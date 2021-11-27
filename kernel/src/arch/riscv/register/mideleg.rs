#[inline]
pub unsafe fn read() -> usize {
    let ret: usize;
    llvm_asm!("csrr $0, mideleg":"=r"(ret):::"volatile");
    ret
}

#[inline]
pub unsafe fn write(mideleg: usize) {
    llvm_asm!("csrw mideleg, $0"::"r"(mideleg)::"volatile");
}