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


pub struct Process {
    // p->lock must be held when using these
    pub state:Procstate,
    pub channel:usize, // If non-zero, sleeping on chan
    pub killed:usize, // If non-zero, have been killed
    pub xstate:usize, // Exit status to be returned to parent's wait
    pub pid: usize,   // Process ID

    // proc_tree_lock must be held when using this:
    pub parent: Option<ptr::NonNull<Process>>,

    // these are private to the process, so p->lock need to be held
    kstack:usize,  // Virtual address of kernel stack
    size:usize, // size of process memory
    pagetable: Option<Box<PageTable>>, // User page table
    trapframe: *mut Trapframe, // data page for trampoline.S
    context: Context, // swtch() here to run processs
    // TODO: Open files and Current directory
    name: &'static str   // Process name (debugging)
}

impl Process{
    pub const fn new() -> Self{
        Self{    
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

    pub fn set_kstack(&mut self, addr:usize){
        self.kstack = addr
    }

    pub fn set_state(&mut self, state: Procstate){
        self.state = state;
    }

    pub fn get_context_mut(&mut self) -> *mut Context{
        &mut self.context as *mut Context
    }
}

extern "C" {
    fn trampoline();
}





