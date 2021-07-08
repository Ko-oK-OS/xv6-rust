use crate::define::fs::{ NDIRECT, DIRSIZ };

/// On-disk inode structure
#[repr(C)]
pub struct Dinode {
    file_type: u16, // File type
    major: i16, // Major device number (T_REVICE only)
    minor: i16, // Minor device number (T_DEVICE only)
    nlink: i16, // Number of links to inode in file system
    size: usize, // Size of file (bytes)
    addrs: [usize;NDIRECT+1] // Data block addresses
}

pub struct Dirent {
    inum: u16,
    name:[u8;DIRSIZ]
}