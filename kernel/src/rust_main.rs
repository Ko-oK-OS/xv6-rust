use cpu::cpuid;

use crate::logo::LOGO;
use crate::console;
use crate::interrupt::{
    plic::{plicinit, plicinithart},
    trap::{trapinithart, trapinit}
};

use crate::memory::{
    kalloc::kinit,
    mapping::{kvm::{ kvminit, kvminithart}},
    container::{boxed::Box, vec::Vec}
};

use crate::process::*;
use crate::register::sstatus;

#[no_mangle]
pub unsafe extern "C" fn rust_main() -> !{
    if cpu::cpuid() == 0{
        console::consoleinit();
        println!("{}",LOGO);
        println!("xv6 kernel is booting!");
        kinit(); // physical page allocator
        kvminit(); // create kernel page table
        kvminithart(); // turn on paging
        ProcManager::procinit();
        trapinit();      // trap vectors
        trapinithart(); // trap vectors
        plicinit(); // set up interrupt controller
        plicinithart(); // ask PLIC for device interrupts

        // llvm_asm!("ebreak"::::"volatile");

        // panic!("end of rust main, cpu id is {}", cpu::cpuid());
        sstatus::intr_on();
        loop{}
    }else{
        println!("hart {} starting\n", cpu::cpuid());
        kvminithart(); // turn on paging
        trapinithart();   // install kernel trap vector
        plicinithart();   // ask PLIC for device interrupts
        panic!("end of rust main, cpu id is {}", cpu::cpuid());
        // loop{}
    }

    // scheduler();
    
}