use core::ptr;
use crate::lock::spinlock::Spinlock;
use crate::memory::{
    address::{VirtualAddress, Addr},
    mapping::page_table::PageTable,
    container::boxed::Box
};
use super::*;

#[derive(PartialEq)]
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
    pub state:Procstate,
    pub channel:usize, // If non-zero, sleeping on chan
    pub killed:usize, // If non-zero, have been killed
    pub xstate:usize, // Exit status to be returned to parent's wait
    pub pid: usize,   // Process ID
    // proc_tree_lock must be held when using this:
    pub parent: Option<ptr::NonNull<Process>>
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

    pub fn set_state(&mut self, state: Procstate){
        self.state = state;
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

    pub fn get_context_mut(&mut self) -> *mut Context{
        &mut self.context as *mut Context
    }


    pub fn set_kstack(&mut self, addr:usize){
        self.kstack = addr
    }
}

// Per-process state
pub struct Process {
   pub excl: Spinlock<ProcessExcl>,
   pub inner: ProcessInner
}

impl Process{
    pub const fn new() -> Self{
        Self{
            excl:Spinlock::new(ProcessExcl::new(), "process"),
            inner: ProcessInner::new()
        }
    }

    pub fn as_ptr(&self) -> *const Process{
        self as *const Process
    }
}

extern "C" {
    fn trampoline();
}





