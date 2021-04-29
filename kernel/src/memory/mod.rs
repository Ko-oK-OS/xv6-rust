pub mod kalloc;
pub mod mapping;
pub mod address;
pub mod container;

pub use kalloc::*;
pub use mapping::*;
pub use address::*;
pub use container::*;

use crate::define::memlayout::PGSIZE;

use alloc::boxed::Box;

#[repr(C, align(4096))]
pub struct RawPage{
    data: [u8; PGSIZE]
}

impl RawPage {
    pub unsafe fn new_zeroed() -> usize {
        let boxed_page = Box::<Self>::new_zeroed().assume_init();
        Box::into_raw(boxed_page) as usize
    }
}