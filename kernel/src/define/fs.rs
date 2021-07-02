use core::mem::size_of;
use crate::fs::Dinode;
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

pub const NOFILE: usize = 16;  // open files per process
pub const NFILE: usize = 100;  // open files per system
pub const NINODE: usize = 50;  // maximum number of active i-nodes
pub const ROOTDEV: u32 = 1;  // device number of file system root disk
pub const FSSIZE: usize = 1000;  // size of file system in blocks

pub const NDIRECT: usize = 12;
pub const NINDIRECT: usize =  BSIZE/8;
pub const MAXFILE: usize = NDIRECT + NINDIRECT;

/// Directory is a file containing a sequence of dirent structures
pub const DIRSIZ: usize = 14;

/// Inodes per block. 
pub const IPB:usize = BSIZE/size_of::<Dinode>();

/// Bitmap bits per block
pub const BPB:usize = BSIZE*8;

/// Block containing inode i 
#[inline]
pub fn iblock(i: usize, sb: SuperBlock) -> usize {
    i/IPB + sb.inodestart() as usize
}

/// Block of free map containing bit for block b
#[inline]
pub fn bblock(b:usize, sb:SuperBlock) -> usize {
    b/BPB + sb.bmapstart() as usize 
}

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


