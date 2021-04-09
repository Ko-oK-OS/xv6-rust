use core::ptr;
use crate::lock::spinlock::{ Spinlock, SpinlockGuard };
use crate::memory::{
    address::{VirtualAddress, Addr},
    mapping::page_table::PageTable,
    container::boxed::Box
};
use super::*;

#[derive(PartialEq, Copy, Clone)]
pub enum Procstate{
    UNUSED,
    USED,
    SLEEPING,
    RUNNABLE,
    RUNNING,
    ZOMBIE,
    ALLOCATED
}


pub struct Process {
    pub data: Spinlock<ProcData>,
    name: &'static str   // Process name (debugging)
}

pub struct ProcData {
    // p->lock must be held when using these
    pub state:Procstate,
    pub channel:usize, // If non-zero, sleeping on chan
    pub killed:usize, // If non-zero, have been killed
    pub xstate:usize, // Exit status to be returned to parent's wait
    pub pid: usize,   // Process ID

    // proc_tree_lock must be held when using this:
    pub parent: Option<ptr::NonNull<Process>>,

    // these are private to the process, so p->lock need to be held
    pub kstack:usize,  // Virtual address of kernel stack
    pub size:usize, // size of process memory
    pub pagetable: Option<Box<PageTable>>, // User page table
    pub trapframe: *mut Trapframe, // data page for trampoline.S
    pub context: Context, // swtch() here to run processs
    // TODO: Open files and Current directory
}

impl ProcData {
    pub const fn new() -> Self {
        Self {
            state: Procstate::UNUSED,
            channel: 0,
            killed: 0,
            xstate: 0,
            pid: 0,
            parent: None,

            kstack:0,
            size: 0,
            pagetable: None,
            trapframe: ptr::null_mut(),
            context: Context::new(),
        }
    }

    pub fn set_kstack(&mut self, ksatck:usize) {
        self.kstack = ksatck;
    }

    pub fn set_state(&mut self, state: Procstate) {
        self.state = state;
    }

    pub fn get_context_mut(&mut self) -> *mut Context {
        &mut self.context as *mut Context
    }
}



impl Process{
    pub const fn new() -> Self{
        Self{    
            data: Spinlock::new(ProcData::new(), "process"),
            name: "process"
        }
    }

    pub fn as_ptr(&self) -> *const Process{
        self as *const Process
    }

    pub fn as_mut_ptr(&mut self) -> *mut Process{
        self as *mut Process
    }

    pub fn as_ptr_addr(&self) -> usize{
        self as *const Process as usize
    }

    pub fn as_mut_ptr_addr(&mut self) -> usize{
        self as *mut Process as usize
    }


    // Give up the CPU for one scheduling round.
    // yield is a keyword in rust
    pub fn yielding(&self) {
        let mut guard = self.data.acquire();
        let ctx = guard.get_context_mut();
        guard.set_state(Procstate::RUNNABLE);

        unsafe {
            let my_cpu = CPU_MANAGER.mycpu();
            guard = my_cpu.sched(
                guard,
                ctx
            );
        }
        drop(guard)
    }

    // Atomically release lock and sleep on chan
    // Reacquires lock when awakened.
    pub fn sleep<T>(&self, channel: usize, lock: SpinlockGuard<T>) {
        // Must acquire p->lock in order to 
        // change p->state and then call sched.
        // Once we hold p->lock, we can be
        // guaranteed that we won't miss any wakeup
        // (wakeup locks p->lock)
        // so it's okay to release lk;
        let mut guard = self.data.acquire();
        drop(lock);

        // Go to sleep.
        guard.channel = channel;
        guard.set_state(Procstate::SLEEPING);

        unsafe {
            let my_cpu = CPU_MANAGER.mycpu();
            let ctx = guard.get_context_mut();
            
            // get schedule process
            guard = my_cpu.sched(
                guard, 
                ctx
            );

            // Tide up
            guard.channel = 0;
            drop(guard);
        }
        

    }
}

extern "C" {
    fn trampoline();
}





