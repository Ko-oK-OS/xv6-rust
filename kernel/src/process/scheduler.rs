use array_macro::array;
use core::str::{from_utf8, from_utf8_unchecked};
use core::{mem::size_of_val, ptr::NonNull};
use core::ops::{ DerefMut };
use super::*;
use crate::define::{
    param::NPROC,
    memlayout::{ PGSIZE, TRAMPOLINE }
};
use crate::lock::spinlock::{ Spinlock, SpinlockGuard };
use crate::register::sstatus::intr_on;
use crate::memory::*;

pub struct ProcManager {
    proc: [Process; NPROC],
    init_proc: Process,
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
            init_proc: Process::new(),
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
        for (pos, p) in self.proc.iter_mut().enumerate() {
            p.init(kstack(pos));
        }

        println!("procinit done......");
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
        let extern_data = p.extern_data.get_mut();
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

    pub fn seek_runnable(&mut self) -> Option<&mut Process> {
        for p in self.proc.iter_mut() {
            let mut guard = p.data.acquire();
            match guard.state {
                Procstate::RUNNABLE => {
                    guard.state = Procstate::ALLOCATED;
                    drop(guard);
                    // unsafe{ println!("Process {} will run.", (&*p.extern_data.get()).name); }
                    return Some(p)
                },

                _ => {
                    drop(guard);
                },
            }
        }
        None
    }

    
}



#[inline]
fn kstack(pos: usize) -> usize {
    Into::<usize>::into(TRAMPOLINE) - (pos + 1) * 2 * PGSIZE
}