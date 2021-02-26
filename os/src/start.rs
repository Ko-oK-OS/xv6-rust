use crate::register::{
    mstatus, mepc, sstatus, satp, medeleg, mideleg, sie, mhartid, tp,

};

use crate::rust_main::rust_main;

#[no_mangle]
pub unsafe fn start() -> !{
    // Set M Previlege mode to Supervisor, for mret
    mstatus::set_mpp();

    // set M Exception Program Counter to main, for mret.
    // requires gcc -mcmodel=medany
    mepc::write(rust_main as usize);

    // disable paging for now.
    satp::write(0);

    // delegate all interrupts and exceptions to supervisor mode.
    medeleg::write(0xffff);
    mideleg::write(0xffff);
    sie::write(sie::read() | sie::SIE::SEIE as usize | sie::SIE::STIE as usize | sie::SIE::SSIE as usize);

    // ask for clock interrupts.
    // timerinit();

    // keep each CPU's hartid in its tp register, for cpuid().
    let id:usize = mhartid::read(); 
    tp::write(id);

    // switch to supervisor mode and jump to main().
    llvm_asm!("mret"::::"volatile");

    loop{}
    
}

// set up to receive timer interrupts in machine mode,
// which arrive at timervec in kernelvec.S,
// which turns them into software interrupts for
// devintr() in trap.c.
unsafe fn timerinit() -> ! {
    loop{}
}