use crate::memory::{
    PageTable, VirtualAddress, Addr
};
use crate::define::memlayout::PGSIZE;
use crate::fs::Inode;
use crate::fs::LOG;

use core::mem::size_of;

use super::CPU_MANAGER;

const ELF_MAGIC: usize = 0x464C457F; // elf magic number

// File header
pub struct ElfHeader {
    pub magic: usize, // must equal ELF_MAGIC,
    pub elf: [u8; 12],
    pub f_type: u16,
    pub machine: u16,
    pub version: u32,
    pub entry: usize,
    pub phoff: usize,
    pub shoff: usize,
    pub flags: usize,
    pub ehsize: u16,
    pub phentsize: u16,
    pub phnum: u16,
    pub shentsize: u16,
    pub shnum: u16,
    pub shstrndx: u16
}


// Programe Section Header
pub struct ProgHeader {
    pub prog_type: u32,
    pub flags: u32,
    pub off: usize,
    pub vaddr: usize,
    pub paddr: usize,
    pub file_size: usize,
    pub mem_size: usize,
    pub align: usize
}

// Load a program segment into pagetable at virtual address va.
// va must be page-aligned
// and the pages from va to va+sz must already be mapped.
// Returns 0 on success, -1 on failure.

#[allow(unused_variables)]
#[allow(unused_assignments)]
fn load_seg(
    mut page_table: PageTable, 
    va:usize, 
    ip: &mut Inode,
    offset:usize, 
    size: usize
) -> Result<(), &'static str> {
    let mut va = VirtualAddress::new(va);
    if !va.is_page_aligned() {
        panic!("load_seg(): va must be page aligned.");
    }

    let mut i:usize = 0;
    while i < size {
        match page_table.walkaddr(va) {
            Some(pa) => {
                let n:usize;
                if size - i < PGSIZE {
                    n = size - i;
                }else {
                    n = PGSIZE;
                }

                // TODO: readi()
            },

            None => {
                panic!("load_seg(): address should exist.");
            }
        }

        i += PGSIZE;
        va.add_page();
    }

    Ok(())
}


pub fn exec(path: &str, args: &[*const u8]) -> Result<usize, &'static str> {
    let elf: ElfHeader = ElfHeader {
        magic: 0, // must equal ELF_MAGIC,
        elf: [0; 12],
        f_type: 0,
        machine: 0,
        version: 0,
        entry: 0,
        phoff: 0,
        shoff: 0,
        flags: 0,
        ehsize: 0,
        phentsize: 0,
        phnum: 0,
        shentsize: 0,
        shnum: 0,
        shstrndx: 0  
    };
    LOG.begin_op();
    match Inode::namei(path) {
        None => {
            LOG.end_op();
            Err("exec")
        }

        Some(ip) => {
            ip.lock();
           
            // Check ELF header
            if !ip.read(
                0, 
                &elf as *const ElfHeader as usize, 
                0, 
                size_of::<ElfHeader>()
            ).is_err() {
                if elf.magic == ELF_MAGIC {
                    let my_proc = CPU_MANAGER.myproc().unwrap();
                    if my_proc.proc_pagetable()
                }
            }
            
            Ok(0)
        }
    }
}