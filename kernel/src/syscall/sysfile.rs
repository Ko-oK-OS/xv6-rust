use crate::fs::VFile;
use super::*;

use alloc::vec;


pub fn sys_read() -> Result<usize, &'static str> {
    let mut file: VFile= VFile::init();
    let mut addr: usize = 0;
    let mut size: usize = 0;
    if argfd(0, &mut 0, &mut file).is_err() 
        || argint(2, &mut size).is_err() 
        || argint(1, &mut addr).is_err() {
        return Err("sys_read: Fail to get arguments.")
    }
    let mut buf = vec![0;size];
    let buf = &mut buf[..];

    file.read(addr, buf)
}

// pub fn sys_write() -> Result<usize, &'static str> {
//     let mut file = VFile::init();
//     let mut addr: usize = 0;
//     let mut size: usize = 0;
// }