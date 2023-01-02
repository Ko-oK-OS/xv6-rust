// Machine-mode interrupt vector
#[inline]
pub unsafe fn read() -> usize {
    let ret:usize;
    core::arch::asm!("csrr {}, mtvec", out(reg)ret);
    ret
}

#[inline]
pub unsafe fn write(x:usize){
    core::arch::asm!("csrw mtvec, {}",in(reg)x);
}