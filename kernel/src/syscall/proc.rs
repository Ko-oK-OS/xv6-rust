use crate::trap::TICKS_LOCK;
use super::*;

impl Syscall<'_> {
    /// Shut down the emulated machine at the request of a user program.
    pub fn sys_shutdown(&self) -> SysResult {
        // Reuse the kernel's existing S-mode environment call so user space
        // cannot write the QEMU virt-test MMIO device directly.
        crate::shutdown::shutdown();
        Ok(0)
    }

    pub fn sys_fork(&mut self) -> SysResult {
        let proc_meta = self.process.meta.acquire();
        drop(proc_meta);
        let child_proc = self.process.fork().ok_or(())?;
        let pmeta = child_proc.meta.acquire();
        let pid = pmeta.pid;
        drop(pmeta);
        Ok(pid)
    }

    pub fn sys_exit(&self) -> SysResult {
        let status = self.arg(0);
        unsafe {
            // exit() from a secondary thread must not close the descriptor
            // table or turn the complete process into a zombie.
            if self.process.is_user_thread() {
                PROC_MANAGER.thread_exit(status)
            } else {
                PROC_MANAGER.exit(status)
            }
        }
    }

    pub fn sys_thread_clone(&mut self) -> SysResult {
        let entry = self.arg(0);
        let arg = self.arg(1);
        let stack = self.arg(2);
        let return_pc = self.arg(3);
        unsafe {
            PROC_MANAGER
                .create_user_thread(self.process, entry, arg, stack, return_pc)
                .map_err(|_| ())
        }
    }

    pub fn sys_thread_join(&self) -> SysResult {
        let tid = self.arg(0);
        let status_addr = self.arg(1);
        unsafe { PROC_MANAGER.join_user_thread(tid, status_addr).ok_or(()) }
    }

    pub fn sys_thread_exit(&self) -> SysResult {
        let status = self.arg(0);
        unsafe { PROC_MANAGER.thread_exit(status) }
    }

    pub fn sys_wait(&self) -> SysResult {
        let addr = self.arg(0);
        match unsafe {
            PROC_MANAGER.wait(addr)
        } {
            Some(pid) => {
                Ok(pid)
            },
    
            None => {
                Err(())
            }
        }
    }

    pub fn sys_getpid(&self) -> SysResult {
        let pmeta = self.process.meta.acquire();
        let pid = pmeta.pid;
        drop(pmeta);
        Ok(pid)
    }
    
    
    pub fn sys_sbrk(&mut self) -> SysResult {
        let size = self.arg(0);
        let address_space = unsafe { (&*self.process.data.get())
            .address_space.as_ref().unwrap().clone() };
        let addr = address_space.acquire().size;
        match self.process.grow_proc(size as isize) {
            Ok(()) => {
                return Ok(addr)
            }
    
            Err(err) => {
                panic!("err: {:?}", err);
            }
        }
    }
    
    
    
    pub fn sys_sleep(&self) -> SysResult {
        let time_span = self.arg(0);

        let mut ticks_guard = unsafe {
            TICKS_LOCK.acquire()
        };
        let now_time = *ticks_guard;
        let mut cur_time = *ticks_guard;
        while cur_time - now_time < time_span {
            let my_proc = unsafe {
                CPU_MANAGER.myproc().expect("Fail to get my procsss")
            };
            if my_proc.killed() {
                drop(ticks_guard);           
                return Err(())
            } else {
                // Sleep on the ticks object itself so clock_intr can wake only
                // timer waiters instead of using the ambiguous channel zero.
                my_proc.sleep(
                    core::ptr::addr_of!(TICKS_LOCK) as usize,
                    ticks_guard
                );
                ticks_guard = unsafe {
                    TICKS_LOCK.acquire()
                }
            }
            cur_time = *ticks_guard;
        }
        drop(ticks_guard);
        Ok(0)
    }
    
    
    pub fn sys_kill(&self) -> SysResult {
        let pid = self.arg(0);
        unsafe {
            PROC_MANAGER.kill(pid)
        }
    }
    
}
