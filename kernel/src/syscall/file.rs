use core::char::MAX;
use core::ptr::drop_in_place;
use core::str::from_utf8;
use core::usize;
use core::{ptr::NonNull, slice::from_raw_parts_mut};
use core::slice::from_raw_parts;
use core::cell::RefCell;

use crate::arch::riscv::qemu::fs::DIRSIZ;
use crate::arch::riscv::qemu::layout::PGSIZE;
use crate::arch::riscv::qemu::param::MAXARG;
use crate::memory::{ RawPage, PageAllocator };
use crate::misc::str_cmp;
use crate::{arch::riscv::qemu::{fs::OpenMode, param::MAXPATH}, fs::{FileType, ICACHE, Inode, InodeData, InodeType, LOG, VFile}, lock::sleeplock::{SleepLock, SleepLockGuard}};
use crate::fs::{Pipe, DirEntry};
use super::*;

use alloc::string::String;
use alloc::sync::Arc;
use alloc::vec;
use bit_field::BitField;

impl Syscall<'_> {
    pub fn sys_dup(&self) -> SysResult {
        let old_fd = self.arg(0);
        let pdata = unsafe{ &mut *self.process.data.get() };
        let file = pdata.open_files[old_fd].as_ref().unwrap();
        // 使用 Arc 来代替 refs
        let new_fd = unsafe{ CPU_MANAGER.alloc_fd(&file) }.unwrap();
        let new_file = Arc::clone(&file);
        pdata.open_files[new_fd].replace(new_file);
        Ok(new_fd)
    }

    /// read file data by special vfile. 
    pub fn sys_read(&self) -> SysResult {
        let size: usize;
        // Get file
        let fd = self.arg(0);
        let pdata = unsafe{ &mut *self.process.data.get() };
        let file = pdata.open_files[fd].as_ref().unwrap();
        // 两个参数分别是读取存储的地址和读取的最大字节数
        // Get user read address
        let ptr = self.arg(1);
        // Get read size
        let len = self.arg(2);
        // Read file data
        match file.read(ptr, len) {
            Ok(cur_size) => {
                size = cur_size;
            },

            Err(err) => {
                #[cfg(feature = "kernel_warning")]
                println!("[kernel] sys_read: err: {}", err);
                return Err(())
            }
        }
        // println!("[Kernel] sys_read: dir_entry size: {}, size: {}",size_of::<DirEntry>() ,size);
        Ok(size)
    }

    /// Write into file.
    pub fn sys_write(&self) -> SysResult {
        let size;
        let fd = self.arg(0);
        let pdata = unsafe{ &mut *self.process.data.get() };
        let file = pdata.open_files[fd].as_ref().unwrap();
        let ptr = self.arg(1);
        let len = self.arg(2);
        match file.write(ptr, len) {
            Ok(cur_size) => {
                size = cur_size;
            },
            Err(err) => {
                println!("[Kernel] sys_write: err: {}", err);
                return Err(())
            }
        }
        Ok(size)
    }

    pub fn sys_open(&self) -> SysResult {
        let mut path = [0;MAXPATH];
        let inode: Inode;
        let mut file: VFile;
        let mut inode_guard: SleepLockGuard<InodeData>;
        // Get file path
        let addr = self.arg(0);
        self.copy_from_str(addr, &mut path, MAXPATH).unwrap();
        // Get open mode
        let open_mode = self.arg(1);
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
                        println!("[Kernel] syscall: sys_open: {}", err);
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
                            return Err(());
                        }
                    },
                    None => {
                        LOG.end_op();
                        return Err(())
                    }
                }
            }
        }
        file = VFile::init();
        match inode_guard.dinode.itype {
            InodeType::Device => {
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
    
        file.inode = Some(inode);
        // 0x0 -> read only
        // 0x1 -> write only
        // 0x2 -> read & write
        file.writeable = open_mode.get_bit(0) | open_mode.get_bit(1);
        file.readable = !open_mode.get_bit(0) | open_mode.get_bit(1);
        let fd;
        match unsafe { CPU_MANAGER.alloc_fd(&file) } {
            Ok(new_fd) => {
                fd = new_fd;
            }
            Err(err) => {
                println!("[Kernel] sys_open: err: {}", err);
                return Err(())
            }
        }
        Ok(fd)
    
    }
    
    pub fn sys_exec(&self) -> SysResult {
        let mut path = [0u8;MAXPATH];
        let mut argv = [0 as *mut u8; MAXARG];
        let mut user_arg: usize;
        let addr = self.arg(0);
        self.copy_from_str(addr, &mut path, MAXPATH).unwrap();
        let user_argv = self.arg(1);
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
            self.copy_form_addr(
                user_argv + count * size_of::<usize>(), 
                &mut buf, 
                8
            )?;

            user_arg = usize::from_le_bytes(buf);
            if user_arg == 0 {
                argv[count] = 0 as *mut u8;
                break;
            }
            let mem = unsafe{ RawPage::new_zeroed() as *mut u8 };
            argv[count] = mem;
            let buf = unsafe { from_raw_parts_mut(mem, PGSIZE) };
            self.copy_from_str(
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
            exec(path, &argv).map_err(
                |_|(())
            )?
        };
    
        for i in 0..MAXARG {
            if argv[i] != 0 as *mut u8 {
                unsafe{ drop_in_place(argv[i] as *mut RawPage) };
            }
        }
        // println!("[Debug] sys_exec return {}", ret);
        Ok(ret)
    }

    pub fn sys_mknod(&self) -> SysResult {
        let mut path: [u8; MAXPATH] = [0;MAXPATH];
        let major = self.arg(1);
        let minor = self.arg(2);
        LOG.begin_op();
        // Get file path
        let addr = self.arg(0);
        self.copy_from_str(addr, &mut path, MAXPATH)?;
        match ICACHE.create(
            &path, 
            InodeType::Device, 
            major as i16, 
            minor as i16
        ) {
            Ok(inode) => {
                LOG.end_op();
                drop(inode);
                Ok(0)
            },
    
            Err(err) => {
                println!("[Kernel] sys_mknod: err: {}", err);
                LOG.end_op();
                Err(())
            }
        }
    
    }

    pub fn sys_close(&self) -> SysResult {
        let fd = self.arg(0);
        let pdata = unsafe{ &mut *self.process.data.get() };
        // 使用 take() 夺取所有权来将引用数减 1
        pdata.open_files[fd].take();
        Ok(0)
    }

    pub fn sys_fstat(&self) -> SysResult {
        let fd = self.arg(0);
        let stat = self.arg(1);

        #[cfg(feature = "kernel_debug")]
        println!("[Kernel] sys_fstat: fd: {}, stat:0x{:x}", fd, stat);

        let pdata = unsafe{ &mut *self.process.data.get() };
        let file = pdata.open_files[fd].as_ref().unwrap();

        #[cfg(feature = "kernel_debug")]
        println!("[Kernel] sys_fstat: File Type: {:?}", file.ftype);

        match file.stat(stat) {
            Ok(()) => {
                return Ok(0)
            },

            Err(err) => {
                println!("[Kernel] sys_stat: err: {}", err);
                return Err(())
            }
        }
    }

    pub fn sys_chdir(&self) -> SysResult {
        let mut path = [0u8; MAXPATH];
        LOG.begin_op();
        let addr = self.arg(0);
        self.copy_from_str(addr, &mut path, MAXPATH)?;
        match ICACHE.namei(&path) {
            Some(inode) => {
                let inode_guard = inode.lock();
                match inode_guard.dinode.itype {
                    InodeType::Directory => {
                        drop(inode_guard);
                        let old_cwd = unsafe{ (&mut *self.process.data.get()).cwd.replace(inode) };
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

    pub fn sys_pipe(&self) -> SysResult {
        // User use an array to represent two file. 
        // let mut fd_array: usize = 0;
        let mut rf: &mut VFile = &mut VFile::init();
        let mut wf: &mut VFile = &mut VFile::init();
        // arg_addr(0, &mut &mut fd_array)?;
        let fd_array = self.arg(0);
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
                // rf.close();
                println!("[Kernel] sys_pipe: err: {}", err);
                return Err(())
            }
        }
        
        match p.fd_alloc(wf) {
            Ok(fd) => {
                wfd = fd;
            },

            Err(err) => {
                // rf.close();
                // wf.close();
                println!("[Kernel] sys_pipe: err: {}", err);
                return Err(())
            }
        }

        let pgt = p.page_table();
        let pdata = unsafe{ &mut *self.process.data.get() };
        let open_files = &mut pdata.open_files;
        if pgt.copy_out(fd_array, rf as *const _ as *const u8, size_of::<usize>()).is_err() {
            open_files[rfd].take();
            open_files[wfd].take();
            // rf.close();
            // wf.close();
            return Err(())
        }

        if pgt.copy_out(
            fd_array + size_of::<usize>(), 
            wf as *const _ as *const u8, 
            size_of::<usize>()
        ).is_err() {
            open_files[rfd].take();
            open_files[wfd].take();
            // rf.close();
            // wf.close();
            return Err(())
        }
        Ok(0)
    }

    pub fn sys_unlink(&self) -> SysResult {
        let mut path = [0u8; MAXPATH];
        let mut name = [0u8; DIRSIZ];
        let parent: Inode;
        let inode: Inode;

        let addr = self.arg(0);
        self.copy_from_str(addr, &mut path, MAXPATH)?;

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
    pub fn sys_link(&self) -> SysResult {
        let mut new_path = [0u8; MAXPATH];
        let mut old_path = [0u8; MAXPATH];
        let mut name = [0u8; DIRSIZ];
        let inode: Inode;
        let parent: Inode;

        let old_path_addr = self.arg(0);
        let new_path_addr = self.arg(1);
        self.copy_from_str(old_path_addr, &mut old_path, MAXPATH)?;
        self.copy_from_str(new_path_addr, &mut new_path, MAXPATH)?;

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

    pub fn sys_mkdir(&self) -> SysResult {
        let mut path = [0u8; MAXPATH];
        LOG.begin_op();
        let addr = self.arg(0);
        self.copy_from_str(addr, &mut path, MAXPATH)?;
        match ICACHE.create(&path, InodeType::Directory, 0, 0) {
            Ok(inode) => {
                drop(inode);
                LOG.end_op();
                Ok(0)
            },

            Err(err) => {
                println!("[Kernel] sys_mkdir: err: {}", err);
                Err(())
            }
        }
    }

}






