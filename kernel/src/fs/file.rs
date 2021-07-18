use crate::define::param::NDEV;
use crate::lock::spinlock::Spinlock;
use crate::lock::sleeplock::SleepLock;
use super::pipe::Pipe;
use super::inode::Inode;
use super::devices::DEVICES;
use super::{ FILE_TABLE, LOG };

use alloc::sync::Arc;
use core::{ops::{ Deref, DerefMut }, ptr::NonNull};


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
    pub(crate) ftype: FileType,
    pub(crate) refs: usize,
    pub(crate) readable: bool,
    pub(crate) writeable: bool,
    pub(crate) pipe: Option<NonNull<Pipe>>,
    pub(crate) inode: Option<NonNull<Inode>>,
    pub(crate) offset: u32,
    pub(crate) major: i16
}

impl VFile {
    pub(crate) const fn init() -> Self {
        Self{
            ftype: FileType::None,
            refs: 0,
            readable: false,
            writeable: false,
            pipe: None,
            inode: None,
            offset: 0,
            major: 0
        }
    }

    pub fn read(
        &mut self, 
        addr: usize, 
        len: usize
    ) -> Result<usize, &'static str> {
        let mut r = 0;
        if !self.readable() {
            panic!("File can't be read!")
        }

        match self.ftype {
            FileType::Pipe => {
                r = unsafe{ (self.pipe.unwrap().as_ref()).read(addr, len).unwrap() };
                return Ok(r)
            },

            FileType::Device => {
                if self.major < 0 || self.major as usize >= NDEV || unsafe{ DEVICES[self.major as usize].read.is_none() } {
                    return Err("vfs: fail to read device")
                }
                r = unsafe{ DEVICES[self.major as usize].read.unwrap().call((1, addr, len))} as usize;
                return Ok(r)
            },

            FileType::Inode => {
                let inode = unsafe{ &mut (*self.inode.unwrap().as_ptr()) };
                let mut inode_guard = inode.lock();
                match inode_guard.read(true, addr, self.offset, len as u32) {
                    Ok(_) => {
                        self.offset += r as u32;
                        drop(inode_guard);
                        Ok(r)
                    },
                    Err(err) => {
                        Err(err)
                    }
                }
            },

            _ => {
                panic!("Invalid file!")
            },
        }
    }

    /// Write to file f. 
    /// addr is a user virtual address.
    pub fn write(
        &self, 
        addr: usize, 
        len: usize
    ) -> Result<usize, &'static str> {
        let mut r = 0;
        let mut ret = 0; 
        if !self.writeable() {
            panic!("file can't be written")
        }

        match self.ftype {
            FileType::Pipe => {
                ret = unsafe{ (self.pipe.unwrap().as_ref()).write(addr, len).unwrap() };
            },

            FileType::Device => {
                if self.major < 0 || self.major as usize>= NDEV || unsafe{ DEVICES[self.major as usize].write.is_none()} {
                    return Err("vfs: fail to write")
                }

                ret = unsafe{ DEVICES[self.major as usize].write.unwrap().call((1, addr, len)) as usize };
            },

            FileType::Inode => {
                panic!("No implement.")
                // write a few blocks at a time to avoid exceeding 
                // the maxinum log transaction size, including
                // inode, indirect block, allocation blocks, 
                // and 2 blocks of slop for non-aligned writes. 
                // this really belongs lower down, since inode write
                // might be writing a device like console. 

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
        if self.refs < 1 {
            panic!("vfile dup: no used file.")
        }
        self.refs += 1;
        drop(guard);
    }

    /// Close file f(Decrement ref count, close when reaches 0.)
    pub fn close(&mut self) {
        let guard = unsafe{ FILE_TABLE.lock.acquire() };
        if self.refs < 1 {
            panic!("vfs close: no used file.")
        }
        self.refs -= 1;
        if self.refs > 0 {
            drop(guard);
            return 
        }

        match self.ftype {
            FileType::Pipe => {
                let pipe = unsafe{ &mut (*self.pipe.unwrap().as_ptr()) };
                pipe.close(self.writeable());
            },

            FileType::Inode => {
                let inode = unsafe{ &(*self.inode.unwrap().as_ptr()) };
                LOG.begin_op();
                drop(inode);
            },

            _ => {}
        }
        
        self.refs = 0;
        self.ftype = FileType::None;
        drop(guard);
        
    }
}



