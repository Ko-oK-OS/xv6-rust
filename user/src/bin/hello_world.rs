#![no_std]
#![no_main]

use user::println;
pub extern "C" fn _start() {
    println!("Hello world!");
}

