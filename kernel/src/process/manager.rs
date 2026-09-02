use array_macro::array;
use alloc::sync::Arc;
use core::cell::RefCell;
use core::str::{from_utf8, from_utf8_unchecked};
use core::{mem::size_of_val, ptr::{copy_nonoverlapping, NonNull}};
use core::ops::{ DerefMut };
use super::*;
use crate::arch::riscv::qemu::fs::ROOTIPATH;
use crate::arch::riscv::qemu::{
    param::NPROC,
    layout::{ PGSIZE, TRAMPOLINE, TRAPFRAME }
};
use crate::fs::{VFile, ICACHE, LOG};
use crate::lock::spinlock::{ Spinlock, SpinlockGuard };
use crate::arch::riscv::register::sstatus::intr_on;
use crate::memory::*;

pub struct ProcManager {
    proc: [Process; NPROC],
    init_proc: *mut Process,
    pid_lock: Spinlock<usize>,
    /// helps ensure that wakeups of wait()ing
    /// parents are not lost. helps obey the
    /// memory model when using p->parent.
    /// must be acquired before any p->lock.
    pub wait_lock: Spinlock<()>,
}

pub static mut PROC_MANAGER:ProcManager = ProcManager::new();


impl ProcManager{
    pub const fn new() -> Self {
        Self{
            proc: array![_ => Process::new(); NPROC],
            init_proc: 0 as *mut Process,
            pid_lock: Spinlock::new(0, "pid_lock"),
            wait_lock: Spinlock::new((), "wait_lock"),
        }
    }
    
    pub fn get_table_mut(&mut self) -> &mut [Process; NPROC] {
        &mut self.proc
    }

    pub fn alloc_pid(&mut self) -> usize {
        let mut guard = self.pid_lock.acquire();
        let pid;       
        *guard += 1;
        pid = *guard;        
        drop(guard);
        pid
    }

    /// initialize the proc table at boot time.
    /// Only used in boot.
    pub unsafe fn init(&mut self){
        println!("process init......");
        for (pos, proc) in self.proc.iter_mut().enumerate() {
            proc.init(kernel_stack(pos));
        }
    }

    /// Allocate 4 page for each process's kernel stack.
    /// Map it high in memory, followed by an invalid 
    /// group page
    pub unsafe fn proc_mapstacks(&mut self) {
        for (pos, _) in self.proc.iter_mut().enumerate() {
            let pa = Stack::new_zeroed();
            let va = kernel_stack(pos);

            // map process stack into kernel, 
            // which contain 5 page(stack for 4 page and 1 for guard page). 
            KERNEL_PAGETABLE.kernel_map(
                VirtualAddress::new(va),
                PhysicalAddress::new(pa),
                PGSIZE * 4,
                PteFlags::R | PteFlags::W
            );
            
        }
    }

    /// Set up first user programe
    pub unsafe fn user_init(&mut self) {
        println!("first user process init......");
        let p = self.alloc_proc().expect("Fail to get unused process");

        // allocate one user page and copy init's instructions
        // and data into it.
        let pdata = &mut *p.data.get();
        let address_space = pdata.address_space.as_ref().unwrap().clone();
        {
            let mut memory = address_space.acquire();
            memory.page_table.uvm_init(&INITCODE);
            memory.size = PGSIZE;
        }

        // prepare for the very first "return" from kernel to user. 
        let tf =  &mut *pdata.trapframe;
        tf.epc = 0; // user program counter
        tf.sp = 4 * PGSIZE; // user stack pointer

        let init_name = b"initname\0";
        pdata.set_name(init_name);
        // Set init process's directory
        let resources = pdata.resources.as_ref().unwrap().clone();
        resources.acquire().cwd = Some(
            ICACHE.namei(&ROOTIPATH).expect("cannot find root inode")
        );
        
        // Keep init allocated but not runnable until the fs-init system thread
        // has recovered the log and made the root filesystem safe to use.
        self.init_proc = p as *mut Process;
    }

    /// Make the first user process runnable after asynchronous kernel setup.
    pub unsafe fn start_init_process(&mut self) {
        let init_proc = self.init_proc.as_mut().expect("init process is not allocated");
        let mut guard = init_proc.meta.acquire();
        debug_assert_eq!(guard.state, ProcState::ALLOCATED);
        guard.set_state(ProcState::RUNNABLE);
    }

    /// Create a scheduler-managed thread that runs entirely in supervisor mode.
    pub fn spawn_system_thread(
        &mut self,
        name: &[u8],
        entry: SystemThreadEntry,
    ) -> Result<usize, &'static str> {
        let pid = self.alloc_pid();

        for proc in self.proc.iter_mut() {
            let mut guard = proc.meta.acquire();
            if guard.state != ProcState::UNUSED {
                continue;
            }

            let pdata = proc.data.get_mut();
            debug_assert!(pdata.trapframe.is_null());
            debug_assert!(pdata.address_space.is_none());

            guard.pid = pid;
            guard.channel = 0;
            guard.killed = false;
            guard.xstate = 0;
            guard.set_state(ProcState::ALLOCATED);

            pdata.set_name(name);
            pdata.init_system_thread_context(entry);
            guard.set_state(ProcState::RUNNABLE);
            return Ok(pid)
        }

        Err("process table is full")
    }


    /// Look in the process table for an UNUSED proc.
    /// If found, initialize state required to run in the kernel,
    /// and return p.acquire() held.
    /// If there are a free procs, or a memory allocation fails, return 0. 

    /// WARNING: possible error occurs here.
    pub fn alloc_proc(&mut self) -> Option<&mut Process> {
        let alloc_pid = self.alloc_pid();
        // self.proc_dump();
        for proc in self.proc.iter_mut() {
            let mut pmeta = proc.meta.acquire();
            match pmeta.state {
                ProcState::UNUSED => {
                    pmeta.pid = alloc_pid;
                    pmeta.set_state(ProcState::ALLOCATED);
                    let pdata = proc.data.get_mut();
                    // Allocate a trapframe page.
                    let trapframe = unsafe{ RawPage::new_zeroed() as *mut u8 };
                    pdata.set_trapframe(trapframe as *mut Trapframe);
                    // An empty user page table
                    unsafe{
                        pdata.proc_pagetable();
                    }
                    pdata.resources = Some(Arc::new(Spinlock::new(
                        UserResources::new(),
                        "user resources"
                    )));
                    // Set up new context to start executing at forkret, 
                    // which returns to user space. 
                    pdata.init_context();
                    drop(pmeta);
                    return Some(proc)
                }
                _ => {}
            }
        }
        None
    }

    /// Create a schedulable user thread that shares its creator's process-wide
    /// address space and resources but owns a private trapframe and kernel stack.
    pub fn create_user_thread(
        &mut self,
        creator: &mut Process,
        entry: usize,
        arg: usize,
        stack: usize,
        return_pc: usize,
    ) -> Result<usize, &'static str> {
        let creator_data = unsafe { &*creator.data.get() };
        let address_space = creator_data
            .address_space
            .as_ref()
            .ok_or("thread_clone: no address space")?
            .clone();
        let resources = creator_data
            .resources
            .as_ref()
            .ok_or("thread_clone: no user resources")?
            .clone();
        let name = creator_data.name;

        let stack_top = stack
            .checked_add(PGSIZE)
            .ok_or("thread_clone: stack overflow")?;
        {
            let mut memory = address_space.acquire();
            if stack % PGSIZE != 0
                || stack_top > memory.size
                || entry >= memory.size
                || return_pc >= memory.size
            {
                return Err("thread_clone: invalid user address")
            }

            // Validate both ends of the caller-owned stack page. This catches
            // holes in the page table instead of letting the new thread fault
            // while the parent believes clone succeeded.
            for address in [entry, return_pc, stack, stack_top - 1] {
                if memory
                    .page_table
                    .pgt_translate(VirtualAddress::new(address))
                    .is_none()
                {
                    return Err("thread_clone: unmapped user address")
                }
            }
        }

        let table_base = self.proc.as_ptr() as usize;
        // Keep only the raw slot pointer so the temporary alloc_proc borrow of
        // the manager ends before we acquire wait_lock below.
        let thread_ptr = self.alloc_proc().ok_or("thread_clone: process table full")?
            as *mut Process;
        let thread = unsafe { &mut *thread_ptr };
        let slot = (thread_ptr as usize - table_base) / core::mem::size_of::<Process>();
        let thread_data = unsafe { &mut *thread.data.get() };

        // alloc_proc creates an independent empty page table. A thread does
        // not need it, so release its trampoline/trapframe mappings before
        // attaching the slot to the creator's shared address space.
        let empty_address_space = thread_data
            .address_space
            .take()
            .expect("thread_clone: missing temporary address space");
        empty_address_space
            .acquire()
            .page_table
            .proc_free_pagetable(0);
        thread_data.resources = None;

        // Derive a stable, per-slot virtual address below the leader's fixed
        // trapframe. A joined slot can safely reuse this VA because unmap now
        // clears the old PTE before the physical trapframe is freed.
        let trapframe_va = TRAPFRAME - (slot + 1) * PGSIZE;
        if !unsafe {
            address_space.acquire().page_table.map(
                VirtualAddress::new(trapframe_va),
                PhysicalAddress::new(thread_data.trapframe as usize),
                PGSIZE,
                PteFlags::R | PteFlags::W,
            )
        } {
            panic!("thread_clone: cannot map private trapframe");
        }

        unsafe {
            copy_nonoverlapping(
                creator_data.trapframe as *const Trapframe,
                thread_data.trapframe,
                1,
            );
            let trapframe = &mut *thread_data.trapframe;
            trapframe.epc = entry;
            trapframe.sp = stack_top;
            trapframe.a0 = arg;
            // The userspace wrapper supplies thread_return here so a normal
            // entry return becomes thread_exit(0), not a jump to address zero.
            trapframe.ra = return_pc;
        }

        thread_data.address_space = Some(address_space);
        thread_data.resources = Some(resources);
        thread_data.trapframe_va = trapframe_va;
        thread_data.user_thread = true;
        thread_data.name = name;

        let wait_guard = self.wait_lock.acquire();
        // All secondary threads are children of the process leader. This
        // keeps the process tree stable even when one thread creates another.
        thread_data.parent = if creator_data.user_thread {
            creator_data.parent
        } else {
            Some(creator as *mut Process)
        };
        let mut thread_meta = thread.meta.acquire();
        let tid = thread_meta.pid;
        thread_meta.set_state(ProcState::RUNNABLE);
        drop(thread_meta);
        drop(wait_guard);
        Ok(tid)
    }

    /// Wait for one thread in the caller's address-space group and reclaim its
    /// private kernel state. Normal wait() deliberately ignores these entries.
    pub fn join_user_thread(&mut self, tid: usize, status_addr: usize) -> Option<usize> {
        let current = unsafe { CPU_MANAGER.myproc()? };
        let address_space = unsafe {
            (&*current.data.get()).address_space.as_ref()?.clone()
        };
        let mut wait_guard = self.wait_lock.acquire();

        loop {
            let mut found = false;
            for thread in self.proc.iter_mut() {
                if thread as *mut Process == current as *mut Process {
                    continue;
                }
                let thread_data = unsafe { &*thread.data.get() };
                let same_group = thread_data.user_thread
                    && thread_data
                        .address_space
                        .as_ref()
                        .map(|candidate| Arc::ptr_eq(candidate, &address_space))
                        .unwrap_or(false);
                if !same_group {
                    continue;
                }

                let thread_meta = thread.meta.acquire();
                if thread_meta.pid != tid {
                    drop(thread_meta);
                    continue;
                }
                found = true;
                if thread_meta.state == ProcState::ZOMBIE {
                    let status = thread_meta.xstate as i32;
                    if status_addr != 0
                        && address_space.acquire().page_table.copy_out(
                            status_addr,
                            &status as *const i32 as *const u8,
                            core::mem::size_of::<i32>(),
                        ).is_err()
                    {
                        drop(thread_meta);
                        drop(wait_guard);
                        return None
                    }
                    drop(thread_meta);
                    thread.free_proc();
                    drop(wait_guard);
                    return Some(tid)
                }
                drop(thread_meta);

                // thread_exit wakes this exact channel while holding wait_lock,
                // so the state check and sleep cannot lose a completion wakeup.
                current.sleep(thread as *mut Process as usize, wait_guard);
                wait_guard = self.wait_lock.acquire();
                break;
            }

            if !found {
                drop(wait_guard);
                return None
            }
        }
    }

    /// Finish only the calling userspace thread; shared process resources stay
    /// alive until the process leader exits.
    pub fn thread_exit(&mut self, status: usize) -> ! {
        let current = unsafe {
            CPU_MANAGER.myproc().expect("thread_exit: no current process")
        };
        if !current.is_user_thread() {
            self.exit(status)
        }

        let wait_guard = self.wait_lock.acquire();
        self.reparent(current);
        self.wake_up(current as *mut Process as usize);

        let current_data = unsafe { &mut *current.data.get() };
        let mut current_meta = current.meta.acquire();
        current_meta.xstate = status;
        current_meta.set_state(ProcState::ZOMBIE);
        drop(wait_guard);

        unsafe {
            current_meta = CPU_MANAGER.mycpu().sched(
                current_meta,
                &mut current_data.context as *mut Context,
            );
        }
        drop(current_meta);
        panic!("a joined user thread was scheduled again");
    }


    /// Wake up all processes sleeping on chan.
    /// Must be called without any p->lock.
    pub fn wake_up(&self, channel: usize) {
        for p in self.proc.iter() {
            let mut guard = p.meta.acquire();
            if guard.state == ProcState::SLEEPING && guard.channel == channel {
                // println!("[Debug] Wake up process {}", guard.pid);
                guard.state = ProcState::RUNNABLE;
            }
            drop(guard);
        }
    }

    /// Find a runnable and set status to allocated
    pub fn seek_runnable(&mut self) -> Option<&mut Process> {
        for p in self.proc.iter_mut() {
            let mut guard = p.meta.acquire();
            match guard.state {
                ProcState::RUNNABLE => {
                    guard.state = ProcState::ALLOCATED;
                    drop(guard);
                    return Some(p)
                },
                _ => {
                    drop(guard);
                },
            }
        }
        None
    }

    /// Pass p's abandonded children to init. 
    /// Caller must hold wait lock. 
    pub fn reparent(&self, proc: &mut Process) {
        for index in 0..self.proc.len() {
            let p = &self.proc[index];
                let pdata = unsafe{ &mut *p.data.get() };
                if let Some(parent) = pdata.parent {
                    if parent as *const _ == proc as *const _ {
                        pdata.parent = Some(self.init_proc);
                        self.wake_up(self.init_proc as usize);
                    }
                }
        }
    }

    /// Stop and reap every secondary thread before a process leader becomes a
    /// zombie. Otherwise its parent could reap the leader while live threads
    /// still refer to the shared address space, leaving unreachable zombies.
    fn terminate_user_threads(&mut self, leader: &mut Process) {
        let address_space = unsafe {
            (&*leader.data.get())
                .address_space
                .as_ref()
                .expect("exiting process has no address space")
                .clone()
        };

        loop {
            let wait_guard = self.wait_lock.acquire();
            let mut target = None;
            let mut reaped = false;

            for thread in self.proc.iter_mut() {
                let thread_data = unsafe { &*thread.data.get() };
                let same_group = thread_data.user_thread
                    && thread_data
                        .address_space
                        .as_ref()
                        .map(|candidate| Arc::ptr_eq(candidate, &address_space))
                        .unwrap_or(false);
                if !same_group {
                    continue;
                }

                let mut thread_meta = thread.meta.acquire();
                if thread_meta.state == ProcState::ZOMBIE {
                    drop(thread_meta);
                    thread.free_proc();
                    reaped = true;
                    break;
                }

                // A sleeping thread must be made runnable so it can observe
                // killed at the next trap boundary and take thread_exit.
                thread_meta.killed = true;
                if thread_meta.state == ProcState::SLEEPING {
                    thread_meta.set_state(ProcState::RUNNABLE);
                }
                target = Some(thread as *const Process as usize);
                drop(thread_meta);
                break;
            }

            if reaped {
                drop(wait_guard);
                continue;
            }
            let Some(channel) = target else {
                drop(wait_guard);
                return
            };
            leader.sleep(channel, wait_guard);
        }
    }
    
    /// Exit the current process. Does not return. 
    /// An exited process remains in the zombie state 
    /// until its parent calls wait. 
    pub fn exit(&mut self, status : usize) -> ! {
        let my_proc = unsafe {
            CPU_MANAGER.myproc().expect("Current cpu's process is none.")
        };
        // The leader owns process teardown. Wait until all secondary threads
        // have stopped before closing their shared resources.
        self.terminate_user_threads(my_proc);
        let pdata = unsafe{ &mut *my_proc.data.get() };
        let resources = pdata.resources.as_ref().unwrap().clone();
        {
            let mut resources = resources.acquire();
            // 遍历该进程打开的文件，夺取所有权，即将引用计数减一
            for file in resources.open_files.iter_mut() {
                file.take();
            }
            resources.cwd = None;
        }

        LOG.begin_op();
        LOG.end_op();

        let wait_guard = self.wait_lock.acquire();
        // Give any children to init. 
        self.reparent(my_proc);
        // Parent might be sleeping in wait. 
        // 唤醒父进程
        self.wake_up(pdata.parent.expect("Fail to find parent process") as usize);

        let mut proc_data = my_proc.meta.acquire();
        // 设置退出状态
        proc_data.xstate = status;
        // 设置运行状态
        proc_data.set_state(ProcState::ZOMBIE);

        drop(wait_guard);

        let my_cpu = unsafe {
            CPU_MANAGER.mycpu()
        };
        unsafe {
            my_cpu.sched(
                proc_data, 
                &mut pdata.context as *mut Context
            );
        }

        panic!("zombie exit!");
    }

    /// Wait for a child process to exit and return its pid. 
    /// 等待子进程退出并返回 pid
    pub fn wait(&mut self, addr: usize) -> Option<usize> {
        let pid;
        let my_proc = unsafe {
            CPU_MANAGER.myproc().expect("Fail to get my process")
        };
        let mut wait_guard = self.wait_lock.acquire();
        loop {
            let mut have_kids = false;
            // Scan through table looking for exited children. 
            // 遍历所有进程是否为其他进程的子进程
            for index in 0..self.proc.len() {
                let p = &mut self.proc[index];
                let pdata = unsafe { p.data.get().as_mut().unwrap() };
                if pdata.user_thread {
                    continue;
                }
                if let Some(parent) = pdata.parent {
                    if parent as *const _ == my_proc as *const _ {
                        // 确报子进程不会退出或者进行被调度出去
                        let proc_meta = p.meta.acquire();
                        have_kids = true;
                        // make sure the child isn't still in exit or swtch. 
                        if proc_meta.state == ProcState::ZOMBIE {
                            // Found one 
                            pid = proc_meta.pid;
                            // 这里是要获取子进程退出的状态，当 addr 的值为 0 的时候为悬空指针，表示
                            // 不需要获取子进程退出的状态
                            if addr != 0 {
                                let address_space = unsafe {
                                    (&*my_proc.data.get()).address_space.as_ref().unwrap().clone()
                                };
                                if address_space.acquire().page_table.copy_out(
                                    addr,
                                    &proc_meta.xstate as *const usize as *const u8,
                                    size_of_val(&proc_meta.xstate)
                                ).is_err() {
                                    drop(proc_meta);
                                    drop(wait_guard);
                                    return None
                                }
                            }
                            drop(proc_meta);
                            p.free_proc();
                            drop(wait_guard);
                            return Some(pid);
                        }
                        drop(proc_meta);
                    }
                }
            }
            let my_proc_data = my_proc.meta.acquire();
            // No point waiting if we don't have any children. 
            if !have_kids || my_proc_data.killed {
                drop(wait_guard);
                drop(my_proc_data);
                return None
            }
            // 释放锁，否则会死锁
            drop(my_proc_data);
            // Wait for a child to exit.
            my_proc.sleep(
                my_proc as *const _ as usize, 
                wait_guard
            );
            wait_guard = self.wait_lock.acquire();
        }
    }

    /// Kill the process with the given pid. 
    /// The victim won't exit until it tries to return. 
    /// to user space (user_trap)
    pub fn kill(&mut self, pid: usize) -> Result<usize, ()> {
        for proc in self.proc.iter_mut() {
            if proc.pid() == pid {
                proc.set_killed(true);
                if proc.state() == ProcState::SLEEPING {
                    // Wake process from sleep. 
                    proc.set_state(ProcState::RUNNABLE);
                    return Ok(0)
                }
            }
        }
        Err(())
    }

    /// Print a process listing to console. For debugging. 
    /// Runs when user type ^P on console. 
    /// No lock to avoid wedging a stuck machine further
    pub fn proc_dump(&self) {
        for proc in self.proc.iter() {
            if proc.state() == ProcState::UNUSED { continue; }
            else {
                println!("pid: {} state: {:?} name: {}", proc.pid(), proc.state(), proc.name());
            }
        }
    }
}

#[inline]
fn kernel_stack(pos: usize) -> usize {
    TRAMPOLINE - (pos + 1) * 5 * PGSIZE
}
