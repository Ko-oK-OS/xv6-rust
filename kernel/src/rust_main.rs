use crate::logo::LOGO;
use crate::interrupt::{
    plic::{plicinit, plicinithart},
    trap::{trap_init_hart}
};

use crate::memory::{
    kalloc::kinit,
    mapping::{page_table::kvminit},
    container::boxed::Box
};

use crate::process::{cpu};

#[no_mangle]
pub extern "C" fn rust_main() -> !{
    println!("{}",LOGO);
    println!("xv6 kernel is booting!");
    if unsafe{cpu::cpuid()} == 0{
        unsafe{kinit()}; // physical page allocator
        // test heap allocator by using Box
        let test:usize = 42;
        match unsafe {Box::new(test)}{
            Some(m) => {
                println!("box: {}", *m);
            }
            None => {
                println!("none");
            }
        }
        kvminit(); // create kernel page table
        unsafe{ 
            trap_init_hart(); // trap vectors
            plicinit(); // set up interrupt controller
            plicinithart(); // ask PLIC for device interrupts
        }
        // test interrupt
        // unsafe {
        //     llvm_asm!("ebreak"::::"volatile");
        // };
    }
    panic!("end of rust main");
}