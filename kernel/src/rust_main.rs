use crate::logo::LOGO;
use crate::interrupt::{
    plic::{plicinit},
    trap::{trap_init_hart}
};

#[no_mangle]
pub extern "C" fn rust_main() -> !{
    println!("{}",LOGO);
    println!("xv6 kernel is booting!");
    unsafe{ 
        trap_init_hart();
        plicinit();
    }
    // test interrupt
    unsafe {
        llvm_asm!("ebreak"::::"volatile");
    };
    panic!("end of rust main");
}