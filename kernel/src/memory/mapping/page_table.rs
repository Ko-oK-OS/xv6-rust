use core::ptr::{write, read, write_bytes, copy_nonoverlapping};
use core::ptr::drop_in_place;
use core::ptr::copy;

use crate::interrupt::trap::kerneltrap;
use crate::register::{ sfence_vma, satp };
use crate::memory::mapping::page_table_entry::{ PageTableEntry, PteFlags};
use crate::define::memlayout::{ PGSIZE, MAXVA, PGSHIFT, TRAMPOLINE, TRAPFRAME };
use crate::memory::{
    address::{ VirtualAddress, PhysicalAddress, Addr }, 
    kalloc::KERNEL_HEAP,
    RawPage
};
use crate::misc::mem_copy;


use alloc::boxed::Box;
use super::*;

#[derive(Debug, Clone, Copy)]
#[repr(C, align(4096))]
pub struct PageTable{
    pub entries: [PageTableEntry; PGSIZE/8],
}

static mut KERNEL_PAGETABLE:PageTable = PageTable::empty();


impl PageTable{
    pub fn as_addr(&self) -> usize{
        self.entries.as_ptr() as usize
    }

    pub const fn empty() -> Self{
        Self{
            entries:[PageTableEntry(0); PGSIZE/8]
        }
    }

    /// Convert the page table to be the usize
    /// that can be written in satp register
    pub fn as_satp(&self) -> usize{
        satp::SATP_SV39 | ((self.entries.as_ptr() as usize) >> PGSHIFT)
    }

    #[inline]
    pub fn clear(&mut self){
        for pte in self.entries.iter_mut(){
            pte.write_zero();
        }
    }

    pub fn write(&mut self, page_table: &PageTable) {
        for i in 0..512 {
            self.entries[i].write(page_table.entries[i].as_usize());
        }
    }


    // Recursively free page-table pages.
    // All leaf mappings must already have been removed.

    pub fn freewalk(&mut self) {
        // there are 2^9 = 512 PTEs in a pagetable
        for i in 0..512 {
            let pte = self.entries[i];
            if pte.is_valid() && (pte.is_read() || pte.is_write() || pte.is_execute()) {
                // this PTE points to a lower-level page. 
                unsafe {
                    let child = &mut *(pte.as_pagetable());
                    child.freewalk();
                }
                self.entries[i] = PageTableEntry::new(0);
            } else if pte.is_valid() {
                panic!("freewalk(): leaf not be removed");
            }
        }

        drop(self);
    }

    

    // Return the address of the PTE in page table pagetable
    // that corresponds to virtual address va.  If alloc!=0,
    // create any required page-table pages.
    //
    // The risc-v Sv39 scheme has three levels of page-table
    // pages. A page-table page contains 512 64-bit PTEs.
    // A 64-bit virtual address is split into five fields:
    //   39..63 -- must be zero.
    //   30..38 -- 9 bits of level-2 index.
    //   21..29 -- 9 bits of level-1 index.
    //   12..20 -- 9 bits of level-0 index.
    //    0..11 -- 12 bits of byte offset within the page.


    // find  the PTE for a virtual address
     fn walk(
         &mut self, 
         va: VirtualAddress, 
         alloc:i32
        ) -> Option<&mut PageTableEntry> {
        let mut pagetable = self as *mut PageTable;
        let real_addr:usize = va.as_usize();
        if real_addr > MAXVA {
            panic!("walk");
        }
        for level in (1..=2).rev() {
            let pte = unsafe{ &mut (*pagetable).entries[va.page_num(level)] };
            if pte.is_valid() {
                pagetable = pte.as_pagetable();
    
            }else{
                if alloc == 0{
                    return None
                }

                let zeroed_pgt: Box<PageTable> = unsafe{ 
                    Box::new_zeroed().assume_init()
                };
                pagetable = Box::into_raw(zeroed_pgt);
                pte.0 = (((pagetable as usize) >> 12) << 10) | (PteFlags::V.bits());
            }
        }
        Some(unsafe{&mut (*pagetable).entries[va.page_num(0)]})
    }

    // Look up a virtual address, return the physical address,
    // or 0 if not mapped.
    // Can only be used to look up user pages.
    pub fn walkaddr(
        &mut self, 
        va: VirtualAddress
    ) -> Option<PhysicalAddress> {
        let addr = va.as_usize();
        if addr > MAXVA{
            return None
        }
        match self.walk(va, 0){
            Some(pte) => {
                if !pte.is_valid(){
                    return None
                }
                if !pte.is_user(){
                    return None
                }

                let pagetable_addr = pte.as_pagetable() as usize;
                Some(PhysicalAddress::new(pagetable_addr))
            }

            None => None
        }
    }


    // Create PTEs for virtual addresses starting at va that refer to
    // physical addresses starting at pa. va and size might not
    // be page-aligned. Returns 0 on success, -1 if walk() couldn't
    // allocate a needed page-table page.

    pub unsafe fn mappages(
        &mut self, 
        mut va: VirtualAddress, 
        mut pa: PhysicalAddress, 
        size:usize, 
        perm:PteFlags
    ) -> bool {
        let mut last = VirtualAddress::new(va.as_usize() + size);
        va.pg_round_down();
        last.pg_round_up();
        while va != last{
            match self.walk(va, 1){
                Some(pte) => {
                // TODO - is_valid?
                if pte.is_valid(){
                    println!(
                        "va: {:#x}, pa: {:#x}, pte: {:#x}",
                        va.as_usize(),
                        pa.as_usize(),
                        pte.0
                    );
                    panic!("remap");
                }
                pte.write_perm(pa, perm);
                va.add_page();
                pa.add_page();

                }
                None => return false
             }
        }
        true
    }

    // add a mapping to the kernel page table.
    // only used when booting
    // does not flush TLB or enable paging
    
    pub unsafe fn kvmmap(
        &mut self, 
        va:VirtualAddress, 
        pa:PhysicalAddress, 
        size:usize, 
        perm:PteFlags
    ) {
        println!(
            "kvm_map: va={:#x}, pa={:#x}, size={:#x}",
            va.as_usize(),
            pa.as_usize(),
            size
        );
        if !self.mappages(va, pa, size, perm){
            panic!("kvmmap");
        }
    }


    /// Create an empty user page table.
    /// return None if out of memory
    pub unsafe fn uvmcreate() -> Box<PageTable>{
        Box::new_zeroed().assume_init()
    }

    /// Load the user initcode into address 0 of pagetable
    /// for the very first process
    /// sz must be less than a page
    pub unsafe fn uvminit(&mut self, src: &[u8], size:usize){
        if size >= PGSIZE{
            panic!("inituvm: more than a page");
        }

        let mem = RawPage::new_zeroed() as *mut u8;
        write_bytes(mem, 0, PGSIZE);

        self.mappages(
            VirtualAddress::new(0), 
            PhysicalAddress::new(mem as usize), 
            PGSIZE, 
            PteFlags::W | PteFlags::R | PteFlags::X | PteFlags::U
        );

        copy_nonoverlapping(src.as_ptr(), mem, PGSIZE);
    }


    /// Allocate PTEs and physical memory to grow process from oldsz to
    /// newsz, which need not be page aligned.  Returns new size or 0 on error.
    pub unsafe fn uvmalloc(
        &mut self, 
        mut old_size:usize, 
        new_size:usize
    ) -> Option<usize> {
        if new_size < old_size {
            return Some(old_size)
        }

        old_size = page_round_up(old_size);
        let mut a = old_size;
        while a < new_size {

            let mem = RawPage::new_zeroed() as *mut u8;

            write_bytes(mem, 0, PGSIZE);

            if self.mappages(
                VirtualAddress::new(a), 
                PhysicalAddress::new(mem as usize), 
                PGSIZE, 
                PteFlags::W | PteFlags::R | PteFlags::X | PteFlags::U
            ){
                // drop RawPage , maybe UB?
                // drop(*(mem as *mut RawPage));
                drop_in_place(mem as *mut RawPage);
                self.uvmdealloc(a, old_size);
                return None
            }

            a += PGSIZE;
        }

        Some(new_size)
    }

    /// Free user memory pages,
    /// then free page-table pages
    pub fn uvmfree(&mut self, size: usize) {
        if size > 0 {
            let mut pa = PhysicalAddress::new(size);
            pa.pg_round_up();
            self.uvmunmap(
                VirtualAddress::new(0),
                 pa.as_usize(),
                1
            );
        }

        self.freewalk();
    }


    /// Deallocate user pages to bring the process size from oldsz to
    /// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
    /// need to be less than oldsz.  oldsz can be larger than the actual
    /// process size.  Returns the new process size.
    pub fn uvmdealloc(
        &mut self, 
        old_size:usize, 
        new_size:usize
    ) -> usize {
        if new_size >= old_size { 
            return old_size
        }

        if page_round_up(new_size) < page_round_up(old_size){
            let npages = (page_round_up(old_size) - page_round_up(new_size)) / PGSIZE;
            self.uvmunmap(
                VirtualAddress::new(page_round_up(new_size)), 
                npages, 
                1
            );
        }

        new_size

    }


    /// Remove npages of mappings starting from va. va must be
    /// page-aligned. The mappings must exist.
    /// Optionally free the physical memory.
    pub fn uvmunmap(
        &mut self, 
        va:VirtualAddress, 
        npages:usize, 
        do_free:usize
    ){
        if !va.is_page_aligned(){
            panic!("uvmunmap: not aligned");
        }

        let mut a = va.clone();

        while a != va.add_addr(npages * PGSIZE){
            match self.walk(va, 0){
                Some(pte) => {
                    if pte.as_usize() & PteFlags::V.bits() == 0 {
                        panic!("uvmunmap: not mapped")
                    }

                    if pte.as_flags() == PteFlags::V.bits() {
                        panic!("uvmunmap: not a leaf")
                    }

                    if do_free != 0 {
                        unsafe{
                            let pa = (&(*pte.as_pagetable())).as_addr();
                            drop_in_place(pa as *mut RawPage);
                        }
                    }

                    pte.write_zero();
                }

                None => panic!("uvmunmap(): walk")
            }

            a.add_page()
        }


    }


    /// Given a parent process's page table, copy
    /// its memory into a child's page table.
    /// Copies both the page table and the
    /// physical memory.
    /// returns 0 on success, -1 on failure.
    /// frees any allocated pages on failure.
    pub unsafe fn uvmcopy(
        &mut self, 
        new: &mut Self, 
        size: usize
    ) -> Result<(), &'static str> {
        let mut va = VirtualAddress::new(0);
        while va.as_usize() != size {
            match self.walk(va, 0) {
                Some(pte) => {
                    if !pte.is_valid() {
                        panic!("uvmcopy(): page not present");
                    }

                    let page_table = pte.as_pagetable();
                    let flags = pte.as_flags();
                    let flags = PteFlags::new(flags);

                    let new_page_table = &mut *(RawPage::new_zeroed() as *mut PageTable);
                    new_page_table.write(& *page_table);

                    if !new.mappages(
                        va,
                        PhysicalAddress::new(new_page_table.as_addr()),
                        PGSIZE,
                        flags
                    ) {
                        drop(new_page_table);
                        new.uvmunmap(
                            VirtualAddress::new(0), 
                            va.as_usize() / PGSIZE, 
                            1
                        );
                        return Err("uvmcopy(): fail.")
                    }
                },

                None => {
                    panic!("uvmcopy(): no exist pte(pte should exist)");
                }
            }
            va.add_page();
        }

        Ok(())
    }

    /// mark a PTE invalid for user access.
    /// used by exec for the user stack guard page.
    pub fn uvmclear(&mut self, va: VirtualAddress) {
        if let Some(pte) = self.walk(va, 0) {
            pte.rm_user_bit();
        }else {
            panic!("uvmclear(): Not found valid pte for virtualaddress");
        }
    }

    /// Copy from kernel to user.
    /// Copy len bytes from src to virtual address dstva in a given page table.
    /// Return Result<(), Err>. 
    pub fn copy_out(
        &mut self, 
        mut dst: usize, 
        mut src: *const u8,
        mut len: usize 
    ) -> Result<(), &'static str> {
        let mut va = VirtualAddress::new(dst);
        va.pg_round_down();

        loop {
            let pa = self.walkaddr(va).unwrap();
            let count = PGSIZE - (dst - va.as_usize());
            if len < count {
                mem_copy(
                    pa.as_usize() + (dst - va.as_usize()), 
                    src as usize, 
                    len
                );
                return Ok(())
            }
            len -= count;
            src = unsafe{ src.offset(count as isize) };
            va.add_page();
        }
    }   


    /// Copy from user to kernel.
    /// Copy len bytes to dst from virtual address srcva in a given page table.
    /// Return Result<(), Err>
    
    pub fn copy_in(
        &mut self, 
        mut dst: *mut u8, 
        src: usize, 
        mut len: usize
    ) -> Result<(), &'static str> {
        let mut va = VirtualAddress::new(src);
        va.pg_round_down();
        loop {
            // Get physical address by virtual address
            let pa = self.walkaddr(va).unwrap();
            // Get copy bytes of current page.
            let count = PGSIZE - (src - va.as_usize());
            if len < count {
                mem_copy(
                    dst as usize, 
                    pa.as_usize() + ( src - va.as_usize() ), 
                    len
                );
                return Ok(())
            }
            mem_copy(
                dst as usize,
                pa.as_usize() + ( src - va.as_usize() ),
                count
            );

            len -= count;
            dst = unsafe{ dst.offset(count as isize) };
            va.add_page();
        }
    }

    /// Copy a null-trrminated string from user to kernel. 
    /// Copy bytes to dst from virtual address src in a given table. 
    /// until a '\0', or max. 
    /// Return Result. 
    pub fn copy_in_str(
        &mut self, 
        dst: *mut u8,
        src: usize,
        max: usize
    ) -> Result<(),&'static str> {
        let mut va = VirtualAddress::new(src as usize);
        va.pg_round_down();
        loop {
            let pa = self.walkaddr(va).unwrap();
            let count = PGSIZE - (src - va.as_usize());
            let s = (pa.as_usize() + (src - va.as_usize())) as *const u8;
            if max < count {
                for i in 0..max {
                    unsafe{
                        let src_ptr = s.offset(i as isize);
                        let src_val = read(src_ptr); 
                        if src_val == 0 {
                            return Err("copy_in_str: string end.")
                        }
                        let dst_ptr = dst.offset(i as isize);
                        write(dst, src_val);
                    }
                }
                return Ok(())
            }

            for i in 0..count {
                unsafe {
                    let src_ptr = s.offset(i as isize);
                    let src_val = read(src_ptr); 
                    if src_val == 0 {
                        return Err("copy_in_str: string end.")
                    }
                    let dst_ptr = dst.offset(i as isize);
                    write(dst, src_val);
                }
            }
            max -= count;
            va.add_page();
        }
    }


    /// Free a process's page table, and free the
    /// physical memory it refers to.
    pub fn proc_freepagetable(&mut self, size: usize) {
        self.uvmunmap(
            VirtualAddress::new(TRAMPOLINE ), 
            1, 
            0
        );

        self.uvmunmap(
            VirtualAddress::new(TRAPFRAME),
            1,
            0
        );

        self.uvmfree(size);
    }

}