use crate::process::cpu::cpuid;

use crate::logo::LOGO;
use crate::console::{self, console_init};
use crate::interrupt::{
    PLIC,
    trap::{trap_init_hart, trap_init}
};

use crate::memory::{
    RawPage,
    kalloc::*,
    mapping::kvm::{ kvm_init, kvm_init_hart }
};
use crate::driver::pci::pci_init;

use crate::process::*;
use crate::register::sstatus;
use crate::fs::*;
use crate::driver::virtio_disk::DISK;
use crate::test::console_write_test;

use core::sync::atomic::{ AtomicBool, Ordering };

static STARTED:AtomicBool = AtomicBool::new(false);
#[no_mangle]
pub unsafe extern "C" fn rust_main() {
    if cpu::cpuid() == 0 {
        // console::uart_init(); //  uart init
        console_init();
        println!("{}",LOGO); 
        println!("xv6-rust kernel is booting!");
        KERNEL_HEAP.kinit(); // physical page allocator
        kvm_init(); // create kernel page table
        kvm_init_hart(); // turn on paging
        PROC_MANAGER.init(); // process table
        trap_init();      // trap vectors
        trap_init_hart(); // trap vectors
        let plic = PLIC.acquire();
        plic.init(); // set up interrupt controller
        plic.init_hart(); // ask PLIC for device interrupts
        drop(plic);
        BCACHE.binit(); // buffer cache
        DISK.acquire().init(); // emulated hard disk
        pci_init(); // init pci
        PROC_MANAGER.user_init(); // first user process

        // panic!("end of rust main, cpu id is {}", cpu::cpuid());
        // console_write_test();
        // sstatus::intr_on();
        STARTED.store(true, Ordering::SeqCst);
        // llvm_asm!("ebreak"::::"volatile");
        // loop{};
    } else {
        while !STARTED.load(Ordering::SeqCst){}
        // println!("hart {} starting\n", cpu::cpuid());
        // kvm_init_hart(); // turn on paging
        // trap_init_hart();   // install kernel trap vector
        // plic_init_hart();   // ask PLIC for device interrupts
        // panic!("end of rust main, cpu id is {}", cpu::cpuid());
        loop{}
    }
    CPU_MANAGER.scheduler();
    
}