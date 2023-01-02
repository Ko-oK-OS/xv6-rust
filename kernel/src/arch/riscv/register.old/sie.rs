// Supervisor Interrupt Enable
pub enum SIE {
    SEIE = 1 << 9, // external
    STIE = 1 << 5, // timer
    SSIE = 1 << 1, // software
}

#[inline]
pub unsafe fn read() -> usize {
    let ret:usize;
    core::arch::asm!("csrr $0, sie":"=r"(ret):::"volatile");
    ret
}

#[inline]
pub unsafe fn write(x:usize) {
    core::arch::asm!("csrw sie, $0"::"r"(x)::"volatile");
}

/// enable all software interrupts
/// still need to set SIE bit in sstatus
pub unsafe fn intr_on() {
    let mut sie = read();
    sie |= SIE::SSIE as usize | SIE::STIE as usize | SIE::SEIE as usize;
    write(sie);
}