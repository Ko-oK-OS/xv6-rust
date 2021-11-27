#[inline]
pub unsafe fn read() -> usize {
    let ret:usize;
    llvm_asm!("csrr $0, medeleg":"=r"(ret):::"volatile");
    ret
}

#[inline]
pub unsafe fn write(medeleg: usize){
    llvm_asm!("csrw medeleg, $0"::"r"(medeleg)::"volatile");
}