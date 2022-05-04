use crate::ipc::semaphore::SEM_MANAGER;

use super::*;

//TODO  Type!!!!

impl Syscall<'_>{
    pub fn sys_sem_get(&mut self) -> SysResult{
        println!("sys_sem_get in ipc.rs");
        let id = self.arg(0) as i32;
        let res = unsafe{SEM_MANAGER.get(id)};
        if res >= 0 {
            println!("sys_sem_get res >= 0 in ipc.rs");
            Ok(res as usize)
        }else{
            Err(())
        }
        // let res = SEM_MANAGER.get(id);
        // Ok(res);
    }

    pub fn sys_sem_put(&mut self) -> SysResult{
        println!("sys_sem_put in ipc.rs");
        let id = self.arg(0) as i32;
        let res = unsafe{SEM_MANAGER.put(id) as usize};
        if  res == 0 {
            Ok(res)
        }else{
            Err(())
        }
    }

    pub fn sys_sem_up(&mut self) -> SysResult{
        println!("sys_sem_up in ipc.rs");
        let id = self.arg(0) as i32;
        let semOption = unsafe{SEM_MANAGER.getSemById(id)};
        match semOption{
            Some(sem) => {
                sem.sem_up();
                Ok(0)
            }
            None => Err(())
        }
    }

    pub fn sys_sem_down(&mut self) -> SysResult{
        println!("sys_sem_down in ipc.rs");
        let id = self.arg(0) as i32;
        let semOption = unsafe{SEM_MANAGER.getSemById(id)};
        match semOption{
            Some(sem) => {
                sem.sem_down();
                Ok(0)
            }
            None => Err(())
        }
    }

    pub fn sys_sem_init(&mut self) -> SysResult{
        println!("sys_sem_init in ipc.rs");
        let id = self.arg(0) as i32;
        let cnt = self.arg(1) as i32;
        let semOption = unsafe{SEM_MANAGER.getSemById(id)};
        match semOption{
            Some(sem) => {
                sem.sem_init(cnt);
                // println!("sys_sem_get in ipc.rs");
                Ok(0)
            }
            None => Err(())
        }
    }
}