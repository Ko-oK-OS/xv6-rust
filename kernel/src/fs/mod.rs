//! File system

use core::ops::DerefMut;

mod log;
mod bio;
mod superblock;
mod file;
mod pipe;
mod inode;
mod dinode;
mod devices;
// mod file_table;
mod stat;
mod bitmap;

pub use bio::Buf;
pub use bio::BCACHE;
pub use log::LOG;
pub use file::{ VFile, FileType };
pub use inode::{ Inode, InodeData, ICACHE };
pub use dinode::{ DiskInode, DirEntry, InodeType };
pub use superblock::{ SUPER_BLOCK, SuperBlock };
pub use devices::DEVICE_LIST;
pub use pipe::Pipe;
// pub use pipe::PipeData;

use log::Log;
use bio::BufData;


use crate::arch::riscv::qemu::fs::DIRSIZ;
use crate::lock::sleeplock::SleepLockGuard;

/// Init fs.
/// Read super block info.
/// Init log info and recover if necessary.
pub unsafe fn init(dev: u32) {
    SUPER_BLOCK.init(dev);
    let log_ptr = LOG.acquire().deref_mut() as *mut Log;
    log_ptr.as_mut().unwrap().init(dev);
    println!("file system: setup done");
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
