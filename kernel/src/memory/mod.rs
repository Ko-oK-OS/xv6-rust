pub mod kalloc;
pub mod mapping;
pub mod address;

pub use kalloc::*;
pub use mapping::*;
pub use address::*;

use crate::define::memlayout::PGSIZE;

use alloc::boxed::Box;

#[repr(C, align(4096))]
pub struct RawPage{
    data: [u8; PGSIZE]
}

#[repr(C, align(65536))]
pub struct BigPage {
    data: [u8; PGSIZE*16]
}

impl RawPage {
    pub unsafe fn new_zeroed() -> usize {
        let boxed_page = Box::<Self>::new_zeroed().assume_init();
        let ptr = Box::into_raw(boxed_page) as usize;
        println!("RawPage addr: 0x{:x}", ptr);
        ptr
        // Box::into_raw(boxed_page) as usize
    }
}

impl BigPage {
    pub unsafe fn new_zeroed() -> usize {
        let boxed_page = Box::<Self>::new_zeroed().assume_init();
        Box::into_raw(boxed_page) as usize
    }
}