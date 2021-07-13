use crate::lock::sleeplock::SleepLockGuard;
use crate::memory::{Addr, PageTable, VirtualAddress, page_round_up};
use crate::define::memlayout::PGSIZE;
use crate::define::param::MAXARG;
use crate::fs::Inode;
use crate::fs::LOG;
use crate::fs::InodeData;
use crate::misc::str_len;

use core::mem::size_of;
use core::ops::IndexMut;

use super::CPU_MANAGER;
use super::Process;

use alloc::boxed::Box;

const ELF_MAGIC: usize = 0x464C457F; // elf magic number

// Values for Proghdr type
const ELF_PROG_LOAD: u32 = 1;

// Flag bits for Proghdr flags
const ELF_PROG_FLAG_EXEC: usize = 1;
const ELF_PROG_FLAG_WRITE: usize = 2;
const ELF_PROG_FLAG_READ: usize = 4;

// File header
#[repr(C)]
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
#[repr(C)]
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
    mut page_table: Box<PageTable>, 
    va: usize, 
    mut inode_data: SleepLockGuard<InodeData>,
    offset: usize, 
    size: usize
) -> Result<(), &'static str> {
    let mut va = VirtualAddress::new(va);
    if !va.is_page_aligned() {
        panic!("load_seg(): va must be page aligned.");
    }

    let mut i:usize = 0;
    while i < size {
        match page_table
                .walkaddr(va) {
            Some(pa) => {
                let n:usize;
                if size - i < PGSIZE {
                    n = size - i;
                }else {
                    n = PGSIZE;
                }

                if inode_data.read(
                    false, 
                    pa.as_usize(), 
                    (offset + i) as u32, 
                    n as u32
                ).is_err() {
                    return Err("load_seg: Fail to read inode")
                }
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


// pub unsafe fn exec(
//     path: &str, 
//     argv: &[*const u8]
// ) -> Result<usize, &'static str> {
//     assert!(size_of::<ProgHeader>() == 64*7, "Wrong size of PrgoHeader.");
//     assert!(size_of::<ElfHeader>() == 64*9, "Wrong size of ElfHeader");

//     let elf = Box::<ElfHeader>::new_zeroed().assume_init();
//     let ph = Box::<ProgHeader>::new_zeroed().assume_init();
//     let page_table: Box<PageTable>;
//     let mut size = 0;
//     let p: &mut Process;
//     let mut sp: usize;
//     let stack_base: usize;
//     let mut user_stack: [usize; MAXARG] = [0;MAXARG];
//     let ip: Box<Inode>;
//     LOG.begin_op();
//     match Inode::namei(path) {
//         None => {
//             LOG.end_op();
//             return Err("exec: Fail to ")
//         }

//         Some(new_ip) => {
//             ip = new_ip;
//         }
//     }

//     ip.lock();
           
//     // Check ELF header
//     if ip.read(
//         0, 
//         &*elf as *const ElfHeader as usize, 
//         0, 
//         size_of::<ElfHeader>()
//     ).is_err() {
//         err_inode(ip);
//         return Err("exec: Fail to read elf header.")
//     }

//     if elf.magic != ELF_MAGIC {
//         err_inode(ip);
//         return Err("exec: Elf magic number is wrong.")
//     }

//     let my_proc = CPU_MANAGER.myproc().unwrap();
//         page_table = my_proc
//             .proc_pagetable()
//             .expect("Fail to alloc pagetable for current process.");
        
//         // Load program into memeory. 
//         for _ in 0..elf.phnum {
//             let mut off = elf.phoff;
//             if ip.clone().read(
//                 0, 
//                 &*ph as *const ProgHeader as usize, 
//                 off as u32, 
//                 size_of::<ProgHeader>()
//             ).is_ok() {
//                 if ph.prog_type != ELF_PROG_LOAD { continue; }
//                 if ph.mem_size < ph.file_size {
//                     err_page_table(page_table.clone(), size);
//                     err_inode(ip);
//                     return Err("exec: memory size is less than file size.")
//                 }
//                 if ph.vaddr + ph.mem_size < ph.vaddr {
//                     err_page_table(page_table.clone(), size);
//                     err_inode(ip);
//                     return Err("exec: vaddr + memory size is less than vaddr.")
//                 }
//                 match page_table.clone()
//                 .uvmalloc(size, ph.vaddr + ph.mem_size)
//                 .take() {
//                     None => {
//                         err_page_table(page_table.clone(), size);
//                         err_inode(ip);
//                         return Err("exec: Fail to uvmalloc.")
//                     }

//                     Some(new_size) => {
//                         size = new_size;
//                     }
//                 }
//                 if ph.vaddr % PGSIZE != 0 {
//                     err_page_table(page_table.clone(), size);
//                     err_inode(ip);
//                     return Err("exec: Programe Header must be integer multiple of PGSIZE. ")
//                 }

//                 if load_seg(
//                     page_table.clone(), 
//                     ph.vaddr, 
//                     ip.clone(), 
//                     ph.off, 
//                     ph.file_size
//                 ).is_err() {
//                     err_page_table(page_table.clone(), size);
//                     err_inode(ip);
//                     return Err("exec: Fail to load segment. ")
//                 }
                

//             } else {
//                 err_page_table(page_table.clone(), size);
//                 err_inode(ip);
//                 return Err("exec: Fail to read from inode")
//             }
//             off += size_of::<ProgHeader>();
//         }

//         ip.unlock_put();
//         LOG.end_op();

//         p = CPU_MANAGER.myproc().unwrap();
//         let old_size = (&*p.extern_data.get()).size;

//         // Allocate two pages at the next page boundary
//         // Use the second as the user stack. 
//         size = page_round_up(size);
//         match page_table.clone()
//                 .uvmalloc(size, size + 2*PGSIZE) {
//             None => {
//                 err_page_table(page_table.clone(), size);
//                 return Err("exec: Fail to uvmalloc")
//             }

//             Some(new_size) => {
//                 size = new_size;
//             }
//         }

//         page_table.clone().uvmclear(VirtualAddress::new(size - 2*PGSIZE));
//         sp = size;
//         stack_base = sp - PGSIZE;

//         // Push argument strings, prepare rest of stack in ustack. 
//         for argc in 0..argv.len() {
//             if argc > MAXARG {
//                 err_page_table(page_table.clone(), size);
//                 return Err("exec: argc is more than MAXARG. ")
//             }
//             sp -= str_len(argv[argc]);
//             // riscv sp must be 16-byte aligned. 
//             sp -= sp % 16;
//             if sp < stack_base {
//                 err_page_table(page_table.clone(), size);
//                 return Err("User stack bump. ")
//             }

//             if page_table
//                 .clone()
//                 .copy_out(
//                     VirtualAddress::new(sp), 
//                     core::slice::from_raw_parts_mut(
//                         argv[argc] as *mut u8, 
//                         str_len(argv[argc])
//                     )
//                 ).is_err() {
//                     err_page_table(page_table.clone(), size);
//                     return Err("exec: Fail to copy out.") 
//                 }

//             user_stack[argc] = sp;
//         }
//     let argc = argv.len();
//     user_stack[argc] = 0;

//     // Push the array of argv pointers. 
//     sp -= (argc + 1) * size_of::<usize>();
//     sp -= sp % 16;
//     if sp < stack_base {
//         err_page_table(page_table.clone(), size);
//     }

//     if page_table.clone().copy_out(
//         VirtualAddress::new(sp), 
//         core::slice::from_raw_parts_mut(
//             user_stack.as_mut_ptr() as *mut u8, 
//             (argc + 1)*size_of::<usize>())
//     ).is_err() {
//         err_page_table(page_table.clone(), size);
//         return Err("exec: Fail to copy out.")
//     }

//     // arguments to user main(argc, argv)
//     // argc is returned via the system call return
//     // value, which goes in a0. 
//     let exten_data = p.extern_data.get_mut();
//     let trapframe = &mut *exten_data.trapframe;
//     trapframe.a1 = sp;

//     // Save program name for debugging
    

//     // Commit to use image. 
//     exten_data.pagetable.as_mut().unwrap().proc_freepagetable(old_size);
//     exten_data.set_pagetable(Some(page_table));
//     exten_data.size = size;
//     // initial program counter = main
//     trapframe.epc = elf.entry;
//     // initial stack pointer
//     trapframe.sp = sp;

    
//     Ok(argc)
// }

// pub fn err_page_table(mut page_table: Box<PageTable>, size: usize) {
//     page_table.proc_freepagetable(size)
// }

// pub fn err_inode(ip: Box<Inode>) {
//     ip.unlock_put();
//     LOG.end_op();
// }