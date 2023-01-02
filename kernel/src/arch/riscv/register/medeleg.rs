#[inline]
pub unsafe fn read() -> usize {
    let ret:usize;
    core::arch::asm!("csrr {}, medeleg",out(reg)ret);
    ret
}

#[inline]
pub unsafe fn write(medeleg: usize){
    core::arch::asm!("csrw medeleg, {}",in(reg)medeleg);
}