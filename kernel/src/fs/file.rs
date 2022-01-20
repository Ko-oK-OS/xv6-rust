use crate::arch::riscv::qemu::fs::{ BSIZE, MAXOPBLOCKS };
use crate::arch::riscv::qemu::param::NDEV;
use crate::lock::spinlock::Spinlock;
use crate::lock::sleeplock::SleepLock;
use crate::process::CPU_MANAGER;
use super::pipe::Pipe;
use super::inode::Inode;
use super::devices::DEVICE_LIST;
use super::stat::Stat;
// use super::{ FILE_TABLE, LOG };
use super::LOG;

use core::mem::size_of;
use core::ptr::NonNull;


#[derive(Clone, Copy, Debug, PartialEq)]
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
#[derive(Clone, Debug)]
pub struct VFile {
    pub(crate) ftype: FileType,
    pub(crate) readable: bool,
    pub(crate) writeable: bool,
    pub(crate) pipe: Option<*mut Pipe>,
    pub(crate) inode: Option<Inode>,
    pub(crate) offset: u32,
    pub(crate) major: i16
}

impl VFile {
    pub(crate) const fn init() -> Self {
        Self{
            ftype: FileType::None,
            readable: false,
            writeable: false,
            pipe: None,
            inode: None,
            offset: 0,
            major: 0
        }
    }

    pub fn read(
        &self, 
        addr: usize, 
        len: usize
    ) -> Result<usize, &'static str> {
        let mut ret = 0;
        if !self.readable() {
            panic!("File can't be read!")
        }

        match self.ftype {
            FileType::Pipe => {
                let pipe = unsafe{ &*self.pipe.unwrap() };
                ret = pipe.read(addr, len)?;
                return Ok(ret)
            },

            FileType::Device => {
                if self.major < 0 || 
                self.major as usize >= NDEV || 
                unsafe{ DEVICE_LIST.table[self.major as usize].read as usize == 0 }{
                    return Err("[Error] vfs: Fail to read device")
                }
                let read = unsafe { 
                    DEVICE_LIST.table[self.major as usize].read()
                };               
                ret = read(true, addr, len).ok_or("Fail to read device")?;
                return Ok(ret)
            },

            FileType::Inode => {
                let inode = self.inode.as_ref().unwrap();
                let mut inode_guard = inode.lock();
                match inode_guard.read(true, addr, self.offset, len as u32) {
                    Ok(_) => {
                        let offset = unsafe { &mut *(&self.offset as *const _ as *mut u32)};
                        *offset += ret as u32;
                        drop(inode_guard);
                        Ok(ret)
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
        let ret; 
        if !self.writeable() {
            panic!("file can't be written")
        }
        
        match self.ftype {
            FileType::Pipe => {
                let pipe = unsafe{ &*self.pipe.unwrap() };
                ret = pipe.write(addr, len)?;
                Ok(ret)
            },

            FileType::Device => {
                if self.major < 0 || 
                self.major as usize >= NDEV || 
                unsafe{ DEVICE_LIST.table[self.major as usize].write as usize == 0 } {
                    return Err("Fail to write to device")
                }

                let write = unsafe{ 
                    DEVICE_LIST.table[self.major as usize].write()
                };
                ret = write(true, addr, len).ok_or("Fail to write device")?;
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
                    let inode = self.inode.as_ref().unwrap();
                    let mut inode_guard = inode.lock();

                    // return err when failt to write
                    inode_guard.write(true, addr + count, self.offset, write_bytes as u32)?;

                    // release sleeplock
                    drop(inode_guard);
                    // end log
                    LOG.end_op();

                    // update loop data
                    // self.offset += write_bytes as u32;
                    let offset = unsafe{ &mut *(&self.offset as *const _ as *mut u32) };
                    *offset += write_bytes as u32;
                    count += write_bytes;
                    
                }
                ret = count;
                Ok(ret)
            },

            _ => {
                panic!("Invalid File Type!")
            }
        }

    }

    fn readable(&self) -> bool {
        self.readable
    }

    fn writeable(&self) -> bool {
        self.writeable
    }

    /// Get metadata about file f. 
    /// addr is a user virtual address, pointing to a struct stat. 
    pub fn stat(&self, addr: usize) -> Result<(), &'static str> {
        let p = unsafe{ CPU_MANAGER.myproc().unwrap() };
        let mut stat: Stat = Stat::new();
        match self.ftype {
            FileType::Device | FileType::Inode => {
                let inode = self.inode.as_ref().unwrap();
                
                #[cfg(feature = "debug")]
                println!("[Kernel] stat: inode index: {}, dev: {}, inum: {}", inode.index, inode.dev, inode.inum);

                let inode_guard = inode.lock();
                inode_guard.stat(&mut stat);
                drop(inode_guard);

                let pdata = p.data.get_mut();
                let page_table = pdata.pagetable.as_mut().unwrap();
                page_table.copy_out(addr, (&stat) as *const Stat as *const u8, size_of::<Stat>())?;
                Ok(())
            },  

            _ => {
                Err("")
            }
        }
    }
}





