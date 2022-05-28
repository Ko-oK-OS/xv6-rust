use alloc::task;
use array_macro::array;
use spin::MutexGuard;
use core::cell::RefCell;
use core::str::{from_utf8, from_utf8_unchecked};
use core::{mem::size_of_val, ptr::NonNull};
use core::ops::{ DerefMut };
use alloc::{boxed::Box, vec};
use super::*;
use crate::arch::riscv::qemu::fs::ROOTIPATH;
use crate::arch::riscv::qemu::{
    param::NTASK,
    layout::{ PGSIZE, TRAMPOLINE }
};
use crate::fs::VFile;
use crate::lock::spinlock::{ Spinlock, SpinlockGuard };
use crate::arch::riscv::register::sstatus::intr_on;
use crate::memory::*;
use crate::ipc::bitmap::*;

pub struct ProcManager {
    tasks: [task_struct; NTASK],
    init_proc: *mut task_struct,
    // pid_lock: Spinlock<usize>,
    /// helps ensure that wakeups of wait()ing
    /// parents are not lost. helps obey the
    /// memory model when using p->parent.
    /// must be acquired before any p->lock.
    
    // pub wait_lock: Spinlock<()>,

    pub tasks_lock: Spinlock<()>,
    pub wait_lock: Spinlock<()>,
}

pub static mut PROC_MANAGER:ProcManager = ProcManager::new();
pub static mut TasksLock:Spinlock<()> = Spinlock::new((), "TasksLock");

pub static mut nextpid: usize = 0;

impl ProcManager{
    pub const fn new() -> Self {
        Self{
            tasks: array![_ => task_struct::new(); NTASK],
            init_proc: 0 as *mut task_struct,
            // pid_lock: Spinlock::new(0, "pid_lock"),
            // wait_lock: Spinlock::new((), "wait_lock"),

            tasks_lock: Spinlock::new((), "tasks_lock"),
            wait_lock: Spinlock::new((), "wait_lock")
        }
    }
    
    // pub fn get_table_mut(&mut self) -> &mut [task_struct; NTASK] {
    //     &mut self.tasks
    // }

    pub fn alloc_pid() -> usize {
        // let curtask = unsafe {
        //     CPU_MANAGER.myproc().expect("Current cpu's process is none.")
        // };
        unsafe {
            let ret = nextpid;
            
            nextpid += 1;
            ret
        }
    }

    /// initialize the proc table at boot time.
    /// Only used in boot.
    pub unsafe fn init(&mut self){
        println!("process init......");
        for (pos, proc) in self.tasks.iter_mut().enumerate() {
            proc.init(kernel_stack(pos));
        }
    }

    /// Allocate 4 page for each process's kernel stack.
    /// Map it high in memory, followed by an invalid 
    /// group page
    pub unsafe fn proc_mapstacks(&mut self) {
        for (pos, _) in self.tasks.iter_mut().enumerate() {
            let pa = Stack::new_zeroed();
            let va = kernel_stack(pos);

            // map process stack into kernel, 
            // which contain 5 page(stack for 4 page and 1 for guard page). 
            KERNEL_PAGETABLE.kernel_map(
                VirtualAddress::new(va),
                PhysicalAddress::new(pa),
                PGSIZE * 4,
                PteFlags::R | PteFlags::W
            );
            
        }
    }

    /// Set up first user programe
    pub unsafe fn user_init(&mut self) {
        println!("first user process init......");
        let task = ProcManager::alloc_proc().expect("Fail to get unused process");

        // allocate one user page and copy init's instructions
        // and data into it.
        task.pagetable.as_mut().unwrap().uvm_init(
            &INITCODE,
        );

        task.size = PGSIZE;

        // prepare for the very first "return" from kernel to user. 
        let tf = &mut *task.trapframe;
        tf.epc = 0; // user program counter
        tf.sp = 4 * PGSIZE; // user stack pointer

        let init_name = b"initname\0";
        task.set_name(init_name);
        // Set init process's directory
        task.cwd = Some(ICACHE.namei(&ROOTIPATH).expect("cannot find root inode"));
        
        let guard = self.tasks_lock.acquire();
        task.set_state(ProcState::RUNNABLE);
        drop(guard);

        // Set init process
        self.init_proc = task as *mut task_struct;
    }


    /// Look in the process table for an UNUSED proc.
    /// If found, initialize state required to run in the kernel,
    /// and return p.acquire() held.
    /// If there are a free procs, or a memory allocation fails, return 0. 

    /// WARNING: possible error occurs here.
    pub fn alloc_proc() -> Option<&'static mut task_struct> {

        let guard = unsafe { PROC_MANAGER.tasks_lock.acquire() };

        // let alloc_pid = self.alloc_pid();
   
        for task in unsafe { PROC_MANAGER.tasks.iter_mut() } {
            match task.state {
                ProcState::UNUSED => {
                    task.pid = ProcManager::alloc_pid();
                    task.set_state(ProcState::ALLOCATED);
                    
                    drop(guard);

                    // Allocate a trapframe page.
                    let trapframe = unsafe{ RawPage::new_zeroed() as *mut u8 };
                    task.set_trapframe(trapframe as *mut Trapframe);
                    // An empty user page table
                    // unsafe{
                    //     task.proc_pagetable();
                    // }
                    task.pagetable = task.proc_pagetable();

                    let box_bitmap: Box<BitMap> = unsafe { Box::new_zeroed().assume_init() };
                    let ptr = Box::into_raw(box_bitmap);
                    task.sharemem_bitmap = ptr;

                    // Set up new context to start executing at forkret, 
                    // which returns to user space. 
                    task.init_context();
                    task.thread = 0;

                    return Some(task)
                }
                _ => {}
            }
        }
        drop(guard);
        None
    }


    pub fn alloc_thread() -> Option<&'static mut task_struct> {

        let guard = unsafe { PROC_MANAGER.tasks_lock.acquire() };

        // let alloc_pid = self.alloc_pid();
   
        for task in unsafe { PROC_MANAGER.tasks.iter_mut() } {
            match task.state {
                ProcState::UNUSED => {
                    task.pid = ProcManager::alloc_pid();
                    task.set_state(ProcState::ALLOCATED);
                    
                    drop(guard);

                    // Allocate a trapframe page.
                    // let trapframe = unsafe{ RawPage::new_zeroed() as *mut u8 };
                    // task.set_trapframe(trapframe as *mut Trapframe);
        
                    // task.pagetable = ;
                    // Set up new context to start executing at forkret, 
                    // which returns to user space. 
                    task.init_context();
                    task.thread = 1;

                    return Some(task)
                }
                _ => {}
            }
        }
        drop(guard);
        None
    }


    pub fn wakeup1(channel: usize){
        for task in unsafe { PROC_MANAGER.tasks.iter_mut() }{
            if task.state == ProcState::SLEEPING && task.channel == channel {
                task.state = ProcState::RUNNABLE;
            }
        }
    }

    /// Wake up all processes sleeping on chan.
    /// Must be called without any p->lock.

    pub fn wake_up(&mut self, channel: usize) {
        let guard = self.tasks_lock.acquire();
        ProcManager::wakeup1(channel);
        drop(guard);
    }

    /// Find a runnable and set status to allocated
    /// should in lock
    pub fn seek_runnable(&mut self) -> Option<&mut task_struct> {
        // let guard = self.tasks_lock.acquire();
        for task in self.tasks.iter_mut() {
            // match task.state {
            //     ProcState::RUNNABLE => {
            //         task.state = ProcState::ALLOCATED;
            //         drop(guard);
            //         return Some(task)
            //     },
            //     _ => {
            //         drop(guard);
            //     },
            // }
            if task.state == ProcState::RUNNABLE {
                return Some(task)
            }
        }
        None
    }

    /// Pass p's abandonded children to init. 
    /// Caller must hold wait lock.  tasks_lock
    pub fn reparent(proc: &mut task_struct) {
        // for index in 0..self.proc.len() {
        //     let p = &self.proc[index];
        //         let pdata = unsafe{ &mut *p.data.get() };
        //         if let Some(parent) = pdata.parent {
        //             if parent as *const _ == proc as *const _ {
        //                 pdata.parent = Some(self.init_proc);
        //                 self.wake_up(self.init_proc as usize);
        //             }
        //         }
        // }
        for task in unsafe { PROC_MANAGER.tasks.iter_mut() } {
            if let Some(parent) = task.parent {
                if parent as *const _ == proc as *const _ {
                    task.parent = unsafe { Some(PROC_MANAGER.init_proc) };
                    // if task.state == ProcState::ZOMBIE     !!!!!!!!TODO
                    ProcManager::wakeup1(unsafe { PROC_MANAGER.init_proc as usize });
                } 
            }
        }
    }
    
    /// Exit the current process. Does not return. 
    /// An exited process remains in the zombie state 
    /// until its parent calls wait. 
    pub fn exit(&mut self, status : usize) -> ! {
        let curtask = unsafe {
            CPU_MANAGER.myproc().expect("Current cpu's process is none.")
        };
        // close all open files. 
        // println!("STATUS {}", status);
        let open_files = &mut curtask.open_files;
        // 遍历该进程打开的文件，夺取所有权，即将引用计数减一
        for index in 0..open_files.len() {
            if open_files[index].is_some() {
                open_files[index].take();
            }
        }

        LOG.begin_op();
        let cwd = curtask.cwd.as_mut().expect("Fail to get inode");
        drop(cwd);
        LOG.end_op();


        curtask.cwd = None;



        let guard = self.tasks_lock.acquire();
        // Parent might be sleeping in wait. 
        // 唤醒父进程
        ProcManager::wakeup1(curtask.parent.expect("Fail to find parent process") as usize);

        // Give any children to init. 
        ProcManager::reparent(curtask);
        // 设置退出状态
        curtask.xstate = status;
        // 设置运行状态
        curtask.state = ProcState::ZOMBIE;

        let my_cpu = unsafe {
            CPU_MANAGER.mycpu()
        };
        unsafe {
            my_cpu.sched();
        }

        panic!("zombie exit!");
    }

    /// Wait for a child process to exit and return its pid. 
    /// 等待子进程退出并返回 pid
    pub fn wait(&mut self, addr: usize) -> Option<usize> {
        let pid;
        let curtask = unsafe {
            CPU_MANAGER.myproc().expect("Fail to get my process")
        };
        
        // let wait_guard = self.wait_lock.acquire();
        
        loop {
            let tasks_guard = self.tasks_lock.acquire();
            

            let mut have_kids = false;
            // Scan through table looking for exited children. 
            // 遍历所有进程是否为其他进程的子进程
            for index in 0..self.tasks.len() {
                let task = &mut self.tasks[index];
    
                if let Some(parent) = task.parent {
                    if parent as *const _ == curtask as *const _ {
                        
                        have_kids = true;
                        // make sure the child isn't still in exit or swtch. 
                        if task.state == ProcState::ZOMBIE {
                            // Found one 
                            pid = task.pid;
                            let page_table = unsafe { &mut *task.pagetable };
                            // 这里是要获取子进程退出的状态，当 addr 的值为 0 的时候为悬空指针，表示
                            // 不需要获取子进程退出的状态
                            if addr != 0 && page_table.copy_out(addr, task.xstate as *const u8, size_of_val(&task.xstate)).is_err() {
                                // drop(wait_guard);
                                drop(tasks_guard);
                                return None
                            }
                            task.free_proc();

                            // drop(wait_guard);
                            drop(tasks_guard);
                            return Some(pid)
                        }
                    }
                }
            }
            
            // No point waiting if we don't have any children. 
            if !have_kids || curtask.killed {
                drop(tasks_guard);
                // drop(wait_guard);
                return None
            }


            drop(tasks_guard);
            // Wait for a child to exit.
            let mut wait_guard = unsafe { PROC_MANAGER.wait_lock.acquire() };
            curtask.sleep(
                curtask as *const _ as usize, 
                wait_guard
            );
            wait_guard = self.wait_lock.acquire();
        }
    }

    pub fn join(&mut self, stack: usize) -> Option<usize> {
        let pid;
        let my_proc = unsafe {
            CPU_MANAGER.myproc().expect("Fail to get my process")
        };
        println!("In join the stack varible addr is {}", stack);
        loop {
            let mut guard = self.tasks_lock.acquire();
            let mut have_kids = false;
            // Scan through table looking for exited children. 
            // 遍历所有进程是否为其他进程的子进程
            for index in 0..self.tasks.len() {
                let p = &mut self.tasks[index];
      
                if let Some(parent) = p.parent {
                    if parent as *const _ == my_proc as *const _ {
                        have_kids = true;
                        if p.state == ProcState::ZOMBIE {
                            pid = p.pid;

                            //TODO    BUG!!!!!!!!!!!!!!!!!!!!!!

                            // let page_table = unsafe { &mut *p.pagetable };
                            // page_table.copy_out(stack, p.thread_ustack as *const u8, size_of::<usize>());
                            // println!("(FIND");
                            p.free_thread();
                            drop(guard);
                            return Some(pid);
                        }
                    }
                }
            }
            // No point waiting if we don't have any children. 
            if !have_kids || my_proc.killed {
                drop(guard);
                return None
            }
            // 释放锁，否则会死锁
            drop(guard);
            let mut wait_guard = self.wait_lock.acquire();
            // Wait for a child to exit.
            my_proc.sleep(
                my_proc as *const _ as usize, 
                wait_guard
            );
            wait_guard = self.wait_lock.acquire();
        }
    }


    /// Kill the process with the given pid. 
    /// The victim won't exit until it tries to return. 
    /// to user space (user_trap)
    pub fn kill(&mut self, pid: usize) -> Result<usize, ()> {
        let guard = self.tasks_lock.acquire();
        for task in self.tasks.iter_mut() {
            if task.pid == pid {
                task.killed = true;
                if task.state == ProcState::SLEEPING {
                    // Wake process from sleep. 
                    task.state = ProcState::RUNNABLE;
                }
                drop(guard);
                return Ok(0)
            }
        }
        drop(guard);
        Err(())
    }

    /// Print a process listing to console. For debugging. 
    /// Runs when user type ^P on console. 
    /// No lock to avoid wedging a stuck machine further
    pub fn proc_dump(&self) {
        for proc in self.tasks.iter() {
            if proc.state() == ProcState::UNUSED { continue; }
            else {
                println!("pid: {} state: {:?} name: {}", proc.pid(), proc.state(), proc.name());
            }
        }
    }
}

#[inline]
fn kernel_stack(pos: usize) -> usize {
    TRAMPOLINE - (pos + 1) * 5 * PGSIZE
}