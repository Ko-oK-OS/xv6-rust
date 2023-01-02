// Supervisor Scratch register, for early trap handler in trampoline.S.

#[inline]
pub unsafe fn write(x:usize){
    core::arch::asm!("csrw sscratch, {}", in(reg)x);
}