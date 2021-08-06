#![no_std]
#![feature(llvm_asm)]
#![feature(asm)]
#![feature(alloc_error_handler)]

#[macro_use]
pub mod syscall;
pub mod print;
pub use syscall::*;
mod allocator;

extern crate alloc;

  
pub const O_RDONLY: u32 = 0x000;
pub const O_WRONLY: u32 = 0x001;
pub const O_RDWR: u32 = 0x002;
pub const O_CREATE: u32 = 0x200;
pub const O_TRUNC: u32 = 0x400;

pub const CONSOLE: usize = 1;

pub const STDIN: usize = 0;
pub const STDOUT: usize = 1;
pub const STDERR: usize = 2;

pub fn fork() -> SysRet {
    sys_fork()
}

pub fn open(path: &str, flags: u32) -> SysRet {
    sys_open(path, flags)
}

pub fn close(fd: usize) -> SysRet {
    sys_close(fd)
}

pub fn dup(fd: usize) -> SysRet {
    sys_dup(fd)
}

pub fn mknod(path: &str, mode: usize, dev: usize) -> SysRet {
    sys_mknod(path, mode, dev)
}

pub fn exit(exit_code: i32) -> ! {
    sys_exit(exit_code)
}

pub fn exec(path: &str, args: &[*const u8]) -> SysRet {
    sys_exec(path, args)
}

pub fn read(fd: usize, buf: &mut [u8], n: usize) -> SysRet {
    sys_read(fd, buf, n)
}

pub fn write(fd: usize, buf: &[u8], n: usize) -> SysRet {
    sys_write(fd, buf, n)
}

pub fn wait(status: isize) -> SysRet {
    sys_wait(status)
}

pub fn sbrk(bytes: usize) -> SysRet {
    sys_sbrk(bytes)
}