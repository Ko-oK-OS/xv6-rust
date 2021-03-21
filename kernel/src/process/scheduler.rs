use core::ptr::NonNull;
use super::*;
use crate::define::{
    param::NPROC,
    memlayout::KSTACK
};
use crate::lock::spinlock::Spinlock;
use crate::register::sstatus::intr_on;

pub struct ProcManager{
    proc:[Process; NPROC]
}

pub static mut PROC_MANAGER:ProcManager = ProcManager::new();

impl ProcManager{
    const fn new() -> Self{
        Self{
            proc: [Process::new(); NPROC]
        }
    }

    pub fn get_table_mut(&mut self) -> &mut [Process; NPROC]{
        &mut self.proc
    }


    pub fn myproc(&mut self) -> Option<&mut Process>{
        // TODO: push_off, pop_off
        let c = CPU_MANAGER.mycpu();
        match c.process{
            Some(proc) => {
                Some(proc.as_mut())
            }

            None => None
        }

    }

    // initialize the proc table at boot time.
    // Only used in boot.
    pub fn procinit(){
        for p in PROC_MANAGER.proc.iter_mut(){
            p.inner.set_kstack((p.as_ptr() as usize) - (PROC_MANAGER.proc.as_ptr() as usize));
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

pub fn scheduler(){
    let mut c = CPU_MANAGER.mycpu();
    c.set_proc(None);

    loop{
        // Avoid deadlock by ensuring that devices can interrupt.
        intr_on();

        for p in PROC_MANAGER.get_table_mut().iter_mut(){
            let guard = p.excl.acquire();
            if guard.state == Procstate::RUNNABLE {
                // Switch to chosen process.  It is the process's job
                // to release its lock and then reacquire it
                // before jumping back to us.
                guard.set_state(Procstate::RUNNING);
                c.set_proc(NonNull::new(p as *mut Process));
                extern "C" {
                    fn swtch(old:*mut Context, new:*mut Context);
                }

                swtch(c.get_context_mut(), p.inner.get_context_mut());

                // Process is done running for now.
                // It should have changed its p->state before coming back.
                c.set_proc(None);
            }
            drop(guard);
            p.excl.release();
        }
    }
}


// Switch to scheduler.  Must hold only p->lock
// and have changed proc->state. Saves and restores
// intena because intena is a property of this
// kernel thread, not this CPU. It should
// be proc->intena and proc->noff, but that would
// break in the few places where a lock is held but
// there's no process.

pub fn sched(){
    let my_proc = PROC_MANAGER.myproc().unwrap();
    let mut my_cpu = CPU_MANAGER.mycpu();

    if !my_proc.excl.holding(){
        panic!("sched p->lock");
    }

    if CPU_MANAGER.mycpu().noff != 1{
        panic!("sched locks");
    }

    //TODO: p->state == RUNNING

    if intr_get(){
        panic!("sched interruptible");
    }

    let intena = my_cpu.intena;
    extern "C" {
        fn swtch(old: *mut Context, new: *mut Context);
    }

    swtch(my_proc.inner.get_context_mut(), my_cpu.get_context_mut());
    my_cpu.intena = intena;
}