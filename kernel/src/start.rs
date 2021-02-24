
// global_asm!(include_str!("entry.asm"));
use crate::register::{
    mstatus
};

#[no_mangle]
pub extern "C" fn start() -> !{
    print!("test")
    // Set M Previlege mode to Supervisor, for mret
    msatus::set_mpp();

    // switch to supervisor mode and jump to main().
    llvm_asm!("mret"::::"volatile");

    loop{}
    
}