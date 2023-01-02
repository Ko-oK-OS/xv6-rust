#[inline]
pub unsafe fn read() -> usize {
    let ret:usize;
    core::arch::asm!("csrr $0, ra":"=r"(ret):::"volatile");
    ret
}