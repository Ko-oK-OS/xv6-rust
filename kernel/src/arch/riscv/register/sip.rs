// Supervisor Interrupt Pending

const SSIP: usize = 1 << 1;

#[inline]
pub unsafe fn read() -> usize {
    let sip: usize;
    core::arch::asm!("csrr {}, sip", out(reg)sip);
    sip
}

#[inline]
pub unsafe fn write(sip: usize){
    core::arch::asm!("csrw sip, {}", in(reg)sip);
}

pub fn clear_ssip() {
    unsafe {
        write(read() & !SSIP);
    }
}