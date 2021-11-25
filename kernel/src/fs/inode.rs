use crate::define::fs::{BSIZE, DIRSIZ, IPB, MAXFILE, NDIRECT, NINDIRECT, NINODE, ROOTDEV, ROOTINUM};
use crate::fs::LOG;
use crate::fs::bitmap::inode_alloc;
use crate::lock::sleeplock::{SleepLock, SleepLockGuard};
use crate::lock::spinlock::Spinlock;
use crate::memory::{copy_from_kernel, copy_to_kernel};
use crate::misc::{ min, mem_set };
use crate::process::CPU_MANAGER;

use alloc::boxed::Box;
use alloc::string::String;

use core::mem::size_of;
use core::ptr::{self, read, write};

use array_macro::array;

use super::Buf;
use super::BCACHE;
use super::SUPER_BLOCK;
use super::stat::Stat;
use super::{ InodeType, DiskInode, DirEntry };
use super::bitmap::{balloc, bfree};

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
                idata.valid = false;
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

    /// Allocate an inode on device dev. 
    /// Mark it as allocated by giving it type type. 
    /// Returns an unlocked but allocated and reference inode 
    pub fn alloc(&self, dev: u32, itype: InodeType) -> Option<Inode> {
        let ninodes = unsafe {
            SUPER_BLOCK.ninodes()
        };
        for inum in 1 ..= ninodes {
            // get block id
            let block_id = unsafe {
                SUPER_BLOCK.locate_inode(inum)
            };
            // read block into buffer by device and block_id
            let mut block = BCACHE.bread(dev, block_id);
        
            // Get inode offset in the block
            let offset = locate_inode_offset(inum) as isize;
            let dinode = unsafe { (block.raw_data_mut() as *mut DiskInode).offset(offset) };
            let dinode = unsafe{ &mut *dinode };
            // Find a empty inode
            if dinode.try_alloc(itype).is_ok() {
                LOG.write(block);
                return Some(self.get(dev, inum))
            }
            // drop(block);
        }
        None
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
            if guard[i].inum == inum && guard[i].refs > 0 && guard[i].dev == dev {
                guard[i].refs += 1;
                println!("[Debug] 获取Inode");
                return Inode {
                    dev,
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
        println!("[Debug] empty_i: {}", empty_i);
        guard[empty_i].dev = dev;
        guard[empty_i].inum = inum;
        guard[empty_i].refs = 1;
        // 此时 Inode Cache 应当是无效的
        let idata = self.data[empty_i].lock();
        assert!(idata.valid == false, "此时 idata 应当无效");
        Inode {
            dev,
            inum,
            index: empty_i
        }
    }

    /// Helper function for 'namei' and 'namei_parent'
    fn namex(
        &self, 
        path: &[u8], 
        name: &mut [u8;DIRSIZ], 
        is_parent: bool
    ) -> Option<Inode> {
        let mut inode: Inode;
        if path[0] == b'/' {
            println!("[Debug] 根目录");
            inode = self.get(ROOTDEV, ROOTINUM);
        } else {
            println!("[Debug] 当前目录");
            let p = unsafe { CPU_MANAGER.myproc().unwrap() };
            inode = self.dup(p.extern_data.get_mut().cwd.as_ref().unwrap());
        }
        let mut cur: usize = 0;
        loop {
            cur = skip_path(path, cur, name);
            if cur == 0 { break; }
            println!("[Debug] cur: {}", cur);

            let mut data_guard = inode.lock();
            if data_guard.dinode.itype != InodeType::Directory {
                println!("[Debug] Disk Inode: {:?}", data_guard.dinode);
                println!("[Debug] 该文件不是目录");
                drop(data_guard);
                return None
            }
            if is_parent && path[cur] == 0 {
                drop(data_guard);
                return Some(inode)
            }

            match data_guard.dir_lookup(name) {
                None => {
                    drop(data_guard);
                    return None
                },
                Some(last_inode) => {
                    drop(data_guard);
                    inode = last_inode;
                }
            }
        }
        if is_parent {
            // only when querying root inode's parent 
            println!("Kernel warning: namex querying root inode's parent");
            None 
        } else {
            Some(inode)
        }
    }

    /// namei interprets the path argument as an pathname to Unix file. 
    /// It will return an [`inode`] if succeed, Err(()) if fail. 
    /// It must be called inside a transaction(i.e.,'begin_op' and `end_op`) since it calls `put`.
    /// Note: the path should end with 0u8, otherwise it might panic due to out-of-bound. 
    pub fn namei(&self, path: &[u8]) -> Option<Inode> {
        let mut name: [u8;DIRSIZ] = [0;DIRSIZ];
        self.namex(path, &mut name, false)
    }

    /// Same behavior as `namei`, but return the parent of the inode, 
    /// and copy the end path into name. 
    pub fn namei_parent(&self, path: &[u8], name: &mut [u8;DIRSIZ]) -> Option<Inode> {
        self.namex(path, name, true)
    }

    pub fn create(
        &self,
        path: &[u8],
        itype: InodeType,
        major: i16,
        minor: i16
    ) -> Result<Inode, &'static str> {
        let mut name: [u8; DIRSIZ] = [0; DIRSIZ];
        let dirinode = self.namei_parent(path, &mut name).unwrap();
        let mut dirinode_guard = dirinode.lock();
        
        match dirinode_guard.dir_lookup(&name) {
            Some(inode) => {
                drop(dirinode_guard);
                let inode_guard = inode.lock();
                match inode_guard.dinode.itype {
                    InodeType::Device | InodeType::File => {
                        if itype == InodeType::File {
                            drop(inode_guard);
                            return Ok(inode)
                        }
                        return Err("create: unmatched type.");
                    },
    
                    _ => {
                        return Err("create: unmatched type.")
                    }
                }
            },
    
            None => {}
        }
        // Allocate a new inode to create file
        let dev = dirinode_guard.dev;
        // let inode = ICACHE.alloc(dev, itype).unwrap();
        let inum = inode_alloc(dev, itype);
        let inode = self.get(dev, inum);
        
        let mut inode_guard = inode.lock();
        // initialize new allocated inode
        inode_guard.dinode.major = major;
        inode_guard.dinode.minor = minor;
        inode_guard.dinode.nlink = 1;
        // Write back to disk
        inode_guard.update();
        debug_assert_eq!(inode_guard.dinode.itype, itype);
    
        // Directory, create .. 
        if itype == InodeType::Directory {
            // Create . and .. entries. 
            inode_guard.dinode.nlink += 1;
            inode_guard.update();
            // No nlink++ for . to avoid recycle ref count. 
            inode_guard.dir_link(".".as_bytes(), inode.inum)?;
            inode_guard.dir_link("..".as_bytes(), dirinode_guard.inum)?;
        }
        dirinode_guard
            .dir_link(&name, inode_guard.inum)
            .expect("Parent inode fail to link");

        drop(inode_guard);
        drop(dirinode_guard);
        Ok(inode)
    }
}

/// Skip the path starting at cur by b'/'s. 
/// It will copy the skipped content to name. 
/// Return the current offset after skiping. 
fn skip_path(
    path: &[u8], 
    mut cur: usize, 
    name: &mut [u8; DIRSIZ]
) -> usize {
    // skip preceding b'/'
    while path[cur] == b'/' {
        cur += 1;
    }
    if path[cur] == 0 {
        return 0
    }

    let start = cur;
    while path[cur] != b'/' && path[cur] != 0 {
        cur += 1;
    }

    let mut count = cur - start; 
    if count >= name.len() {
        debug_assert!(false);
        count = name.len() - 1;
    }
    unsafe{
        ptr::copy(path.as_ptr().offset(start as isize), name.as_mut_ptr(), count);
    }
    name[count] = 0;

    // skip succeeding b'/'
    while path[cur] == b'/' {
        cur += 1;
    }
    cur
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
    pub valid: bool,
    pub dev: u32,
    pub inum: u32,
    pub dinode: DiskInode
}

impl InodeData {
    const fn new() -> Self {
        Self {
            valid: false,
            dev: 0,
            inum: 0,
            dinode: DiskInode::new()
        }
    }


    /// Copy stat information from inode
    pub fn stat(&self, stat: &mut Stat) {
        stat.dev = self.dev;
        stat.inum = self.inum;
        stat.itype = self.dinode.itype;
        stat.nlink = self.dinode.nlink;
        stat.size = self.dinode.size as usize;
    }

    /// Discard the inode data/content. 
    pub fn truncate(&mut self, inode: &Inode) {
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
        self.update();
    }

    /// Update a modified in-memory inode to disk. 
    /// Typically called after changing the content of inode info. 
    pub fn update(&mut self) {
        let mut buf = BCACHE.bread(
            self.dev, 
            unsafe { SUPER_BLOCK.locate_inode(self.inum)}
        );
        let offset = locate_inode_offset(self.inum) as isize;
        let dinode = unsafe{ (buf.raw_data_mut() as *mut DiskInode).offset(offset) };
        unsafe{ write(dinode, self.dinode) };
        println!("self.dindoe: {:?}", self.dinode);
        LOG.write(buf);
    }

    /// The content (data) associated with each inode is stored
    /// in blocks on the disk. The first NDIRECT block numbers
    /// are listed in self.dinode.addrs, The next NINDIRECT blocks are 
    /// listed in block self.dinode.addrs[NDIRECT]. 
    /// 
    /// Return the disk block address of the nth block in inode. 
    /// If there is no such block, bmap allocates one. 
    pub fn bmap(&mut self, offset_bn: u32) -> Result<u32, &'static str> {
        let mut addr;
        let offset_bn = offset_bn as usize;
        if offset_bn < NDIRECT {
            if self.dinode.addrs[offset_bn] == 0 {
                addr = balloc(self.dev);
                self.dinode.addrs[offset_bn] = addr;
                return Ok(addr)
            } else {
                return Ok(self.dinode.addrs[offset_bn])
            }
        }
        if offset_bn < NINDIRECT + NDIRECT {
            // Load indirect block, allocating if necessary. 
            let count = offset_bn - NDIRECT;
            if self.dinode.addrs[NDIRECT] == 0 {
                addr = balloc(self.dev);
                self.dinode.addrs[NDIRECT] = addr;
            } else {
                addr = self.dinode.addrs[NDIRECT]
            }
            let buf = BCACHE.bread(self.dev, addr);
            let buf_data = buf.raw_data() as *mut u32;
            addr = unsafe{ read(buf_data.offset(count as isize)) };
            if addr == 0 {
                unsafe{
                    addr = balloc(self.dev);
                    write(buf_data.offset(count as isize), addr);
                }
                LOG.write(buf);
            }
            // drop(buf);
            return Ok(addr)
        }
        panic!("inode bmap: out of range.");
    }

    /// Read data from inode. 
    /// Caller must hold inode's sleeplock. 
    /// If is_user is true, then dst is a user virtual address;
    /// otherwise, dst is a kernel address. 
    /// is_user 为 true 表示 dst 为用户虚拟地址，否则表示内核虚拟地址
    pub fn read(
        &mut self, 
        is_user: bool, 
        mut dst: usize, 
        offset: u32, 
        count: u32
    ) -> Result<(), &'static str> { 
        // Check the reading content is in range.
        let end = offset.checked_add(count).ok_or("Fail to add count.")?;
        if end > self.dinode.size {
            return Err("inode read: end is more than diskinode's size.")
        }

        let mut total: usize = 0;
        let mut offset = offset as usize;
        let count = count as usize;
        let mut block_basic = offset / BSIZE;
        let mut block_offset = offset % BSIZE;
        // println!("[Debug] count: 0x{:x}", count);
        while total < count as usize {
            let surplus_len = count - total;
            let block_no = self.bmap(block_basic as u32)?;
            let buf = BCACHE.bread(self.dev, block_no);
            // println!("[Debug] surplus_len: 0x{:x}, BSIZE - block_offset: 0x{:x}", surplus_len, BSIZE - block_offset);
            let write_len = min(surplus_len, BSIZE - block_offset);
            if copy_from_kernel(
                is_user, 
                dst, 
                unsafe{ (buf.raw_data() as *mut u8).offset((offset % BSIZE) as isize) },
                write_len as usize
            ).is_err() {
                drop(buf);
                return Err("inode read: Fail to either copy out.")
            }
            drop(buf);
            total += write_len as usize;
            offset += write_len as usize;
            dst += write_len as usize;
            // 块的初始值及块的偏移量
            block_basic = offset / BSIZE;
            block_offset = offset % BSIZE;
        }
        Ok(())
    }


    /// Write data to inode. 
    /// Caller must hold inode's sleeplock. 
    /// If is_user is true, then src is a user virtual address; 
    /// otherwise, src is a kernel address. 
    /// Returns the number of bytes successfully written. 
    /// If the return value is less than the requestes n, 
    /// there was an error of some kind. 
    pub fn write(
        &mut self, 
        is_user: bool, 
        mut src: usize, 
        offset: u32, 
        count: u32
    ) -> Result<(), &'static str> {
        let end = offset.checked_add(count).ok_or("Fail to add count.")?;
        if end > self.dinode.size {
            return Err("inode read: end is more than diskinode's size.")
        }

        let mut offset = offset as usize;
        let count = count as usize;
        let mut total = 0;
        let mut block_basic = offset / BSIZE;
        let mut block_offset = offset % BSIZE;
        while total < count {
            let surplus_len = count - total;
            let block_no = self.bmap(block_basic as u32)?;
            let mut buf = BCACHE.bread(self.dev, block_no);
            let write_len = min(surplus_len, block_offset % BSIZE);
            if copy_to_kernel(
                unsafe{ (buf.raw_data_mut() as *mut u8).offset((offset % BSIZE) as isize ) }, 
                is_user, 
                src, 
                write_len
            ).is_err() {
                drop(buf);
                return Err("inode write: Fail to either copy in")
            }
            offset += write_len;
            src += write_len;
            total += write_len;

            block_basic = offset / BSIZE;
            block_offset = offset % BSIZE;

            LOG.write(buf);
        }

        if self.dinode.size < offset as u32 {
            self.dinode.size = offset as u32;
        }

        Ok(())
    }

    /// Look for an inode entry in this directory according the name. 
    /// Panics if this is not a directory. 
    pub fn dir_lookup(&mut self, name: &[u8]) -> Option<Inode> {
        assert!(name.len() == DIRSIZ);
        // debug_assert!(self.dev != 0);
        if self.dinode.itype != InodeType::Directory {
            panic!("inode type is not directory");
        }
        let de_size = size_of::<DirEntry>();
        let mut dir_entry = DirEntry::new();
        let dir_entry_ptr = &mut dir_entry as *mut _ as *mut u8;
        for offset in (0..self.dinode.size).step_by(de_size) {
            self.read(
                false, 
                dir_entry_ptr as usize, 
                offset, 
                de_size as u32
            ).expect("Cannot read entry in this dir");
            if dir_entry.inum == 0 {
                continue;
            }
            for i in 0..DIRSIZ {
                println!("dir entry: {}", String::from_utf8(dir_entry.name.to_vec()).unwrap());
                if dir_entry.name[i] != name[i] {
                    break;
                }
                if dir_entry.name[i] == 0 {
                    return Some(ICACHE.get(self.dev, dir_entry.inum as u32))
                }
            }
        }
        None
    }

    /// Write s new directory entry (name, inum) into the directory
    pub fn dir_link(&mut self, name: &[u8], inum: u32) -> Result<(), &'static str>{
        self.dir_lookup(name).ok_or("Fail to find inode")?;
        let mut dir_entry = DirEntry::new();
        // look for an empty dir_entry
        let mut entry_offset = 0;
        for offset in (0..self.dinode.size).step_by(size_of::<DirEntry>()) {
            self.read(
                false, 
                (&mut dir_entry) as *mut DirEntry as usize, 
                offset, 
                size_of::<DirEntry>() as u32
            )?;
            if dir_entry.inum == 0 {
                entry_offset = offset;
                break;
            }
        }
        unsafe {
            ptr::copy(name.as_ptr(), dir_entry.name.as_mut_ptr(), name.len());
        }
        dir_entry.inum = inum as u16;
        self.write(
            false, 
            (&dir_entry) as *const DirEntry as usize, 
            entry_offset, 
            size_of::<DirEntry>() as u32
        )?;
        Ok(())
    }

    /// Is the directory empty execpt for "." and ".." ?
    pub fn is_dir_empty(&mut self) -> bool {
        let mut dir_entry = DirEntry::new();
        // "." and ".." size
        let init_size = 2 * size_of::<DirEntry>() as u32;
        let final_size = self.dinode.size;
        for offset in (init_size..final_size).step_by(size_of::<DirEntry>()) {
            // Check each direntry, foreach step by size of DirEntry. 
            if self.read(
                false, 
                &mut dir_entry as *mut DirEntry as usize, 
                offset, 
                size_of::<DirEntry>() as u32
            ).is_err() {
                panic!("is_dir_empty(): Fail to read dir content");
            }

            if dir_entry.inum != 0 {
                return true
            }
        }
        false

    }
}

/// Inode handed out by inode cache. 
/// It is actually a handle pointing to the cache. 
#[derive(Debug)]
pub struct Inode {
    pub dev: u32,
    pub inum: u32,
    pub index: usize
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
        println!("self.index: {}", self.index);
        println!("[Debug] guard.valid: {}", guard.valid);
        
        if !guard.valid {
            println!("[Debug] 非有效，从磁盘中读取");
            let blockno = unsafe{ SUPER_BLOCK.locate_inode(self.inum) };
            let buf = BCACHE.bread(self.dev, blockno);
            let offset = locate_inode_offset(self.inum) as isize;
            let dinode = unsafe{ (buf.raw_data() as *const DiskInode).offset(offset) };
            guard.dinode = unsafe{ core::ptr::read(dinode) };
            drop(buf);
            guard.valid = true;
            guard.dev = self.dev;
            guard.inum = self.inum;
            println!("[Debug] self.inum: {}", self.inum);
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
