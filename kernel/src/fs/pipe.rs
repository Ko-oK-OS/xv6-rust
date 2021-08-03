use core::intrinsics::drop_in_place;
use crate::{lock::spinlock::Spinlock, memory::RawPage, process::{CPU, CPU_MANAGER, PROC_MANAGER}};

use super::{FILE_TABLE, FileType, VFile};

// use super::File;

const PIPE_SIZE: usize = 512;
#[repr(C)]
pub struct Pipe {
    guard: Spinlock<PipeGuard>
}

#[repr(C)]
#[derive(Clone, Copy)]
struct PipeGuard {
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
    pub fn alloc(rf: &mut &mut VFile, wf: &mut &mut VFile) -> Self {
        let pipe_guard = unsafe{ *PipeGuard::alloc() }; 
        let mut pipe = Self {
            guard: Spinlock::new(pipe_guard, "pipe")
        };

        *rf = unsafe {
            FILE_TABLE.allocate().expect("Fail to allocate file")
        };

        *wf = unsafe {
            FILE_TABLE.allocate().expect("Fail to allocate file")
        };
        rf.ftype = FileType::Pipe;
        rf.readable = true;
        rf.writeable = false;
        rf.pipe = Some(&mut pipe as *mut Pipe);
        wf.ftype = FileType::Pipe;
        wf.readable = false;
        wf.writeable = true;
        wf.pipe = Some(&mut pipe as *mut Pipe);

        pipe
    }

    pub fn read(&self, addr: usize, len: usize) -> Result<usize, &'static str> {
        // let my_proc = unsafe {
        //     CPU_MANAGER.myproc().ok_or("Fail to get my process")?
        // };

        // let pipe_guard = &mut self.guard.acquire();
        // while pipe_guard.read_number == pipe_guard.write_number && pipe_guard.write_open {
        //     // Pipe empty
        //     if my_proc.killed() {
        //         drop(pipe_guard);
        //         return Err("pipe read: current process has been killed")
        //     }
        //     // pipe read sleep
        //     my_proc.sleep(
        //         &pipe_guard.read_number as *const _ as usize, 
        //         pipe_guard
        //     )
        // }

        // let mut i = 0;
        // for index in 0..len {
        //     if pipe_guard.read_number == pipe_guard.write_number { break; }
        //     let read_cursor = pipe_guard.read_number % PIPE_SIZE;
        //     let ch = pipe_guard.data[read_cursor % PIPE_SIZE];
        //     pipe_guard.read_number += 1;
        //     let pgt = my_proc.page_table();
        //     if pgt.copy_out(addr + index, &ch as *const u8, 1).is_err() {
        //         break;
        //     }
        //     i = index;
        // }

        // unsafe{ PROC_MANAGER.wakeup(&pipe_guard.write_number as *const _ as usize) };
        // drop(pipe_guard);
        // Ok(i)
        Ok(0)
    }

    pub fn write(&self, addr: usize, len: usize) -> Result<usize, &'static str> {
        // let my_proc = unsafe {
        //     CPU_MANAGER.myproc().ok_or("Fail to get current process")?
        // };

        // let pipe_guard = &mut self.guard.acquire();
        // let mut i = 0;
        // while i < len {
        //     if !pipe_guard.read_open || my_proc.killed() {
        //         drop(pipe_guard);
        //         return Err("pipe write: pipe read close or current process has been killed")
        //     }

        //     if pipe_guard.write_number == pipe_guard.read_number + PIPE_SIZE {
        //         unsafe {
        //             PROC_MANAGER.wakeup(&pipe_guard.read_number as *const _ as usize);
        //         }
        //         my_proc.sleep(&pipe_guard.write_number as *const _ as usize, pipe_guard);
        //     } else {
        //         let mut char: u8 = 0;
        //         let pgt = my_proc.page_table();
        //         if pgt.copy_in(&mut char as *mut u8, addr + i, 1).is_err() {
        //             break;
        //         }
        //         let write_cursor = pipe_guard.write_number % PIPE_SIZE;
        //         pipe_guard.data[write_cursor % PIPE_SIZE] = char;
        //         i += 1;
        //     }
        // }

        // unsafe {
        //     PROC_MANAGER.wakeup(&pipe_guard.read_number as *const _ as usize);
        // }
        // drop(pipe_guard);

        // Ok(i)
        Ok(0)
    }

    pub fn close(&self, writeable: bool) {
        let mut pipe_guard = self.guard.acquire();
        if writeable {
            pipe_guard.write_open = false;
            unsafe {
                PROC_MANAGER.wakeup(&pipe_guard.read_number as *const _ as usize);
            }
        } else {
            pipe_guard.read_open = false;
            unsafe {
                PROC_MANAGER.wakeup(&pipe_guard.write_number as *const _ as usize);
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

impl PipeGuard {
    fn alloc() -> *mut Self {
        let pipe = unsafe{ RawPage::new_zeroed() as *mut PipeGuard };
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
