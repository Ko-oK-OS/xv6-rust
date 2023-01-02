// machine-mode cycle counter
#[inline]
pub unsafe fn read() -> usize {
    let ret:usize;
    core::arch::asm!("csrr $0, time":"=r"(ret):::"volatile");
    ret
}