use core::borrow::Borrow;
use core::ptr::*;
use core::cell::{ UnsafeCell, RefCell };
use core::str::from_utf8;
use alloc::vec::Vec;
use alloc::vec;
use alloc::sync::Arc;
use array_macro::array;

use crate::arch::riscv::qemu::fs::NOFILE;
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

pub type SystemThreadEntry = fn();

/// Memory shared by every userspace thread in one process.
///
/// Each thread still owns a trapframe and kernel stack, but all of them switch
/// to this same page table so writes to globals and heap memory are visible to
/// the complete thread group.
pub struct UserAddressSpace {
    pub page_table: Box<PageTable>,
    pub size: usize,
}

impl UserAddressSpace {
    pub fn new(page_table: Box<PageTable>, size: usize) -> Self {
        Self { page_table, size }
    }
}

/// File descriptors and cwd have process-wide semantics, so threads share one
/// locked instance instead of cloning independent descriptor arrays.
pub struct UserResources {
    // NOFILE is the per-process descriptor limit. NFILE is the global file
    // object limit and made this value large enough to overflow kernel stacks
    // when a shared resource object was constructed during a syscall.
    pub open_files: [Option<Arc<VFile>>; NOFILE],
    pub cwd: Option<Inode>,
}

impl UserResources {
    pub const fn new() -> Self {
        Self {
            open_files: array![_ => None; NOFILE],
            cwd: None,
        }
    }
}

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
    pub address_space: Option<Arc<Spinlock<UserAddressSpace>>>,
    pub trapframe: *mut Trapframe, // data page for trampoline.S
    /// Virtual address where this thread's private trapframe is mapped.
    pub trapframe_va: usize,
    pub context: Context, // switch() here to run processs
    pub name: [u8; 16],   // Process name (debugging)
    // proc_tree_lock must be held when using this:
    pub parent: Option<*mut Process>,   
    pub resources: Option<Arc<Spinlock<UserResources>>>,
    /// True for a userspace thread created by thread_clone, not its leader.
    pub user_thread: bool,
    /// Present only for a scheduler-managed thread that never enters user mode.
    pub system_thread_entry: Option<SystemThreadEntry>,

}

impl ProcData {
    pub const fn new() -> Self {
        Self {
            kstack:0,
            address_space: None,
            trapframe: null_mut(),
            trapframe_va: TRAPFRAME,
            context: Context::new(),
            name: [0u8; 16],
            parent: None,
            resources: None,
            user_thread: false,
            system_thread_entry: None,
        }
    }

    pub fn get_trapframe(&self) -> *mut Trapframe {
        self.trapframe
    }

    pub fn set_name(&mut self, name: &[u8]) {
        // Keep one trailing NUL and clamp caller-provided names so a long
        // system-thread name cannot overwrite adjacent process metadata.
        self.name = [0; 16];
        let len = core::cmp::min(name.len(), self.name.len() - 1);
        unsafe {
            copy_nonoverlapping(
                name.as_ptr(), 
                self.name.as_mut_ptr(),
                len
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

    pub fn set_address_space(
        &mut self,
        address_space: Option<Arc<Spinlock<UserAddressSpace>>>,
    ) {
        self.address_space = address_space
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

    /// Prepare a fresh context that starts at the system-thread bootstrap.
    pub fn init_system_thread_context(&mut self, entry: SystemThreadEntry) {
        self.context.write_zero();
        self.context.write_ra(system_thread_bootstrap as usize);
        // System threads may use the complete four-page kernel stack because
        // they never need a user trapframe at its top.
        self.context.write_sp(self.kstack + PGSIZE * 4);
        self.system_thread_entry = Some(entry);
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

        self.address_space = Some(Arc::new(Spinlock::new(
            UserAddressSpace::new(page_table, 0),
            "user address space"
        )));
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

    pub fn is_system_thread(&self) -> bool {
        unsafe { (&*self.data.get()).system_thread_entry.is_some() }
    }

    pub fn is_user_thread(&self) -> bool {
        unsafe { (&*self.data.get()).user_thread }
    }

    pub fn modify_kill(&self, killed: bool) {
        let mut proc_data = self.meta.acquire();
        proc_data.killed = killed;
        drop(proc_data);
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
        let pdata = self.data.get_mut();
        if !pdata.trapframe.is_null() {
            let address_space = pdata
                .address_space
                .take()
                .expect("user process has no address space");
            {
                let mut shared = address_space.acquire();
                // Every thread maps its private trapframe into the shared page
                // table. Remove that mapping before releasing the physical page.
                shared.page_table.uvm_unmap(
                    VirtualAddress::new(pdata.trapframe_va),
                    1,
                    false
                );
                if Arc::strong_count(&address_space) == 1 {
                    // The last thread owns the user pages and trampoline mapping.
                    // Earlier joins only remove their private trapframe mapping.
                    let size = shared.size;
                    shared.page_table.free_shared_user_pagetable(size);
                }
            }

            unsafe {
                drop(Box::from_raw(pdata.trapframe as *mut RawPage));
            }
            pdata.set_trapframe(0 as *mut Trapframe);

            let mut guard = self.meta.acquire();

            pdata.set_parent(None);
            pdata.resources = None;
            pdata.system_thread_entry = None;
            pdata.user_thread = false;
            pdata.trapframe_va = TRAPFRAME;
            pdata.context.write_zero();
            pdata.name = [0; 16];

            guard.pid = 0;
            guard.channel = 0;
            guard.killed = false;
            guard.xstate = 0;
            guard.set_state(ProcState::UNUSED);

            drop(guard);
            
        }
    }

    /// Recycle a returned system thread after the scheduler regains control.
    pub fn free_system_thread(&mut self) {
        let pdata = self.data.get_mut();
        debug_assert!(pdata.system_thread_entry.is_some());
        debug_assert!(pdata.trapframe.is_null());
        debug_assert!(pdata.address_space.is_none());

        pdata.system_thread_entry = None;
        pdata.context.write_zero();
        pdata.name = [0; 16];
        pdata.parent = None;
        // Reclaim descriptors one at a time: constructing a 100-entry
        // replacement array here overflowed the small per-hart scheduler stack
        // during system-thread teardown and corrupted a concurrently starting
        // user process.
        pdata.resources = None;
        pdata.user_thread = false;

        let mut guard = self.meta.acquire();
        guard.pid = 0;
        guard.channel = 0;
        guard.killed = false;
        guard.xstate = 0;
        guard.set_state(ProcState::UNUSED);
    }

    
    /// Grow or shrink user memory by n bytes. 
    /// Return true on success, false on failure. 
    pub fn grow_proc(&mut self, count: isize) -> Result<(), &'static str> {
        let address_space = self
            .data
            .get_mut()
            .address_space
            .as_ref()
            .expect("process has no address space")
            .clone();
        let mut shared = address_space.acquire();
        let mut size = shared.size;
        if count > 0 {
            match unsafe { shared.page_table.uvm_alloc(size, size + count as usize) } {
                Some(new_size) => {
                    size = new_size;
                },

                None => {
                    return Err("Fail to allocate virtual memory for user")
                }
            }
        } else if count < 0 {
            let new_size = (size as isize + count) as usize;
            size = shared.page_table.uvm_dealloc(size, new_size);
        }

        shared.size = size;

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
        let mut guard = self.meta.acquire();
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
        let resources = unsafe { (&*self.data.get()).resources.as_ref() }
            .expect("process has no resources")
            .clone();
        let mut resources = resources.acquire();
        let fd = resources
            .open_files
            .iter()
            .position(Option::is_none)
            .ok_or("Fail to find unallocted fd")?;
        resources.open_files[fd].replace(Arc::new(file.clone()));
        Ok(fd)       
    } 

    pub fn fork(&mut self) -> Option<&mut Self> {
        // 从表中获取未被分配的子进程
        if let Some(child_proc) = unsafe{ PROC_MANAGER.alloc_proc() } {
            // 从当前进程的页表拷贝到子进程中
            let pdata = unsafe{ &mut *self.data.get() };
            let child_data = unsafe{ &mut *child_proc.data.get() };
            let address_space = pdata.address_space.as_ref().unwrap().clone();
            let child_address_space = child_data.address_space.as_ref().unwrap().clone();
            {
                let mut parent_memory = address_space.acquire();
                let mut child_memory = child_address_space.acquire();
                let parent_size = parent_memory.size;
                if unsafe{ parent_memory.page_table.uvm_copy(
                    &mut child_memory.page_table,
                    parent_size
                ).is_err() } {
                    panic!("fork: Fail to copy data from parent process.")
                }
                child_memory.size = parent_size;
            }
            // 将当前进程的 trapframe 拷贝到子进程
            let ptf = pdata.trapframe as *const Trapframe;
            let child_tf = unsafe{ &mut *child_data.trapframe };
            unsafe{ copy_nonoverlapping(ptf, child_tf, 1); }
            // fork 后子进程应当返回0
            child_tf.a0 = 0;

            // 子进程拷贝父进程的文件和工作目录
            let resources = pdata.resources.as_ref().unwrap().clone();
            let child_resources = child_data.resources.as_ref().unwrap().clone();
            {
                let resources = resources.acquire();
                let mut child_resources = child_resources.acquire();
                child_resources.open_files.clone_from(&resources.open_files);
                child_resources.cwd.clone_from(&resources.cwd);
            }

            child_data.name = pdata.name;

            let wait = unsafe{ PROC_MANAGER.wait_lock.acquire() };
            child_data.parent = Some(self as *mut Process);
            drop(wait);

            // Publish RUNNABLE only after every field needed by exec/exit is
            // initialized. On multiple harts the old order allowed the child
            // to exit while parent was still None. Drop temporary Arc clones
            // as well so exec sees no false "active user threads" reference.
            drop(address_space);
            drop(child_address_space);
            drop(resources);
            drop(child_resources);
            let mut child_meta = child_proc.meta.acquire();
            child_meta.state = ProcState::RUNNABLE;
            drop(child_meta);
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
