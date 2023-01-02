const MSTATUS_MPP_MASK:usize = 3 << 11; // previous mode.
const MSTATUS_MPP_M:usize =  3 << 11;
const MSTATUS_MPP_S:usize =  1 << 11;
const MSTATUS_MPP_U:usize =  0 << 11;
const MSTATUS_MIE:usize =  1 << 3;   // machine-mode interrupt enable.

use bit_field::BitField;


// read register from M mode
#[inline]
unsafe fn read() -> usize {
    let ret:usize;
    core::arch::asm!("csrr {}, mstatus",out(reg)ret);
    ret
}

// Write into register in M mode
#[inline]
unsafe fn write(x: usize) {
    core::arch::asm!("csrw mstatus, {}",in(reg)x);
}

// set M Previous Privilege mode to Supervisor, for mret.
pub unsafe fn set_mpp(){
    let mut x = read();
    x &= !MSTATUS_MPP_MASK;
    x |= MSTATUS_MPP_S;
    write(x);
}

// enable machine-mode interrupts.
pub unsafe fn enable_interrupt(){
    let mut mstatus = read();
    mstatus.set_bit(3, true);
    write(mstatus);
}

