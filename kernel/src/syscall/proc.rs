use crate::{interrupt::trap::TICKS_LOCK, process::*};
use super::*;

impl Syscall<'_> {
    pub fn fork(&mut self) -> SysResult {
        let child_proc = self.process.fork().expect("Fail to fork process");
        let pmeta = child_proc.meta.acquire();
        let pid = pmeta.pid;
        drop(pmeta);
        Ok(pid)
    }

    pub fn sys_exit(&self) -> SysResult {
        let status = self.arg(0);
        unsafe {
            PROC_MANAGER.exit(status)
        }
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
        let pdata = unsafe{ &*self.process.data.get() };
        let addr = pdata.size;
        drop(pdata);
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
                my_proc.sleep(0, ticks_guard);
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


