#![no_std]
#![no_main]

//lack allocator;
extern crate alloc;
#[macro_use]
extern crate user;
//lack getchar's syscall

const LF: u8 = 0x0Au8;
const CR: u8 = 0x0Du8;
const DL: u8 = 0x7Fu8;
const BS: u8 = 0x09u8;

use std::rt::panic_count::get;

use user::{
    fork,
    exec,
    // Waitpid,
    open,
    // OpenFlags,
    close,
    dup,
};
use alloc::string::String;
use alloc::vec::Vec;

pub fn get_char()->u8 {
    let mut buf=[0u8;1];
    read(STDIN,buf);//lack syscall
    c[0]
}

#[no_mangle]
fn main()->isize{
    println!("shell init...");
    let mut buf:String = String::new();
    print!(">>>");
    loop{
        let temp=get_char();
        match temp {
            LF | CR =>{
                //to be continued
            }

            BS | DL =>{
                //to be continued
            }

            _=>{
                //order just push.
                print!("{}", temp as char);
                buf.push(temp as char);
            }
        }
    }
}