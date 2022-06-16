use core::ptr::drop_in_place;
use crate::{lock::spinlock::Spinlock, memory::{ RawPage, PageAllocator }, process::{CPU, CPU_MANAGER, PROC_MANAGER}};

use super::{FileType, VFile};

// use super::File;

const PIPE_SIZE: usize = 512;
#[repr(C)]
pub struct Pipe {
    data: [u8; PIPE_SIZE],
  
    nread: usize, 

    nwrite: usize, 
 
    read_open: bool,

    write_open: bool,

    pub pipe_lock: Spinlock<()>
}

// #[repr(C)]
// #[derive(Clone, Copy)]
// pub struct PipeData {
//     data: [u8; PIPE_SIZE],
//     /// number of bytes read
//     read_number: usize, 
//     /// number of bytes written
//     write_number: usize, 
//     /// read fd is still open
//     read_open: bool,
//     /// write fd is still open
//     write_open: bool
// }

impl Pipe {
    pub fn init() -> *mut Pipe{
        let pipe_ptr = unsafe{ RawPage::new_zeroed() as *mut Pipe };
        let pipe = unsafe { &mut *pipe_ptr };
        pipe.read_open = true;
        pipe.write_open = true;
        pipe.nread = 0;
        pipe.nwrite = 0;
        pipe.pipe_lock = Spinlock::new((), "pipelock");

        pipe_ptr
    }

    pub unsafe fn alloc(rf: *mut *mut VFile, wf: *mut *mut VFile) -> *mut Pipe {
        let pipe_ptr = unsafe{ RawPage::new_zeroed() as *mut Pipe };

        // let pipedata = unsafe{ *PipeData::alloc() }; 
        // let mut pipe = Self {
        //     pipe: PipeData::alloc(),
        //     pipe_lock: Spinlock::new((), "pipe")
        // };

        let pipe = &mut *pipe_ptr;
        pipe.read_open = true;
        pipe.write_open = true;
        pipe.nread = 0;
        pipe.nwrite = 0;
        pipe.pipe_lock = Spinlock::new((), "pipelock");

        **rf = VFile::init();
        **wf = VFile::init();
        (*(*rf)).ftype = FileType::Pipe;
        (*(*rf)).readable = true;
        (*(*rf)).writeable = false;
        (*(*rf)).pipe = Some(pipe as *mut Pipe);
        (*(*wf)).ftype = FileType::Pipe;
        (*(*wf)).readable = false;
        (*(*wf)).writeable = true;
        (*(*wf)).pipe = Some(pipe as *mut Pipe);

        pipe_ptr
    }

    pub fn read(&mut self, addr: usize, len: usize) -> Result<usize, &'static str> {
        let my_proc = unsafe {
            CPU_MANAGER.myproc().ok_or("Fail to get my process")?
        };

        let mut guard = self.pipe_lock.acquire();
        // let pipe = unsafe { &mut *self.pipe };
        while self.nread == self.nwrite && self.write_open {
            // Pipe empty
            if my_proc.killed() {
                drop(guard);
                return Err("pipe read: current process has been killed")
            }
            // pipe read sleep
            
            my_proc.sleep(
                &self.nread as *const _ as usize, 
                guard
            );
            guard = self.pipe_lock.acquire();
        }

        // let mut i = 0;
        // for index in 0..len {
        //     if pipe_guard.read_number == pipe_guard.write_number { break; }
        //     let read_cursor = pipe_guard.read_number % PIPE_SIZE;
        //     let ch = pipe_guard.data[read_cursor % PIPE_SIZE];
        //     pipe_guard.read_number += 1;
        //     let pgt = unsafe { &mut *my_proc.pagetable };
        //     if pgt.copy_out(addr + index, &ch as *const u8, 1).is_err() {
        //         break;
        //     }
        //     i = index;
        //     // pipe_guard.read_number += 1;

        // }


        let mut i = 0;
        while i < len {
            if self.nread == self.nwrite {
                break;
            }
            let ch = self.data[self.nread % PIPE_SIZE];
            self.nread += 1;
            
            let pgt = unsafe { &mut *my_proc.pagetable };
            if pgt.copy_out(addr + i, &ch as *const u8, 1).is_err() {
                break;
            }
            i += 1;
        }

        unsafe{ PROC_MANAGER.wake_up(&self.nwrite as *const _ as usize) };
        drop(guard);
        Ok(i)
    }

    pub fn write(&mut self, addr: usize, len: usize) -> Result<usize, &'static str> {
        
        let my_proc = unsafe {
            CPU_MANAGER.myproc().ok_or("Fail to get current process")?
        };
        // println!("$$$");
       
        let mut guard = self.pipe_lock.acquire();
        // let pipe = unsafe { &mut *self.pipe };
        let mut i = 0;
        
        while i < len {
            // println!("#{}", i);
            if !self.read_open || my_proc.killed() {
                drop(guard);
                return Err("pipe write: pipe read close or current process has been killed")
            }
            // println!("HEHE");
           
            if self.nwrite == self.nread + PIPE_SIZE {
                
                
                unsafe {
                    PROC_MANAGER.wake_up(&self.nread as *const _ as usize);
                }
                my_proc.sleep(&self.nwrite as *const _ as usize, guard);
                guard = self.pipe_lock.acquire();
            } else {
           
                let mut char: u8 = 0;
                let pgt = unsafe { &mut *my_proc.pagetable };
                if pgt.copy_in(&mut char as *mut u8, addr + i, 1).is_err() {
                    break;
                }
                let write_cursor = self.nwrite % PIPE_SIZE;
                self.data[write_cursor] = char;
                
                self.nwrite += 1;
                i += 1;
            }
        }

         

        unsafe {
            PROC_MANAGER.wake_up(&self.nread as *const _ as usize);
        }
        drop(guard);
        
        Ok(i)
    }

    pub fn close(&mut self, writeable: bool) {
        let guard = self.pipe_lock.acquire();
        // let self = unsafe { &mut *self.self };
        if writeable {
            self.write_open = false;
            unsafe {
                PROC_MANAGER.wake_up(&self.nread as *const _ as usize);
            }
        } else {
            self.read_open = false;
            unsafe {
                PROC_MANAGER.wake_up(&self.nwrite as *const _ as usize);
            }
        }
        
        if !self.read_open && !self.write_open {
            drop(guard);
            drop(self);
        } else {
            drop(guard);
        }
    }
}

// impl PipeData {
//     pub fn alloc() -> *mut Self {
//         let pipe = unsafe{ RawPage::new_zeroed() as *mut PipeData };
//         let pipe = unsafe{ &mut *pipe };
//         pipe.read_number = 0;
//         pipe.write_number = 0;
//         pipe.read_open = true;
//         pipe.write_open = true;
//         pipe as *mut Self 
//     }

//     pub fn free(&mut self) {
//         unsafe {
//             drop_in_place(self as *const _ as *mut RawPage)
//         }
//     }
// }
