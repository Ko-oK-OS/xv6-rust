// which hart (core) is this?
#[inline]
pub unsafe fn read() -> usize{
    let ret:usize;
    llvm_asm!("csrr $0, mhartid":"=r"(ret):::"volatile");
    ret
}