use core::ptr::NonNull;

use crate::{define::{fs::OpenMode, param::MAXPATH}, fs::{FILE_TABLE, FileType, ICACHE, Inode, InodeData, InodeType, LOG, VFile, create}, lock::sleeplock::{SleepLock, SleepLockGuard}};
use super::*;

use alloc::vec;
use bit_field::BitField;

pub fn sys_dup() -> SysResult {
    let mut file: VFile = VFile::init();
    let fd: usize;
    arg_fd(0, &mut 0, &mut file)?;
    match unsafe {
        CPU_MANAGER.alloc_fd(&mut file)
    } {
        Ok(cur_fd) => {
            fd = cur_fd;
        }

        Err(err) => {
            println!("{}", err);
            return Err(())
        }
    }
    file.dup();
    Ok(fd)
}

/// read file data by special vfile. 
pub fn sys_read() -> SysResult {
    let size: usize;
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
    match file.read(ptr, len) {
        Ok(cur_size) => {
            size = cur_size;
        },

        Err(err) => {
            println!("{}", err);
            return Err(())
        }
    }
    Ok(size)
}

/// Write into file.
pub fn sys_write() -> SysResult {
    let mut file = VFile::init();
    let mut ptr: usize = 0;
    let mut len: usize = 0;
    let size;

    arg_fd(0, &mut 0, &mut file)?;
    arg_addr(1, &mut ptr)?;
    arg_int(2, &mut len)?;

    match file.write(ptr, len) {
        Ok(cur_size) => {
            size = cur_size;
        },
        Err(err) => {
            println!("{}", err);
            return Err(())
        }
    }
    Ok(size)
}

pub fn sys_open() -> SysResult {
    let mut path = [0;MAXPATH];
    let mut open_mode = 0;
    let mut fd = 0;
    let mut inode: Inode;
    let mut file: &mut VFile;
    let mut inode_guard: SleepLockGuard<InodeData>;
    // Get file path
    arg_str(0, &mut path, MAXPATH)?;
    // Get open mode
    arg_int(1, &mut open_mode)?;
    // Start write log
    LOG.begin_op();
    match OpenMode::mode(open_mode) {
        OpenMode::CREATE => {
            match create(&path, crate::fs::InodeType::File, 0, 0) {
                Ok(cur_inode) => {
                    inode = cur_inode;
                    inode_guard = inode.lock();
                },
                Err(err) => {
                    LOG.end_op();
                    println!("{}", err);
                    return Err(())
                }
            }
        },

        _ => {
            match ICACHE.namei(&path) {
                Some(cur_inode) => {
                    inode = cur_inode;
                    inode_guard = inode.lock();
                    if inode_guard.dinode.itype == InodeType::Directory && open_mode != OpenMode::RDONLY as usize{
                        drop(inode_guard);
                        LOG.end_op();
                        println!("Fail to enter dir.");
                        return Err(());
                    }
                },
                None => {
                    LOG.end_op();
                    println!("Fail to find file");
                    return Err(())
                }
            }
        }
    }
    
    // Allocate file descriptor
    match unsafe{ FILE_TABLE.allocate() }  {
        Some(cur_file) => {
            file = cur_file;
            match unsafe {
                CPU_MANAGER.alloc_fd(file)
            } {
                Ok(cur_fd) => {
                    fd = cur_fd;
                }
                Err(err) => {
                    println!("{}", err);
                    return Err(())
                }
            }
        }

        None => {
            drop(inode_guard);
            LOG.end_op();
            println!("Fail to allocate file");
            return Err(())
        }
    }

    match inode_guard.dinode.itype {
        InodeType::Device => {
            file.ftype = FileType::Device;
            file.major = inode_guard.dinode.major;
        },
        _ => {
            file.ftype = FileType::Inode;
            file.offset = 0;
        }
    }

    if open_mode.get_bit(11) && inode_guard.dinode.itype == InodeType::File {
        inode_guard.truncate(&inode);
    }

    // Drop guard for immutable borrow
    drop(inode_guard);
    LOG.end_op();

    file.inode = Some((&mut inode) as *mut Inode);
    file.writeable = !open_mode.get_bit(0);
    file.readable = open_mode.get_bit(0) | open_mode.get_bit(1);
    Ok(fd)

}

pub fn sys_close() -> SysResult {
    let mut fd = 0;
    let mut file = VFile::init();
    arg_fd(0, &mut fd, &mut file)?;
    let proc = unsafe {
        CPU_MANAGER.myproc().unwrap()
    };
    unsafe {
        (&mut *proc.extern_data.get()).fd_close(fd)
    };
    file.close();
    Ok(0)
}