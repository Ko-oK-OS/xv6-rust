extern crate fs_lib;

use std::io::{BufRead, BufReader, Read, Seek, SeekFrom, Write};
use std::str::from_utf8;
use std::sync::Mutex;
use std::ptr;
use std::mem::size_of;
use std::fs::{ File, OpenOptions };
use std::cmp::min;
use std::sync::atomic::AtomicBool;

use fs_lib::{BSIZE, FSMAGIC, FSSIZE, IPB, LOGSIZE, MAXFILE, NDIRECT, NINDIRECT, NINODES, RawSuperBlock};
use fs_lib::{ DirEntry, DiskInode, InodeType };
use fs_lib::SuperBlock;

// Disk Layout
// [ boot block | sb block | log | inode blocks | free bit map | data blocks ]


pub static FS_IMG: &'static str = "../fs.img";
pub static USERPROG_DIR: &'static str = "../bin/";
pub static USER_PROGRAMS: [&'static str; 2] = [
    "init",
    "hello_world",
];

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
        println!("{:?}", unsafe{ *(buf.as_ptr() as *const RawSuperBlock) });
        self.write(1, &buf);
    }

    /// read superblock from sector
    fn read_sb(&self) {
        let mut buf = vec![0;BSIZE];
        self.read(1, &mut buf);
        println!("{:?}", unsafe{ *(buf.as_ptr() as *const RawSuperBlock) });
    }

    /// Allocate inode and return inode number. 
    fn alloc_inode(&self, itype: u16) -> u32 {
        let inum: u32;
        unsafe {
            inum = FREE_INODE as u32;
            FREE_INODE += 1;
        }
        let mut dinode = Box::new(DiskInode::new());
        dinode.itype = bytes_order_u16(itype);
        dinode.nlink = bytes_order_u16(1);
        dinode.size = bytes_order_u32(0);

        self.write_inode(inum, &dinode);
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
    

    fn append_inode(&self, inum: u32, mut data: *const u8, mut count: usize) {
        println!("Enter append inode");
        let mut dinode: DiskInode = DiskInode::new();
        let mut indirect = vec![0u8;BSIZE];
        let mut buf = vec![0;BSIZE]; 
        let mut addr: u32 = 0;

        // Read inode number inum into dinode
        self.read(inum, &mut buf);
        unsafe{
            ptr::write(&mut dinode as *mut DiskInode, *(buf.as_ptr() as *const DiskInode))
        }
        // Inode might already have some data, offset is the last bytes it have. 
        let mut offset = bytes_order_u32(dinode.size);

        // While we have bytes to write into inode, loop. 
        while count > 0 {
            // Get the block number of the last block from offset
            let block_number = offset as usize / BSIZE;
            assert!(block_number < MAXFILE, "Block Number must be less than MAXFILE.");
            // If block number is still inside direct blocks
            if block_number < NDIRECT {
                // is block allocated?
                if bytes_order_u32(dinode.addrs[block_number]) == 0 {
                    // no allocate it by incrementing freeblock pointer. 
                    unsafe {
                        dinode.addrs[block_number] = bytes_order_u32(FREE_BLOCKS as u32);
                        FREE_BLOCKS += 1;
                    }
                }
                // allocated ... get the block
                addr = bytes_order_u32(dinode.addrs[block_number]);
            } else {
                // it's a indirect block
                if bytes_order_u32(dinode.addrs[NDIRECT]) == 0 {
                    // was first level of indirection allocated?
                    unsafe {
                        dinode.addrs[NDIRECT] = bytes_order_u32(FREE_BLOCKS as u32);
                        FREE_BLOCKS += 1;
                    }
                }
                // read the sector that contains 1 level indirect table 
                // into indirect. 
                self.read(bytes_order_u32(dinode.addrs[NDIRECT]), &mut indirect);
                // Some convert for rust features. 
                let indirect_block_number = block_number - NDIRECT;
                let mut indirect = unsafe{ 
                    Vec::from_raw_parts(
                        indirect.as_mut_ptr() as *mut u32, 
                        indirect.len()/4, 
                        indirect.capacity()/4
                    ) 
                };

                assert!(indirect_block_number < NINDIRECT, "indirect offset should be less than BSIZE");

                // Check if the entry already allocated in the table. 
                if indirect[indirect_block_number] == 0 {
                    // no allocated, allocate a new block and 
                    // update the first indirect table. 
                    unsafe{
                        let indirect_data = bytes_order_u32(FREE_BLOCKS as u32);
                        FREE_BLOCKS += 1;
                        indirect[indirect_block_number] = indirect_data;
                        let indirect = Vec::from_raw_parts(
                            indirect.as_mut_ptr() as *mut u8, 
                            indirect.len() * 4, 
                            indirect.capacity()*4
                        );
                        self.write(dinode.addrs[NDIRECT], &indirect);
                    }
                }
                // get sector number
                addr = bytes_order_u32(indirect[indirect_block_number]);
            }
            let size = min(count, (block_number + 1) * BSIZE - offset as usize);
            // read sector 
            self.read(addr, &mut buf);

            // copy data into buf
            let write_ptr = buf_offset(&mut buf, offset as usize - (block_number * BSIZE));
            block_copy(data, write_ptr, size);

            // write back the sector
            self.write(addr, &buf);

            // update the size of write bytes and offset. 
            count -= size;
            offset += size as u32;
            data = unsafe{ data.offset(size as isize) };
            println!("size: {}", size);
            println!("count: {}", count);
        }
        dinode.size = bytes_order_u32(offset);
        // write back the inode
        self.write_inode(inum, &dinode);
        println!("Write back inode.");
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


/// Copy Data form one to the other
pub fn block_copy(src: *const u8, dst: *mut u8, size: usize) {
    unsafe {
        ptr::copy(src, dst, size);
    }
}

/// Get write pointer by slice and offset
pub fn buf_offset(buf: &mut [u8], offset: usize) -> *mut u8 {
    unsafe{
        buf.as_mut_ptr().offset(offset as isize)
    }
}


pub fn main() {
    assert!(BSIZE % size_of::<DirEntry>() == 0);
    assert!(BSIZE % size_of::<DiskInode>() == 0);
    assert!(size_of::<DirEntry>() == 16);
    assert!(size_of::<DiskInode>() == 64);
    assert!(size_of::<RawSuperBlock>() == 32);


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

    println!("{:?}", raw_sb);
    
    unsafe{ SUPER_BLOCK.initialized = AtomicBool::new(true) };

    println!(
           "meta data :{}\nboot block: 1\nsuper block: 1\nlog blocks :{}\ninode blocks :{}\nbitmap blocks :{}\ndata blocks :{} \ntotal blocks :{} ",
            META_NUMBER, LOG_NUMBER, INODE_BLOCK_NUMBER, BITMAP_NUMBER, DATA_NUMBER, FSSIZE
        );

    // initialize free blocks. 
    unsafe{ FREE_BLOCKS = META_NUMBER };

    // Initialize fs.img 
    println!("initialize fs.img");
    block_device.write_zero();

    // Initialize SuperBlock
    println!("initialize superblock.");
    block_device.write_sb(raw_sb);
    block_device.read_sb();

    // Initialize root inode
    println!("initialize root inode");
    let root_inode = block_device.alloc_inode(1);
    assert!(root_inode == ROOT_INUM, "root inode number is {}", root_inode);

    // Initialize '.' dir
    println!("initialize `.` dir");
    let mut dir_entry: DirEntry = DirEntry::new();
    dir_entry.inum = bytes_order_u16(root_inode as u16);
    let dot = ".";
    unsafe{
        ptr::copy_nonoverlapping(dot.as_bytes().as_ptr(), dir_entry.name.as_mut_ptr(), dot.len());
    }
    // debug
    println!("{}", from_utf8(&dir_entry.name).unwrap());
    let data = (&dir_entry) as *const DirEntry as *const u8;
    block_device.append_inode(root_inode, data, size_of::<DirEntry>());

    // initialize '..' dir
    println!("initialize `..` dir");
    dir_entry.inum = bytes_order_u16(root_inode as u16);
    let dot_dot = "..";
    unsafe{
        ptr::copy_nonoverlapping(dot_dot.as_bytes().as_ptr(), dir_entry.name.as_mut_ptr(), dot_dot.len());
    }
    println!("{}", from_utf8(&dir_entry.name).unwrap());
    let data = (&dir_entry) as *const DirEntry as *const u8;
    block_device.append_inode(root_inode, data, size_of::<DirEntry>());

    // Initialize use programe
    for prog in USER_PROGRAMS.iter() {
        let short_str: &str = "null";
        let path = format!("{}{}", USERPROG_DIR, prog);
        let inum = block_device.alloc_inode(InodeType::File as u16);
        let mut dir_entry = DirEntry::new();
        dir_entry.inum = inum as u16;
        unsafe{
            ptr::copy_nonoverlapping(short_str.as_ptr(), dir_entry.name.as_mut_ptr(), dot_dot.len());
        }
        println!("path: {}", path);
        let mut exec_file = File::open(path).unwrap();
        let mut buf = [0u8;BSIZE];
        while exec_file.read(&mut buf).unwrap() > 0 {
            block_device.append_inode(inum, buf.as_ptr(), BSIZE);
        }
        drop(exec_file);
    }

    // fix size of root inode dir
    let mut dinode = DiskInode::new();
    block_device.read_inode(root_inode, &mut dinode);
    let offset = bytes_order_u32(dinode.size);
    let offset = ((offset as usize / BSIZE) + 1) * BSIZE; 
    dinode.size = bytes_order_u32(offset as u32);
    block_device.write_inode(root_inode, &dinode);

    block_device.alloc(unsafe{ FREE_BLOCKS });
    drop(block_device);

    
}

#[test]
fn fs_test() {
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

     block_device.read_sb();
}
