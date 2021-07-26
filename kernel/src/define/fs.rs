use core::mem::size_of;
use crate::fs::DiskInode;
use crate::fs::SuperBlock;

/// magic number indentifying this specific file system
pub const FSMAGIC: u32 = 0x10203040;
/// size of disk block
pub const BSIZE: usize = 1024;
/// Maxinum of blocks an FS op can write
pub const MAXOPBLOCKS: usize = 10;
/// size of buffer cache for block
pub const NBUF: usize = MAXOPBLOCKS * 3;
/// size of log space in disk
pub const LOGSIZE: usize = MAXOPBLOCKS * 3;

/// open files per process
pub const NOFILE: usize = 16;
/// open files per system
pub const NFILE: usize = 100; 
/// maximum number of active i-nodes
pub const NINODE: usize = 50;  
/// device number of file system root disk
pub const ROOTDEV: u32 = 1;
/// size of file system in blocks
pub const FSSIZE: usize = 1000; 

pub const ROOTINUM: u32 = 1;

pub const NDIRECT: usize = 12;
pub const NINDIRECT: usize =  BSIZE / 8;
pub const MAXFILE: usize = NDIRECT + NINDIRECT;

/// Directory is a file containing a sequence of dirent structures
pub const DIRSIZ: usize = 14;

/// Inodes per block. 
pub const IPB: usize = BSIZE / size_of::<DiskInode>();

/// Bitmap bits per block
pub const BPB: u32 = (BSIZE*8) as u32;

#[inline]
pub fn major(dev: usize) -> usize {
    (dev >> 16) & 0xFFFF
}

#[inline]
pub fn minor(dev: usize) -> usize {
    dev & 0xFFFF
}

#[inline]
pub fn mkdev(m: usize, n: usize) -> usize {
    (m << 16) | n
}

#[repr(usize)]
pub enum OpenMode {
   RDONLY = 0x000,
   WRONLY = 0x001,
   RDWR = 0x002,
   CREATE = 0x200,
   TRUNC = 0x400,
   INVALID
}

impl OpenMode {
    pub fn mode(item: usize) -> Self {
        match item {
            0x000 => { Self::RDONLY },
            0x001 => { Self::WRONLY },
            0x002 => { Self::RDWR },
            0x200 => { Self::CREATE },
            0x400 => { Self::TRUNC },
            _ => {Self::INVALID}
        }
    }
}


