use crate::{lock::spinlock::Spinlock, memory::{ RawPage, PageAllocator }, process::{CPU, CPU_MANAGER, PROC_MANAGER}};
use crate::fs::{FileType, VFile};
use core::ptr::{drop_in_place, null_mut, null};
use array_macro::array;
use alloc::{boxed::Box, sync::Arc};

pub const MAX_NAME_LEN: usize = 20;
struct ShareMem{
    id: usize,
    used: bool,
    vaddr: usize,
    paddr: usize,
    npages: usize,
    flags: usize,
    links: usize,
    name: [u8; MAX_NAME_LEN],

    lock: Spinlock<()>
}

impl ShareMem {
    pub fn new() -> Self{
        Self{
            id: 0,
            used: false,
            vaddr: 0,
            paddr: 0,
            npages: 0,
            flags: 0,
            links: 0,
            name: [0; MAX_NAME_LEN],
            lock: Spinlock::new((), "Share Mem Lock")
        }
    }

    pub fn reset(&mut self){
        self.id = 0;
        self.flags = 0;
        self.used = false;
        self.vaddr = 0;
        self.paddr = 0;
        self.npages = 0;
        self.links = 0;
        self.name = [0; MAX_NAME_LEN];
    }


    //TODO  npages, memory management
    pub fn free(&mut self){
        if self.paddr != 0 {
            let pa = self.paddr as *mut RawPage;
            unsafe { drop_in_place(pa) };
        }

        self.reset();
    }

    pub fn map(&mut self, id: usize, shmaddr: usize, flags: usize) -> Option<usize> {
        
    }
}