extern crate fs_lib;

use std::io::{Seek, SeekFrom, Write};
use std::sync::Mutex;
use std::ptr;
use std::env;
use std::mem::size_of;
use std::process::exit;
use std::fs::{ File, OpenOptions };
use fs_lib::{ FSSIZE ,BSIZE, NINODES, IPB, LOGSIZE };
use fs_lib::{ Dirent, DiskInode };

use lazy_static::lazy_static;

lazy_static! {
    static ref ARGS: Vec<String> = {
        if env::args().len() < 2 {
            eprintln!("Usage: mkfs fs.img files...");
        }
        env::args().collect()
    };

    static ref FS_FD: Mutex<File> = Mutex::new(
        OpenOptions::new()
            .read(true)
            .write(true)
            .create(true)
            .truncate(true)
            .open(&ARGS[1])
            .expect(&ARGS[1]),
    );
}

const BITMAP_NUMBER: usize = FSSIZE / (BSIZE * 8) + 1;
const INODE_BLOCK_NUMBER: usize = NINODES / IPB + 1;
const LOG_SIZE: usize = LOGSIZE;
/// Number of meta blocks (boot, sb, nlog, inode, bitmap)
const META_NUMBER: usize = 2 + LOG_SIZE + INODE_BLOCK_NUMBER + BITMAP_NUMBER;
/// Number of data blocks
const DATA_NUMBER: usize = FSSIZE - META_NUMBER;

/// Convert to intel byte order
fn bytes_order_u16(x: u16) -> u16 {
    let mut y: u16 = 0;
    for i in 0..=1 {
        unsafe {
            let write_ptr = ((&mut y) as *mut _ as *mut u8).offset(i as isize);
            let write_val:u8 = (x >> (8 * i)) as u8;
            ptr::write(write_ptr, write_val);
        } 
    }
    y
}

fn bytes_order_u32(x: u32) -> u32 {
    let mut y: u32 = 0;
    for i in 0..=3 {
        unsafe {
            let write_ptr = ((&mut y) as *mut _ as *mut u8).offset(i as isize);
            let write_val:u8 = (x >> (8 * i)) as u8;
            ptr::write(write_ptr, write_val);
        } 
    }
    y
}

fn write_sector(sector: u32, buf: &[u8]) {
    let sector = sector as usize;
    let mut fs_guard = FS_FD.lock().unwrap();
    if fs_guard
        .seek(SeekFrom::Start((sector * BSIZE) as u64))
        .unwrap() != (sector * BSIZE) as u64{
           panic!("write_sector: Fail to seek for sector"); 
    }
    if fs_guard.write(buf).unwrap() != BSIZE {
        panic!("write_sector: Fail to write sector");
    }
}

fn write_inode(inum: u32) {

}

fn read_inode(inum: u32) {

}

fn read_sector(sector: u32) {

}

pub fn main() {
    assert!(BSIZE % size_of::<Dirent>() == 0);
    assert!(BSIZE % size_of::<DiskInode>() == 0);
    // 1 fs block = 1 disk sector 

}