#![no_std]
#![no_main]

#![feature(llvm_asm)]
#![feature(const_fn)]
#![feature(global_asm)]
#![feature(ptr_internals)]
#![allow(dead_code)]
#![feature(panic_info_message)]
#![allow(non_snake_case)]
#![allow(const_item_mutation)]
#![allow(unused_imports)]
#![feature(const_option)]
#![feature(const_fn_union)]
#![feature(alloc_error_handler)]
#![feature(new_uninit)]
#![feature(fn_traits)]
#![feature(const_fn_fn_ptr_basics)]
#![feature(const_mut_refs)]


#[macro_use]
extern crate bitflags;
extern crate lazy_static;

// use buddy system allocator
extern crate alloc;
extern crate fs_lib;

global_asm!(include_str!("asm/entry.S"));
global_asm!(include_str!("asm/kernelvec.S"));
global_asm!(include_str!("asm/trampoline.S"));
global_asm!(include_str!("asm/switch.S"));


#[macro_use]
mod printf;
mod shutdown;

mod logo;
mod console;
mod arch;
mod lock;
mod process;
mod memory;
mod syscall;
mod fs;
mod driver;
mod net;
mod misc;
mod trap;

use core::sync::atomic::{ AtomicBool, Ordering };

use crate::driver::plic::{plic_init, plic_init_hart};
use crate::process::cpu::cpuid;
use crate::logo::LOGO;
use crate::console::{UART, console_init};
use crate::trap::trap_init_hart;
use crate::memory::{
    RawPage,
    kalloc::*,
    mapping::kernel_map::{ kvm_init, kvm_init_hart }
};
use crate::process::*;
use crate::fs::*;
use crate::driver::virtio_disk::DISK;
use crate::arch::riscv::{
    mstatus, mepc, satp, medeleg, mideleg, sie, mhartid, tp, clint, 
    mscratch, mtvec, mie, sstatus
};
use crate::arch::riscv::qemu::param::NCPU;

static mut TIMER_SCRATCH:[[u64; 5]; NCPU] = [[0u64; 5]; NCPU];
static STARTED:AtomicBool = AtomicBool::new(false);

/// 引导启动程序,进行寄存器的初始化操作
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

/// set up to receive timer interrupts in machine mode,
/// which arrive at timervec in kernelvec.S,
/// which turns them into software interrupts for
/// devintr() in trap.rs.
/// 启动时钟中断
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

/// 进入内核初始化
#[no_mangle]
pub unsafe extern "C" fn rust_main() {
    if cpu::cpuid() == 0 {
        console_init();
        println!("{}",LOGO); 
        println!("xv6-rust kernel is booting!");
        KERNEL_HEAP.kinit(); // physical page allocator
        kvm_init(); // create kernel page table
        kvm_init_hart(); // turn on paging
        PROC_MANAGER.init(); // process table
        trap_init_hart(); // trap vectors
        plic_init(); // set up interrupt controller
        plic_init_hart(); // ask PLIC for device interrupts
        BCACHE.binit(); // buffer cache
        DISK.acquire().init(); // emulated hard disk
        PROC_MANAGER.user_init(); // first user process
        STARTED.store(true, Ordering::SeqCst);
        sstatus::intr_on();
    } else {
        while !STARTED.load(Ordering::SeqCst){}
        println!("hart {} starting\n", cpu::cpuid());
        kvm_init_hart(); // turn on paging
        trap_init_hart(); // install kernel trap vector
        plic_init(); // set up interrupt controller
        plic_init_hart(); // ask PLIC for device interrupts
    }
    CPU_MANAGER.scheduler();
    
}


