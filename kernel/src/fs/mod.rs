//! File system

use core::ops::DerefMut;

mod log;
mod bio;
mod superblock;

pub use bio::Buf;
pub use bio::BCACHE;
pub use log::LOG;

use superblock::SUPER_BLOCK;
use log::Log;
use bio::BufData;

/// Init fs.
/// Read super block info.
/// Init log info and recover if necessary.
pub unsafe fn init(dev: u32) {
    SUPER_BLOCK.init(dev);
    let log_ptr = LOG.acquire().deref_mut() as *mut Log;
    log_ptr.as_mut().unwrap().init(dev);
    println!("file system: setup done");
}
