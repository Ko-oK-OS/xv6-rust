use crate::{lock::spinlock::Spinlock, memory::{ RawPage, PageAllocator, VirtualAddress, PhysicalAddress, page_round_up }, process::{CPU, CPU_MANAGER, PROC_MANAGER}};
use crate::fs::{FileType, VFile};
use core::ptr::{drop_in_place, null_mut, null};
use array_macro::array;
use alloc::{boxed::Box, sync::Arc};
use crate::arch::riscv::qemu::layout::{ PGSIZE };
use crate::memory::page_table_entry::*;
use super::bitmap::*;



pub const SHARE_MEM_TYPE_NR: usize = 64;
pub const MAX_NAME_LEN: usize = 20;


pub const SHARE_MEM_PRIVATE_FLAG: usize = 0x01;


pub const IPC_CREATE: usize = 0x1;
pub const IPC_EXCL:   usize = 0x2;

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
    pub const fn new() -> Self{
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
            let mut pa = self.paddr;
            for i in 0..self.npages {
                unsafe { drop_in_place(pa as *mut RawPage) };
                pa += PGSIZE;
            }
            
        }

        self.reset();
    }

    pub unsafe fn map(&mut self, shmaddr: usize, flags: usize) -> Option<usize> {
        let task = CPU_MANAGER.myproc().unwrap();
        let pgt = &mut *task.pagetable ;

        if shmaddr == 0 {

            let bitmap = &mut *task.sharemem_bitmap;
            let vaddr = bitmap.get_unmapped_addr(self.npages);
            self.vaddr = vaddr;

            if self.paddr == 0 {
                let paddr = RawPage::new_zeroed();
                self.paddr = paddr;

                
                pgt.map(VirtualAddress::new(vaddr),
                        PhysicalAddress::new(paddr),
                        PGSIZE,
                        PteFlags::W | PteFlags::R | PteFlags::U);

                //TODO npages
            } else {
                pgt.map(VirtualAddress::new(self.vaddr),
                        PhysicalAddress::new(self.paddr),
                        PGSIZE,
                        PteFlags::W | PteFlags::R | PteFlags::U);
            }
        }else{
            //TODO fixed mapping addr
        }
        
        self.links += 1;

        //TODO   error situation
        Some(self.vaddr)
    }

    //TODO   directly use paddr?
    pub unsafe fn unmap(&mut self){
        let task = CPU_MANAGER.myproc().unwrap();
        let pgt = &mut *task.pagetable ;

        let mut vaddr = self.vaddr;
        for i in 0..self.npages{
            let pte = pgt.translate(VirtualAddress::new(vaddr)).unwrap();

            //TODO Check exist 
            pte.0 = 0;

            vaddr += PGSIZE;
        }

        

        let bitmap = &mut *task.sharemem_bitmap;
        bitmap.set_nbits(BitMap::addr_to_page(self.vaddr), self.npages, 0);

        self.links -= 1;
        //TODO return value
    }
}


pub struct ShareMemManager{
    shares: [ShareMem; SHARE_MEM_TYPE_NR],
    lock: Spinlock<()>
}

static mut nextID: usize = 1;

pub static mut SHARE_MEM_MANAGER: ShareMemManager = ShareMemManager::new();

impl ShareMemManager{
    pub const fn new() -> Self {
        Self{
            shares: array![_=>ShareMem::new(); SHARE_MEM_TYPE_NR],
            lock: Spinlock::new((), "Share Mem Manager Lock")
        }
    }

    pub fn alloc(&mut self, name:[u8; MAX_NAME_LEN], size: usize) -> Option<usize> {
        let guard = self.lock.acquire();
        for i in 0..SHARE_MEM_TYPE_NR {
            let sharemem = &mut self.shares[i];
            if sharemem.used == true {
                continue;
            }else{
                sharemem.used = true;
                sharemem.name = name;
                unsafe {
                    sharemem.id   = nextID;
                    nextID += 1;
                }
                let sz = page_round_up(size);
                sharemem.npages = sz / PGSIZE;

                drop(guard);
                return Some(sharemem.id);
            }
        }

        drop(guard);
        Some(0)
    }

    pub fn getShareIndexByName(&mut self, name: [u8; MAX_NAME_LEN]) -> Option<usize> {
        for i in 0..SHARE_MEM_TYPE_NR {
            let sharemem = &mut self.shares[i];
            if sharemem.used == true && sharemem.name == name {
                return Some(i);
            }
        }
        None
    }

    pub fn getShareIndexByID(&mut self, id: usize) -> Option<usize> {
        for i in 0..SHARE_MEM_TYPE_NR {
            let sharemem = &mut self.shares[i];
            if sharemem.used == true && sharemem.id == id {
                return Some(i);
            }
        }

        None
    }

    pub fn map(&mut self, id: usize, shmaddr: usize, shmflag: usize) -> Option<usize>{
        let idxOption = self.getShareIndexByID(id);
        match idxOption {
            Some(idx) => {
                let sharemem = &mut self.shares[idx];
                unsafe { sharemem.map(shmaddr, shmflag) }
            }

            None => None
        }
    }

    pub fn unmap(&mut self, id: usize) -> Option<usize> {
        let idxOption = self.getShareIndexByID(id);
        match idxOption {
            Some(idx) => {
                let sharemem = &mut self.shares[idx];
                unsafe { sharemem.unmap() };
                Some(0)
            }

            None => None
        }
    }

    pub fn get(&mut self, name: [u8; MAX_NAME_LEN], size: usize, flags: usize) -> Option<usize> {
        if name == [0; MAX_NAME_LEN] {
            return None;
        }
        if size > 0 && page_round_up(size) >= SHARE_MEM_AREA_SIZE {
            return None;
        }

        println!("In mana get, size: {}, flag: {}", size, flags);

        if flags & IPC_CREATE != 0 {
            let idOption = self.alloc(name, size);
            return idOption;
        }else{
            
            let idxOption = self.getShareIndexByName(name);
            match idxOption {
                Some(idx) => {
                    let id = self.shares[idx].id;
                    Some(id)
                }
                None => {
                    None
                }
            }
        }
    }

    pub fn put(&mut self, id: usize) -> Option<usize> {
        let idxOption = self.getShareIndexByID(id);
        match idxOption {
            Some(idx) => {
                let sharemem = &mut self.shares[idx];
                sharemem.free();
                Some(0)
            }
            None => {
                None 
            }
        }
    }
}