use core::convert::Into;
use core::ptr;

use crate::define::memlayout::{CLINT, CLINT_MTIME, CLINT_MTIMECMP};

// core local interruptor (CLINT), which contains the timer.

#[inline]
unsafe fn read_mtime() -> u64 {
    ptr::read_volatile(Into::<usize>::into(CLINT_MTIME) as *const u64)
}

unsafe fn write_mtimecmp(mhartid:usize, value: u64) {
    let offset = Into::<usize>::into(CLINT_MTIMECMP) + 8*mhartid;
    ptr::write_volatile(offset as *mut u64, value);
}

pub unsafe fn add_mtimecmp(mhartid:usize, interval:u64){
    let value = read_mtime();
    write_mtimecmp(mhartid, value+interval);
}



