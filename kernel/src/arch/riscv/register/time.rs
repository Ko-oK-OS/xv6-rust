// machine-mode cycle counter
#[inline]
pub unsafe fn read() -> usize {
    let ret:usize;
    core::arch::asm!("csrr {}, time", out(reg)ret);
    ret
}