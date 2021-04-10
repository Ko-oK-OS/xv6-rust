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
    pub const fn new() -> Self {
        Self{
            proc: array![_ => Process::new(); NPROC]
        }
    }

    
    pub fn get_table_mut(&mut self) -> &mut [Process; NPROC] {
        &mut self.proc
    }

    

    // initialize the proc table at boot time.
    // Only used in boot.
    pub unsafe fn procinit(&mut self){
        println!("procinit......");
        for (pos, p) in self.proc.iter_mut().enumerate() {
            let mut guard = p.data.acquire();
            guard.set_kstack(kstack(pos));
            drop(guard);
        }

        println!("procinit done......");
    }

    // Allocate a page for each process's kernel stack.
    // Map it high in memory, followed by an invalid 
    // group page
    pub unsafe fn proc_mapstacks(&mut self) {
        for (pos, p) in self.proc.iter_mut().enumerate() {
            let pa = kalloc().expect("Fail to allocate physical page.");
            let va = kstack(pos);

            KERNEL_PAGETABLE.kvmmap(
                VirtualAddress::new(va),
                PhysicalAddress::new(pa as usize),
                PGSIZE,
                PteFlags::R | PteFlags::W
            );
            
        }
    }


    // Look in the process table for an UNUSED proc.
    // If found, initialize state required to run in the kernel,
    // and return p.acquire() held.
    // If there are a free procs, or a memory allocation fails, return 0. 

    pub fn allocaproc(&mut self) -> Option<Process> {
        for p in self.proc.iter_mut() {
            let mut guard = p.data.acquire();
            if guard.state == Procstate::UNUSED {
                guard.pid = alloc_pid();
                guard.set_state(Procstate::USED);

                match unsafe { kalloc() } {
                    Some(pa) => {
                        guard.set_trapframe(pa as *mut Trapframe);
                    }

                    None => {
                        
                        return None
                    }
                }
            
            }else {
                drop(guard);
            }
        }

        None
    }

    // Wake up all processes sleeping on chan.
    // Must be called without any p->lock.
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


// Per-CPU process scheduler.
// Each CPU calls scheduler() after setting itself up.
// Scheduler never returns.  It loops, doing:
//  - choose a process to run.
//  - swtch to start running that process.
//  - eventually that process transfers control
//    via swtch back to the scheduler.

pub unsafe fn scheduler(){
    extern "C" {
        fn swtch(old: *mut Context, new: *mut Context);
    }

    let c = CPU_MANAGER.mycpu();
    c.set_proc(None);

    loop{
        // Avoid deadlock by ensuring that devices can interrupt.
        intr_on();

        match PROC_MANAGER.seek_runnable() {
            Some(p) => {
                c.set_proc(NonNull::new(p as *mut Process));
                let mut guard = p.data.acquire();
                guard.state = Procstate::RUNNING;

                swtch(c.get_context_mut(),
                    &mut guard.context as *mut Context);

                c.set_proc(None);
                drop(guard);

            }

            None => {}
        }
    }
}


pub fn alloc_pid() -> usize{
    let guard = PID_LOCK.acquire();
    let pid;
    unsafe {
        pid = NEXT_PID;
        NEXT_PID += 1;
    }
    drop(guard);
    pid
}


#[inline]
fn kstack(pos: usize) -> usize {
    Into::<usize>::into(TRAMPOLINE) - (pos + 1) * 2 * PGSIZE
}