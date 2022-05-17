use core::ptr::drop_in_place;
use crate::{lock::spinlock::Spinlock, memory::{ RawPage, PageAllocator }, process::{CPU, CPU_MANAGER, PROC_MANAGER}};

use super::{FileType, VFile};

// use super::File;

const PIPE_SIZE: usize = 512;
#[repr(C)]
pub struct Pipe {
    pub guard: Spinlock<PipeData>
}

#[repr(C)]
#[derive(Clone, Copy)]
pub struct PipeData {
    data: [u8; PIPE_SIZE],
    /// number of bytes read
    read_number: usize, 
    /// number of bytes written
    write_number: usize, 
    /// read fd is still open
    read_open: bool,
    /// write fd is still open
    write_open: bool
}

impl Pipe {
    pub unsafe fn alloc(rf: *mut *mut VFile, wf: *mut *mut VFile) -> Self {
        let pipedata = unsafe{ *PipeData::alloc() }; 
        let mut pipe = Self {
            guard: Spinlock::new(pipedata, "pipe")
        };
        **rf = VFile::init();
        **wf = VFile::init();
        (*(*rf)).ftype = FileType::Pipe;
        (*(*rf)).readable = true;
        (*(*rf)).writeable = false;
        (*(*rf)).pipe = Some(&mut pipe as *mut Pipe);
        (*(*wf)).ftype = FileType::Pipe;
        (*(*wf)).readable = false;
        (*(*wf)).writeable = true;
        (*(*wf)).pipe = Some(&mut pipe as *mut Pipe);

        pipe
    }

    pub fn read(&self, addr: usize, len: usize) -> Result<usize, &'static str> {
        let my_proc = unsafe {
            CPU_MANAGER.myproc().ok_or("Fail to get my process")?
        };

        let mut pipe_guard = self.guard.acquire();
        while pipe_guard.read_number == pipe_guard.write_number && pipe_guard.write_open {
            // Pipe empty
            if my_proc.killed() {
                drop(pipe_guard);
                return Err("pipe read: current process has been killed")
            }
            // pipe read sleep
            
            my_proc.sleep(
                &pipe_guard.read_number as *const _ as usize, 
                pipe_guard
            );
            pipe_guard = self.guard.acquire();
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
            if pipe_guard.read_number == pipe_guard.write_number {
                break;
            }
            let ch = pipe_guard.data[pipe_guard.read_number % PIPE_SIZE];
            pipe_guard.read_number += 1;
            
            let pgt = unsafe { &mut *my_proc.pagetable };
            if pgt.copy_out(addr + i, &ch as *const u8, 1).is_err() {
                break;
            }
            i += 1;
        }

        unsafe{ PROC_MANAGER.wake_up(&pipe_guard.write_number as *const _ as usize) };
        drop(pipe_guard);
        Ok(i)
    }

    pub fn write(&self, addr: usize, len: usize) -> Result<usize, &'static str> {
        
        let my_proc = unsafe {
            CPU_MANAGER.myproc().ok_or("Fail to get current process")?
        };
        println!("$$$");
       
        let mut pipe_guard = self.guard.acquire();
        let mut i = 0;
   
        println!("HAHA");
        while i < len {
            
            if pipe_guard.write_number == pipe_guard.read_number + PIPE_SIZE {
                if !pipe_guard.read_open || my_proc.killed() {
                    drop(pipe_guard);
                    return Err("pipe write: pipe read close or current process has been killed")
                }

                unsafe {
                    PROC_MANAGER.wake_up(&pipe_guard.read_number as *const _ as usize);
                }
                my_proc.sleep(&pipe_guard.write_number as *const _ as usize, pipe_guard);
                pipe_guard = self.guard.acquire();
            } else {
                let mut char: u8 = 0;
                let pgt = unsafe { &mut *my_proc.pagetable };
                if pgt.copy_in(&mut char as *mut u8, addr + i, 1).is_err() {
                    break;
                }
                let write_cursor = pipe_guard.write_number % PIPE_SIZE;
                pipe_guard.data[write_cursor % PIPE_SIZE] = char;
                // println!("{}", char);
                i += 1;
                pipe_guard.write_number += 1;
            }
        }

         

        unsafe {
            PROC_MANAGER.wake_up(&pipe_guard.read_number as *const _ as usize);
        }
        drop(pipe_guard);
        
        Ok(i)
    }

    pub fn close(&self, writeable: bool) {
        let mut pipe_guard = self.guard.acquire();
        
        if writeable {
            pipe_guard.write_open = false;
            unsafe {
                PROC_MANAGER.wake_up(&pipe_guard.read_number as *const _ as usize);
            }
        } else {
            pipe_guard.read_open = false;
            unsafe {
                PROC_MANAGER.wake_up(&pipe_guard.write_number as *const _ as usize);
            }
        }
        
        if !pipe_guard.read_open && !pipe_guard.write_open {
            pipe_guard.free();
            drop(pipe_guard);
        } else {
            drop(pipe_guard);
        }
    }
}

impl PipeData {
    pub fn alloc() -> *mut Self {
        let pipe = unsafe{ RawPage::new_zeroed() as *mut PipeData };
        let pipe = unsafe{ &mut *pipe };
        pipe.read_number = 0;
        pipe.write_number = 0;
        pipe.read_open = true;
        pipe.write_open = true;
        pipe as *mut Self 
    }

    pub fn free(&mut self) {
        unsafe {
            drop_in_place(self as *const _ as *mut RawPage)
        }
    }
}
