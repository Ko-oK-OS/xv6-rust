// Supervisor Trap-Vector Base Address
// low two bits are mode.
#[inline]
pub unsafe fn read() -> usize {
    let ret:usize;
    llvm_asm!("csrr $0, stvec":"=r"(ret):::"volatile");
    ret
}

#[inline]
pub unsafe fn write(x:usize){
    llvm_asm!("csrw stvec, $0"::"r"(x)::"volatile");
}