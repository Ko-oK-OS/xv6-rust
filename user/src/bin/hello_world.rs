#![no_std]
#![no_main]

use user::println;
pub extern "C" fn start() {
    println!("Hello world!");
}

