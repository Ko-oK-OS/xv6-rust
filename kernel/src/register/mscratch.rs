#[inline]
pub unsafe fn write(x:usize){
    llvm_asm!("csrw mscratch, $0"::"r"(x)::"volatile");
}