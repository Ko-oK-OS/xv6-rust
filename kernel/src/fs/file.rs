use crate::define::param::NDEV;
use crate::lock::spinlock::Spinlock;
use crate::lock::sleeplock::SleepLock;
// use super::File;
use super::pipe::Pipe;
use super::inode::Inode;
use super::devices::DEVICES;


pub enum FileType {
    None,
    Pipe,
    Inode,
    Device,
    Socket,
}

/// Virtual File System, which can abstract struct to dispatch 
/// syscall to specific file. 
pub struct VFS {
    file_type: FileType,
    file_ref: usize,
    readable: bool,
    writeable: bool,
    pipe: Option<*mut Pipe>,
    inode: Option<SleepLock<Inode>>,
    off: usize,
    major: u16
}

impl VFS {
    pub const fn init() -> VFS {
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

    fn read(&self, addr: usize, buf: &mut [u8]) -> Result<usize, &'static str> {
        let r;
        if !self.readable() {
            return Err("vfs: file not be read.")
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
                Err("No implement")
            },

            _ => {
                return Err("vfs: fail to read")
            },
        }
    }

    fn write(&self, addr: usize, buf: &[u8]) -> Result<usize, &'static str> {
        let mut r = 0;
        let mut ret = 0; 
        if !self.writeable() {
            return Err("vfs: file not be written")
        }

        match self.file_type {
            FileType::Pipe => {
                r = unsafe{ (&*(self.pipe.unwrap())).write(addr, buf).unwrap() };
            },

            FileType::Device => {

            },

            FileType::Inode => {

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
}

