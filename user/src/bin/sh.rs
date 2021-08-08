#![no_std]
#![no_main]

// lack allocator;
extern crate alloc;
#[macro_use]
extern crate user;
// lack getchar's syscall

const LF: u8 = 0x0Au8;
const CR: u8 = 0x0Du8;
const DL: u8 = 0x7Fu8;
const BS: u8 = 0x09u8;

use user::{
    fork,
    exec,
    // Waitpid,
    open,
    // OpenFlags,
    close,
    dup,
    read,

    STDIN
};
use alloc::string::String;
use alloc::vec::Vec;

pub fn get_char() -> u8 {
    let mut buf=[0u8;1];
    read(STDIN,&mut buf, 1);//lack syscall
    buf[0]
}

#[no_mangle]
pub extern "C" fn start() -> isize {
    println!("shell init...");
    let mut buf: String = String::new();
    print!(">>>");
    loop{
        let c=get_char();
        match c {
            LF | CR =>{
                //to be continued
            }

            BS | DL =>{
                // to be continued
            }

            _ => {
                // order just push.
                println!("{}", c as char);
                buf.push(c as char);
            }
        }
    }
}