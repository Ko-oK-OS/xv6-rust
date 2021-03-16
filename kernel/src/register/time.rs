// machine-mode cycle counter
#[inline]
pub unsafe fn read() -> usize {
    let ret:usize;
    llvm_asm!("csrr $0, time":"=r"(ret):::"volatile");
    ret
}