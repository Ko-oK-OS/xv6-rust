// Supervisor Trap Value
#[inline]
pub unsafe fn read() -> usize {
    let ret:usize;
    core::arch::asm!("csrr $0, stval":"=r"(ret):::"volatile");
    ret
}

#[inline]
pub unsafe fn write(x:usize){
    core::arch::asm!("csrw stval, $0"::"r"(x)::"volatile");
}