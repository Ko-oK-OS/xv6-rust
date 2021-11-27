use array_macro::array;
use crate::fs::VFile;
use crate::register::{ tp, sstatus };
use crate::define::param::NCPU;
use crate::lock::spinlock::{SpinlockGuard, Spinlock};
use core::cell::RefCell;
use core::ops::IndexMut;
use core::ptr::NonNull;
use super::*;
pub struct CPU {
    pub process: Option<NonNull<Process>>, // The process running on this cpu, or null.
    pub context: Context, // swtch() here to enter scheduler().
    pub noff: usize, // Depth of push_off() nesting.
    pub intena: usize // Were interrupts enabled before push_off()?
}

pub struct CPUManager{
    cpus: [CPU; NCPU]
}

pub static mut CPU_MANAGER:CPUManager = CPUManager::new();

pub unsafe fn cpuid() -> usize {
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
        push_off();
        let c = CPU_MANAGER.mycpu();
        let p = &mut *c.process.unwrap().as_ptr();
        pop_off();
        Some(p)
    }

    pub fn yield_proc(&mut self) {
        if let Some(my_proc) = unsafe{ self.myproc() } {
            let guard = my_proc.meta.acquire();
            if guard.state == ProcState::RUNNING {
                drop(guard);
                my_proc.yielding();
            }else {
                drop(guard);
            }
        }
    }
    
    /// Per-CPU process scheduler.
    /// Each CPU calls scheduler() after setting itself up.
    /// Scheduler never returns.  It loops, doing:
    ///  - choose a process to run.
    ///  - switch to start running that process.
    ///  - eventually that process transfers control
    ///    via switch back to the scheduler.
    pub unsafe fn scheduler(&mut self){
        extern "C" {
            fn switch(old: *mut Context, new: *mut Context);
        }

        let c = self.mycpu();
        loop {
            // Avoid deadlock by ensuring that devices can interrupt.
            sstatus::intr_on();
            match PROC_MANAGER.seek_runnable() {
                Some(proc) => {
                    // Switch to chosen process. It is the process's job
                    // to release it's lock and then reacquire it 
                    // before jumping back to us.
                    c.set_proc(NonNull::new(proc as *mut Process));
                    let mut pmeta = proc.meta.acquire();
                    pmeta.state = ProcState::RUNNING;
                    switch(
                        c.get_context_mut(),
                        &mut proc.data.get_mut().context as *mut Context
                    );
                    if c.get_context_mut().is_null() {
                        panic!("context switch back with no process reference.");
                    }
                    // Process is done running for now. 
                    // It should have changed it's process state before coming back. 
                    c.set_proc(None);
                    drop(pmeta);
                }

                None => {}
            }
        }
    }

    pub fn alloc_fd(&mut self, file:&VFile) -> Result<usize, &'static str> {
        let proc = unsafe{ self.myproc().ok_or("Fail to find current process")? };
        proc.fd_alloc(file)
    }

    pub fn fd_close(&mut self, fd: usize) {
        let proc = unsafe {
            self.myproc().unwrap()
        };
        let pdata = unsafe{ &mut *proc.data.get() };
        pdata.open_files[fd].take();
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

    pub fn set_proc(&mut self, proc:Option<NonNull<Process>>){
        self.process = proc;
    }

    pub fn get_context_mut(&mut self) -> *mut Context{
        &mut self.context as *mut Context
    }


    /// Switch to scheduler.  Must hold only p->lock
    /// and have changed proc->state. Saves and restores
    /// intena because intena is a property of this
    /// kernel thread, not this CPU. It should
    /// be proc->intena and proc->noff, but that would
    /// break in the few places where a lock is held but
    /// there's no process.
    pub unsafe fn sched<'a>
    (
        &mut self, 
        guard: SpinlockGuard<'a, ProcMeta>, 
        ctx: *mut Context
    ) 
    -> SpinlockGuard<'a, ProcMeta>
    {
        extern "C" {
            fn switch(old: *mut Context, new: *mut Context);
        }

        if !guard.holding() {
            panic!("sched: not holding proc's lock");
        }
        // only holding self.proc.lock
        if self.noff != 1 {
            println!("self noff is {}", self.noff);
            panic!("sched: cpu hold mutliple locks");
        }
            
        // proc is not running. 
        if guard.state == ProcState::RUNNING {
            panic!("sched: proc is running");
        }

        // should not be interruptible
        if sstatus::intr_get() {
            panic!("sched: interruptible");
        }

        let intena = self.intena;
        switch(
            ctx, 
            &mut self.context as *mut Context
        );
        self.intena = intena;

        guard
        
    }

    /// Yield the holding process if any and it's RUNNING.
    /// Directly return if none.
    pub fn try_yield_proc(&mut self) {
        if !self.process.is_none() {
            let guard = unsafe {
                (&mut *self.process.unwrap().as_ptr()).meta.acquire()
            };
            if guard.state == ProcState::RUNNING {
                drop(guard);
                unsafe { self.process.unwrap().as_mut().yielding() }
            } else {
                drop(guard);
            }
        }
    }

}

/// push_off/pop_off are like intr_off()/intr_on() except that they are matched:
/// it takes two pop_off()s to undo two push_off()s.  Also, if interrupts
/// are initially off, then push_off, pop_off leaves them off.

pub fn push_off(){
    let old_enable;
    unsafe{
        old_enable = sstatus::intr_get();
        sstatus::intr_off();
    }
    let my_cpu = unsafe{ CPU_MANAGER.mycpu() };
    if my_cpu.noff == 0 {
        my_cpu.intena = old_enable as usize;
    }

    my_cpu.noff += 1;
}


pub fn pop_off() {
    if unsafe{ sstatus::intr_get() } {
        panic!("pop_off(): interruptable");
    }
    let c = unsafe { CPU_MANAGER.mycpu() };
    if c.noff.checked_sub(1).is_none() {
        panic!("pop_off(): count not match");
    }
    c.noff -= 1;
    if c.noff == 0 && c.intena != 0 {
        unsafe{ sstatus::intr_on() };
    }
}
