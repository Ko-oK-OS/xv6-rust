#[inline]
pub unsafe fn write(x:usize){
    core::arch::asm!("csrw mscratch, {}",in(reg)x);
}