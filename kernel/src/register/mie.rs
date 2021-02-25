// Machine-mode Interrupt Enable
pub enum MIE {
    MEIE = 1 << 11, // external
    MTIE = 1 << 7,  // timer
    MSIE = 1 << 3  // software
}

#[inline]
pub unsafe fn read() -> usize {
    let ret:usize;
    llvm_asm!("csrr $0, mie":"=r"(ret):::"volatile");
    ret
}

#[inline]
pub unsafe fn write(x:usize){
    llvm_asm!("csrw mie, $0"::"r"(x)::"volatile");
}