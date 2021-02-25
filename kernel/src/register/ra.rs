#[inline]
pub unsafe fn read() -> usize {
    let ret:usize;
    llvm_asm!("csrr $0, ra":"=r"(ret):::"volatile");
    ret
}