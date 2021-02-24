const MSTATUS_MPP_MASK:usize = 3 << 11; // previous mode.
const MSTATUS_MPP_M:usize =  3 << 11;
const MSTATUS_MPP_S:usize =  1 << 11;
const MSTATUS_MPP_U:usize =  0 << 11;
const MSTATUS_MIE:usize =  1 << 3;   // machine-mode interrupt enable.

// read register from M mode
#[inline]
unsafe fn read() -> usize {
    let ret:usize;
    llvm_asm!("csrr $0, mstatus":"=r"(ret):::"volatile");
    ret
}

// Write into register in M mode
#[inline]
unsafe fn write(x: usize) {
    llvm_asm!("csrw mstatus, $0"::"r"(x)::"volatile");
}

// set M Previous Privilege mode to Supervisor, for mret.
pub unsafe fn set_mpp(){
    let mut x = read();
    x &= !MSTATUS_MPP_MASK;
    x |= MSTATUS_MPP_S;
    write(x);
}

pub unsafe fn mepc(func: usize) {
    llvm_asm!("csrw mepc, %0" : : "r" (func));
}