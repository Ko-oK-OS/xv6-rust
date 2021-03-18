use core::ptr;
use crate::lock::spinlock::Spinlock;
use crate::memory::{
    address::{VirtualAddress, Addr},
    mapping::page_table::PageTable,
    container::boxed::Box
};
use super::*;

pub enum Procstate{
    UNUSED,
    USED,
    SLEEPING,
    RUNNABLE,
    RUNNING,
    ZOMBIE
}

pub struct ProcessExcl{
    // p->lock must be held when using these:
    state:Procstate,
    channel:usize, // If non-zero, sleeping on chan
    killed:usize, // If non-zero, have been killed
    xstate:usize, // Exit status to be returned to parent's wait
    pid: usize,   // Process ID
    // proc_tree_lock must be held when using this:
    parent: Option<ptr::NonNull<Process>>
}

impl ProcessExcl{
    const fn new() -> Self{
        Self{
            state: Procstate::UNUSED,
            channel: 0,
            killed: 0,
            xstate: 0,
            pid: 0,
            parent: None
        }
    }
}

pub struct ProcessInner{
    // these are private to the process, so p->lock need to be held
    kstack:usize,  // Virtual address of kernel stack
    size:usize, // size of process memory
    pagetable: Option<Box<PageTable>>, // User page table
    trapframe: *mut Trapframe, // data page for trampoline.S
    context: Context, // swtch() here to run processs
    // TODO: Open files and Current directory
    name: &'static str   // Process name (debugging)
}

impl ProcessInner{
    const fn new() -> Self{
        Self{
            kstack:0,
            size: 0,
            pagetable: None,
            trapframe: ptr::null_mut(),
            context: Context::new(),
            name: "process"
        }
    }
}

// Per-process state
pub struct Process {
   pub excl: Spinlock<ProcessExcl>,
   pub inner: ProcessInner
}

extern "C" {
    fn trampoline();
}


// initialize the proc table at boot time
// pub fn procinit()


