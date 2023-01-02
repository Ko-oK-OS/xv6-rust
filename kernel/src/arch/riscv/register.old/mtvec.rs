// Machine-mode interrupt vector
#[inline]
pub unsafe fn read() -> usize {
    let ret:usize;
    core::arch::asm!("csrr $0, mtvec":"=r"(ret):::"volatile");
    ret
}

#[inline]
pub unsafe fn write(x:usize){
    core::arch::asm!("csrw mtvec, $0"::"r"(x)::"volatile");
}