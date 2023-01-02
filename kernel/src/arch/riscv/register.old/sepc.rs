// machine exception program counter, holds the
// instruction address to which a return from
// exception will go.
#[inline]
pub unsafe fn read() -> usize {
    let ret:usize;
    core::arch::asm!("csrr $0, sepc":"=r"(ret):::"volatile");
    ret
}

#[inline]
pub unsafe fn write(x:usize){
    core::arch::asm!("csrw sepc, $0"::"r"(x)::"volatile");
}