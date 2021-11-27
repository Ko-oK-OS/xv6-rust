use bit_field::BitField;

use super::SUPER_BLOCK;
use super::LOG;
use super::BCACHE;
use super::{ InodeType, DiskInode };


use crate::arch::riscv::qemu::fs::{ BPB, BSIZE, IPB };

use core::ptr;

// / Zero a block. 
// pub fn bzero(dev: u32, bno: u32) {
//     let mut buf = BCACHE.bread(dev, bno);
//     unsafe{ (&mut *buf.raw_data_mut()).zero() };
//     LOG.write(buf);
// }

/// Given an inode number. 
/// Calculate the offset index of this inode inside the block. 
#[inline]
fn locate_inode_offset(inum: u32) -> usize {
    inum as usize % IPB
}

/// Free a block in the disk by setting the relevant bit in bitmap to 0.
pub fn bfree(dev: u32, blockno: u32) {
    let bm_blockno = unsafe { SUPER_BLOCK.bitmap_blockno(blockno) };
    let bm_offset = blockno % BPB;
    let index = (bm_offset / 8) as isize;
    let bit = (bm_offset % 8) as usize;
    let mut buf = BCACHE.bread(dev, bm_blockno);
    
    let byte = unsafe { (buf.raw_data_mut() as *mut u8).offset(index).as_mut().unwrap() };
    if !byte.get_bit(bit) {
        panic!("bitmap: double freeing a block");
    }
    byte.set_bit(bit, false);
    LOG.write(buf);
}


/// Allocate a zeroed disk block 
pub fn balloc(dev: u32) -> u32 {
    let mut b = 0;
    let sb_size = unsafe{ SUPER_BLOCK.size() };
    while b < sb_size {
        let bm_blockno = unsafe{ SUPER_BLOCK.bitmap_blockno(b) };
        let mut buf = BCACHE.bread(dev, bm_blockno);
        let mut bi = 0;
        while bi < BPB && b + bi < sb_size {
            bi += 1;
            let m = 1 << (bi % 8);
            let buf_ptr = unsafe{ (buf.raw_data_mut() as *mut u8).offset((bi / 8) as isize).as_mut().unwrap() };
            let buf_val = unsafe{ ptr::read(buf_ptr) };
            if buf_val == 0 { // Is block free?
                unsafe{ ptr::write(buf_ptr, m) };
                LOG.write(buf);
                // drop(buf);
                // bzero(dev, b + bi);
                return b + bi
            }
        }
        drop(buf);
        b += BPB;
    }
    panic!("balloc: out of the block ranges.")
}

pub fn inode_alloc(dev: u32, itype: InodeType) -> u32 {
    let size = unsafe { SUPER_BLOCK.ninodes() };
    for inum in 1..size {
        let blockno = unsafe { SUPER_BLOCK.locate_inode(inum) };
        let offset = locate_inode_offset(inum) as isize;
        let mut buf = BCACHE.bread(dev, blockno);
        let dinode = unsafe { (buf.raw_data_mut() as *mut DiskInode).offset(offset) };
        let dinode = unsafe { &mut *dinode };
        if dinode.try_alloc(itype).is_ok() {
            LOG.write(buf);
            return inum
        }
    }

    panic!("not enough inode to alloc");
}