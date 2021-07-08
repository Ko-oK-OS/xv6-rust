use crate::define::param::NDEV;
use crate::lock::spinlock::Spinlock;
use crate::lock::sleeplock::SleepLock;
use super::pipe::Pipe;
use super::inode::Inode;
use super::devices::DEVICES;
use super::FILE_TABLE;

use alloc::sync::Arc;
use core::ops::{ Deref, DerefMut };


#[derive(Clone, Copy)]
pub enum FileType {
    None,
    Pipe,
    Inode,
    Device,
    Socket,
}

/// Virtual File, which can abstract struct to dispatch 
/// syscall to specific file.
pub struct VFile {
    pub(crate) file_type: FileType,
    pub(crate) file_ref: usize,
    pub(crate) readable: bool,
    pub(crate) writeable: bool,
    pub(crate) pipe: Option<*mut Pipe>,
    pub(crate) inode: Option<SleepLock<Inode>>,
    pub(crate) off: usize,
    pub(crate) major: i16
}

impl VFile {
    pub(crate) const fn init() -> Self {
        Self{
            file_type: FileType::None,
            file_ref: 0,
            readable: false,
            writeable: false,
            pipe: None,
            inode: None,
            off: 0,
            major: 0
        }
    }

    pub fn read(&self, addr: usize, buf: &mut [u8]) -> Result<usize, &'static str> {
        let r;
        if !self.readable() {
            panic!("File can't be read!")
        }

        match self.file_type {
            FileType::Pipe => {
                r = unsafe{ (&*(self.pipe.unwrap())).read(addr, buf).unwrap() };
                return Ok(r)
            },

            FileType::Device => {
                if self.major < 0 || self.major as usize >= NDEV || unsafe{ DEVICES[self.major as usize].read.is_none() } {
                    return Err("vfs: fail to read device")
                }
                r = unsafe{ DEVICES[self.major as usize].read.unwrap().call((1, addr, buf))} as usize;
                return Ok(r)
            },

            FileType::Inode => {
                panic!("No implement.")
            },

            _ => {
                panic!("Invalid file!")
            },
        }
    }

    pub fn write(&self, addr: usize, buf: &[u8]) -> Result<usize, &'static str> {
        let mut r = 0;
        let mut ret = 0; 
        if !self.writeable() {
            panic!("file can't be written")
        }

        match self.file_type {
            FileType::Pipe => {
                r = unsafe{ (&*(self.pipe.unwrap())).write(addr, buf).unwrap() };
            },

            FileType::Device => {
                if self.major < 0 || self.major as usize>= NDEV || unsafe{ DEVICES[self.major as usize].write.is_none()} {
                    return Err("vfs: fail to write")
                }

                ret = unsafe{ DEVICES[self.major as usize].write.unwrap().call((1, addr, buf)) as usize };
            },

            FileType::Inode => {
                panic!("No implement.")
            },

            _ => {
                panic!("Invalid file type!")
            }
        }

        Ok(ret)
    }

    fn readable(&self) -> bool {
        self.readable
    }

    fn writeable(&self) -> bool {
        self.writeable
    }

    /// Increment ref count for file f
    pub fn dup(&mut self){
        let guard = unsafe{ FILE_TABLE.lock.acquire() };
        if self.file_ref < 1 {
            panic!("vfile dup: no used file.")
        }
        self.file_ref += 1;
        drop(guard);
    }

    /// Close file f(Decrement ref count, close when reaches 0.)
    pub fn close(&mut self) {
        let guard = unsafe{ FILE_TABLE.lock.acquire() };
        if self.file_ref < 1 {
            panic!("vfs close: no used file.")
        }
        self.file_ref -= 1;
        if self.file_ref > 0 {
            drop(guard);
            return 
        }

        // TODO: pipe, inode
    }
}



