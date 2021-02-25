// Supervisor Scratch register, for early trap handler in trampoline.S.
#[inline]
pub unsafe fn read() -> usize {
    let ret:usize;
    llvm_asm!("csrr $0, sscratch":"=r"(ret):::"volatile");
    ret
}

#[inline]
pub unsafe fn write(x:usize){
    llvm_asm!("csrw sscratch, $0"::"r"(x)::"volatile");
}