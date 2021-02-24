
// global_asm!(include_str!("entry.asm"));
use crate::register::{
    mstatus, mepc, sstatus
};

use crate::rust_main::rust_main;

#[no_mangle]
pub extern "C" fn start() -> !{
    // Set M Previlege mode to Supervisor, for mret
    msatus::set_mpp();

    // set M Exception Program Counter to main, for mret.
    // requires gcc -mcmodel=medany
    mepc::write(rust_main as usize);

    // switch to supervisor mode and jump to main().
    llvm_asm!("mret"::::"volatile");

    loop{}
    
}