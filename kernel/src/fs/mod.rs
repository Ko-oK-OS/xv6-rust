//! File system

use core::ops::DerefMut;

mod log;
mod bio;
mod superblock;
mod file;
mod pipe;
mod stdio;
mod inode;
mod dinode;
mod devices;
mod file_table;
mod ramdisk;
mod stat;
mod bitmap;

pub use bio::Buf;
pub use bio::BCACHE;
pub use log::LOG;
pub use file::{ VFile, FileType };
pub use file_table::FILE_TABLE;
pub use inode::{ Inode, InodeData, ICACHE };
pub use dinode::{ DiskInode, DirEntry, InodeType };
pub use superblock::{ SUPER_BLOCK, SuperBlock };
pub use devices::DEVICE_LIST;

use log::Log;
use bio::BufData;


use crate::define::fs::DIRSIZ;
use crate::lock::sleeplock::SleepLockGuard;

// pub trait File: Send + Sync {
//     fn read(&self, addr: usize, buf: &mut [u8]) -> Result<usize, &'static str>;
//     fn write(&self, addr: usize, buf: &[u8]) -> Result <usize, &'static str>;
//     fn readable(&self) -> bool;
//     fn writeable(&self) -> bool;
// }

/// Init fs.
/// Read super block info.
/// Init log info and recover if necessary.
pub unsafe fn init(dev: u32) {
    SUPER_BLOCK.init(dev);
    let log_ptr = LOG.acquire().deref_mut() as *mut Log;
    log_ptr.as_mut().unwrap().init(dev);
    println!("file system: setup done");
}

pub fn create(
    path: &[u8],
    itype: InodeType,
    major: i16,
    minor: i16
) -> Result<Inode, &'static str> {
    let mut name = [0;DIRSIZ];
    let dirinode = ICACHE.namei_parent(path, &mut name).unwrap();
    let mut dirinode_guard = dirinode.lock();
    
    match dirinode_guard.dir_lookup(&name) {
        Some(inode) => {
            drop(dirinode_guard);
            let inode_guard = inode.lock();
            match inode_guard.dinode.itype {
                InodeType::Device | InodeType::File => {
                    if itype == InodeType::File {
                        drop(inode_guard);
                        return Ok(inode)
                    }
                    return Err("create: unmatched type.");
                },

                _ => {
                    return Err("create: unmatched type.")
                }
            }
        },

        None => {}
    }
    // Allocate a new inode to create file
    let inode = ICACHE.alloc(dirinode.dev, itype).unwrap();
    
    let mut inode_guard = inode.lock();
    // initialize new allocated inode
    inode_guard.dinode.major = major;
    inode_guard.dinode.minor = minor;
    inode_guard.dinode.nlink = 1;
    // Write back to disk
    inode_guard.update(&inode);

    // Directory, create .. 
    if itype == InodeType::Directory {
        // Create . and .. entries. 
        inode_guard.dinode.nlink += 1;
        inode_guard.update(&inode);
        // No nlink++ for . to avoid recycle ref count. 
        inode_guard.dir_link(".".as_bytes(), inode.inum)?;
        inode_guard.dir_link("..".as_bytes(), dirinode_guard.inum)?;
    }
    dirinode_guard.dir_link(&name, inode_guard.inum)?;
    drop(inode_guard);
    Ok(inode)
}

#[cfg(test)]
mod test {
    use super::bio::Bcache;

    pub fn read_disk() {
        let block_cache = Bcache::new();
        block_cache.init();
        // read superblock
        block_cache.bread(0, 0);
    }
}
