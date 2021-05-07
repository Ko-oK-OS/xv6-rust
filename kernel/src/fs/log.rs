//! Log-relevant operations

use core::{ops::{Deref, DerefMut}, panic, ptr};
use core::mem;

use crate::define::fs::{MAXOPBLOCKS, LOGSIZE, BSIZE};
use crate::process::{CPU_MANAGER, PROC_MANAGER};
use crate::lock::spinlock::Spinlock;
use super::{BCACHE, Buf, SUPER_BLOCK, BufData};

pub static LOG: Spinlock<Log> = Spinlock::new(Log::uninit(), "log");

/// Log info about the file system.
pub struct Log {
    /// the starting block in the fs
    start: u32,
    /// the number of blocks available for log
    size: u32,
    dev: u32,
    outstanding: u32,
    /// not allow any fs op when the log is committing
    committing: bool,
    lh: LogHeader,
}

impl Log {
    const fn uninit() -> Self {
        Self {
            start: 0,
            size: 0,
            dev: 0,
            outstanding: 0,
            committing: false,
            lh: LogHeader { len: 0, blocknos: [0; LOGSIZE-1] },
        }
    }

    /// Init the log when booting.
    /// Recover the fs if necessary.
    /// SAFETY: It must be called without holding any locks,
    ///         because it will call disk rw, which might sleep.
    pub unsafe fn init(&mut self, dev: u32) {
        debug_assert!(mem::size_of::<LogHeader>() < BSIZE);
        debug_assert_eq!(mem::align_of::<BufData>() % mem::align_of::<LogHeader>(), 0);
        let (start, size) = SUPER_BLOCK.read_log();
        self.start = start;
        self.size = size;
        self.dev = dev;
        self.recover();
    }

    /// Recover the file system from log if necessary.
    fn recover(&mut self) {
        println!("file system: checking logs");
        self.read_head();
        if self.lh.len > 0 {
            println!("file system: recovering from logs");
            self.install_trans(true);
            self.empty_head();
        } else {
            println!("file system: no need to recover");
        }
    }

    /// Read the log header from disk into the in-memory log header.
    fn read_head(&mut self) {
        let buf = BCACHE.bread(self.dev, self.start);
        unsafe {
            ptr::copy_nonoverlapping(
                buf.raw_data() as *const LogHeader,
                &mut self.lh,
                1
            );
        }
        drop(buf);
    }

    /// Write in-memory log header to disk.
    /// This is the true point at which the current transaction commits.
    fn write_head(&mut self) {
        let mut buf = BCACHE.bread(self.dev, self.start);
        unsafe {
            ptr::copy_nonoverlapping(
                &self.lh,
                buf.raw_data_mut() as *mut LogHeader,
                1,
            );
        }
        buf.bwrite();
        drop(buf);
    }

    /// Empty log header in disk by 
    /// setting the len of log(both in-memory and in-disk) to zero.
    fn empty_head(&mut self) {
        self.lh.len = 0;
        let mut buf = BCACHE.bread(self.dev, self.start);
        let raw_lh = buf.raw_data_mut() as *mut LogHeader;
        unsafe { raw_lh.as_mut().unwrap().len = 0; }
        buf.bwrite();
        drop(buf);
    }

    /// Copy committed blocks from log to their home location.
    fn install_trans(&mut self, recovering: bool) {
        for i in 0..self.lh.len {
            let log_buf  = BCACHE.bread(self.dev, self.start+1+i);
            let mut disk_buf = BCACHE.bread(self.dev, self.lh.blocknos[i as usize]);
            unsafe {
                ptr::copy(
                    log_buf.raw_data(),
                    disk_buf.raw_data_mut(),
                    1,
                );
            }
            disk_buf.bwrite();
            if !recovering {
                unsafe { disk_buf.unpin(); }
            }
            drop(log_buf);
            drop(disk_buf);
        }
    }

    /// Commit the log.
    /// SAFETY: It must be called while the committing field is set.
    pub unsafe fn commit(&mut self) {
        if !self.committing {
            panic!("log: committing while the committing flag is not set");
        }
        // debug_assert!(self.lh.len > 0);     // it should have some log to commit
        if self.lh.len > 0 {
            self.write_log();
            self.write_head();
            self.install_trans(false);
            self.empty_head();
        }
    }

    /// Copy the log content from buffer cache to disk.
    fn write_log(&mut self) {
        for i in 0..self.lh.len {
            let mut log_buf  = BCACHE.bread(self.dev, self.start+1+i);
            let cache_buf = BCACHE.bread(self.dev, self.lh.blocknos[i as usize]);
            unsafe {
                ptr::copy(
                    cache_buf.raw_data(),
                    log_buf.raw_data_mut(),
                    1,
                );
            }
            log_buf.bwrite();
            drop(cache_buf);
            drop(log_buf);
        }
    }
}

impl Spinlock<Log> {
    /// It should be called at the start of file system call.
    pub fn begin_op(&self) {
        let mut guard  = self.acquire();
        loop {
            if guard.committing ||
                1 + guard.lh.len as usize +
                (guard.outstanding+1) as usize * MAXOPBLOCKS > LOGSIZE
            {
                let channel = guard.deref() as *const Log as usize;
                unsafe { CPU_MANAGER.myproc().unwrap().sleep(channel, guard); }
                guard = self.acquire();
            } else {
                guard.outstanding += 1;
                drop(guard);
                break;
            }
        }
    }

    /// Accept a buffer, write it into the log and then release the buffer.
    /// This function will pin this buf in the cache until the log commits.
    pub fn write(&self, buf: Buf<'_>) {
        let mut guard = self.acquire();
        
        if (guard.lh.len+1) as usize >= LOGSIZE || guard.lh.len+1 >= guard.size {
            panic!("log: not enough space for ongoing transactions");
        }
        if guard.outstanding < 1 {
            panic!("log: this log write is out of recording");
        }

        // record the buf's blockno in the log header
        for i in 0..guard.lh.len {
            if guard.lh.blocknos[i as usize] == buf.read_blockno() {
                drop(guard);
                drop(buf);
                return;
            }
        }
        if (guard.lh.len+2) as usize >= LOGSIZE || guard.lh.len+2 >= guard.size {
            panic!("log: not enough space for this transaction");
        }
        unsafe { buf.pin(); }
        let len = guard.lh.len as usize;
        guard.lh.blocknos[len] = buf.read_blockno();
        guard.lh.len += 1;
        drop(guard);
        drop(buf);
    }

    /// It should be called at the end of file system call.
    /// It will commit the log if this is the last outstanding op.
    pub fn end_op(&self) {
        let mut log_ptr: *mut Log = ptr::null_mut();

        let mut guard = self.acquire();
        guard.outstanding -= 1;
        if guard.committing {
            // it is not allowed to start a fs op while the log is commiting
            panic!("log: end fs op while the log is committing");
        }
        if guard.outstanding == 0 {
            guard.committing = true;
            log_ptr = guard.deref_mut() as *mut Log;
        } else {
            let channel = guard.deref() as *const Log as usize;
            unsafe { PROC_MANAGER.wakeup(channel); }
        }
        drop(guard);

        if !log_ptr.is_null() {
            // SAFETY: Call commit without holding any lock.
            //        And the committing flag protects the log op.
            unsafe { log_ptr.as_mut().unwrap().commit(); }
            let mut guard = self.acquire();
            guard.committing = false;
            let channel = guard.deref() as *const Log as usize;
            unsafe { PROC_MANAGER.wakeup(channel); }
            drop(guard);
        }
    }
}

#[repr(C)]
struct LogHeader {
    len: u32,                       // current len of blocknos array
    blocknos: [u32; LOGSIZE-1],     // LOGSIZE-1: one block left for log info
}
