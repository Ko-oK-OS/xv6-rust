use crate::lock::spinlock::Spinlock;

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
    killed:usize, // If non-zero, have been killed
    xstate:usize, // Exit status to be returned to parent's wait
    pid: usize,   // Process ID
}

pub struct ProcessInner{

}

// Per-process state
pub struct Process {
   pub excl: Spinlock<ProcessExcl>,
   pub inner: ProcessInner
}