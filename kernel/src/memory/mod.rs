pub mod kalloc;
pub mod mapping;
pub mod address;

use core::ptr::{read, write};

pub use kalloc::*;
pub use mapping::*;
pub use address::*;

use crate::{define::memlayout::PGSIZE, process::{ CPU_MANAGER }};

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

/// memory copy, copy memory into other memory. 
pub(crate) unsafe fn mem_copy(dst: usize, src: usize, len: usize) {
    for i in 0..len {
        let val = read((src + i) as *const u8);
        write((dst + i) as *mut u8, val);
    }
}

/// Copy from either a user address, or kernel address,
/// depending on usr_dst. 
/// Returns Result<(), &'static str>
pub fn either_copy_in(
    dst: *mut u8, 
    user_usr: usize, 
    kern_src: usize, 
    len: usize
) -> Result<(), &'static str>{
    unsafe {
        let my_proc =  CPU_MANAGER.myproc().unwrap();
        
        if user_usr != 0 {
            let extern_data = &mut *(my_proc.extern_data.get());
            let page_table = extern_data.pagetable.as_mut().unwrap();
            page_table.copy_in(dst, kern_src, len)
        } else {
            mem_copy(dst as usize, kern_src, len);
            Ok(())
        }
    }
}