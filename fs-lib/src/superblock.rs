use core::mem::{ MaybeUninit };
use core::sync::atomic::{AtomicBool, Ordering};

use super::{ IPB, BPB };

/// In-memory copy of superblock
#[derive(Debug)]
pub struct SuperBlock {
    data: MaybeUninit<RawSuperBlock>,
    initialized: AtomicBool,
}

unsafe impl Sync for SuperBlock {}

impl SuperBlock {
    pub const fn uninit() -> Self {
        Self {
            data: MaybeUninit::uninit(),
            initialized: AtomicBool::new(false),
        }
    }

    /// Read the info of super block.
    fn read(&self) -> &RawSuperBlock {
        debug_assert!(self.initialized.load(Ordering::Relaxed));
        unsafe {
            self.data.as_ptr().as_ref().unwrap()
        }
    }

    /// Get the info of super block for write. 
    pub fn write(&mut self) -> &mut RawSuperBlock {
        unsafe{
            self.data.as_mut_ptr().as_mut().unwrap()
        }
    }

    /// Load the log info of super block.
    /// Return starting block and usable blocks for log.
    pub fn read_log(&self) -> (u32, u32) {
        let sb = self.read();
        (sb.logstart, sb.nlog)
    }

    /// The total count of blocks in the disk.
    pub fn size(&self) -> u32 {
        let sb = self.read();
        sb.size
    }

    /// The inodestart of blocks
    pub fn inodestart(&self) -> u32 {
        let sb = self.read();
        sb.inodestart
    }

    /// bmapstart
    pub fn bmapstart(&self) -> u32 {
        let sb = self.read();
        sb.bmapstart
    }

    /// Given an inode number. 
    /// Return the blockno of the block this inode resides. 
    /// Panic if the queryed inode out of range. 
    pub fn locate_inode(&self, inum: u32) -> u32 {
        let sb = self.read();
        if inum >= sb.ninodes {
            panic!("query inum {} larger than maximum inode nums {}", inum, sb.ninodes);
        }

        let blockno = (inum / (IPB as u32)) + sb.inodestart;
        blockno
    }

    /// Given a block number in the disk. 
    /// Returns the relevant block number of the (controlling) bitmap block. 
    pub fn bitmap_blockno(&self, blockno: u32) -> u32 {
        let sb = self.read();
        (blockno / BPB as u32) + sb.bmapstart
    }

    
}

/// Raw super block describes the disk layout.
#[repr(C)]
#[derive(Debug, Clone, Copy)]
pub struct RawSuperBlock {
    pub magic: u32,      // Must be FSMAGIC
    pub size: u32,       // Size of file system image (blocks)
    pub nblocks: u32,    // Number of data blocks
    pub ninodes: u32,    // Number of inodes
    pub nlog: u32,       // Number of log blocks
    pub logstart: u32,   // Block number of first log block
    pub inodestart: u32, // Block number of first inode block
    pub bmapstart: u32,  // Block number of first free map block
}
