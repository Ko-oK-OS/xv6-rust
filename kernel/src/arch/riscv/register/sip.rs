// Supervisor Interrupt Pending

const SSIP: usize = 1 << 1;

#[inline]
pub unsafe fn read() -> usize {
    let sip: usize;
    llvm_asm!("csrr $0, sip":"=r"(sip):::"volatile");
    sip
}

#[inline]
pub unsafe fn write(sip: usize){
    llvm_asm!("csrw sip, $0"::"r"(sip)::"volatile");
}

pub fn clear_ssip() {
    unsafe {
        write(read() & !SSIP);
    }
}