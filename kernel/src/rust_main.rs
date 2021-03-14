use cpu::cpuid;

use crate::logo::LOGO;
use crate::interrupt::{
    plic::{plicinit, plicinithart},
    trap::{trap_init_hart}
};

use crate::memory::{
    kalloc::kinit,
    mapping::{page_table::{ kvminit, kvminithart}},
    container::{boxed::Box, vec::Vec}
};

use crate::process::{cpu};

#[no_mangle]
pub unsafe extern "C" fn rust_main() -> !{
    if cpu::cpuid() == 0{
        // println!("{}",LOGO);
        println!("xv6 kernel is booting!");
        kinit(); // physical page allocator
        
        // test heap allocator by using Box
        // let test:usize = 42;
        // match Box::new(test){
        //     Some(m) => {
        //         println!("box: {}", *m);
        //     }
        //     None => {
        //         println!("none");
        //     }
        // }

        // test vec
        // let mut vec:Vec<usize> = Vec::new();
        // vec.push(45);
        // vec.push(46);
        // vec.push(47);
        // vec.push(48);
        // vec.printf();

        kvminit(); // create kernel page table
        kvminithart(); // turn on paging
        trap_init_hart(); // trap vectors
        plicinit(); // set up interrupt controller
        plicinithart(); // ask PLIC for device interrupts
        
        // test interrupt
        // unsafe {
        //     llvm_asm!("ebreak"::::"volatile");
        // };
    }
    panic!("end of rust main, cpu id is {}", cpu::cpuid());
}