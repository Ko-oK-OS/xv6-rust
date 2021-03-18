use crate::register::tp;
use crate::define::param::NCPU;
use core::ptr::NonNull;
use super::*;
pub struct CPU{
    process:Option<NonNull<Process>>, // The process running on this cpu, or null.
    context:Context, // swtch() here to enter scheduler().
    noff:usize, // Depth of push_off() nesting.
    intena:usize // Were interrupts enabled before push_off()?
}

static mut cpus:[CPU; NCPU] = [CPU::new(); NCPU];

pub unsafe fn cpuid() ->usize{
    let id = tp::read();
    id
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
}