extern crate fs_lib;

use std::io::{ Read, Seek, SeekFrom, Write };
use std::sync::Mutex;
use std::ptr;
use std::mem::size_of;
use std::fs::{ File, OpenOptions };

use fs_lib::{BSIZE, FSMAGIC, FSSIZE, IPB, LOGSIZE, NINODES, RawSuperBlock};
use fs_lib::{ Dirent, DiskInode };
use fs_lib::SuperBlock;


pub static FS_IMG: &'static str = "../fs.img";

pub static mut SUPER_BLOCK: SuperBlock = SuperBlock::uninit();
pub static mut FREE_INODE: usize = 1;
pub static mut FREE_BLOCKS: usize = 0;

const BITMAP_NUMBER: usize = FSSIZE / (BSIZE * 8) + 1;
const INODE_BLOCK_NUMBER: usize = NINODES / IPB + 1;
const LOG_NUMBER: usize = LOGSIZE;
/// Number of meta blocks (boot, sb, nlog, inode, bitmap)
const META_NUMBER: usize = 2 + LOG_NUMBER + INODE_BLOCK_NUMBER + BITMAP_NUMBER;
/// Number of data blocks
const DATA_NUMBER: usize = FSSIZE - META_NUMBER;

/// Root innode number
const ROOT_INUM: u32 = 1;

pub struct BlockDevice(Mutex<File>);

impl BlockDevice {
    fn read(&self, sector_id: u32, buf: &mut [u8]) {
        let sector = sector_id as usize;
        let mut file = self.0.lock().unwrap();
        let read_pos = (sector * BSIZE) as u64;
        if file
            .seek(SeekFrom::Start(read_pos))
            .is_err() {
                panic!("read sector: Fail to seek for sector.");
            }
        if file.read(buf).is_err() {
            panic!("read sector: Fail to read sector.");
        }
    }

    fn write(&self, sector_id: u32, buf: &[u8]) {
        let sector = sector_id as usize;
        let mut file = self.0.lock().unwrap();
        let write_pos = (sector * BSIZE) as u64;
        if file
            .seek(SeekFrom::Start(write_pos))
            .is_err() {
               panic!("write sector: Fail to seek for sector."); 
        }
        if file.write(buf).unwrap() != BSIZE {
            panic!("write sector: Fail to write sector");
        }
    }

    fn alloc(&self, used: usize) {
        let mut buf:Vec<u8> = vec![0;BSIZE];
        let bmapstart = unsafe{ SUPER_BLOCK.bmapstart() };
        println!("balloc: First {} blocks have been allocated.\n", used);
        assert!(used < 8 * BSIZE);
        
        for i in 0..used {
            buf[i/8] = buf[i/8] | (1 << (i % 8));
        }
        println!("balloc: write bitmap block at sector {}", bmapstart);
        self.write(bmapstart, &buf);
    }

    /// Initialize fs.img, only call unitl create fs.img
    fn write_zero(&self) {
        let buf = vec![0;BSIZE];
        for i in 0..FSSIZE {
            self.write(i as u32, &buf);
        }
    }

    /// Write superblock into secotr
    fn write_sb(&self, raw_sb: &RawSuperBlock) {
        let mut buf = vec![0;BSIZE];
        unsafe {
            ptr::write(buf.as_mut_ptr() as *mut RawSuperBlock, *raw_sb);
        }
        // println!("{:?}", &buf);
        self.write(1, &buf);
    }

    /// Allocate inode and return inode number. 
    fn alloc_inode(&self, itype: u16) -> u32 {
        let inum: u32;
        unsafe {
            inum = FREE_INODE as u32;
            FREE_INODE += 1;
        }
        let mut dinode = Box::new(DiskInode::new());
        let mut buf:Vec<u8> = vec![0;BSIZE];
        dinode.itype = bytes_order_u16(itype);
        dinode.nlink = bytes_order_u16(1);
        dinode.size = bytes_order_u32(0);

        unsafe{
            ptr::write(buf.as_mut_ptr() as *mut DiskInode, *dinode);
        }

        self.write(inum, &buf);
        inum
    }

    fn write_inode(&self, inum: u32, inode: &DiskInode) {
        let mut buf = vec![0;BSIZE];
        let block_number = unsafe{ SUPER_BLOCK.locate_inode(inum) };
        self.read(block_number, &mut buf);
    
        let offset = (inum as usize % IPB) as isize;
        unsafe {
            let dinode = (buf.as_mut_ptr() as *mut DiskInode).offset(offset);
            ptr::write(dinode, *inode);
        }
        self.write(block_number, &buf);
    }
    
    fn read_inode(&self, inum: u32, inode: &mut DiskInode) {
        let mut buf = vec![0;BSIZE];
        let block_number = unsafe{ SUPER_BLOCK.locate_inode(inum) };
    
        self.read(block_number, &mut buf);
        let offset = (inum as usize % IPB) as isize;
        unsafe {
            let dinode = (buf.as_ptr() as *const DiskInode).offset(offset);
            let dinode_val = ptr::read(dinode);
            ptr::write(inode as *mut DiskInode, dinode_val);
        }
    }    
    
    fn append_inode(&self, inum: u32) {
        let mut dinode:DiskInode = DiskInode::new();
        let mut buf = vec![0;BSIZE]; 
        self.read(inum, &mut buf);
        unsafe{
            ptr::write(&mut dinode as *mut DiskInode, *(buf.as_ptr() as *const DiskInode))
        }
    }
}


/// Convert to intel byte order
fn bytes_order_u16(x: u16) -> u16 {
   let mut y: [u8; 2];
   y = x.to_be_bytes();
   y.reverse();
   ((y[0] as u16) << 8) | y[1] as u16
   
}

fn bytes_order_u32(x: u32) -> u32 {
   let mut y: [u8; 4];
   y = x.to_be_bytes();
   y.reverse();
  ((y[0] as u32) << 24) | ((y[1] as u32) << 16) | ((y[2] as u32) << 8) | y[3] as u32
}


pub fn main() {
    assert!(BSIZE % size_of::<Dirent>() == 0);
    assert!(BSIZE % size_of::<DiskInode>() == 0);

    let block_device = BlockDevice(
       Mutex::new(
        OpenOptions::new()
        .read(true)
        .write(true)
        .create(true)
        .truncate(true)
        .open(FS_IMG)
        .expect("Fail to open fs.img."),
       )
    );

    // 1 fs block = 1 disk sector 
    let raw_sb = unsafe{ SUPER_BLOCK.write() };
    // Initialize raw superblock. 
    raw_sb.magic = FSMAGIC;
    raw_sb.size = bytes_order_u32(FSSIZE as u32);
    raw_sb.nblocks = bytes_order_u32(DATA_NUMBER as u32);
    raw_sb.ninodes = bytes_order_u32(NINODES as u32);
    raw_sb.logstart = bytes_order_u32(2);
    raw_sb.inodestart = bytes_order_u32(2 + LOG_NUMBER as u32);
    raw_sb.bmapstart = bytes_order_u32((2 + LOG_NUMBER + INODE_BLOCK_NUMBER) as u32);

    println!(
           "meta data :{}\nboot block: 1\nsuper block: 1\nlog blocks :{}\ninode blocks :{}\nbitmap blocks :{}\ndata blocks :{} \ntotal blocks :{} ",
            META_NUMBER, LOG_NUMBER, INODE_BLOCK_NUMBER, BITMAP_NUMBER, DATA_NUMBER, FSSIZE
        );

    // initialize free blocks. 
    unsafe{ FREE_BLOCKS = META_NUMBER };

    // Initialize fs.img 
    block_device.write_zero();

    // Initialize SuperBlock
    block_device.write_sb(raw_sb);

    // Initialize root inode
    let root_inode = block_device.alloc_inode(1);
    assert!(root_inode == ROOT_INUM, "root inode number is {}", root_inode);

}