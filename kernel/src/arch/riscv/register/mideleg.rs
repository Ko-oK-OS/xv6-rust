#[inline]
pub unsafe fn read() -> usize {
    let ret: usize;
    core::arch::asm!("csrr {}, mideleg", out(reg)ret);
    ret
}

#[inline]
pub unsafe fn write(mideleg: usize) {
    core::arch::asm!("csrw mideleg, {}", in(reg)mideleg);
}