use crate::define::fs::{ NDIRECT, BSIZE, NINODE, IPB, NINDIRECT };
use crate::fs::LOG;
use crate::lock::sleeplock::{SleepLock, SleepLockGuard};
use crate::lock::spinlock::Spinlock;
use crate::memory::either_copy_out;
use crate::misc::{ min, mem_set };
use crate::define::fs::iblock;

use alloc::boxed::Box;
use alloc::string::String;

use core::mem::size_of;
use core::ptr::{ read, write };

use array_macro::array;

use super::Buf;
use super::DiskInode;
use super::BCACHE;
use super::SUPER_BLOCK;
use super::dinode::InodeType;
use super::bitmap::bfree;

pub static ICACHE: InodeCache = InodeCache::new();

type BlockNo = u32;


pub struct InodeCache {
    meta: Spinlock<[InodeMeta; NINODE]>,
    data: [SleepLock<InodeData>; NINODE]
}

impl InodeCache {
    const fn new() -> Self {
        Self {
            meta: Spinlock::new(array![_ => InodeMeta::new(); NINODE], "InodeMeta"),
            data: array![_ => SleepLock::new(InodeData::new(), "InodeData"); NINODE],
        }
    }


    /// Clone an inode by just increment its reference count by 1. 
    fn dup(&self, inode: &Inode) -> Inode {
        let mut guard = self.meta.acquire();
        guard[inode.index].refs += 1;
        Inode {
            dev: inode.dev,
            blockno: inode.blockno,
            inum: inode.inum,
            index: inode.index
        }
    }

    /// Done with this inode. 
    /// If this is the last reference in the inode cache, then is might be recycled. 
    /// Further, if this inode has no links anymore, free this inode in the disk. 
    /// It should only be called by the Drop impl of Inode. 
    fn put(&self, inode: &mut Inode) {
        let mut guard = self.meta.acquire();
        let i = inode.index;
        let imeta = &mut guard[i];

        if imeta.refs == 1 {
            // SAFETY: reference count is 1, so this lock will not block. 
            let mut idata = self.data[i].lock();
            if !idata.valid || idata.dinode.nlink > 0 {
                drop(idata);
                imeta.refs -= 1;
                drop(guard);
            } else {
                drop(guard);
                idata.dinode.itype = InodeType::Empty;
                idata.truncate(inode);
                idata.valid = false;
                drop(idata);

                // recycle after this inode content in the cache is no longer valid. 
                // note: it is wrong to recycle it earlier, 
                // otherwise the cache content might change
                // before the previous content written to disk. 
                let mut guard = self.meta.acquire();
                guard[i].refs -= 1;
                debug_assert_eq!(guard[i].refs, 0);
                drop(guard);
            }
        } else {
            imeta.refs -= 1;
            drop(guard);
        }
    }
}

struct InodeMeta {
    /// device number
    dev: u32,
    /// block number, calculated from inum
    blockno: u32,
    /// inode number
    inum: u32,
    /// reference count
    refs: usize
}

impl InodeMeta {
    const fn new() -> Self {
        Self {
            dev: 0,
            blockno: 0,
            inum: 0,
            refs: 0
        }
    }
}

/// In-memory copy of an inode
pub struct InodeData {
    valid: bool,
    dinode: DiskInode
}

impl InodeData {
    const fn new() -> Self {
        Self {
            valid: false,
            dinode: DiskInode::new()
        }
    }

    /// Discard the inode data/content. 
    fn truncate(&mut self, inode: &Inode) {
        // direct block
        for i in 0..NDIRECT {
            if self.dinode.addrs[i] > 0 {
                bfree(inode.dev, self.dinode.addrs[i]);
                self.dinode.addrs[i] = 0;
            }
        }

        // indirect block
        if self.dinode.addrs[NDIRECT] > 0 {
            let buf = BCACHE.bread(inode.dev, self.dinode.addrs[NDIRECT]);
            let buf_ptr = buf.raw_data() as *const BlockNo;
            for i in 0..NINDIRECT {
                let bn = unsafe{ read(buf_ptr.offset(i as isize)) };
                if bn > 0 {
                    bfree(inode.dev, bn);
                }
            }
            drop(buf);
            bfree(inode.dev, self.dinode.addrs[NDIRECT]);
            self.dinode.addrs[NDIRECT] = 0;
        }

        self.dinode.size = 0;
        self.update(inode);
    }

    /// Update a modified in-memory inode to disk. 
    /// Typically called after changing the content of inode info. 
    fn update(&mut self, inode: &Inode) {
        let mut buf = BCACHE.bread(inode.dev, inode.blockno);
        let offset = locate_inode_offset(inode.inum) as isize;
        let dinode = unsafe{ (buf.raw_data_mut() as *mut DiskInode).offset(offset) };
        unsafe{ write(dinode, self.dinode) };
        LOG.write(buf);
    }
}

/// Inode handed out by inode cache. 
/// It is actually a handle pointing to the cache. 
pub struct Inode {
    dev: u32,
    blockno: u32,
    inum: u32,
    index: usize
}

impl Clone for Inode {
    fn clone(&self) -> Self {
        ICACHE.dup(self)
    }
}

impl Inode {
    /// Lock the inode. 
    /// Load it from the disk if its content not cached yet. 
    pub fn lock<'a>(&'a self) -> SleepLockGuard<'a, InodeData> {
        let mut guard = ICACHE.data[self.index].lock();
        
        if !guard.valid {
            let buf = BCACHE.bread(self.dev, self.blockno);
            let offset = locate_inode_offset(self.inum) as isize;
            let dinode = unsafe{ (buf.raw_data() as *const DiskInode).offset(offset) };
            guard.dinode = unsafe{ core::ptr::read(dinode) };
            drop(buf);
            guard.valid = true;
            if guard.dinode.itype == InodeType::Empty {
                panic!("inode lock: trying to lock an inode whose type is empty.")
            }
        }
        guard
    }
}

impl Drop for Inode {
    /// Done with this inode. 
    /// If this is the last reference in the inode cache, then is might be recycled. 
    /// Further, if this inode has no links anymore, free this inode in the disk. 
    fn drop(&mut self) {
        ICACHE.put(self)
    }
}


/// Given an inode number. 
/// Calculate the offset index of this inode inside the block. 
#[inline]
fn locate_inode_offset(inum: u32) -> usize {
    inum as usize % IPB
}

// #[repr(C)]
// #[derive(Clone, Copy)]
// pub struct Inode {
//     dev: u32, // device id
//     inum: u32, // Inode number
//     file_ref: i32, // Reference count
//     vaild: i32, // inode has been read from disk

//     file_type: i16, // copy of disk inode
//     major: i16,
//     minor: i16,
//     nlink: i16,
//     size: usize,
//     addrs: [usize;NDIRECT+1]
// }

// impl Inode {
//     /// Allocate an inode on device dev. 
//     /// Mark it as allocated by giving it type type. 
//     /// Returns an unlocked but allocated and referenced inode. 
//     pub(crate) fn alloc(dev: u32, file_type: i16) -> Option<&'static mut Inode> {
//         let sb_inodes = unsafe{ SUPER_BLOCK.inodestart() };
//         let mut bp: Buf;
//         let mut dip: &mut DiskInode;
//         for inum in 1..sb_inodes {
//             bp = BCACHE.bread(dev, iblock(inum, SUPER_BLOCK));
//             dip = unsafe{ &mut *(bp.raw_data_mut() as *mut DiskInode) };
//             if dip.get_type() == 0 {
//                 // a free inode 
//                 mem_set(
//                     dip as *const _ as *mut u8, 
//                     0, 
//                     size_of::<DiskInode>()
//                 );
//                 dip.set_type(file_type);
//                 LOG.write(bp);
//                 BCACHE.brelse(bp.get_index());
//                 return Inode::get(dev, inum)
//             }
//             BCACHE.brelse(bp.get_index());
//         }
//         panic!("inode alloc: no inodes");
//     }


//     /// Copy a modified in-memory inode to disk
//     /// Must be called after every change to an ip->xxx field
//     /// that lives on disk. 
//     /// Caller must hold ip->lock
//     pub(crate) fn update(&self) {

//     }

//     /// Find the inode with number inum on device dev
//     /// and return th in-memory copy. Does not lock
//     /// the inode and does not read it from disk. 
//     pub(crate) fn get(dev: u32, inum: u32) -> Option<&'static mut Inode> {
//         None
//     }


//     /// Increment reference count for ip. 
//     /// Returns ip to enable ip = idup(ip1) idinum
//     pub(crate) fn dup(&mut self) {

//     } 

//     /// Lock the given inode. 
//     /// Reads the inode from disk if necessary. 
//     pub(crate) fn lock(&self) {
//         if self.file_ref < 1 {
//             panic!("inode lock: inode references should be more than 1.");
//         }

        
//     }

//     /// Unlock the given inode. 
//     pub(crate) fn unlock(&self) {

//     }

//     /// Drop a reference to an im-memory inode. 
//     /// If that was the last reference, the inode table entry can
//     /// be recycled. 
//     /// If that was the last reference and the inode has no links
//     /// to it, free the inode (and its content) on disk. 
//     /// All calls to put() must be inside a transaction in
//     /// case it has to free the inode. 
//     pub(crate) fn put(&self) {

//     }

//     /// Inode content
//     /// 
//     /// The content (data) associated with each inode is stored
//     /// in blocks on the disk. The first NDIRECT block numbers
//     /// are listed in ip->address. The next NINDIRECT blocks are
//     /// listed in block ip.addr[NDIRECT]. 
//     /// 
//     /// Return the disk block address of the nth block in inode ip. 
//     /// If there is no such block, bmap allocates one. 
//     pub(crate) fn bmap(&self, bn: usize) -> u32 {
//         panic!("inode map: out of range.")
//     }

//     /// Truncate inode (discard contents)
//     /// Caller must hold ip.lock 
//     pub(crate) fn trunc(&mut self) {

//     }

//     /// Copy stat information from inode. 
//     /// Caller must hold ip->lock. 
//     pub(crate) fn stat(&mut self, st: &super::stat::Stat) {

//     }


//     /// Read data from inode.
//     /// Caller must hold ip->lock.
//     /// If user_dst==1, then dst is a user virtual address;
//     /// otherwise, dst is a kernel address.
//     pub(crate) fn read(
//         &self, 
//         user_dst: usize, 
//         mut dst: usize, 
//         off: u32, 
//         mut len: usize
//     ) -> Result<usize, &'static str>{
//         let mut tot = 0;
//         let mut m = 0;
//         let mut off = off as usize;
//         let mut bp: Buf;
//         if off > self.size || off + len < off {
//             return Err("inode read: off should be more than size and less than off + len")
//         }
//         if off + len > self.size {
//             len = self.size - off;
//         }

//         for _ in 0..len/m {
//             bp = BCACHE.bread(self.dev, self.bmap(off / BSIZE));
//             m = min(len - tot, BSIZE - off%BSIZE);
//             if either_copy_out(
//                 user_dst, dst, 
//                 (bp.raw_data() as usize + (off % BSIZE)) as *mut u8, 
//                 m
//             ).is_err() {
//                 BCACHE.brelse(bp.get_index());
//                 return Err("Fail to copy out")
//             }
//             BCACHE.brelse(bp.get_index());
//             tot += m;
//             off += m;
//             dst += m;
//         }

//         Ok(tot)
//     }

//     /// Write data to inode. 
//     /// Caller must hold ip->lock. 
//     /// If user_dst == 1, then src is a user virtual address;
//     /// otherwise, src is a kernel address. 
//     /// Returns the number of bytes successfully written. 
//     /// If the return value is less than the requested n, 
//     /// there was an error of some kind.
//     pub(crate) fn write(
//         &mut self,
//         user_dst: usize,
//         dst: usize,
//         off: u32,
//         buf: &[u8]
//     ) {

//     }

//     /// Common idiom: unlock, then put. 
//     pub fn unlock_put(&self) {
//         self.unlock();
//         self.put();
//     }

// }