use core::borrow::Borrow;
use core::ptr::*;
use core::cell::{ UnsafeCell, RefCell };
use core::str::from_utf8;
use alloc::vec::Vec;
use alloc::vec;
use alloc::sync::Arc;
use array_macro::array;

use crate::arch::riscv::qemu::fs::{NFILE, NOFILE};
use crate::lock::spinlock::{ Spinlock, SpinlockGuard };
use crate::memory::{
    kalloc::*,
    address::{ PhysicalAddress, VirtualAddress, Addr },
    mapping::{ page_table::PageTable, page_table_entry::PteFlags},
    RawPage
};
use crate::arch::riscv::qemu::layout::{ PGSIZE, TRAMPOLINE, TRAPFRAME };
use crate::arch::riscv::register::satp;
use super::*;
use crate::fs::{FileType, Inode, VFile};


use alloc::boxed::Box;

#[derive(PartialEq, Copy, Clone, Debug)]
pub enum ProcState{
    UNUSED,
    USED,
    SLEEPING,
    RUNNABLE,
    RUNNING,
    ZOMBIE,
    ALLOCATED
}


pub struct Process {
    pub meta: Spinlock<ProcMeta>,
    pub data: UnsafeCell<ProcData>,
}

pub struct ProcMeta {
    // p->lock must be held when using these
    pub state: ProcState,
    pub channel: usize, // If non-zero, sleeping on chan
    pub killed: bool, // If non-zero, have been killed
    pub xstate: usize, // Exit status to be returned to parent's wait
    pub pid: usize,   // Process ID
}

impl ProcMeta {
    pub const fn new() -> Self {
        Self {
            state: ProcState::UNUSED,
            channel: 0,
            killed: false,
            xstate: 0,
            pid: 0,

        }
    }

    pub fn set_state(&mut self, state: ProcState) {
        self.state = state;
    }
}

pub struct ProcData {
    // these are private to the process, so p->lock need to be held
    pub kstack:usize,  // Virtual address of kernel stack
    pub size:usize, // size of process memory
    pub pagetable: Option<Box<PageTable>>, // User page table
    pub trapframe: *mut Trapframe, // data page for trampoline.S
    pub context: Context, // switch() here to run processs
    pub name: [u8; 16],   // Process name (debugging)
    // proc_tree_lock must be held when using this:
    pub parent: Option<*mut Process>,   
    pub open_files: [Option<Arc<VFile>>; NFILE],
    pub cwd: Option<Inode>

}

impl ProcData {
    pub const fn new() -> Self {
        Self {
            kstack:0,
            size: 0,
            pagetable: None,
            trapframe: null_mut(),
            context: Context::new(),
            name: [0u8; 16],
            parent: None,
            open_files: array![_ => None; NFILE],
            cwd: None
        }
    }

    pub fn get_trapframe(&self) -> *mut Trapframe {
        self.trapframe
    }

    pub fn set_name(&mut self, name: &[u8]) {
        unsafe {
            copy_nonoverlapping(
                name.as_ptr(), 
                self.name.as_mut_ptr(),
                name.len()
            );
        }
    }

    pub fn set_parent(&mut self, parent: Option<*mut Process>) {
        self.parent = parent;
    }

    pub fn set_kstack(&mut self, ksatck: usize) {
        self.kstack = ksatck;
    }

    pub fn set_trapframe(&mut self, trapframe: *mut Trapframe) {
        self.trapframe = trapframe;
    }

    pub fn set_pagetable(&mut self, pagetable: Option<Box<PageTable>>) {
        self.pagetable = pagetable
    }

    pub fn set_context(&mut self, ctx: Context) {
        self.context = ctx
    }

    pub fn get_context_mut(&mut self) -> *mut Context {
        &mut self.context as *mut Context
    }

    pub fn init_context(&mut self) {

        let kstack = self.kstack;
        self.context.write_zero();
        self.context.write_ra(fork_ret as usize);
        self.context.write_sp(kstack + PGSIZE);
    }

    /// Find an unallocated file desprictor in proc
    pub fn find_unallocated_fd(&self) -> Result<usize, &'static str> {
        for fd in 0..self.open_files.len() {
            if self.open_files[fd].is_none() {
                return Ok(fd)
            }
        }
        Err("Fail to find unallocted fd")
    }

    // Create a user page table for a given process,
    // with no user memory, but with trampoline pages
    pub unsafe fn proc_pagetable(&mut self) {

        extern "C" {
            fn trampoline();
        }

        // An empty page table
        let mut page_table = PageTable::uvmcreate();
        // map the trampoline code (for system call return )
        // at the highest user virtual address.
        // only the supervisor uses it, on the way
        // to/from user space, so not PTE_U. 
        if !page_table.map(
            VirtualAddress::new(TRAMPOLINE),
            PhysicalAddress::new(trampoline as usize),
            PGSIZE,
            PteFlags::R | PteFlags::X
        ) {
            page_table.uvm_free(0);
        }

        // map the trapframe just below TRAMPOLINE, for trampoline.S 
        if !page_table.map(
            VirtualAddress::new(TRAPFRAME), 
            PhysicalAddress::new(self.trapframe as usize),
            PGSIZE,
            PteFlags::R | PteFlags::W
        ) {
            page_table.uvm_free(0);
        }

        self.pagetable = Some(page_table);
    }

    /// Close a fd
    pub fn fd_close(&mut self, fd: usize) {
        self.open_files[fd].take();
    }

    /// Initialize first user process
    pub fn user_init(&mut self) {
        extern "C" {
            fn user_trap();
        }
        let tf = unsafe{ &mut *self.trapframe };
        // kernel page table
        tf.kernel_satp = unsafe{ satp::read() };
        // process's kernel stack 
        tf.kernel_sp = self.kstack + PGSIZE * 4;
        // kernel user trap address
        tf.kernel_trap = user_trap as usize;
        // current process's cpu id.
        tf.kernel_hartid = unsafe {
            cpu::cpuid()
        };
    }
}



impl Process{
    pub const fn new() -> Self{
        Self{    
            meta: Spinlock::new(ProcMeta::new(), "process"),
            data: UnsafeCell::new(ProcData::new()),
        }
    }

    pub fn init(&mut self, kstack: usize) {
        let pdata = unsafe {
            &mut *self.data.get()
        };

        pdata.open_files = array![_ => None; NFILE];

        pdata.set_kstack(kstack);
    }

    pub fn as_ptr(&self) -> *const Process{
        self as *const Process
    }

    pub fn as_mut_ptr(&mut self) -> *mut Process{
        self as *mut Process
    }

    pub fn as_ptr_addr(&self) -> usize{
        self as *const Process as usize
    }

    pub fn as_mut_ptr_addr(&mut self) -> usize{
        self as *mut Process as usize
    }

    pub fn killed(&self) -> bool {
        let proc_data = self.meta.acquire();
        let killed = proc_data.killed;
        drop(proc_data);
        killed
    }

    pub fn pid(&self) -> usize {
        let proc_data = self.meta.acquire();
        let pid = proc_data.pid;
        drop(proc_data);
        pid
    }

    pub fn set_state(&mut self, state: ProcState) {
        let mut proc_data = self.meta.acquire();
        proc_data.set_state(state);
        drop(proc_data);
    }

    pub fn set_killed(&mut self, killed: bool) {
        let mut proc_data = self.meta.acquire();
        proc_data.killed = killed;
        drop(proc_data);
    }

    pub fn state(&self) -> ProcState {
        let proc_data = self.meta.acquire();
        let state = proc_data.state;
        drop(proc_data);
        state
    }

    pub fn name(&self) -> &str {
        let pdata = unsafe{ &*self.data.get() };
        from_utf8(&pdata.name).unwrap()
    }

    pub fn modify_kill(&self, killed: bool) {
        let mut proc_data = self.meta.acquire();
        proc_data.killed = killed;
        drop(proc_data);
    }

    pub fn page_table(&self) -> &mut Box<PageTable> {
        let pdata = unsafe{ &mut *self.data.get() };
        let page_table = pdata.pagetable.as_mut().expect("Fail to get page table");
        page_table
    }

    /// Create a user page table for a given process,
    /// with no user memory, but with trampoline pages. 
    pub fn proc_pagetable(&self) -> Option<Box<PageTable>> {
        // An empty page table
        let mut page_table = unsafe{ PageTable::uvmcreate() };
         
        // map the trampoline code(for system call return)
        // at the highest user virtual address. 
        // only the supervisor uses it, on the way
        // to/from user space, so not PTE_U. 
        unsafe{
            if !page_table.map(
            VirtualAddress::new(TRAMPOLINE), 
            PhysicalAddress::new(trampoline as usize),
             PGSIZE, 
             PteFlags::R | PteFlags::X
            ) {
                page_table.uvm_free(0);
                return None
            }

            // map the trapframe just below TRAMPOLINE, for trampoline.S 
            if !page_table.map(
                VirtualAddress::new(TRAPFRAME), 
                PhysicalAddress::new((&*self.data.get()).get_trapframe() as usize), 
                PGSIZE, 
                PteFlags::R | PteFlags::W
            ) {
                page_table.uvm_unmap(
                    VirtualAddress::new(TRAPFRAME), 
                    1, 
                    false
                );
                page_table.uvm_free(0);
                return None
            }
        }
        Some(page_table)
    }

    /// free a proc structure and the data hanging from it,
    /// including user pages.
    /// p.acquire() must be held.

    pub fn free_proc(&mut self) {
        let mut pdata = self.data.get_mut();
        if !pdata.trapframe.is_null() {
            // kfree(PhysicalAddress::new(extern_data.trapframe as usize));
            drop(pdata.trapframe as *mut RawPage);
            pdata.set_trapframe(0 as *mut Trapframe);

            if let Some(page_table) = pdata.pagetable.as_mut() {
                page_table.proc_free_pagetable(pdata.size);
            }


            let mut guard = self.meta.acquire();

            pdata.set_pagetable(None);
            pdata.set_parent(None);
            pdata.size = 0;

            guard.pid = 0;
            guard.channel = 0;
            guard.killed = false;
            guard.xstate = 0;
            guard.set_state(ProcState::UNUSED);

            drop(guard);
            
        }
    }

    
    /// Grow or shrink user memory by n bytes. 
    /// Return true on success, false on failure. 
    pub fn grow_proc(&mut self, count: isize) -> Result<(), &'static str> {
        let mut pdata = self.data.get_mut();
        let mut size = pdata.size; 
        let page_table = pdata.pagetable.as_mut().unwrap();
        if count > 0 {
            match unsafe { page_table.uvm_alloc(size, size + count as usize) } {
                Some(new_size) => {
                    size = new_size;
                },

                None => {
                    return Err("Fail to allocate virtual memory for user")
                }
            }
        } else if count < 0 {
            let new_size = (size as isize + count) as usize;
            size = page_table.uvm_dealloc(size, new_size);
        }

        pdata.size = size;

        Ok(())
    }


    /// Give up the CPU for one scheduling round.
    /// yield is a keyword in rust
    pub fn yielding(&mut self) {
        // println!("[Debug] 让出 CPU");
        let mut pmeta = self.meta.acquire();
        let ctx = self.data.get_mut().get_context_mut();
        pmeta.set_state(ProcState::RUNNABLE);

        unsafe {
            let my_cpu = CPU_MANAGER.mycpu();
            pmeta = my_cpu.sched(
                pmeta,
                ctx
            );
        }
        drop(pmeta)
    }

    /// Atomically release lock and sleep on chan
    /// Reacquires lock when awakened.
    pub fn sleep<T>(&self, channel: usize, lock: SpinlockGuard<'_, T>) {
        // Must acquire p->lock in order to 
        // change p->state and then call sched.
        // Once we hold p->lock, we can be
        // guaranteed that we won't miss any wakeup
        // (wakeup locks p->lock)
        // so it's okay to release lk;
        println!("[Debug] sleep: try to acquire metadata lock");
        let mut guard = self.meta.acquire();
        println!("[Debug] sleep: acquire metadata lock");
        drop(lock);
        // Go to sleep.
        guard.channel = channel;
        guard.set_state(ProcState::SLEEPING);
        unsafe {
            let my_cpu = CPU_MANAGER.mycpu();
            let ctx = (&mut (*self.data.get())).get_context_mut();      
            // get schedule process
            guard = my_cpu.sched(
                guard, 
                ctx
            );
            // Tide up
            guard.channel = 0;
            drop(guard);
        }
    }

    /// Find a unallocated fd
    pub fn fd_alloc(&mut self, file: &VFile) -> Result<usize, &'static str>{
        let pdata = unsafe {
            &mut *self.data.get()
        };
        let fd = pdata.find_unallocated_fd()?;
        pdata.open_files[fd] = Some(Arc::new(*file));
        Ok(fd)       
    } 

    pub fn fork(&mut self) -> Option<&mut Self> {
        // 从表中获取未被分配的子进程
        if let Some(child_proc) = unsafe{ PROC_MANAGER.alloc_proc() } {
            // 从当前进程的页表拷贝到子进程中
            let pdata = unsafe{ &mut *self.data.get() };
            let child_data = unsafe{ &mut *child_proc.data.get() };
            if unsafe{ pdata.pagetable.as_mut().unwrap().uvm_copy(
                child_data.pagetable.as_mut().unwrap(), 
                pdata.size
            ).is_err() } {
                panic!("fork: Fail to copy data from parent process.")
            }
            // 将当前进程的 trapframe 拷贝到子进程
            let ptf = pdata.trapframe as *const Trapframe;
            let child_tf = unsafe{ &mut *child_data.trapframe };
            unsafe{ copy_nonoverlapping(ptf, child_tf, 1); }
            // fork 后子进程应当返回0
            child_tf.a0 = 0;

            // 子进程拷贝父进程的文件和工作目录
            child_data.open_files.clone_from(&pdata.open_files);
            child_data.cwd.clone_from(&pdata.cwd);

            child_data.name = pdata.name;
            child_data.size = pdata.size;

            let mut child_meta = child_proc.meta.acquire();
            child_meta.state = ProcState::RUNNABLE;
            drop(child_meta);

            let wait = unsafe{ PROC_MANAGER.wait_lock.acquire() };
            child_data.parent = Some(self as *mut Process);
            println!("[Debug] fork: parent address: 0x{:x}", self as *mut Process as usize);
            drop(wait);
            Some(child_proc)
        }else {
            None
        }
    }
}

extern "C" {
    fn trampoline();
}





