use core::intrinsics::drop_in_place;
use core::str::from_utf8;
use core::usize;
use core::{ptr::NonNull, slice::from_raw_parts_mut};
use core::slice::from_raw_parts;
use core::cell::RefCell;

use crate::define::fs::DIRSIZ;
use crate::define::layout::PGSIZE;
use crate::define::param::MAXARG;
use crate::memory::{ RawPage, PageAllocator };
use crate::misc::str_cmp;
use crate::{define::{fs::OpenMode, param::MAXPATH}, fs::{FILE_TABLE, FileType, ICACHE, Inode, InodeData, InodeType, LOG, VFile}, lock::sleeplock::{SleepLock, SleepLockGuard}};
use crate::fs::Pipe;
use super::*;

use alloc::string::String;
use alloc::sync::Arc;
use alloc::vec;
use bit_field::BitField;

pub fn sys_dup() -> SysResult {
    // let mut file: VFile = VFile::init();
    let mut fd: usize = 0;
    arg_fd(0, &mut fd)?;
    // println!("[Debug] sys_dup: 文件描述符: {}", fd);
    let proc = unsafe{ CPU_MANAGER.myproc().unwrap() };
    let extern_data = proc.extern_data.get_mut();
    let file = extern_data.open_files[fd].as_ref().unwrap();
    match unsafe {
        CPU_MANAGER.alloc_fd(&file)
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
    // let mut file = VFile::init();
    let mut fd = 0;
    // Get file
    arg_fd(0, &mut fd)?;
    let proc = unsafe{ CPU_MANAGER.myproc().unwrap() };
    let extern_data = proc.extern_data.get_mut();
    let file = extern_data.open_files[fd].as_ref().unwrap();
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
    // println!("[Debug] 调用sys_write");
    let mut file = VFile::init();
    let mut ptr: usize = 0;
    let mut len: usize = 0;
    let mut fd: usize = 0;
    let size;

    arg_fd(0, &mut fd)?;
    let proc = unsafe{ CPU_MANAGER.myproc().unwrap() };
    let extern_data = proc.extern_data.get_mut();
    let file = extern_data.open_files[fd].as_ref().unwrap();
    // println!("[Debug] 文件描述符: {}", fd);
    arg_addr(1, &mut ptr)?;
    arg_int(2, &mut len)?;

    // println!("[Debug] sys_write: {:?}", file);
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
            match ICACHE.create(&path, crate::fs::InodeType::File, 0, 0) {
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
                        println!("[Debug] sys_open: Fail to enter dir.");
                        return Err(());
                    }
                },
                None => {
                    LOG.end_op();
                    // println!("[Debug] sys_open: Fail to find file");
                    return Err(())
                }
            }
        }
    }
    
    // Allocate file descriptor
    match unsafe{ FILE_TABLE.allocate() }  {
        Some(cur_file) => {
            file = cur_file;
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
            // println!("[Debug] sys_open: 文件类型为设备");
            file.ftype = FileType::Device;
            file.major = inode_guard.dinode.major;
            file.readable = true;
            file.writeable = true;
        },
        _ => {
            file.ftype = FileType::Inode;
            file.offset = 0;
            file.readable = true;
            file.writeable = true;
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
    // println!("[Debug] sys_open: 打开的文件为 {:?}", file);

    match unsafe {
        CPU_MANAGER.alloc_fd(file)
    } {
        Ok(cur_fd) => {
            fd = cur_fd;
            // println!("[Debug] sys_open: 分配的文件描述符为:{}", fd)
        }
        Err(err) => {
            println!("{}", err);
            return Err(())
        }
    }
    Ok(fd)

}

pub fn sys_close() -> SysResult {
    let mut fd = 0;
    // let mut file = VFile::init();
    arg_fd(0, &mut fd)?;
    let proc = unsafe{ CPU_MANAGER.myproc().unwrap() };
    let extern_data = proc.extern_data.get_mut();
    // let file = extern_data.open_files[fd].as_ref().unwrap();
    unsafe {
        (&mut *proc.extern_data.get()).fd_close(fd)
    };
    // file.close();
    Ok(0)
}

pub fn sys_exec() -> SysResult {
    let mut path = [0u8;MAXPATH];
    let mut argv = [0 as *mut u8; MAXARG];
    let mut user_argv = 0;
    let mut user_arg: usize = 0;
    arg_str(0, &mut path, MAXPATH)?;
    arg_addr(1, &mut user_argv)?;
    let path = from_utf8(&path).unwrap();

    let mut count = 0;
    loop {
        if count >= argv.len() {
            for i in 0..MAXARG {
                if argv[i] != 0 as *mut u8 {
                    unsafe{ drop_in_place(argv[i] as *mut RawPage) };
                }
            }
            return Err(());
        }
        let mut buf = [0u8;8];
        fetch_addr(
            user_argv + count * size_of::<usize>(), 
            &mut buf, 
            8
        )?;
        // TODO: use little endian to create an native integer?
        user_arg = usize::from_le_bytes(buf);
        if user_arg == 0 {
            argv[count] = 0 as *mut u8;
            break;
        }
        let mem = unsafe{ RawPage::new_zeroed() as *mut u8 };
        argv[count] = mem;
        let buf = unsafe { from_raw_parts_mut(mem, PGSIZE) };

        fetch_str(
            user_arg, 
            buf, 
            PGSIZE
        )?;        
        count += 1;
    }

    let argv = unsafe{ 
        from_raw_parts(
            argv.as_ptr() as *const *const u8, 
            MAXARG
        ) 
    };
    let ret = unsafe {
        exec(path, &argv).expect("Fail to exec")
    };

    for i in 0..MAXARG {
        if argv[i] != 0 as *mut u8 {
            unsafe{ drop_in_place(argv[i] as *mut RawPage) };
        }
    }
    
    Ok(ret)
}

pub fn sys_pipe() -> SysResult {
    // User use an array to represent two file. 
    let mut fd_array: usize = 0;
    let mut rf: &mut VFile = &mut VFile::init();
    let mut wf: &mut VFile = &mut VFile::init();
    arg_addr(0, &mut &mut fd_array)?;
    Pipe::alloc(&mut rf, &mut wf);

    let p = unsafe {
        CPU_MANAGER.myproc().expect("Fail to get my process.")
    };

    // Allocate file descriptor for r/w file. 
    let rfd: usize;
    let wfd: usize;
    match p.fd_alloc(rf) {
        Ok(fd) => {
            rfd = fd;
        },

        Err(err) => {
            rf.close();
            println!("err: {}", err);
            return Err(())
        }
    }
    
    match p.fd_alloc(wf) {
        Ok(fd) => {
            wfd = fd;
        },

        Err(err) => {
            rf.close();
            wf.close();
            println!("err: {}", err);
            return Err(())
        }
    }

    let pgt = p.page_table();
    let extern_data = unsafe {
        &mut *p.extern_data.get()
    };
    let open_files = &mut extern_data.open_files;
    if pgt.copy_out(fd_array, rf as *const _ as *const u8, size_of::<usize>()).is_err() {
        open_files[rfd].take();

        open_files[wfd].take();
        rf.close();
        wf.close();
        return Err(())
    }

    if pgt.copy_out(
        fd_array + size_of::<usize>(), 
        wf as *const _ as *const u8, 
        size_of::<usize>()
    ).is_err() {
        open_files[rfd].take();
        open_files[wfd].take();
        rf.close();
        wf.close();
        return Err(())
    }
    Ok(0)
}

pub fn sys_fstat() -> SysResult {
    // let mut file: VFile = VFile::init();
    let mut stat: usize = 0;
    let mut fd = 0;
    arg_fd(0, &mut fd)?;
    arg_addr(1, &mut stat)?;

    let proc = unsafe{ CPU_MANAGER.myproc().unwrap() };
    let extern_data = proc.extern_data.get_mut();
    let file = extern_data.open_files[fd].as_ref().unwrap();
    match file.stat(stat) {
        Ok(()) => {
            return Ok(0)
        },

        Err(err) => {
            println!("err: {}", err);
            return Err(())
        }
    }
}

pub fn sys_chdir() -> SysResult {
    let mut path = [0u8; MAXPATH];
    let my_proc = unsafe{ CPU_MANAGER.myproc().expect("Fail to get my process.") };
    LOG.begin_op();
    arg_str(0, &mut path, MAXPATH)?;
    match ICACHE.namei(&path) {
        Some(inode) => {
            let inode_guard = inode.lock();
            match inode_guard.dinode.itype {
                InodeType::Directory => {
                    drop(inode_guard);
                    let old_cwd = my_proc.extern_data.get_mut().cwd.replace(inode);
                    drop(old_cwd);
                    LOG.end_op();
                    return Ok(0)
                },

                _ => {
                    LOG.end_op();
                    drop(inode_guard);
                    return Err(())
                }
            }
        },

        None => {
            LOG.end_op();
            return Err(())
        }
    }

}

pub fn sys_mknod() -> SysResult {
    let mut path: [u8; MAXPATH] = [0;MAXPATH];
    let mut major = 0;
    let mut minor = 0;
    LOG.begin_op();
    // Get file path
    arg_str(0, &mut path, MAXPATH)?;
    arg_int(1, &mut major)?;
    arg_int(2, &mut minor)?;
    // println!("[Debug] major: {}, minor: {}", major, minor);
    // println!("[Debug] path: {}", String::from_utf8(path.to_vec()).unwrap());
    match ICACHE.create(
        &path, 
        InodeType::Device, 
        major as i16, 
        minor as i16
    ) {
        Ok(inode) => {
            LOG.end_op();
            drop(inode);
            // println!("[Debug] create: 创建成功");
            Ok(0)
        },

        Err(err) => {
            println!("err: {}", err);
            LOG.end_op();
            // println!("[Debug] create: 创建失败");
            Err(())
        }
    }

}

pub fn sys_unlink() -> SysResult {
    let mut path = [0u8; MAXPATH];
    let mut name = [0u8; DIRSIZ];
    let mut parent: Inode;
    let mut inode: Inode;

    arg_str(0, &mut path, MAXPATH)?;

    LOG.begin_op();
    match ICACHE.namei_parent(&path, &mut name) {
        Some(cur) => {
            parent = cur;
        },
        None => {
            LOG.end_op();
            return Err(())
        }
    }
    let mut parent_guard = parent.lock();
    if str_cmp(&name, ".".as_bytes(), DIRSIZ) &&
        str_cmp(&name, "..".as_bytes(), DIRSIZ) {
            drop(parent_guard);
            LOG.end_op();
            return Err(())
    }
    match parent_guard.dir_lookup(&name) {
        Some(cur) => {
            inode = cur;
        },
        _ => {
            drop(parent_guard);
            LOG.end_op();
            return Err(())
        }
    }

    let mut inode_guard = inode.lock();
    if inode_guard.dinode.nlink < 1 {
        panic!("sys_unlink: inods's nlink must be larger than 1.");
    }

    if inode_guard.dinode.itype == InodeType::Directory && 
        !inode_guard.is_dir_empty() {
            drop(inode_guard);
            drop(parent_guard);
            LOG.end_op();
            return Err(())
        }

    if inode_guard.dinode.itype == InodeType::Directory {
        parent_guard.dinode.nlink -= 1;
        parent_guard.update();
    }
    drop(parent_guard);

    inode_guard.dinode.nlink -= 1;
    inode_guard.update();
    drop(inode_guard);

    LOG.end_op();
    Ok(0)
}

/// Create the path new as a link to the same inode as old.
pub fn sys_link() -> SysResult {
    let mut new_path = [0u8; MAXPATH];
    let mut old_path = [0u8; MAXPATH];
    let mut name = [0u8; DIRSIZ];
    let mut inode: Inode;
    let mut parent: Inode;

    arg_str(0, &mut old_path, MAXPATH)?;
    arg_str(1, &mut new_path, MAXPATH)?;

    LOG.begin_op();
    match ICACHE.namei(&old_path) {
        Some(cur) => {
            inode = cur;
        },

        None => {
            LOG.end_op();
            return Err(())
        }
    }
    let mut inode_guard = inode.lock();
    if inode_guard.dinode.itype == InodeType::Directory {
        drop(inode_guard);
        LOG.end_op();
        return Err(())
    }

    inode_guard.dinode.nlink += 1;

    match ICACHE.namei_parent(&new_path, &mut name) {
        Some(cur) => {
            parent = cur;
        },

        _ => {
            inode_guard.dinode.nlink -= 1;
            drop(inode_guard);
            LOG.end_op();
            return Err(())
        }
    }
    let mut parent_guard = parent.lock();
    if parent_guard.dinode.itype != InodeType::Directory || 
        parent_guard.dir_link(&name, inode.inum).is_ok() {
            drop(parent_guard);
            inode_guard.dinode.nlink -= 1;
            drop(inode_guard);
            LOG.end_op();
            return Err(())
        }
    
    inode_guard.update();
    drop(inode_guard);
    LOG.end_op();
    return Ok(0)
}

pub fn sys_mkdir() -> SysResult {
    let mut path = [0u8; MAXPATH];
    LOG.begin_op();
    arg_str(0, &mut path, MAXPATH)?;
    match ICACHE.create(&path, InodeType::Directory, 0, 0) {
        Ok(inode) => {
            drop(inode);
            LOG.end_op();
            Ok(0)
        },

        Err(err) => {
            println!("err: {}", err);
            Err(())
        }
    }
}