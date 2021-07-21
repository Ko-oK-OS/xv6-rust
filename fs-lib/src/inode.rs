use super::{ NDIRECT, DIRSIZ };

#[repr(u16)]
#[derive(Clone, Copy, PartialEq, Eq)]
pub enum InodeType {
    Empty = 0,
    File = 1,
    Directory = 2,
    Device = 3
}

/// On-disk inode structure
#[repr(C)]
#[derive(Clone, Copy)]
pub struct DiskInode {
    pub itype: u16, // File type
    pub major: u16, // Major device number (T_REVICE only)
    pub minor: u16, // Minor device number (T_DEVICE only)
    pub nlink: u16, // Number of links to inode in file system
    pub size: u32, // Size of file (bytes)
    pub addrs: [u32; NDIRECT+1] // Data block addresses
}

#[repr(C)]
pub struct DirEntry {
    pub inum: u16,
    pub name:[u8;DIRSIZ]
}

impl DiskInode {
    pub const fn new() -> Self {
        Self {
            itype: 0,
            major: 0,
            minor: 0,
            nlink: 0,
            size: 0,
            addrs: [0; NDIRECT+1]
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