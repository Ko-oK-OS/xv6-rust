use core::ptr::{write, read, write_bytes, copy_nonoverlapping};
use core::ptr::drop_in_place;
use core::ptr::copy;

use crate::trap::kernel_trap;
use crate::arch::riscv::{ sfence_vma, satp };
use crate::memory::mapping::page_table_entry::{ PageTableEntry, PteFlags};
use crate::arch::riscv::qemu::layout::{ PGSIZE, MAXVA, PGSHIFT, TRAMPOLINE, TRAPFRAME };
use crate::memory::{
    address::{ VirtualAddress, PhysicalAddress, Addr }, 
    kalloc::KERNEL_HEAP,
    RawPage,
    PageAllocator
};
use crate::misc::mem_copy;


use alloc::boxed::Box;
use super::*;

#[derive(Debug, Clone )]
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
    pub fn as_satp(&self) -> usize {
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


    /// Recursively free page-table pages.
    /// All leaf mappings must already have been removed.
    pub fn free_pagetable(&mut self) {
        // there are 2^9 = 512 PTEs in a pagetable
        for i in 0..self.entries.len() {
            let pte = &mut self.entries[i];
            if pte.is_valid() && !pte.is_leaf() {
                // this PTE points to a lower-level page. 
                unsafe {
                    let child_pgt = &mut *(pte.as_pagetable());
                    child_pgt.free_pagetable();
                }
                self.entries[i].0 = 0;
                // pte.free();
            } 
            //TODO BUG  TRAPONLINE   Don't need free, 
            else if pte.is_valid() && pte.is_leaf() {
                // panic!("pagetable free(): leaf not be removed {} ", pte.0);   
            }
        }
        drop(self);
    }

    pub fn copy_pagetable(&mut self, pgt_b: &mut Self){
        for i in 0..self.entries.len(){
            let pte_a = &mut self.entries[i];
            let pte_b = &mut pgt_b.entries[i];
            let pte_flag_a = pte_a.as_flags();
            if pte_a.is_valid() && !pte_a.is_leaf() {
                let zeroed_pgt: Box<PageTable> = unsafe { Box::new_zeroed().assume_init() };
                let child_pgt_b = Box::into_raw(zeroed_pgt);
                pte_b.0 = ((child_pgt_b as usize >> 12) << 10) | pte_flag_a;

                let child_pgt_a = unsafe { &mut *(pte_a.as_pagetable()) };
                child_pgt_a.copy_pagetable( unsafe {&mut *child_pgt_b} );
            }else if pte_a.is_valid() {
                pte_b.0 = pte_a.0;
            }
        }
    }

    pub fn copy_pagetable_rmW(&mut self, pgt_b: &mut Self){
        for i in 0..self.entries.len(){
            let pte_a = &mut self.entries[i];
            let pte_b = &mut pgt_b.entries[i];
            let pte_flag_a = pte_a.as_flags();
            if pte_a.is_valid() && !pte_a.is_leaf() {
                let zeroed_pgt: Box<PageTable> = unsafe { Box::new_zeroed().assume_init() };
                let child_pgt_b = Box::into_raw(zeroed_pgt);
                pte_b.0 = ((child_pgt_b as usize >> 12) << 10) | pte_flag_a;

                let child_pgt_a = unsafe { &mut *(pte_a.as_pagetable()) };
                child_pgt_a.copy_pagetable( unsafe {&mut *child_pgt_b} );
            }else if pte_a.is_valid() {
                // pte_b.0 = pte_a.0;
                pte_b.rm_W_bit();
                pte_a.rm_W_bit();
            }
        }
    }



    pub fn print_pagetable(&mut self) {
        for i in 0..self.entries.len(){
            let pte_1 = &mut self.entries[i];

            if pte_1.is_valid(){
                println!("{}--{}", i, pte_1.as_usize());

                let pgt_2 = unsafe { &mut *pte_1.as_pagetable() };
                for j in 0..pgt_2.entries.len(){
                    let pte_2 = &mut pgt_2.entries[j];

                    if pte_2.is_valid() {
                        println!("    {}--{}", j, pte_2.as_usize());

                        let pgt_3 = unsafe { &mut *pte_2.as_pagetable() };
                        for k in 0..pgt_3.entries.len(){
                            let pte_3 = &mut pgt_3.entries[k];

                            if pte_3.is_valid(){
                                println!("        {}--{}", k, pte_3.as_usize());
                            }
                        }
                    }
                }
            }
        }
    }


    /// Return the address of the PTE in page table pagetable
    /// that corresponds to virtual address va.  If alloc!=0,
    /// create any required page-table pages.
    ///
    /// The risc-v Sv39 scheme has three levels of page-table
    /// pages. A page-table page contains 512 64-bit PTEs.
    /// A 64-bit virtual address is split into five fields:
    ///   39..63 -- must be zero.
    ///   30..38 -- 9 bits of level-2 index.
    ///   21..29 -- 9 bits of level-1 index.
    ///   12..20 -- 9 bits of level-0 index.
    ///    0..11 -- 12 bits of byte offset within the page.
    /// 
    /// Look up a virtual address, return the physical address,
    /// or 0 if not mapped.
    /// Can only be used to look up user pages.
    /// 将虚拟地址翻译成物理地址，返回页表项
    fn translate(
        &mut self,
        va: VirtualAddress
    ) -> Option<&mut PageTableEntry> {
        if va.as_usize() > MAXVA {
            return None
        }
        let mut page_table = self as *mut PageTable;
        for level in (1..=2).rev() {
            let pte = unsafe{ &mut (*page_table).entries[va.page_num(level)] };
            if pte.is_valid() {
                page_table = pte.as_pagetable();
    
            }else{
               return None
            }            
        }
        let pte = unsafe{&mut (*page_table).entries[va.page_num(0)]};
        Some(pte)
    }

    /// 将虚拟地址翻译成物理地址或者直接映射
    fn translate_or_alloc(
        &mut self,
        va: VirtualAddress
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
    
            }else {
                let zeroed_pgt: Box<PageTable> = unsafe{ 
                    Box::new_zeroed().assume_init()
                };
                pagetable = Box::into_raw(zeroed_pgt);
                pte.0 = (((pagetable as usize) >> 12) << 10) | (PteFlags::V.bits());
            }
        }
        Some(unsafe{&mut (*pagetable).entries[va.page_num(0)]})
    }

    /// Look up a virtual address, return the physical address,
    /// or 0 if not mapped.
    /// Can only be used to look up user pages.
    /// 通过给定的页表，将对应的虚拟地址转换成物理地址
    pub fn pgt_translate(
        &mut self, 
        va: VirtualAddress
    ) -> Option<PhysicalAddress> {
        let addr = va.as_usize();
        if addr > MAXVA {
            return None
        }
        match self.translate(va){
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

            None => { None }
        }
    }


    /// Create PTEs for virtual addresses starting at va that refer to
    /// physical addresses starting at pa. va and size might not
    /// be page-aligned. Returns 0 on success, -1 if walk() couldn't
    /// allocate a needed page-table page.
    /// 将虚拟地址与物理地址建立映射，并写入MMU中
    pub unsafe fn map(
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
            match self.translate_or_alloc(va){
                Some(pte) => {
                // TODO - is_valid?
                if pte.is_valid() {
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

    /// add a mapping to the kernel page table.
    /// only used when booting
    /// does not flush TLB or enable paging   
    pub unsafe fn kernel_map(
        &mut self, 
        va:VirtualAddress, 
        pa:PhysicalAddress, 
        size:usize, 
        perm:PteFlags
    ) {
        // println!(
        //     "kvm_map: va={:#x}, pa={:#x}, size={:#x}",
        //     va.as_usize(),
        //     pa.as_usize(),
        //     size
        // );
        if !self.map(va, pa, size, perm){
            panic!("内核虚拟地址映射失败");
        }
    }


    /// Create an empty user page table.
    /// return None if out of memory
    pub unsafe fn uvmcreate() -> *mut PageTable{
        let pagetable: Box<PageTable> = Box::new_zeroed().assume_init();
        let ptr = Box::into_raw(pagetable);
        ptr
    }

    /// Load the user initcode into address 0 of pagetable
    /// for the very first process
    /// size must be less than a page
    pub unsafe fn uvm_init(&mut self, src: &[u8]){
        if src.len() >= PGSIZE{
            panic!("inituvm: more than a page");
        }

        let mem = RawPage::new_zeroed() as *mut u8;
        write_bytes(mem, 0, PGSIZE);

        self.map(
            VirtualAddress::new(0), 
            PhysicalAddress::new(mem as usize), 
            PGSIZE, 
            PteFlags::W | PteFlags::R | PteFlags::X | PteFlags::U
        );

        copy_nonoverlapping(src.as_ptr(), mem, src.len());
    }


    /// Allocate PTEs and physical memory to grow process from old_size to
    /// new_size, which need not be page aligned.  Returns new size or 0 on error.
    pub unsafe fn uvm_alloc(
        &mut self, 
        mut old_size: usize, 
        new_size: usize
    ) -> Option<usize> {
        if new_size < old_size {
            return Some(old_size)
        }

        old_size = page_round_up(old_size);

        for cur_size in (old_size..new_size).step_by(PGSIZE) {
            let memory = RawPage::new_zeroed();
            write_bytes(memory as *mut u8, 0, PGSIZE);

            if !self.map(
                VirtualAddress::new(cur_size), 
                PhysicalAddress::new(memory), 
                PGSIZE, 
                PteFlags::W | PteFlags::R | PteFlags::X | PteFlags::U
            ){
                drop_in_place(memory as *mut RawPage);
                self.uvm_dealloc(cur_size, old_size);
                return None
            }
        }

        Some(new_size)
    }

    /// Free user memory pages,
    /// then free page-table pages
    pub fn uvm_free(&mut self, size: usize) {
        if size > 0 {
            let mut pa = PhysicalAddress::new(size);
            pa.pg_round_up();
            let ppn = pa.as_usize() / PGSIZE;
            self.uvm_unmap(
                VirtualAddress::new(0),
                ppn,
                true
            );
        }
        // drop(self);
    }


    /// Deallocate user pages to bring the process size from old_size to
    /// new_size.  old_size and new_size need not be page-aligned, nor does new_size
    /// need to be less than old_size.  old_size can be larger than the actual
    /// process size.  Returns the new process size.
    pub fn uvm_dealloc(
        &mut self, 
        old_size:usize, 
        new_size:usize
    ) -> usize {
        if new_size >= old_size { 
            return old_size
        }

        if page_round_up(new_size) < page_round_up(old_size) {
            let pages_num = (page_round_up(old_size) - page_round_up(new_size)) / PGSIZE;
            self.uvm_unmap(
                VirtualAddress::new(page_round_up(new_size)), 
            pages_num, 
                true
            );
        }

        new_size

    }


    /// Remove npages of mappings starting from va. va must be
    /// page-aligned. The mappings must exist.
    /// Optionally free the physical memory.
    pub fn uvm_unmap(
        &mut self, 
        mut va: VirtualAddress, 
        npages: usize, 
        free: bool
    ){
        if !va.is_page_aligned() {
            panic!("uvm_unmap: not aligned");
        }
        
        for _ in 0..npages {
            match self.translate(va) {
                Some(pte) => {
                    // TO DO !!!!!!!!!!!! is valid check ?

                    if !pte.is_valid() {
                        panic!("uvm_unmap: not mapped");
                    }
                    if !pte.is_leaf() {
                        panic!("IS NOT LEAF");
                    }
                    if pte.as_flags() == PteFlags::V.bits() {
                        panic!("uvm_unmap: not a leaf");
                    }
                    if free {
                        let pa = pte.as_pagetable();
                        unsafe{ drop_in_place(pa) };
                        pte.0 = 0;
                    }
                },

                None => {
                    panic!("uvm_unmap");
                }
            }
            va.add_page();
        }
    }


    /// Given a parent process's page table, copy
    /// its memory into a child's page table.
    /// Copies both the page table and the
    /// physical memory.
    /// returns 0 on success, -1 on failure.
    /// frees any allocated pages on failure.
    pub unsafe fn uvm_copy(
        &mut self, 
        child_pgt: &mut Self, 
        size: usize
    ) -> Result<(), &'static str> {
        let mut va = VirtualAddress::new(0);
        while va.as_usize() != size {
            match self.translate(va) {
                Some(pte) => {
                    if !pte.is_valid() {
                        panic!("uvmcopy(): page not present");
                    }

                    let page_table = pte.as_pagetable();
                    let flags = pte.as_flags();
                    let flags = PteFlags::new(flags);

                    let allocated_pgt = &mut *(RawPage::new_zeroed() as *mut PageTable);
                    allocated_pgt.write(& *page_table);

                    // println!("uvm_copy: va: 0x{:x}", va.as_usize());
                    if !child_pgt.map(
                        va,
                        PhysicalAddress::new(allocated_pgt.as_addr()),
                        PGSIZE,
                        flags
                    ) {
                        drop(allocated_pgt);
                        child_pgt.uvm_unmap(
                            VirtualAddress::new(0), 
                            va.as_usize() / PGSIZE, 
                            true
                        );
                        return Err("uvmcopy: Fail.")
                    }
                },

                None => {
                    panic!("uvmcopy: No exist pte(pte should exist)");
                }
            }
            va.add_page();
        }

        Ok(())
    }

    pub unsafe fn uvm_cow(
        &mut self, 
        child_pgt: &mut Self, 
        size: usize
    ) -> Result<(), &'static str> {
        let mut va = VirtualAddress::new(0);
        while va.as_usize() != size {
            match self.translate(va) {
                Some(pte) => {
                    if !pte.is_valid() {
                        panic!("uvmcopy(): page not present");
                    }

                    let page_table = pte.as_pagetable();
                    let flags = pte.as_flags();
                    let flags = PteFlags::new(flags);

                    // COW Don't need copy uvm

                    // let allocated_pgt = &mut *(RawPage::new_zeroed() as *mut PageTable);
                    // allocated_pgt.write(& *page_table);

                    // println!("uvm_copy: va: 0x{:x}", va.as_usize());

                    let pa = (&mut *page_table).as_addr();

                    if !child_pgt.map(
                        va,
                        PhysicalAddress::new(pa),
                        PGSIZE,
                        flags
                    ) {
                        // drop(allocated_pgt);
                        // child_pgt.uvm_unmap(
                        //     VirtualAddress::new(0), 
                        //     va.as_usize() / PGSIZE, 
                        //     true
                        // );
                        return Err("uvmcopy: Fail.")
                    }
                },

                None => {
                    panic!("uvmcopy: No exist pte(pte should exist)");
                }
            }

            //set pte Only Read
            let pte_parent = self.translate(va).unwrap();
            let pte_child = child_pgt.translate(va).unwrap();
            pte_parent.rm_W_bit();
            pte_child.rm_W_bit();


            va.add_page();
        }

        Ok(())
    }

    

    /// mark a PTE invalid for user access.
    /// used by exec for the user stack guard page.
    pub fn uvm_clear(&mut self, va: VirtualAddress) {
        if let Some(pte) = self.translate(va) {
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
        dst: usize, 
        src: *const u8,
        mut len: usize 
    ) -> Result<(), &'static str> {
        // 从内核空间向用户空间拷贝数据
        // 拷贝的起始地址为 dst, 拷贝的结束地址为 dst + len
        // 首先将目标地址转成虚拟地址并进行页对齐
        let mut va = VirtualAddress::new(dst);
        va.pg_round_down();

        // println!("[Debug] va: 0x{:x}, dst: 0x{:x}", va.as_usize(), dst);
        // 计算第一次需要拷贝的字节数，需要进行页对齐
        let mut count = PGSIZE - (dst - va.as_usize());
        // 拷贝地址的偏移量，即已经拷贝了多少字节
        let mut offset = 0;
        // 将目标地址的虚拟地址翻译成物理地址
        let mut pa = self.pgt_translate(va).unwrap();
        // 计算需要拷贝的虚拟地址的位置
        let mut dst_ptr = unsafe{
            pa.as_mut_ptr().offset((dst - va.as_usize()) as isize)
        }; 
        loop {
            // 由于在 syscall 的时候将用户页表切换成了内核页表，
            // 因此在拷贝的时候需要将用户态的虚拟地址转换成物理地址，
            // 由于在内核中数据区是直接映射，因此在访问物理地址的时候
            // 经过 MMU 不会报错
            // println!("[Debug] count: {}, len: {}", count, len);
            if count > len {
                // 如果页内剩余的容量大于生于要拷贝的容量，则将count替换成len
                count = len;
                unsafe{
                    copy(
                        src.offset(offset as isize), 
                        dst_ptr, 
                        count
                    );
                }
                return Ok(())
            }else {
                unsafe{
                    copy(
                        src.offset(offset as isize), 
                        dst_ptr, 
                        count
                    );
                }
                // 将页内剩余的容量全部拷贝进去，此时减少剩余容量,
                // 增加偏移量,并重新计算物理地址, count, dst_ptr
                len -= count;
                offset += count;
                va.add_page();
                pa = self.pgt_translate(va).unwrap();
                count = PGSIZE;
                dst_ptr = pa.as_mut_ptr();
            }
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
            let pa = self.pgt_translate(va).unwrap();
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
        mut max: usize
    ) -> Result<(),&'static str> {
        // 将 src 作为虚拟地址
        let mut va = VirtualAddress::new(src as usize);
        // 将虚拟地址进行页对齐
        va.pg_round_down();
        loop {
            // 将用户态的虚拟地址转成物理地址
            let pa = self.pgt_translate(va).unwrap();
            // 计算该页所要读取的字节数
            let count = PGSIZE - (src - va.as_usize());
            let s = (pa.as_usize() + (src - va.as_usize())) as *const u8;
            if max < count {
                // 所能读取的最大的字符数小于该页剩余字节
                for i in 0..max {
                    unsafe{
                        // 获取所要读取的指针
                        let src_ptr = s.offset(i as isize);
                        // 获取所要读取的值
                        let val = read(src_ptr); 
                        if val == 0 { return Ok(()) }
                        let dst_ptr = dst.offset(i as isize);
                        write(dst_ptr, val);
                    }
                }
                return Ok(())
            }

            for i in 0..count {
                unsafe {
                    let src_ptr = s.offset(i as isize);
                    let src_val = read(src_ptr); 
                    if src_val == 0 { return Ok(()) }
                    let dst_ptr = dst.offset(i as isize);
                    write(dst_ptr, src_val);
                }
            }
            max -= count;
            va.add_page();
        }
    }


    /// Free a process's page table, and free the
    /// physical memory it refers to.
    pub fn proc_free_pagetable(&mut self, size: usize) {
        self.uvm_unmap(
            VirtualAddress::new(TRAMPOLINE ), 
            1, 
            false
        );

        self.uvm_unmap(
            VirtualAddress::new(TRAPFRAME),
            1,
            false
        );

        self.uvm_free(size);
        // self.free();
    }

}

// impl Drop for PageTable {
//     /// Recursively free non-first-level pagetables.
//     /// Physical memory should already be freed.
//     fn drop(&mut self) {
//         self.entries.iter_mut().for_each(|pte| pte.free());
//     }
// }