// Supervisor Trap Value
#[inline]
pub unsafe fn read() -> usize {
    let ret:usize;
    core::arch::asm!("csrr {}, stval", out(reg)ret);
    ret
}

#[inline]
pub unsafe fn write(x:usize){
    core::arch::asm!("csrw stval, {}", in(reg)x);
}