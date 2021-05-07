//! Super block operations

use core::ptr;
use core::mem::{self, MaybeUninit};
use core::sync::atomic::{AtomicBool, Ordering};

use crate::define::fs::FSMAGIC;
use super::{BCACHE, BufData};

pub static mut SUPER_BLOCK: SuperBlock = SuperBlock::uninit();

/// In-memory copy of superblock
#[derive(Debug)]
pub struct SuperBlock {
    data: MaybeUninit<RawSuperBlock>,
    initialized: AtomicBool,
}

unsafe impl Sync for SuperBlock {}

impl SuperBlock {
    const fn uninit() -> Self {
        Self {
            data: MaybeUninit::uninit(),
            initialized: AtomicBool::new(false),
        }
    }

    /// Read and init the super block from disk into memory.
    /// SAFETY: it should only be called by the first regular process alone.
    pub unsafe fn init(&mut self, dev: u32) {
        debug_assert_eq!(mem::align_of::<BufData>() % mem::align_of::<RawSuperBlock>(), 0);
        if self.initialized.load(Ordering::Relaxed) {
            return
        }

        let buf = BCACHE.bread(dev, 1);
        ptr::copy_nonoverlapping(
            buf.raw_data() as *const RawSuperBlock,
            self.data.as_mut_ptr(),
            1,
        );
        if self.data.as_ptr().as_ref().unwrap().magic != FSMAGIC {
            panic!("invalid file system magic num");
        }
        self.initialized.store(true, Ordering::SeqCst);
        drop(buf);

        #[cfg(feature = "verbose_init_info")]
        println!("super block data: {:?}", self.data.as_ptr().as_ref().unwrap());
    }

    /// Read the info of super block.
    fn read(&self) -> &RawSuperBlock {
        debug_assert!(self.initialized.load(Ordering::Relaxed));
        unsafe {
            self.data.as_ptr().as_ref().unwrap()
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
}

/// Raw super block describes the disk layout.
#[repr(C)]
#[derive(Debug)]
struct RawSuperBlock {
    magic: u32,      // Must be FSMAGIC
    size: u32,       // Size of file system image (blocks)
    nblocks: u32,    // Number of data blocks
    ninodes: u32,    // Number of inodes
    nlog: u32,       // Number of log blocks
    logstart: u32,   // Block number of first log block
    inodestart: u32, // Block number of first inode block
    bmapstart: u32,  // Block number of first free map block
}
