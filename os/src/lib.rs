#![no_std]
#![feature(llvm_asm)]
#![feature(const_fn)]
#![feature(const_in_array_repeat_expressions)]
#![feature(global_asm)]
#![feature(ptr_internals)]
#![allow(dead_code)]
#![feature(panic_info_message)]

#[macro_use]
extern crate bitflags;

global_asm!(include_str!("entry.asm"));


#[macro_use]
mod print;
mod panic;

mod console;
mod register;
mod start;
mod rust_main;



