pub mod kalloc;
pub mod mapping;
pub mod address;



use core::ptr::{slice_from_raw_parts, slice_from_raw_parts_mut};

pub use kalloc::*;
pub use mapping::*;
pub use address::*;

use crate::{define::memlayout::PGSIZE, process::{ CPU_MANAGER }};
use crate::misc::mem_copy;

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
    }
}


/// Copy from either a user address, or kernel address,
/// depending on usr_dst. 
/// Returns Result<(), &'static str>
pub fn either_copy_in(
    dst: *mut u8, 
    user_src: usize, 
    kern_src: usize, 
    len: usize
) -> Result<(), &'static str>{
    unsafe {
        let my_proc =  CPU_MANAGER.myproc().unwrap();
        
        if user_src != 0 {
            let extern_data = &mut *(my_proc.extern_data.get());
            let page_table = extern_data.pagetable.as_mut().unwrap();
            page_table.copy_in(dst, kern_src, len)
        } else {
            mem_copy(dst as usize, kern_src, len);
            Ok(())
        }
    }
}

/// Copy to either a user address, or kernel address,
/// depending on usr_dst. 
/// Returns 0 on success, -1 on error. 
pub fn either_copy_out(
    user_dst: usize,
    dst: usize,
    src: *const u8,
    len: usize
) -> Result<(), &'static str> {
    unsafe{
        let p = CPU_MANAGER.myproc().unwrap();
        if user_dst != 0 {
            let extern_data = p.extern_data.get_mut();
            let page_table = extern_data.pagetable.as_mut().unwrap();
            page_table
                .copy_out(
                    VirtualAddress::new(dst), 
                    &mut *slice_from_raw_parts_mut(src as *mut u8, len)
                )
        } else {
            mem_copy(dst, src as usize, len);
            Ok(())
        }
    }

}