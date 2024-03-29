// Machine-mode Interrupt Enable
pub enum MIE {
    MEIE = 1 << 11, // external
    MTIE = 1 << 7,  // timer
    MSIE = 1 << 3  // software
}

#[inline]
pub unsafe fn read() -> usize {
    let ret:usize;
    core::arch::asm!("csrr {}, mie", out(reg)ret);
    ret
}

#[inline]
pub unsafe fn write(x:usize){
    core::arch::asm!("csrw mie, {}",in(reg)x);
}