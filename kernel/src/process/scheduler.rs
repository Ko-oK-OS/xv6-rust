use array_macro::array;
use core::cell::RefCell;
use core::str::{from_utf8, from_utf8_unchecked};
use core::{mem::size_of_val, ptr::NonNull};
use core::ops::{ DerefMut };
use super::*;
use crate::define::{
    param::NPROC,
    memlayout::{ PGSIZE, TRAMPOLINE }
};
use crate::fs::VFile;
use crate::lock::spinlock::{ Spinlock, SpinlockGuard };
use crate::register::sstatus::intr_on;
use crate::memory::*;

pub static WAIT_LOCK: Spinlock<()> = Spinlock::new((), "wait_lock");

pub struct ProcManager {
    proc: [Process; NPROC],
    init_proc: *mut Process,
    pid_lock: Spinlock<usize>,
    /// helps ensure that wakeups of wait()ing
    /// parents are not lost. helps obey the
    /// memory model when using p->parent.
    /// must be acquired before any p->lock.
    pub wait_lock: Spinlock<()>,
}

pub static mut PROC_MANAGER:ProcManager = ProcManager::new();


impl ProcManager{
    pub const fn new() -> Self {
        Self{
            proc: array![_ => Process::new(); NPROC],
            init_proc: 0 as *mut Process,
            pid_lock: Spinlock::new(0, "pid_lock"),
            wait_lock: Spinlock::new((), "wait_lock"),
        }
    }
    
    pub fn get_table_mut(&mut self) -> &mut [Process; NPROC] {
        &mut self.proc
    }

    pub fn alloc_pid(&mut self) -> usize {
        let mut guard = self.pid_lock.acquire();
        let pid;       
        *guard += 1;
        pid = *guard;        
        drop(guard);
        pid
    }

    /// initialize the proc table at boot time.
    /// Only used in boot.
    pub unsafe fn init(&mut self){
        println!("process init......");
        for (pos, proc) in self.proc.iter_mut().enumerate() {
            proc.init(kstack(pos));
        }
    }

    /// Allocate a page for each process's kernel stack.
    /// Map it high in memory, followed by an invalid 
    /// group page
    pub unsafe fn proc_mapstacks(&mut self) {
        for (pos, _) in self.proc.iter_mut().enumerate() {
            let pa = RawPage::new_zeroed() as *mut u8;
            let va = kstack(pos);

            KERNEL_PAGETABLE.kernel_map(
                VirtualAddress::new(va),
                PhysicalAddress::new(pa as usize),
                PGSIZE,
                PteFlags::R | PteFlags::W
            );
            
        }
    }

    /// Set up first user programe
    pub unsafe fn user_init(&mut self) {
        println!("first user process init......");
        let p = self.alloc_proc().expect("Fail to get unused process");

        // allocate one user page and copy init's instructions
        // and data into it.
        let extern_data = &mut *p.extern_data.get();
        extern_data.pagetable.as_mut().unwrap().uvm_init(
            &INITCODE,
        );

        extern_data.size = PGSIZE;

        // prepare for the very first "return" from kernel to user. 
        let tf =  &mut *extern_data.trapframe;
        tf.epc = 0; // user program counter
        tf.sp = PGSIZE; // user stack pointer

        extern_data.set_name("initcode");
        
        let mut guard = p.data.acquire();
        guard.set_state(Procstate::RUNNABLE);

        drop(guard);

        // set init process
        self.init_proc = p as *mut Process;
    }


    /// Look in the process table for an UNUSED proc.
    /// If found, initialize state required to run in the kernel,
    /// and return p.acquire() held.
    /// If there are a free procs, or a memory allocation fails, return 0. 

    /// WARNING: possible error occurs here.
    pub fn alloc_proc(&mut self) -> Option<&mut Process> {
        let alloc_pid = self.alloc_pid();
        for p in self.proc.iter_mut() {
            let mut guard = p.data.acquire();
            match guard.state {
                Procstate::UNUSED => {
                    guard.pid = alloc_pid;
                    guard.set_state(Procstate::ALLOCATED);

                    let extern_data = p.extern_data.get_mut();
                    // Allocate a trapframe page.
                    let ptr = unsafe{ RawPage::new_zeroed() as *mut u8 };

                    extern_data.set_trapframe(ptr as *mut Trapframe);

                    // An empty user page table
                    unsafe{
                        extern_data.proc_pagetable();
                    }
                    
                    // Set up new context to start executing at forkret, 
                    // which returns to user space. 
                    extern_data.init_context();
                    drop(guard);

                    return Some(p)
                }
                _ => { return None }
            }
        }
        None
    }


    /// Wake up all processes sleeping on chan.
    /// Must be called without any p->lock.
    pub fn wakeup(&self, channel: usize) {
        for p in self.proc.iter() {
            let mut guard = p.data.acquire();
            if guard.state == Procstate::SLEEPING && guard.channel == channel {
                guard.state = Procstate::RUNNABLE;
            }
            drop(guard);
        }
    }

    /// Find a runnable and set status to allocated
    pub fn seek_runnable(&mut self) -> Option<&mut Process> {
        for p in self.proc.iter_mut() {
            let mut guard = p.data.acquire();
            match guard.state {
                Procstate::RUNNABLE => {
                    guard.state = Procstate::ALLOCATED;
                    drop(guard);
                    return Some(p)
                },
                _ => {
                    drop(guard);
                },
            }
        }
        None
    }

    /// Pass p's abandonded children to init. 
    /// Caller must hold wait lock. 
    pub fn reparent(&mut self, proc: &mut Process) {
        for index in 0..self.proc.len() {
            let p = &mut self.proc[index];
                let extern_data = unsafe{ &mut *p.extern_data.get() };
                if let Some(parent) = extern_data.parent {
                    if parent as *const _ == proc as *const _ {
                        extern_data.parent = Some(self.init_proc);
                        self.wakeup(self.init_proc as usize);
                    }
                }
        }
    }
    
    /// Exit the current process. Does not return. 
    /// An exited process remains in the zombie state 
    /// until its parent calls wait. 
    pub fn exit(&mut self, status : usize) -> ! {
        let my_proc = unsafe {
            CPU_MANAGER.myproc().expect("Current cpu's process is none.")
        };
        // close all open files. 
        let extern_data = unsafe{ &mut *my_proc.extern_data.get() };
        let open_files = &mut extern_data.ofile;
        for index in 0..open_files.len() {
            let file = unsafe{ &mut *open_files[index].as_ptr() };
            open_files[index] = Arc::new(
                RefCell::new(
                    VFile::init()
                )
            );
            file.close();
        }

        LOG.begin_op();
        let cwd = extern_data.cwd.as_mut().expect("Fail to get inode");
        drop(cwd);
        LOG.end_op();
        extern_data.cwd = None;

        let wait_guard = WAIT_LOCK.acquire();
        // Give any children to init. 
        self.reparent(my_proc);
        // Parent might be sleeping in wait. 
        self.wakeup(extern_data.parent.expect("Fail to find parent process") as usize);

        let mut proc_data = my_proc.data.acquire();
        proc_data.xstate = status;
        proc_data.set_state(Procstate::ZOMBIE);

        drop(wait_guard);

        let my_cpu = unsafe {
            CPU_MANAGER.mycpu()
        };
        unsafe {
            my_cpu.sched(proc_data, &mut extern_data.context as *mut Context);
        }

        panic!("zombie exit!");
    }

    /// Wait for a child process to exit and return its pid. 
    pub fn wait(&mut self, addr: usize) -> Option<usize> {
        let mut pid = 0;
        let mut have_kids = false;
        let my_proc = unsafe {
            CPU_MANAGER.myproc().expect("Fail to get my process")
        };
        // TODO: in xv6-riscv, wait lock acquire out of loop. 
        loop {
            let wait_guard = WAIT_LOCK.acquire();
            // Scan through table looking for exited children. 
            for index in 0..self.proc.len() {
                let p = &mut self.proc[index];
                let extern_data = unsafe {
                    &mut *p.extern_data.get()
                };
                if let Some(parent) = extern_data.parent {
                    if parent as *const _ == my_proc as *const _ {
                        have_kids = true;
                        // make sure the child isn't still in exit or swtch. 
                        let proc_data = p.data.acquire();
                        if proc_data.state == Procstate::ZOMBIE {
                            // Found one 
                            pid = proc_data.pid;
                            let page_table = extern_data.pagetable.as_mut().expect("Fail to get pagetable");
                            if page_table.copy_out(addr, proc_data.xstate as *const u8, size_of_val(&proc_data.xstate)).is_err() {
                                drop(proc_data);
                                drop(wait_guard);
                                return None
                            }
                        }

                        drop(proc_data);
                        drop(wait_guard);
                        p.free_proc();
                        return Some(pid);
                    }
                    
                }
            }
            let my_proc_data = my_proc.data.acquire();
            // No point waiting if we don't have any children. 
            if !have_kids || my_proc_data.killed {
                drop(wait_guard);
                drop(my_proc_data);
                return None
            }

            // Wait for a child to exit.
            my_proc.sleep(&wait_guard as *const _ as usize, wait_guard);
        }
    }
}

#[inline]
fn kstack(pos: usize) -> usize {
    Into::<usize>::into(TRAMPOLINE) - (pos + 1) * 5 * PGSIZE
}