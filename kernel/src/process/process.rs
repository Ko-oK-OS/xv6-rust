use core::borrow::Borrow;
use core::ptr::*;
use core::cell::{ UnsafeCell, RefCell };
use core::str::from_utf8;
use alloc::vec::Vec;
use alloc::{vec, task};
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


pub struct task_struct {
    // pub meta: Spinlock<ProcMeta>,
    // pub data: UnsafeCell<ProcData>,

    pub kstack:usize,  // Virtual address of kernel stack
    pub thread_ustack: usize,
    pub size:usize, // size of process memory
    pub pagetable: *mut PageTable, // User page table
    pub trapframe: *mut Trapframe, // data page for trampoline.S
    pub context: Context, // switch() here to run processs
    pub name: [u8; 16],   // Process name (debugging)
    // proc_tree_lock must be held when using this:
    pub parent: Option<*mut task_struct>,   
    pub open_files: [Option<Arc<VFile>>; NFILE],
    pub cwd: Option<Inode>,


    pub state: ProcState,
    pub channel: usize, // If non-zero, sleeping on chan
    pub killed: bool, // If non-zero, have been killed
    pub xstate: usize, // Exit status to be returned to parent's wait
    pub pid: usize,   // Process ID
}

// pub struct ProcMeta {
//     // p->lock must be held when using these
//     pub state: ProcState,
//     pub channel: usize, // If non-zero, sleeping on chan
//     pub killed: bool, // If non-zero, have been killed
//     pub xstate: usize, // Exit status to be returned to parent's wait
//     pub pid: usize,   // Process ID
// }

// impl ProcMeta {
//     pub const fn new() -> Self {
//         Self {
//             state: ProcState::UNUSED,
//             channel: 0,
//             killed: false,
//             xstate: 0,
//             pid: 0,

//         }
//     }

//     pub fn set_state(&mut self, state: ProcState) {
//         self.state = state;
//     }
// }

// pub struct ProcData {
//     // these are private to the process, so p->lock need to be held
//     pub kstack:usize,  // Virtual address of kernel stack
//     pub thread_ustack: usize,
//     pub size:usize, // size of process memory
//     pub pagetable: Option<Box<PageTable>>, // User page table
//     pub trapframe: *mut Trapframe, // data page for trampoline.S
//     pub context: Context, // switch() here to run processs
//     pub name: [u8; 16],   // Process name (debugging)
//     // proc_tree_lock must be held when using this:
//     pub parent: Option<*mut Process>,   
//     pub open_files: [Option<Arc<VFile>>; NFILE],
//     pub cwd: Option<Inode>,

//     pub meta: ProcMeta
// }

impl task_struct {
    pub const fn new() -> Self {
        Self {
            kstack:0,
            thread_ustack: 0,
            size: 0,
            pagetable: null_mut(),
            trapframe: null_mut(),
            context: Context::new(),
            name: [0u8; 16],
            parent: None,
            open_files: array![_ => None; NFILE],
            cwd: None,
            
            state: ProcState::UNUSED,
            channel: 0,
            killed: false,
            xstate: 0,
            pid: 0,
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

    pub fn set_parent(&mut self, parent: Option<*mut task_struct>) {
        self.parent = parent;
    }

    pub fn set_kstack(&mut self, ksatck: usize) {
        self.kstack = ksatck;
    }

    pub fn set_trapframe(&mut self, trapframe: *mut Trapframe) {
        self.trapframe = trapframe;
    }

    pub fn set_pagetable(&mut self, pagetable: *mut PageTable) {
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
    // pub unsafe fn proc_pagetable(&mut self) {

    //     extern "C" {
    //         fn trampoline();
    //     }

    //     // An empty page table
    //     let mut page_table = PageTable::uvmcreate();
    //     // map the trampoline code (for system call return )
    //     // at the highest user virtual address.
    //     // only the supervisor uses it, on the way
    //     // to/from user space, so not PTE_U. 
    //     if !page_table.map(
    //         VirtualAddress::new(TRAMPOLINE),
    //         PhysicalAddress::new(trampoline as usize),
    //         PGSIZE,
    //         PteFlags::R | PteFlags::X
    //     ) {
    //         page_table.uvm_free(0);
    //     }

    //     // map the trapframe just below TRAMPOLINE, for trampoline.S 
    //     if !page_table.map(
    //         VirtualAddress::new(TRAPFRAME), 
    //         PhysicalAddress::new(self.trapframe as usize),
    //         PGSIZE,
    //         PteFlags::R | PteFlags::W
    //     ) {
    //         page_table.uvm_free(0);
    //     }

    //     self.pagetable = Some(page_table);
    // }

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



    // pub const fn new() -> Self{
    //     Self{    
    //         meta: Spinlock::new(ProcMeta::new(), "process"),
    //         data: UnsafeCell::new(ProcData::new()),
    //     }
    // }

    pub fn init(&mut self, kstack: usize) {
        // let pdata = unsafe {
        //     &mut *self.data.get()
        // };

        self.open_files = array![_ => None; NFILE];

        self.set_kstack(kstack);
    }

    pub fn as_ptr(&self) -> *const task_struct{
        self as *const task_struct
    }

    pub fn as_mut_ptr(&mut self) -> *mut task_struct{
        self as *mut task_struct
    }

    pub fn as_ptr_addr(&self) -> usize{
        self as *const task_struct as usize
    }

    pub fn as_mut_ptr_addr(&mut self) -> usize{
        self as *mut task_struct as usize
    }

    pub fn killed(&self) -> bool {
        self.killed
    }

    pub fn pid(&self) -> usize {
        self.pid
    }

    pub fn set_state(&mut self, state: ProcState) {
        self.state = state;
    }

    pub fn set_killed(&mut self, killed: bool) {
        self.killed = killed;
    }

    pub fn state(&self) -> ProcState {
        self.state
    }

    pub fn name(&self) -> &str {
        from_utf8(&self.name).unwrap()
    }

    pub fn modify_kill(&mut self, killed: bool) {
        self.killed = killed;
    }

    // pub fn page_table(&mut self) -> &mut Box<PageTable> {
    //     &mut self.pagetable.unwrap()
    // }

    /// Create a user page table for a given process,
    /// with no user memory, but with trampoline pages. 
  
    
    pub fn proc_pagetable(&self) -> *mut PageTable {
        // An empty page table
        let mut page_table = unsafe{ PageTable::uvmcreate() };
        let pagetable = unsafe { &mut *page_table };
        // map the trampoline code(for system call return)
        // at the highest user virtual address. 
        // only the supervisor uses it, on the way
        // to/from user space, so not PTE_U. 
        unsafe{
            if !pagetable.map(
            VirtualAddress::new(TRAMPOLINE), 
            PhysicalAddress::new(trampoline as usize),
             PGSIZE, 
             PteFlags::R | PteFlags::X
            ) {
                pagetable.uvm_free(0);
                return null_mut();
            }

            // map the trapframe just below TRAMPOLINE, for trampoline.S 
            if !pagetable.map(
                VirtualAddress::new(TRAPFRAME), 
                PhysicalAddress::new(self.get_trapframe() as usize), 
                PGSIZE, 
                PteFlags::R | PteFlags::W
            ) {
                pagetable.uvm_unmap(
                    VirtualAddress::new(TRAPFRAME), 
                    1, 
                    false
                );
                pagetable.uvm_free(0);
                return null_mut();
            }
        }
        page_table
    }

    /// free a proc structure and the data hanging from it,
    /// including user pages.
    /// p.acquire() must be held.
    pub fn free_proc(&mut self) {
        if !self.trapframe.is_null() {
            unsafe { drop_in_place(self.trapframe as *mut RawPage) };



            self.set_trapframe(0 as *mut Trapframe);

            // if let Some(page_table) = self.pagetable {
            //     page_table.proc_free_pagetable(self.size);
            // }
            let pagetable = unsafe { &mut *self.pagetable };
            
            // println!("+++++++++++++++++++++");
            // pagetable.print_pagetable();
            // println!("+++++++++++++++++++++");

            // pagetable.proc_free_pagetable(self.size);

            // println!("+++++++++++++++++++++");
            // pagetable.print_pagetable();
            // println!("+++++++++++++++++++++");


            // pagetable.free_pagetable();
            // self.set_pagetable(0 as *mut PageTable);
            
            // println!("+++++++++++++++++++++");
            // pagetable.print_pagetable();
            // println!("+++++++++++++++++++++");
            // while(true){

            // }

            // self.set_pagetable(None);
            self.set_parent(None);
            self.size = 0;

            self.pid = 0;
            self.channel = 0;
            self.killed = false;
            self.xstate = 0;
            self.set_state(ProcState::UNUSED);
            
        }
    }

    pub fn free_thread(&mut self) {
        if !self.trapframe.is_null() {
            unsafe { drop_in_place(self.trapframe as *mut RawPage); }

            self.set_trapframe(0 as *mut Trapframe);

            // let pagetable = unsafe { &mut *self.pagetable };
            // pagetable.proc_free_pagetable(self.size);

            // pagetable.free_pagetable();
            self.set_pagetable(0 as *mut PageTable);


            // self.set_pagetable(None);
            self.set_parent(None);
            self.size = 0;

            self.thread_ustack = 0;

            self.pid = 0;
            self.channel = 0;
            self.killed = false;
            self.xstate = 0;
            self.set_state(ProcState::UNUSED);
            
        }
    }

    
    /// Grow or shrink user memory by n bytes. 
    /// Return true on success, false on failure. 
    pub fn grow_proc(&mut self, count: isize) -> Result<(), &'static str> {
        let mut size = self.size; 
        let page_table = unsafe { &mut *self.pagetable };
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

        self.size = size;

        Ok(())
    }


    /// Give up the CPU for one scheduling round.
    /// yield is a keyword in rust
    pub fn yielding(&mut self) {
        // println!("[Debug] 让出 CPU");
        let guard = unsafe { PROC_MANAGER.tasks_lock.acquire() };
   
        self.set_state(ProcState::RUNNABLE);

        unsafe {
            let my_cpu = CPU_MANAGER.mycpu();
            my_cpu.sched();
        }
        drop(guard);
    }

    /// Atomically release lock and sleep on chan
    /// Reacquires lock when awakened.
    pub fn sleep<T>(&mut self, channel: usize, lock: SpinlockGuard<'_, T>) {
        // Must acquire p->lock in order to 
        // change p->state and then call sched.
        // Once we hold p->lock, we can be
        // guaranteed that we won't miss any wakeup
        // (wakeup locks p->lock)
        // so it's okay to release lk;


        // let mut guard = self.meta.acquire();
        // drop(lock);
        // // Go to sleep.
        // guard.channel = channel;
        // guard.set_state(ProcState::SLEEPING);
        // unsafe {
        //     let my_cpu = CPU_MANAGER.mycpu();
        //     let ctx = (&mut (*self.data.get())).get_context_mut();      
        //     // get schedule process
        //     guard = my_cpu.sched(
        //         guard, 
        //         ctx
        //     );
        //     // Tide up
        //     guard.channel = 0;
        //     drop(guard);
        // }
        
        let tasks_guard = unsafe { PROC_MANAGER.tasks_lock.acquire() };
        drop(lock);

        self.channel = channel;
        self.state = ProcState::SLEEPING;

        unsafe {
            let mycpu = CPU_MANAGER.mycpu();
            // let cur_ctx = (&mut self.context);

            mycpu.sched();
        }
        
        self.channel = 0;

        drop(tasks_guard);
        
    }

    /// Find a unallocated fd
    pub fn fd_alloc(&mut self, file: &VFile) -> Result<usize, &'static str>{
        
        let fd = self.find_unallocated_fd()?;
        self.open_files[fd].replace(Arc::new(file.clone()));
        Ok(fd)       
    } 

    pub fn fork(&mut self) -> Option<&mut Self> {
        // 从表中获取未被分配的子进程
        if let Some(child_proc) = ProcManager::alloc_proc()  {
            // 从当前进程的页表拷贝到子进程中
            // let pdata = unsafe{ &mut *self.data.get() };
            // let child_data = unsafe{ &mut *child_proc.data.get() };
            if unsafe{ self.pagetable.as_mut().unwrap().uvm_copy(
                child_proc.pagetable.as_mut().unwrap(), 
                self.size
            ).is_err() } {
                panic!("fork: Fail to copy data from parent process.")
            }
            // 将当前进程的 trapframe 拷贝到子进程
            let ptf = self.trapframe as *const Trapframe;
            let child_tf = unsafe{ &mut *child_proc.trapframe };
            unsafe{ copy_nonoverlapping(ptf, child_tf, 1); }
            // fork 后子进程应当返回0
            child_tf.a0 = 0;

            // 子进程拷贝父进程的文件和工作目录
            child_proc.open_files.clone_from(&self.open_files);
            child_proc.cwd.clone_from(&self.cwd);

            child_proc.name = self.name;
            child_proc.size = self.size;

            // let wait = unsafe{ PROC_MANAGER.wait_lock.acquire() };
            child_proc.parent = Some(self as *mut task_struct);
            // drop(wait);

            let guard = unsafe { PROC_MANAGER.tasks_lock.acquire() };
            child_proc.state = ProcState::RUNNABLE;
            drop(guard);

            println!("Self pid is {}, child pid is {}", self.pid, child_proc.pid);
            Some(child_proc)
        }else {
            println!("[Kernel] fork: None");
            None
        }
    }
}

extern "C" {
    fn trampoline();
}





