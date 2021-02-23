// remove std
#![no_std]

// remove main
#![no_main]

#![feature(llvm_asm)]

#![feature(global_asm)]

#![feature(panic_info_message)]

#[macro_use]
mod console;
mod panic;
mod sbi;

global_asm!(include_str!("entry.asm"));

#[no_mangle]
pub extern "C" fn main() {
    println!("Hello xv6!");
    panic!("end of rust_main")
    // loop{}
}
