use array_macro::array;
use crate::register::tp;
use crate::define::param::NCPU;
use crate::lock::spinlock::{SpinlockGuard, Spinlock};
use core::ptr::NonNull;
use super::*;
pub struct CPU{
    pub process:Option<NonNull<Process>>, // The process running on this cpu, or null.
    pub context:Context, // swtch() here to enter scheduler().
    pub noff:usize, // Depth of push_off() nesting.
    pub intena:usize // Were interrupts enabled before push_off()?
}

pub struct CPUManager{
    cpus: [CPU; NCPU]
}

pub static mut CPU_MANAGER:CPUManager = CPUManager::new();

pub unsafe fn cpuid() ->usize{
    let id = tp::read();
    id
}

impl CPUManager{
    pub const fn new() -> Self{
        Self{
            cpus: array![_ => CPU::new(); NCPU],
        }
    }

    pub unsafe fn mycpu(&mut self) -> &mut CPU{
        let cpu_id = cpuid();
        &mut self.cpus[cpu_id]
    }

    pub unsafe fn myproc(&mut self) -> Option<&mut Process>{
        // TODO: push_off, pop_off
        let p;
        let c = CPU_MANAGER.mycpu();
        if let Some(proc) = c.process{
           p = &mut *(proc.as_ptr());
           return Some(p)
        }
        None

    }
}

impl CPU{
    pub const fn new() -> Self{
        Self{
            process:None,
            context:Context::new(),
            noff:0,
            intena:0
        }
    }

    // pub fn get_proc(&self) -> &Process {
    //     self.process.unwrap().as_ref()
    // }

    pub fn set_proc(&mut self, proc:Option<NonNull<Process>>){
        self.process = proc;
    }

    pub fn get_context_mut(&mut self) -> *mut Context{
        &mut self.context as *mut Context
    }


    // Switch to scheduler.  Must hold only p->lock
    // and have changed proc->state. Saves and restores
    // intena because intena is a property of this
    // kernel thread, not this CPU. It should
    // be proc->intena and proc->noff, but that would
    // break in the few places where a lock is held but
    // there's no process.

    pub unsafe fn sched(&mut self, guard: SpinlockGuard<Process>, ctx: *mut Context){
        // I have something confused about this function.

        if !guard.holding(){
            panic!("sched p->lock");
        }

        if self.noff != 1{
            panic!("sched locks");
        }

        if guard.state == Procstate::RUNNING{
            panic!("sched running");
        }

        if intr_get(){
            panic!("sched interruptible");
        }

        let intena = self.intena;
        extern "C" {
            fn swtch(old: *mut Context, new: *mut Context);
        }

        swtch(ctx, self.get_context_mut());
        self.intena = intena;
    }
}