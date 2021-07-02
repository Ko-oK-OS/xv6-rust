use crate::define::fs::NDIRECT;

/// In-memory copy of an inode
#[repr(C)]
pub struct Inode {
    dev: usize, // device id
    inum: usize, // Inode number
    file_ref: usize, // Reference count
    vaild: usize, // inode has been read from disk

    file_type: u16, // copy of disk inode
    major: u16,
    minor: u16,
    nlink: u16,
    size: usize,
    addrs: [usize;NDIRECT+1]
}

impl Inode {
    // Read data from inode.
    // Caller must hold ip->lock.
    // If user_dst==1, then dst is a user virtual address;
    // otherwise, dst is a kernel address.
    pub fn read() {

    }

    
}