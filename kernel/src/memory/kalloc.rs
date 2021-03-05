use crate::lock::spinlock::Spinlock;
use crate::define::memlayout::{PGSIZE, PHYSTOP};
use super::address::{PhysicalAddress};
use lazy_static::*;

use core::ptr::{write_volatile, write, NonNull};


#[repr(C)]
pub struct Run{
    next: Option<NonNull<Run>>,
}

unsafe impl Send for Run{}


impl Run{
    pub unsafe fn new(ptr: *mut u8) -> NonNull<Run>{
        let r = ptr as *mut Run;
        write(r, Run{next: None});
        NonNull::new(r).unwrap()
    }

    pub fn set_next(&mut self, value: Option<NonNull<Run>>){
        self.next = value
    }

    pub fn get_next(&mut self) -> Option<NonNull<Run>>{
        self.next.take()
    }
}

type FreeList = Run;

lazy_static!{
    static ref KMEM: Spinlock<FreeList> = Spinlock::new(FreeList { next: None }, "kmem");
}
// static KMEM: Spinlock<FreeList> = Spinlock::new(FreeList { next: None }, "kmem");


// first address after kernel.
    // defined by kernel.ld.
    extern "C"{
        fn end();
    }

pub fn kinit(){
    println!("kinit......");
    println!("kinit done......")

}

fn freerange(pa_start:PhysicalAddress, pa_end:PhysicalAddress){

}

// Free the page of physical memory pointed at by v,
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)

pub unsafe fn kfree(pa: PhysicalAddress){
    let addr:usize = pa.into();

    if (addr % PGSIZE !=0) || (addr < end as usize) || addr > PHYSTOP.into(){
        panic!("kfree")
    }

    // Fill with junk to catch dangling refs.
    for i in 0..PGSIZE {
        write_volatile((addr + i) as *mut u8, 1);
    }

    let mut r:NonNull<FreeList> = FreeList::new(addr as *mut u8);
    let mut guard = (*KMEM).acquire();

    r.as_mut().set_next(guard.get_next());
    guard.set_next(Some(r));

    (*KMEM).release();

}

// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.

pub fn kalloc(){

}

