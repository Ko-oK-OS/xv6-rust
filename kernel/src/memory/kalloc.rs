use crate::lock::spinlock::Spinlock;
use crate::define::memlayout::{PGSIZE, PHYSTOP};
use super::address::{PhysicalAddress};

use core::ptr::write_volatile;


// first address after kernel.
    // defined by kernel.ld.
    extern "C"{
        fn end();
    }

pub fn kinit(){
    println!("kinit......")
}

// Free the page of physical memory pointed at by v,
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)

pub unsafe fn kfree(pa: PhysicalAddress){
    let mut addr:usize = pa.into();
    // let ptr = addr as *mut u8;

    if (addr % PGSIZE !=0) || (addr > end as usize) || addr > PHYSTOP.into(){
        panic!("kfree")
    }

    // Fill with junk to catch dangling refs.
    for i in 0..PGSIZE {
        write_volatile((addr + i) as *mut u8, 1);
    }
}

