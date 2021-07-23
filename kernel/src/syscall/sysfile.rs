use crate::{define::{fs::OpenMode, param::MAXPATH}, fs::{InodeData, LOG, VFile}, lock::sleeplock::SleepLockGuard};
use super::*;

use alloc::vec;

/// read file data by special vfile. 
pub fn sys_read() -> Result<usize, &'static str> {
    let mut file = VFile::init();
    // Get file
    arg_fd(0, &mut 0, &mut file)?;
    // Get user read address
    let mut ptr: usize = 0;
    arg_addr(1, &mut ptr)?;
    // Get read size
    let mut len: usize = 0;
    arg_int(2, &mut len)?;
    // Read file data
    let size = file.read(ptr, len)?;
    Ok(size)
}

/// Write into file.
pub fn sys_write() -> Result<usize, &'static str> {
    let mut file = VFile::init();
    let mut ptr: usize = 0;
    let mut len: usize = 0;

    arg_fd(0, &mut 0, &mut file)?;
    arg_addr(1, &mut ptr)?;
    arg_int(2, &mut len)?;

    let size = file.write(ptr, len)?;
    Ok(size)
}

pub fn sys_open() -> Result<usize, &'static str> {
    let mut path = [0;MAXPATH];
    let mut open_mode = 0;
    let mut fd = 0;
    // Get file path
    arg_str(0, &mut path, MAXPATH)?;
    // Get open mode
    arg_int(1, &mut open_mode)?;
    // Start write log
    LOG.begin_op();

    match OpenMode::mode(open_mode) {
        OpenMode::CREATE => {
            let inode_guard: SleepLockGuard<InodeData>;
            
        },

        _ => {

        }
    }

    Ok(fd)

}