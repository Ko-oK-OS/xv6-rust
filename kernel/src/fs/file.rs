use crate::define::fs::{ BSIZE, MAXOPBLOCKS };
use crate::define::param::NDEV;
use crate::lock::spinlock::Spinlock;
use crate::lock::sleeplock::SleepLock;
use crate::process::CPU_MANAGER;
use super::pipe::Pipe;
use super::inode::Inode;
use super::devices::DEVICES;
use super::stat::Stat;
use super::{ FILE_TABLE, LOG };

use core::mem::size_of;
use core::ptr::NonNull;


#[derive(Clone, Copy)]
#[repr(u16)]
pub enum FileType {
    None = 0,
    Pipe = 1,
    Inode = 2,
    Device = 3,
    Socket = 4,
}

/// Virtual File, which can abstract struct to dispatch 
/// syscall to specific file.
pub struct VFile {
    pub(crate) index: usize,
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
            index: 0,
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
        &mut self, 
        addr: usize, 
        len: usize
    ) -> Result<usize, &'static str> {
        let mut ret = 0; 
        if !self.writeable() {
            panic!("file can't be written")
        }

        match self.ftype {
            FileType::Pipe => {
                ret = unsafe{ (self.pipe.unwrap().as_ref()).write(addr, len).unwrap() };
                Ok(ret)
            },

            FileType::Device => {
                if self.major < 0 || self.major as usize >= NDEV || unsafe{ DEVICES[self.major as usize].write.is_none()} {
                    return Err("vfs: fail to write")
                }

                ret = unsafe{ DEVICES[self.major as usize].write.unwrap().call((1, addr, len)) as usize };
                Ok(ret)
            },

            FileType::Inode => {
                // write a few blocks at a time to avoid exceeding 
                // the maxinum log transaction size, including
                // inode, indirect block, allocation blocks, 
                // and 2 blocks of slop for non-aligned writes. 
                // this really belongs lower down, since inode write
                // might be writing a device like console. 
                let max = ((MAXOPBLOCKS -1 -1 -2) / 2) * BSIZE;
                let mut count  = 0;
                while count < len {
                    let mut write_bytes = len - count;
                    if write_bytes > max { write_bytes = max; }

                    // start log
                    LOG.begin_op();
                    let inode = unsafe{ &mut (*self.inode.unwrap().as_ptr()) };
                    let mut inode_guard = inode.lock();

                    // return err when failt to write
                    inode_guard.write(true, addr + count, self.offset, write_bytes as u32)?;

                    // release sleeplock
                    drop(inode_guard);
                    // end log
                    LOG.end_op();

                    // update loop data
                    self.offset += write_bytes as u32;
                    count += write_bytes;
                    
                }
                ret = count;
                Ok(ret)
            },

            _ => {
                panic!("Invalid file type!")
            }
        }

    }

    fn readable(&self) -> bool {
        self.readable
    }

    fn writeable(&self) -> bool {
        self.writeable
    }

    /// Increment ref count for file f
    pub fn dup(&mut self) {
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

    /// Get metadata about file f. 
    /// addr is a user virtual address, pointing to a struct stat. 
    pub fn stat(&self, addr: usize) -> Result<(), &'static str> {
        let p = unsafe{ CPU_MANAGER.myproc().unwrap() };
        let mut stat: Stat = Stat::new();
        match self.ftype {
            FileType::Device | FileType::Inode => {
                let inode = unsafe{ &mut (*self.inode.unwrap().as_ptr()) };
                let inode_guard = inode.lock();
                inode_guard.stat(&mut stat);
                drop(inode_guard);

                let extern_data = p.extern_data.get_mut();
                let page_table = extern_data.pagetable.as_mut().unwrap();
                page_table.copy_out(addr, (&stat) as *const Stat as *const u8, size_of::<Stat>())?;
                Ok(())
            },  

            _ => {
                Err("")
            }
        }
    }
}

// impl Clone for VFile {
//     fn clone(&self) -> Self {
//         self.dup();
//         Self {
//             index: self.index,
//             ftype: self.ftype,
//             refs: self.refs,
//             readable: self.readable,
//             writeable: self.writeable,
//             pipe: self.pipe,
//             inode: self.inode,
//             offset: self.offset,
//             major: self.major
//         }
//     }
// }



