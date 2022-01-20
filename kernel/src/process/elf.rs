use crate::lock::sleeplock::SleepLockGuard;
use crate::memory::{Addr, PageTable, VirtualAddress, page_round_up};
use crate::arch::riscv::qemu::layout::PGSIZE;
use crate::arch::riscv::qemu::param::MAXARG;
use crate::fs::{ICACHE, Inode};
use crate::fs::LOG;
use crate::fs::InodeData;
use crate::misc::str_len;

use core::mem::size_of;
use core::ops::IndexMut;

use super::CPU_MANAGER;
use super::Process;

use alloc::boxed::Box;
use alloc::string::String;

const ELF_MAGIC: u32 = 0x464C457F; // elf magic number

// Values for Proghdr type
const ELF_PROG_LOAD: u32 = 1;

// Flag bits for Proghdr flags
const ELF_PROG_FLAG_EXEC: usize = 1;
const ELF_PROG_FLAG_WRITE: usize = 2;
const ELF_PROG_FLAG_READ: usize = 4;

// File header
#[repr(C)]
pub struct ElfHeader {
    pub magic: u32, // must equal ELF_MAGIC,
    pub elf: [u8; 12],
    pub f_type: u16,
    pub machine: u16,
    pub version: u32,
    pub entry: usize,
    pub phoff: usize,
    pub shoff: usize,
    pub flags: u32,
    pub ehsize: u16,
    pub phentsize: u16,
    pub phnum: u16,
    pub shentsize: u16,
    pub shnum: u16,
    pub shstrndx: u16
}


// Program Section Header
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

/// Load a program segment into pagetable at virtual address va.
/// va must be page-aligned
/// and the pages from va to va+sz must already be mapped.
/// Returns 0 on success, -1 on failure.
#[allow(unused_variables)]
#[allow(unused_assignments)]
fn load_seg(
    page_table: &mut Box<PageTable>, 
    va: usize, 
    inode_data: &mut SleepLockGuard<InodeData>,
    offset: usize, 
    size: usize
) -> Result<(), &'static str> {
    // 生成虚拟地址
    let mut va = VirtualAddress::new(va);
    if !va.is_page_aligned() {
        panic!("load_seg(): va must be page aligned.");
    }

    let mut copy_size: usize = 0;
    while copy_size < size {
        match page_table
                .pgt_translate(va) {
            Some(pa) => {
                // 将用户虚拟地址翻译成物理地址
                let count: usize;
                if size - copy_size < PGSIZE {
                    count = size - copy_size;
                }else {
                    count = PGSIZE;
                }

                if inode_data.read(
                    false, 
                    pa.as_usize(), 
                    (offset + copy_size) as u32, 
                    count as u32
                ).is_err() {
                    return Err("load_seg: Fail to read inode")
                }
            },

            None => {
                panic!("load_seg(): address should exist.");
            }
        }

        copy_size += PGSIZE;
        va.add_page();
    }

    Ok(())
}


pub unsafe fn exec(
    path: &str, 
    argv: &[*const u8]
) -> Result<usize, &'static str> {
    let elf = Box::<ElfHeader>::new_zeroed().assume_init();
    let ph = Box::<ProgHeader>::new_zeroed().assume_init();
    let mut page_table: Box<PageTable>;
    let mut size = 0;
    let p: &mut Process;
    let mut sp: usize;
    let stack_base: usize;
    let mut user_stack: [usize; MAXARG] = [0;MAXARG];
    let inode: Inode;

    LOG.begin_op();

    // Get current inode by path
    inode = ICACHE.namei(path.as_bytes()).unwrap();

    // Get inode data by sleeplock
    let mut inode_guard = inode.lock();
           
    // Check ELF header
    if inode_guard.read(
        false, 
        &*elf as *const ElfHeader as usize, 
        0, 
        size_of::<ElfHeader>() as u32
    ).is_err() {
        drop(inode_guard);
        LOG.end_op();
        return Err("exec: Fail to read elf header.")
    }

    // println!("[Debug] 检查魔数");
    if elf.magic != ELF_MAGIC {
        // println!("[Debug] 魔数错误, 为0x{:x}, 应为0x{:x}", elf.magic, ELF_MAGIC);
        drop(inode_guard);
        LOG.end_op();
        return Err("exec: Elf magic number is wrong.")
    }

    let my_proc = CPU_MANAGER.myproc().unwrap();
        page_table = my_proc
            .proc_pagetable()
            .expect("Fail to alloc pagetable for current process.");
        
        let ph_size = size_of::<ProgHeader>() as u32;
        // Load program into memeory. 
        let mut off = elf.phoff;
        for _ in 0..elf.phnum {
            if inode_guard.read(
                false, 
                &*ph as *const ProgHeader as usize, 
                off as u32, 
                ph_size
            ).is_ok() {
                if ph.prog_type != ELF_PROG_LOAD { continue; }
                // Check program header size
                if ph.mem_size < ph.file_size {
                    page_table.proc_free_pagetable(size);
                    drop(inode_guard);
                    LOG.end_op();
                    return Err("exec: memory size is less than file size.")
                }

                if ph.vaddr + ph.mem_size < ph.vaddr {
                    page_table.proc_free_pagetable(size);
                    drop(inode_guard);
                    LOG.end_op();
                    return Err("exec: vaddr + mem_size < vaddr")
                }
                
                // alloc memory for load program
                match page_table
                .uvm_alloc(size, ph.vaddr + ph.mem_size)
                .take() {
                    None => {
                        page_table.proc_free_pagetable(size);
                        drop(inode_guard);
                        LOG.end_op();
                        return Err("exec: Fail to uvmalloc.")
                    }

                    Some(new_size) => {
                        size = new_size;
                    }
                }

                if ph.vaddr % PGSIZE != 0 {
                    page_table.proc_free_pagetable(size);
                    LOG.end_op();
                    return Err("exec: Programe Header must be integer multiple of PGSIZE. ")
                }

                // load segement information
                // println!("[Debug] 偏移量: 0x{:x}, 文件大小: 0x{:x}", ph.off, ph.file_size);
                if load_seg(
                    &mut page_table, 
                    ph.vaddr, 
                    &mut inode_guard, 
                    ph.off, 
                    ph.file_size
                ).is_err() {
                    page_table.proc_free_pagetable(size);
                    drop(inode_guard);
                    LOG.end_op();
                    return Err("exec: Fail to load segment. ")
                }
                

            } else {
                drop(page_table);
                drop(inode_guard);
                LOG.end_op();
                return Err("exec: Fail to read from inode")
            }
            off += size_of::<ProgHeader>();
        }
        // println!("[Debug] 完成加载程序");

        drop(inode_guard);
        LOG.end_op();

        p = CPU_MANAGER.myproc().unwrap();
        let old_size = (&*p.data.get()).size;

        // Allocate two pages at the next page boundary
        // Use the second as the user stack. 
        size = page_round_up(size);
        match page_table
                .uvm_alloc(size, size + 2 * PGSIZE) {
            None => {
                page_table.proc_free_pagetable(size);
                return Err("exec: Fail to uvmalloc")
            }

            Some(new_size) => {
                size = new_size;
            }
        }

        page_table.uvm_clear(VirtualAddress::new(size - 2 * PGSIZE));
        // Get stack top address. 
        sp = size;
        // Get stack bottom address. 
        stack_base = sp - PGSIZE;

        // Push argument strings, prepare rest of stack in ustack. 
        let mut argc = 0;
        loop {
            if argv[argc] as usize == 0x0 { break; }
            if argc >= MAXARG {
                page_table.proc_free_pagetable(size);
                return Err("exec: argc is more than MAXARG. ")
            }
            sp -= str_len(argv[argc]) + 1;
            // riscv sp must be 16-byte aligned. 
            sp = align_sp(sp);
            if sp < stack_base {
                drop(page_table);
                return Err("User Stack Bomb!")
            }
            
            // Copy arguments into stack top
            if page_table
                .copy_out(
                    sp, 
                    core::slice::from_raw_parts_mut(
                        argv[argc] as *mut u8, 
                        str_len(argv[argc])
                    ).as_ptr(),
                    str_len(argv[argc]) + 1,
                ).is_err() {
                    page_table.proc_free_pagetable(size);
                    return Err("exec: Fail to copy out.") 
                }
            user_stack[argc] = sp;
            argc += 1;
        }
    user_stack[argc] = 0;

    // Push the array of argv pointers. 
    sp -= (argc + 1) * size_of::<usize>();
    sp = align_sp(sp);
    if sp < stack_base {
        LOG.end_op();
        page_table.proc_free_pagetable(size);
    }

    if page_table
    .copy_out(
        sp, 
        core::slice::from_raw_parts_mut(
            user_stack.as_mut_ptr() as *mut u8, 
            (argc + 1)*size_of::<usize>()
        ).as_ptr(),
            (argc + 1)*size_of::<usize>()
    ).is_err() {
        page_table.proc_free_pagetable(size);
        return Err("exec: Fail to copy out.")
    }

    // arguments to user main(argc, argv)
    // argc is returned via the system call return
    // value, which goes in a0. 
    let pdata = p.data.get_mut();
    let trapframe = &mut *pdata.trapframe;
    trapframe.a1 = sp;

    // Save program name for debugging
    // core::ptr::copy(path.as_ptr(), &mut pdata.name as *mut u8, 16);
    let mut exec_name: String = String::new();
    for c in path.chars() {
        if c != '/' {
            exec_name.push(c);
        }
    }
    core::ptr::copy(exec_name.as_ptr(), &mut pdata.name as *mut u8, 16);

    // Commit to user image.
    let old_pgt = pdata.pagetable.as_mut().take().unwrap();
    old_pgt.proc_free_pagetable(old_size);

    pdata.pagetable = Some(page_table);
    pdata.size = size;
    // initial program counter = main
    trapframe.epc = elf.entry;
    // initial stack pointer
    trapframe.sp = sp;

    Ok(argc)
}


#[inline]
fn align_sp(sp: usize) -> usize {
    sp - (sp % 16)
}