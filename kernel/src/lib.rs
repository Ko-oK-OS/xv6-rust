#![no_std]
#![feature(llvm_asm)]
#![feature(const_fn)]
#![feature(const_in_array_repeat_expressions)]
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



#[macro_use]
extern crate bitflags;
extern crate lazy_static;

// use buddy system allocator
extern crate alloc;

global_asm!(include_str!("asm/entry.S"));
global_asm!(include_str!("asm/kernelvec.S"));
global_asm!(include_str!("asm/trampoline.S"));
global_asm!(include_str!("asm/swtch.S"));


#[macro_use]
mod printf;
mod start;
mod rust_main;
mod shutdown;
mod kernel_syscall;

mod logo;
mod console;
mod register;
mod define;
mod lock;
mod process;
mod interrupt;
mod memory;
mod syscall;
mod fs;
mod driver;
mod net;




