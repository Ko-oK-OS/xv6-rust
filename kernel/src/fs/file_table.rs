use core::cell::UnsafeCell;
use crate::lock::spinlock::Spinlock;
use crate::arch::riscv::qemu::fs::NFILE;
use super::VFile;

use array_macro::array;

pub static mut FILE_TABLE:FileTable = FileTable::new();

pub struct FileTable {
    pub(crate) lock: Spinlock<()>,
    pub(crate) table: UnsafeCell<[VFile;NFILE]>
}

impl FileTable {
    const fn new() -> Self {
        Self{
            lock: Spinlock::new((), "filetable"),
            table: UnsafeCell::new(array![_ => VFile::init();NFILE])
        }
    }

    pub fn get_table(&self) -> &mut [VFile;NFILE]{
        unsafe{
            self.table.get().as_mut().unwrap()
        }
    }

    /// Allocate a file structure
    pub fn allocate(&self) -> Option<&mut VFile> {
        let guard = self.lock.acquire();
        for (index, f) in self.get_table().iter_mut().enumerate() {
            if f.refs == 0 {
                f.index = index;
                f.refs = 1;
                drop(guard);
                return Some(f)
            }
        }
        drop(guard);
        None
    }
    
}