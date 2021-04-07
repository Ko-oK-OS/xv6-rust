use array_macro::array;
use core::ptr::NonNull;
use core::ops::{ DerefMut };
use super::*;
use crate::define::{
    param::NPROC,
    memlayout::{ KSTACK, PGSIZE, TRAMPOLINE }
};
use crate::lock::spinlock::{ Spinlock };
use crate::register::sstatus::intr_on;
use crate::memory::*;

pub struct ProcManager{
    // proc:[Spinlock<Process>; NPROC]
    proc: [Process; NPROC]
}

pub static mut PROC_MANAGER:ProcManager = ProcManager::new();

pub static PID_LOCK:Spinlock<()> = Spinlock::new((), "pid_lock");

// helps ensure that wakeups of wait()ing
// parents are not lost. helps obey the
// memory model when using p->parent.
// must be acquired before any p->lock.
pub static WAIT_LOCK:Spinlock<()> = Spinlock::new((), "wait_lock");

pub static mut NEXT_PID:usize = 0;

impl ProcManager{
    // pub const fn new() -> Self{
    //     Self{
    //         proc: array![_ => Spinlock::new(Process::new(), "proc"); NPROC],
    //     }
    // }

    pub const fn new() -> Self {
        Self{
            proc: array![_ => Process::new(); NPROC]
        }
    }


    // pub fn get_table_mut(&mut self) -> &mut [Spinlock<Process>; NPROC]{
    //     &mut self.proc
    // }
    
    pub fn get_table_mut(&mut self) -> &mut [Process; NPROC] {
        &mut self.proc
    }

    

    // initialize the proc table at boot time.
    // Only used in boot.
    pub unsafe fn procinit(){
        println!("procinit......");
        for (pos, p) in PROC_MANAGER.proc.iter_mut().enumerate() {
            let guard = p.data.acquire();
            let pa = kalloc().expect("no enough page for kernel process");
            let va = kstack(pos);
            PageTable::empty().kvmmap(
                VirtualAddress::new(va),
                PhysicalAddress::new(pa as usize),
                PGSIZE,
                PteFlags::R | PteFlags::W,
            );
            guard.set_kstack(pa as usize);
        }

        println!("procinit done......");
    }

    // Wake up all processes sleeping on chan.
    // Must be called without any p->lock.
    pub fn wakeup(&self, channel: usize) {
        for p in self.proc.iter() {
            let mut guard = p.acquire();
            if guard.state == Procstate::SLEEPING && guard.channel == channel {
                guard.state = Procstate::RUNNABLE;
            }
            drop(guard);
        }
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
        }
    }
}


pub unsafe fn alloc_pid() -> usize{
    let guard = PID_LOCK.acquire();
    let pid = NEXT_PID;
    NEXT_PID += 1;
    drop(guard);
    pid
}


#[inline]
fn kstack(pos: usize) -> usize {
    Into::<usize>::into(TRAMPOLINE) - (pos + 1) * 2 * PGSIZE
}