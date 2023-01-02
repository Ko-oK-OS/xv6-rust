#[inline]
pub unsafe fn read() -> usize {
    let ret: usize;
    core::arch::asm!("csrr $0, mideleg":"=r"(ret):::"volatile");
    ret
}

#[inline]
pub unsafe fn write(mideleg: usize) {
    core::arch::asm!("csrw mideleg, $0"::"r"(mideleg)::"volatile");
}