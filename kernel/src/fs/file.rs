use crate::define::fs::NFILE;
use crate::lock::spinlock::Spinlock;

use array_macro::array;

pub static mut FILE_TABLE:Spinlock<[File; NFILE]> = Spinlock::new(array![_ => File::init(); NFILE], "file_table");

pub trait FileTrait{
    fn read(&self, addr: usize, buf: &mut [u8]) -> Result<usize, &'static str>;
    fn write(&self, addr: usize, buf: &[u8]) -> Result <usize, &'static str>;
}

pub enum FileType {
    None,
    Pipe,
    Inode,
    Device,
    Socket,
}

pub struct File {
    file_type: FileType,
    file_ref: usize,
    flags: u8,
}

impl File {
    const fn init() -> File {
        Self{
            file_type: FileType::None,
            file_ref: 0,
            flags: 0
        }
    }
}

impl FileTrait for File {
    fn read(&self, addr: usize, buf: &mut [u8]) -> Result<usize, &'static str> {
        Err("No implement")
    }

    fn write(&self, addr: usize, buf: &[u8]) -> Result<usize, &'static str> {
        Err("No implement")
    }
}

