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



#[macro_use]
extern crate bitflags;
extern crate lazy_static;

global_asm!(include_str!("asm/entry.S"));
global_asm!(include_str!("asm/kernelvec.S"));


#[macro_use]
mod printf;
mod panic;
mod start;
mod rust_main;

mod logo;
mod console;
mod register;
mod define;
mod lock;
mod process;
mod interrupt;
mod memory;




