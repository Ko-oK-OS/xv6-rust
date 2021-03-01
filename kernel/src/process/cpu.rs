use super::{ process::Process, context::Context};
use crate::register::tp;
pub struct CPU{
    process:Process, // The process running on this cpu, or null.
    context:Context, // swtch() here to enter scheduler().
    noff:usize, // Depth of push_off() nesting.
    intena:usize // Were interrupts enabled before push_off()?
}

pub unsafe fn cpuid() ->usize{
    let id = tp::read();
    id
}