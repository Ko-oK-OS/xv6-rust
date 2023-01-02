#[inline]
pub unsafe fn write(x:usize){
    core::arch::asm!("csrw mscratch, $0"::"r"(x)::"volatile");
}