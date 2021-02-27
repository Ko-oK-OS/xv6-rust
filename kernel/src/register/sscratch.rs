// Supervisor Scratch register, for early trap handler in trampoline.S.

#[inline]
pub unsafe fn write(x:usize){
    llvm_asm!("csrw sscratch, $0"::"r"(x)::"volatile");
}