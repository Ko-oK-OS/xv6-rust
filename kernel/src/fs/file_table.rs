use crate::lock::spinlock::Spinlock;
use crate::define::fs::NFILE;
use super::VFS;

use array_macro::array;

static mut FILE_TABLE:FileTable = FileTable::new();

pub struct FileTable {
    table: Spinlock<[VFS;NFILE]>
}

impl FileTable {
    const fn new() -> Self {
        Self{
            table: Spinlock::new(array![_ => VFS::init();NFILE], "filetable")
        }
    }
}