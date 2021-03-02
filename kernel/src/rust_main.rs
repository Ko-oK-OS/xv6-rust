use crate::logo::LOGO;
use crate::interrupt::{
    plic::{plicinit, plicinithart},
    trap::{trap_init_hart}
};
use crate::memory::{
    kalloc::kinit
};

use crate::process::{cpu};

#[no_mangle]
pub extern "C" fn rust_main() -> !{
    println!("{}",LOGO);
    println!("xv6 kernel is booting!");
    if unsafe{cpu::cpuid()} == 0{
        unsafe{ 
            trap_init_hart(); // trap vectors
            plicinit(); // set up interrupt controller
            plicinithart(); // ask PLIC for device interrupts
        }
        kinit();
        // test interrupt
        unsafe {
            llvm_asm!("ebreak"::::"volatile");
        };
    }
    panic!("end of rust main");
}