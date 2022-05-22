use crate::{trap::TICKS_LOCK, memory::page_round_up};
use super::*;

impl Syscall<'_> {
    pub fn sys_fork(&mut self) -> SysResult {
       
        let child_proc = self.process.fork().ok_or(())?;
       
        let pid = child_proc.pid;
       
        Ok(pid)
    }

    pub fn sys_clone(&mut self) -> SysResult {
        let func = self.arg(0);
       
        let ustack = self.arg(1);

        let ret = self.process.threadclone(func, ustack);

        let task = unsafe { CPU_MANAGER.myproc().unwrap() };
        let tf = unsafe { &mut *task.trapframe } ;
        println!("In sys_clone, pid {} epc {}", task.pid, tf.epc);
        Ok(ret)
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

    pub fn sys_join(&self) -> SysResult {
        let ustack_addr = self.arg(0);
        match unsafe {
            PROC_MANAGER.join(ustack_addr)
        } {
            Some(ret) => {
                Ok(ret)
            },
    
            None => {
                Err(())
            }
        }
    }

    pub fn sys_getpid(&self) -> SysResult {
        let task = unsafe { CPU_MANAGER.myproc().unwrap() };
        let pid = task.pid;

        Ok(pid)
    }
    
    
    pub fn sys_sbrk(&mut self) -> SysResult {
        let size = self.arg(0);

        let task = unsafe{ &mut *self.process };
        let addr = task.size;
     
        match self.process.grow_proc(size as isize) {
            Ok(()) => {
                return Ok(addr)
            }
    
            Err(err) => {
                panic!("err: {:?}", err);
            }
        }


        //TODO  Lazy allocation

        // task.size += page_round_up(size);

        // Ok(0)
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


