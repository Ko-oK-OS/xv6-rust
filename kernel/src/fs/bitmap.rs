use bit_field::BitField;

use super::SUPER_BLOCK;
use super::LOG;
use super::BCACHE;

use crate::define::fs::{ BPB, BSIZE };

use core::ptr;

/// Zero a block. 
pub fn bzero(dev: u32, bno: u32) {
    let buf = BCACHE.bread(dev, bno);
    unsafe{ (&mut *buf.raw_data_mut()).zero() };
    LOG.write(buf);
    BCACHE.brelse(buf.get_index());
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
        let buf = BCACHE.bread(dev, bm_blockno);
        let mut bi = 0;
        while bi < BPB && b + bi < sb_size {
            bi += 1;
            let m = 1 << (bi % 8);
            let buf_ptr = unsafe{ (buf.raw_data_mut() as *mut u8).offset((bi / 8) as isize).as_mut().unwrap() };
            let buf_val = unsafe{ ptr::read(buf_ptr) };
            if buf_val == 0 { // Is block free?
                unsafe{ ptr::write(buf_ptr, m) };
                LOG.write(buf);
                BCACHE.brelse(buf.get_index());
                bzero(dev, b + bi);
                return b + bi
            }
        }
        BCACHE.brelse(buf.get_index());
        b += BPB;
    }
    panic!("balloc: out of the block ranges.")
}