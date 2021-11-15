pub mod kalloc;
pub mod mapping;
pub mod address;

use core::ptr::{slice_from_raw_parts, slice_from_raw_parts_mut, self};

pub use kalloc::*;
pub use mapping::*;
pub use address::*;

use crate::{define::layout::PGSIZE, process::{ CPU_MANAGER }};
use crate::misc::mem_copy;

use alloc::boxed::Box;

pub trait PageAllocator: Sized {
    unsafe fn new_zeroed() -> usize {
        let boxed_page = Box::<Self>::new_zeroed().assume_init();
        let ptr = Box::into_raw(boxed_page) as usize;
        // println!("RawPage addr: 0x{:x}", ptr);
        ptr
    }
}

#[repr(C, align(4096))]
pub struct RawPage {
    data: [u8; PGSIZE]
}

impl PageAllocator for RawPage{}

#[repr(C, align(4096))]
pub struct Stack {
    data: [u8; PGSIZE * 4]
}

impl PageAllocator for Stack{}


/// Copy from either a user address, or kernel address,
/// depending on is_user. 
/// Returns Result<(), &'static str>
/// 从用户或者内核地址拷贝到内核中
pub fn copy_to_kernel(
    dst: *mut u8, 
    is_user: bool, 
    src: usize, 
    len: usize
) -> Result<(), &'static str>{
    unsafe {
        let my_proc =  CPU_MANAGER.myproc().unwrap();
        
        if !is_user {
            let extern_data = &mut *(my_proc.extern_data.get());
            let page_table = extern_data.pagetable.as_mut().unwrap();
            page_table.copy_in(
                dst,
                src,
                len
            )
        } else {
            mem_copy(dst as usize, src, len);
            Ok(())
        }
    }
}

/// Copy to either a user address, or kernel address,
/// depending on usr_dst. 
/// Returns 0 on success, -1 on error. 
/// 如果is_user是true的话，表明dst是用户的虚拟地址，否则是内核的虚拟地址
pub fn copy_from_kernel(
    is_user: bool,
    dst: usize,
    src: *const u8,
    len: usize
) -> Result<(), &'static str> {
    unsafe{
        let p = CPU_MANAGER.myproc().unwrap();
        if is_user {
            println!("[Debug] 从内核拷贝到用户");
            let extern_data = p.extern_data.get_mut();
            let page_table = extern_data.pagetable.as_mut().unwrap();
            println!("[Debug] dst: 0x{:x}, src: 0x{:x}", dst, src as usize);
            page_table
                .copy_out(
                    dst,
                    src,
                    len
                )
        } else {
            println!("[Debug] 从内核拷贝到内核");
            ptr::copy(src as *const u8, dst as *mut u8, len);
            Ok(())
        }
    }

}