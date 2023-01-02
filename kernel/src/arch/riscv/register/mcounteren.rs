// Machine-mode Counter-Enable
#[inline]
pub unsafe fn read() -> usize {
    let ret:usize;
    core::arch::asm!("csrr {}, mcounteren", out(reg)ret);
    ret
}

#[inline]
pub unsafe fn write(x:usize){
    core::arch::asm!("csrw mcounteren, {}",in(reg)x);
}