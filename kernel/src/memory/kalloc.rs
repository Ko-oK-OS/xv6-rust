use crate::lock::spinlock::Spinlock;
use crate::define::param::{ LEAF_SIZE, MAX_ALIGNMENT };
use crate::define::memlayout::{PGSIZE, PHYSTOP};
use super::address::{PhysicalAddress, Addr};
use core::alloc::{ GlobalAlloc, Layout };

use allocator::*;

use core::ptr::{write_volatile, write, NonNull};

// Buddy System for memory allocate

#[global_allocator]
pub static KERNEL_HEAP: KernelHeap = KernelHeap::uninit();

#[alloc_error_handler]
fn alloc_error_handler(layout: Layout) -> ! {
    panic!("alloc error: {:?}", layout);
}

// kernel heap
pub struct KernelHeap(Spinlock<BuddySystem>);

unsafe impl GlobalAlloc for KernelHeap {
    unsafe fn alloc(&self, layout: Layout) -> *mut u8 {
        self.0.acquire().alloc(layout)
    }

    unsafe fn dealloc(&self, ptr: *mut u8, layout: Layout) {
        self.0.acquire().dealloc(ptr, layout)
    }
}

impl KernelHeap {
    const fn uninit() -> Self {
        Self(Spinlock::new(BuddySystem::uninit(), "kernel heap"))
    }

    unsafe fn init(&self, start: usize, end: usize) {
        let res = self.0.acquire().init(start, end, LEAF_SIZE, MAX_ALIGNMENT);
        match res {
            Ok(()) => {
                println!("KernelHeap: success to init.");
            },

            Err(err) => {
                println!("KernelHeap: init error: {}.", err);
            }
        }
    }

    pub unsafe fn kinit(&self) {
        extern "C" {
            fn end();
        }
        let end = end as usize;
        println!("KernelHeap: available memory: [{:#x}, {:#x})", end, PHYSTOP.as_usize());
        self.init(end, PHYSTOP.as_usize());
    }
}
