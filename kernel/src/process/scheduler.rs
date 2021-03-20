use super::*;
use crate::define::{
    param::NPROC,
    memlayout::KSTACK
};
use crate::lock::spinlock::Spinlock;

static mut proc:[Process; NPROC] = [Process::new(); NPROC];

// initialize the proc table at boot time.
// Only used in boot.
pub fn procinit(){
    for p in proc.iter_mut(){
        p.inner.set_kstack(
            KSTACK(
                (p.as_ptr() as usize) - (proc.as_ptr() as usize)
                )
            );
    }
}