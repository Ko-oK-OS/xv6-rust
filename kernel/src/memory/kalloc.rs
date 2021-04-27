use crate::lock::spinlock::Spinlock;
use crate::define::param::{ LEAF_SIZE, MAX_ALIGNMENT };
use crate::define::memlayout::{PGSIZE, PHYSTOP};
use super::address::{PhysicalAddress, Addr};
use lazy_static::*;
use core::alloc::{ GlobalAlloc, Layout };

use allocator::*;

use core::ptr::{write_volatile, write, NonNull};

// Buddy System for memory allocate

#[global_allocator]
pub static KERNEL_HEAP: KernelHeap = KernelHeap::uninit();

#[alloc_error_handler]
fn foo(layout: Layout) -> ! {
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
        self.0.acquire().init(start, end, LEAF_SIZE, MAX_ALIGNMENT);
    }

    pub unsafe fn kinit(&self ) {
        println!("kinit......");
        let end = end as usize;
        println!("KernelHeap: available memory: [{:#x}, {:#x})", end, PHYSTOP.as_usize());
        self.init(end, PHYSTOP.as_usize());
        println!("kinit done......");
    }
}



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

pub unsafe fn kinit(){
    println!("kinit......");
    println!("kinit: end={:#x}", end as usize);
    freerange(PhysicalAddress::new(end as usize), PhysicalAddress::new(PHYSTOP.as_usize()));
    println!("kinit done......")

}

unsafe fn freerange(mut pa_start:PhysicalAddress, pa_end:PhysicalAddress){
    println!("enter freerange......");
    // let mut p:PhysicalAddress = pa_start.pg_round_up();
    pa_start.pg_round_up();
    // let end_addr:PhysAddr = pa_end.as_usize();
    // println!("enter loop......");
    // println!("start addr: {:#x}", p);
    // println!("end addr: {:#x}", end_addr);
    while pa_start != pa_end{
        // println!("page addr: {:#x}", p);
        kfree(pa_start);
        pa_start.add_page();
    }
    println!("freerange done......")

}

// Free the page of physical memory pointed at by v,
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)

pub unsafe fn kfree(pa: PhysicalAddress){
    let addr:usize = pa.into();

    if (addr % PGSIZE !=0) || (addr < end as usize) || addr > PHYSTOP.as_usize(){
        panic!("kfree")
    }

    // Fill with junk to catch dangling refs.
    // for i in 0..PGSIZE {
    //     write_volatile((addr + i) as *mut u8, 1);
    // }

    let mut r:NonNull<FreeList> = FreeList::new(addr as *mut u8);
    let mut guard = (*KMEM).acquire();

    r.as_mut().set_next(guard.get_next());
    guard.set_next(Some(r));
    drop(guard);

    // (*KMEM).release();

}

// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.

pub unsafe fn kalloc() -> Option<*mut u8>{
    let mut guard = (*KMEM).acquire();
    let r = guard.get_next();
    if let Some(mut addr) = r{
        guard.set_next(addr.as_mut().get_next());
    }
    drop(guard);

    match r {
        Some(ptr) => {
            let addr = ptr.as_ptr() as usize;
            Some(addr as *mut u8)
        }
        None => None
    }
}

