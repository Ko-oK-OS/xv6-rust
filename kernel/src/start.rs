use crate::register::{
    mstatus, mepc, satp, medeleg, mideleg, sie, mhartid, tp, clint, 
    mscratch, mtvec, mie
};

use crate::rust_main::rust_main;
use crate::define::param::NCPU;

static mut TIMER_SCRATCH:[[u64; 5]; NCPU] = [[0u64; 5]; NCPU];

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
    sie::intr_on();

    // ask for clock interrupts.
    timer_init();

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
// devintr() in trap.rs.
unsafe fn timer_init(){
    // each CPU has a separate source of timer interrupts.
    let id = mhartid::read();

    // ask the CLINT for a timer interrupt.
    let interval = 1000000;// cycles; about 1/10th second in qemu.
    clint::add_mtimecmp(id, interval);


    // prepare information in scratch[] for timervec.
    // scratch[0..2] : space for timervec to save registers.
    // scratch[3] : address of CLINT MTIMECMP register.
    // scratch[4] : desired interval (in cycles) between timer interrupts.

    TIMER_SCRATCH[id][3] = clint::count_mtiecmp(id) as u64;
    TIMER_SCRATCH[id][4] = interval;
    mscratch::write(TIMER_SCRATCH[id].as_ptr() as usize);

    // set the machine-mode trap handler.
    extern "C" {
        fn timervec();
    }

    mtvec::write(timervec as usize);

    // enable machine-mode interrupts.
    mstatus::enable_interrupt();

    // enable machine-mode timer interrupts.
    mie::write(mie::read() | mie::MIE::MTIE as usize);

}