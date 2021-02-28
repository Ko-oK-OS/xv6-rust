use super::{ process::Process, context::Context};
pub struct CPU{
    process:Process, // The process running on this cpu, or null.
    context:Context, // swtch() here to enter scheduler().
    noff:usize, // Depth of push_off() nesting.
    intena:usize // Were interrupts enabled before push_off()?
}