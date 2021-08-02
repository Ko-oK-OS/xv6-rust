#![no_std]
#![feature(llvm_asm)]
#![feature(asm)]

// extern crate alloc;

use core::alloc::{GlobalAlloc, Layout};

use allocator::*;
use spin::Mutex;

// #[global_allocator]
// pub static USER_HEAP: UserHeap = UserHeap::uninit();

// pub struct UserHeap(Mutex<BuddySystem>);

// unsafe impl GlobalAlloc for UserHeap {
//     unsafe fn alloc(&self, layout: Layout) -> *mut u8 {
//         let ptr = self.0.lock().alloc(layout);
//         // println!("alloc addr: 0x{:x}", ptr as usize);
//         ptr
//     }

//     unsafe fn dealloc(&self, ptr: *mut u8, layout: Layout) {
//         self.0.lock().dealloc(ptr, layout)
//     }
// }

// impl UserHeap {
//     const fn uninit() -> Self {
//         Self(Mutex::new(BuddySystem::uninit()))
//     }

// }

#[macro_use]
pub mod syscall;
pub mod print;
pub use syscall::*;
  
pub const O_RDONLY: u32 = 0x000;
pub const O_WRONLY: u32 = 0x001;
pub const O_RDWR: u32 = 0x002;
pub const O_CREATE: u32 = 0x200;
pub const O_TRUNC: u32 = 0x400;

pub const CONSOLE: usize = 1;

pub const STDIN: usize = 0;
pub const STDOUT: usize = 1;
pub const STDERR: usize = 2;

pub fn fork() -> isize {
    sys_fork()
}

pub fn open(path: &str, flags: u32) -> isize {
    sys_open(path, flags)
}

pub fn close(fd: usize) -> isize {
    sys_close(fd)
}

pub fn dup(fd: usize) -> isize {
    sys_dup(fd)
}

pub fn mknod(path: &str, mode: usize, dev: usize) -> isize {
    sys_mknod(path, mode, dev)
}

pub fn exit(exit_code: i32) -> ! {
    sys_exit(exit_code)
}

pub fn exec(path: &str, args: &[*const u8]) -> isize {
    sys_exec(path, args)
}

pub fn write(fd: usize, buf: &[u8], n:usize) -> isize {
    sys_write(fd, buf, n)
}

pub fn wait(status: isize) -> isize {
    sys_wait(status)
}