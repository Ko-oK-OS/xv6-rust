// Supervisor Interrupt Enable
pub enum SIE{
    SEIE = 1 << 9, // external
    STIE = 1 << 5, // timer
    SSIE = 1 << 1,
}

#[inline]
pub unsafe fn read() -> usize {
    let ret:usize;
    llvm_asm!("csrr $0, sie":"=r"(ret):::"volatile");
    ret
}

#[inline]
pub unsafe fn write(x:usize){
    llvm_asm!("csrw sie, $0"::"r"(x)::"volatile");
}