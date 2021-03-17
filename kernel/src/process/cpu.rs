use super::{ process::Process, context::Context};
use crate::register::tp;
use core::ptr::NonNull;
pub struct CPU{
    process:Option<NonNull<Process>>, // The process running on this cpu, or null.
    context:Context, // swtch() here to enter scheduler().
    noff:usize, // Depth of push_off() nesting.
    intena:usize // Were interrupts enabled before push_off()?
}

pub unsafe fn cpuid() ->usize{
    let id = tp::read();
    id
}