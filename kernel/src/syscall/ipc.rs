use crate::ipc::semaphore::SEM_MANAGER;
// use crate::ipc::fifo::FIFO_MANAGER;
use crate::ipc::fifo::*;
use crate::{arch::riscv::qemu::{fs::OpenMode, param::MAXPATH}, fs::{FileType, ICACHE, Inode, InodeData, InodeType, LOG, VFile}, lock::sleeplock::{SleepLock, SleepLockGuard}};

use super::*;

//TODO  Type!!!!

impl Syscall<'_>{


    /**Semaphore */
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


   
    // pub fn sys_mkfifo(&self) -> SysResult {
    //     let mut name: [u8; NAME_LEN] = [0;NAME_LEN];
    //     let addr = self.arg(0);
    //     self.copy_from_str(addr, &mut name, NAME_LEN).unwrap();

    //     // let mode = self.arg(1);

    //     // let mut rf: &mut VFile = &mut VFile::init();
    //     // let mut wf: &mut VFile = &mut VFile::init();

    //     // Fifo_t::alloc(&mut rf, &mut wf, name);

    //     let fifo_opt = unsafe{FIFO_MANAGER.alloc(name)};
    //     match fifo_opt {
    //         Some(i) => {
    //             println!("In sys_mkfifo, {} {} {} {}", name[0], name[1], name[2], name[3]);
    //             Ok(0)
    //         }

    //         None => {
    //             Err(())
    //         }
    //     } 

    // }
    
    // // to_do   fd
    // pub fn sys_fifo_get(&self) -> SysResult{
    //     let mut name: [u8; NAME_LEN] = [0;NAME_LEN];
    //     let addr = self.arg(0);
    //     self.copy_from_str(addr, &mut name, NAME_LEN).unwrap();

    //     let fifo_opt = unsafe{FIFO_MANAGER.get(name)};
    //     match fifo_opt {
    //         Some(i) => {
    //             println!("In sys_fifo_get, {} {} {} {}", name[0], name[1], name[2], name[3]);
    //             Ok(0)
    //         }

    //         None => {
    //             Err(())
    //         }
    //     } 
    // }

    // pub fn sys_fifo_put(&self) -> SysResult{
    //     let mut name: [u8; NAME_LEN] = [0;NAME_LEN];
    //     let addr = self.arg(0);
    //     self.copy_from_str(addr, &mut name, NAME_LEN).unwrap();

    //     let fifo_opt = unsafe{FIFO_MANAGER.put(name)};
    //     match fifo_opt {
    //         Some(i) => {
    //             println!("In sys_fifo_put, {} {} {} {}", name[0], name[1], name[2], name[3]);
    //             Ok(0)
    //         }

    //         None => {
    //             Err(())
    //         }
    //     } 
    // }

    // pub fn sys_fifo_read(&self) -> SysResult{
    //     let mut name: [u8; NAME_LEN] = [0;NAME_LEN];
    //     let addr = self.arg(0);
    //     self.copy_from_str(addr, &mut name, NAME_LEN).unwrap();

    //     let fifo_opt = unsafe{FIFO_MANAGER.get(name)};

    //     let ptr = self.arg(1);
    //     let len = self.arg(2);

    //     println!("the ptr is {}, the len is {}", ptr, len);
    //     match fifo_opt {
    //         Some(fifo) => {
    //             fifo.read(ptr, len);    //to_do
    //             println!("In sys_fifo_read, the name is {} {} {} {}", name[0], name[1], name[2], name[3]);
    //             Ok(0)
    //         }

    //         None => {
    //             Err(())
    //         }
    //     } 
    // }

    // pub fn sys_fifo_write(&self) -> SysResult {
    //     let mut name: [u8; NAME_LEN] = [0;NAME_LEN];
    //     let addr = self.arg(0);
    //     self.copy_from_str(addr, &mut name, NAME_LEN).unwrap();

    //     let fifo_opt = unsafe{FIFO_MANAGER.get(name)};

    //     let ptr = self.arg(1);
    //     let len = self.arg(2);

    //     // let mut char: [u8; 1] = [0; 1];
    //     // self.copy_from_str(ptr, &mut char, 1);
    //     // println!("The first is {}", char[0]);

    //     println!("the ptr is {}, the len is {}", ptr, len);

    //     match fifo_opt {
    //         Some(fifo) => {
    //             fifo.write(ptr, len);    //to_do
    //             println!("In sys_fifo_write, finished, the name is {} {} {} {}", name[0], name[1], name[2], name[3]);
    //             Ok(0)
    //         }

    //         None => {
    //             Err(())
    //         }
    //     } 
    // }


}