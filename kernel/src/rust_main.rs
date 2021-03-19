use cpu::cpuid;

use crate::logo::LOGO;
use crate::console;
use crate::interrupt::{
    plic::{plicinit, plicinithart},
    trap::{trap_init_hart}
};

use crate::memory::{
    kalloc::kinit,
    mapping::{kvm::{ kvminit, kvminithart}},
    container::{boxed::Box, vec::Vec}
};

use crate::process::{cpu};

#[no_mangle]
pub unsafe extern "C" fn rust_main() -> !{
    if cpu::cpuid() == 0{
        console::consoleinit();
        println!("{}",LOGO);
        println!("xv6 kernel is booting!");
        kinit(); // physical page allocator
        kvminit(); // create kernel page table
        kvminithart(); // turn on paging
        trap_init_hart(); // trap vectors
        plicinit(); // set up interrupt controller
        plicinithart(); // ask PLIC for device interrupts
        panic!("end of rust main, cpu id is {}", cpu::cpuid());
    }
    panic!("end of rust main, cpu id is {}", cpu::cpuid());
}