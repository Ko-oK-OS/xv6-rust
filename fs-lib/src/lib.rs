#![no_std]
use core::mem::size_of;

mod inode;
mod superblock;

pub use inode::{ DiskInode, Dirent, InodeType };
pub use superblock:: { SuperBlock, RawSuperBlock };

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
pub const NINDIRECT: usize =  BSIZE / 8;
pub const MAXFILE: usize = NDIRECT + NINDIRECT;

pub const NINODES: usize = 200;

/// Directory is a file containing a sequence of dirent structures
pub const DIRSIZ: usize = 14;

/// Inodes per block. 
pub const IPB: usize = BSIZE / size_of::<inode::DiskInode>();

/// Bitmap bits per block
pub const BPB: u32 = (BSIZE*8) as u32;
