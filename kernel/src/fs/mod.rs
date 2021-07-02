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

pub use bio::Buf;
pub use bio::BCACHE;
pub use log::LOG;
pub use file::VFile;
pub use file_table::FILE_TABLE;
pub use inode::Inode;
pub use dinode::Dinode;
pub use superblock::{ SUPER_BLOCK, SuperBlock };

use log::Log;
use bio::{ BufData, BufInner };
use devices::DEVICES;

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
