#[inline]
pub unsafe fn read() -> usize {
    let ret:usize;
    core::arch::asm!("csrr $0, medeleg":"=r"(ret):::"volatile");
    ret
}

#[inline]
pub unsafe fn write(medeleg: usize){
    core::arch::asm!("csrw medeleg, $0"::"r"(medeleg)::"volatile");
}