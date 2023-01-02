// which hart (core) is this?
#[inline]
pub unsafe fn read() -> usize{
    let ret:usize;
    core::arch::asm!("csrr {}, mhartid",out(reg)ret);
    ret
}