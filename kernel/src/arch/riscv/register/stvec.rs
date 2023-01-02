// Supervisor Trap-Vector Base Address
// low two bits are mode.
#[inline]
pub unsafe fn read() -> usize {
    let ret:usize;
    core::arch::asm!("csrr {}, stvec", out(reg)ret);
    ret
}

#[inline]
pub unsafe fn write(x:usize){
    core::arch::asm!("csrw stvec, {}", in(reg)x);
}