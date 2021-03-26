use array_macro::array;
use core::ptr::NonNull;
use core::ops::{DerefMut};
use super::*;
use crate::define::{
    param::NPROC,
    memlayout::KSTACK
};
use crate::lock::spinlock::{ Spinlock };
use crate::register::sstatus::intr_on;

pub struct ProcManager{
    proc:[Spinlock<Process>; NPROC]
}

pub static mut PROC_MANAGER:ProcManager = ProcManager::new();

pub static PID_LOCK:Spinlock<usize> = Spinlock::new(0, "pid_lock");

// helps ensure that wakeups of wait()ing
// parents are not lost. helps obey the
// memory model when using p->parent.
// must be acquired before any p->lock.
pub static WAIT_LOCK:Spinlock<usize> = Spinlock::new(0, "wait_lock");

pub static mut NEXT_PID:usize = 0;

impl ProcManager{
    pub const fn new() -> Self{
        Self{
            proc: array![_ => Spinlock::new(Process::new(), "proc"); NPROC],
        }
    }

    pub fn get_table_mut(&mut self) -> &mut [Spinlock<Process>; NPROC]{
        &mut self.proc
    }


    

    // initialize the proc table at boot time.
    // Only used in boot.
    pub unsafe fn procinit(){
        println!("procinit......");
        for p in PROC_MANAGER.proc.iter_mut(){
            // p.inner.set_kstack((p.as_ptr() as usize) - (PROC_MANAGER.proc.as_ptr() as usize));
            let mut guard = p.acquire();
            let curr_proc_addr = guard.as_ptr_addr();
            guard.set_kstack(curr_proc_addr - PROC_MANAGER.proc.as_ptr() as usize);
            p.release();
            drop(guard);
        }

        println!("procinit done......");
    }

}


// Per-CPU process scheduler.
// Each CPU calls scheduler() after setting itself up.
// Scheduler never returns.  It loops, doing:
//  - choose a process to run.
//  - swtch to start running that process.
//  - eventually that process transfers control
//    via swtch back to the scheduler.

pub unsafe fn scheduler(){
    let c = CPU_MANAGER.mycpu();
    c.set_proc(None);

    loop{
        // Avoid deadlock by ensuring that devices can interrupt.
        intr_on();

        for p in PROC_MANAGER.get_table_mut().iter_mut(){
            let mut guard = p.acquire();
            if guard.state == Procstate::RUNNABLE {
                // Switch to chosen process.  It is the process's job
                // to release its lock and then reacquire it
                // before jumping back to us.
                guard.set_state(Procstate::RUNNING);
                c.set_proc(NonNull::new(guard.deref_mut() as *mut Process));


                extern "C" {
                    fn swtch(old: *mut Context, new: *mut Context);
                }

                swtch(c.get_context_mut(), guard.get_context_mut());

                // Process is done running for now.
                // It should have changed its p->state before coming back.
                c.set_proc(None);
            }
            drop(guard);
            p.release();
        }
    }
}


pub unsafe fn alloc_pid() -> usize{
    PID_LOCK.acquire();
    let pid = NEXT_PID;
    NEXT_PID += 1;
    PID_LOCK.release();
    pid
}


