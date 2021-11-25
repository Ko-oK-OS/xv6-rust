use core::ptr;

use crate::define::fs::{ NDIRECT, DIRSIZ };

#[repr(u16)]
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum InodeType {
    Empty = 0,
    Directory = 1,
    File = 2,
    Device = 3
}

/// On-disk inode structure
#[repr(C)]
#[derive(Clone, Copy, Debug)]
pub struct DiskInode {
    pub itype: InodeType, // File type
    pub major: i16, // Major device number (T_REVICE only)
    pub minor: i16, // Minor device number (T_DEVICE only)
    pub nlink: i16, // Number of links to inode in file system
    pub size: u32, // Size of file (bytes)
    pub addrs: [u32; NDIRECT+1] // Data block addresses
}

pub struct DirEntry {
    pub inum: u16,
    pub name:[u8;DIRSIZ]
}

impl DiskInode {
    pub const fn new() -> Self {
        Self {
            itype: InodeType::Empty,
            major: 0,
            minor: 0,
            nlink: 0,
            size: 0,
            addrs: [0; NDIRECT+1]
        }
    }

    pub fn try_alloc(&mut self, itype: InodeType) -> Result<(), ()> {
        if self.itype == InodeType::Empty {
            unsafe { ptr::write_bytes(self, 0, 1); }
            self.itype = itype;
            Ok(())
        } else {
            Err(())
        }
    }
}

impl DirEntry {
    pub const fn new() -> Self {
        Self {
            inum: 0,
            name: [0;DIRSIZ]
        }
    }
}