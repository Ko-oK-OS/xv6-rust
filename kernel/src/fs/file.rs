use crate::define::fs::NFILE;
use crate::lock::spinlock::Spinlock;
use super::File;
use super::pipe::Pipe;
use super::inode::Inode;

use array_macro::array;

pub static mut FILE_TABLE:Spinlock<[AbstractFile; NFILE]> = Spinlock::new(array![_ => AbstractFile::init(); NFILE], "file_table");

pub enum FileType {
    None,
    Pipe,
    Inode,
    Device,
    Socket,
}

pub struct AbstractFile {
    file_type: FileType,
    file_ref: usize,
    readable: bool,
    writeable: bool,
    pipe: Option<Pipe>,
    inode: Option<Inode>,
    off: usize,
    major: u16
}

impl AbstractFile {
    pub const fn init() -> AbstractFile {
        Self{
            file_type: FileType::None,
            file_ref: 0,
            readable: false,
            writeable: false,
            pipe: None,
            inode: None,
            off: 0,
            major: 0
        }
    }
}

impl File for AbstractFile {
    fn read(&self, addr: usize, buf: &mut [u8]) -> Result<usize, &'static str> {
        Err("No implement")
    }

    fn write(&self, addr: usize, buf: &[u8]) -> Result<usize, &'static str> {
        Err("No implement")
    }

    fn readable(&self) -> bool {
        true
    }

    fn writeable(&self) -> bool {
        true
    }
}

