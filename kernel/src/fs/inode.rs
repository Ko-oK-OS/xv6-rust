use crate::define::fs::{ NDIRECT, BSIZE, NINODE, IPB, NINDIRECT };
use crate::fs::LOG;
use crate::lock::sleeplock::{SleepLock, SleepLockGuard};
use crate::lock::spinlock::Spinlock;
use crate::memory::either_copy_out;
use crate::misc::{ min, mem_set };

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

    /// Lookup the inode in the inode cache. 
    /// If found, return an handle. 
    /// If not found, alloc an in-memory location in the cache, 
    /// but not fetch it from the disk yet. 
    fn get(&self, dev: u32, inum: u32) -> Inode {
        let mut guard = self.meta.acquire();

        // lookup in the cache 
        let mut empty_i: Option<usize> = None;
        for i in 0..NINODE {
            if guard[i].inum == inum && guard[i].refs > 0 && guard[i].dev ==dev {
                guard[i].refs += 1;
                return Inode {
                    dev,
                    blockno: guard[i].blockno,
                    inum,
                    index: i,
                }
            }
            if empty_i.is_none() && guard[i].refs == 0 {
                empty_i = Some(i);
            }
        }

        // not found 
        let empty_i = match empty_i {
            Some(i) => i,
            None => panic!("inode: not enough"),
        };
        guard[empty_i].dev = dev;
        let blockno = unsafe{ SUPER_BLOCK.locate_inode(inum) };
        guard[empty_i].blockno = blockno;
        guard[empty_i].inum = inum;
        guard[empty_i].refs = 1;

        Inode {
            dev,
            blockno,
            inum,
            index: empty_i
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

    /// Read data from inode. 
    /// Caller must hold ip sleeplock. 
    /// If is_user is true, then dst is a user virtual address;
    /// otherwise, dst is a kernel address. 
    pub fn read(
        &self, 
        inode: &Inode, 
        is_user: bool, 
        mut dst: usize, 
        mut off: u32, 
        mut n: u32
    ) -> Option<usize> {
        let mut m = 0;
        if off > self.dinode.size {
            return None
        }

        if off + n > self.dinode.size {
            n = self.dinode.size - off;
        }
        let mut tot:usize;

        while tot < n as usize {
            let bm_blockno = unsafe{ SUPER_BLOCK.bitmap_blockno(off / BSIZE as u32) };
            let buf = BCACHE.bread(inode.dev, bm_blockno);
            m = min(inode.dev, BSIZE as u32 - off % BSIZE as u32);
            if either_copy_out(
                is_user, 
                dst, 
                unsafe{ (buf.raw_data() as *mut u8).offset((off % BSIZE as u32) as isize) },
                m as usize
            ).is_err() {
                drop(buf);
                return None
            }
            drop(buf);
            tot += m as usize;
            off += m;
            dst += m as usize;
        }
        Some(tot)
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
