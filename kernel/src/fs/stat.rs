use super::InodeType;


pub struct Stat {
    pub dev: u32, // file
    pub inum: u32, // Inode number
    pub itype: InodeType, // Type of file
    pub nlink: i16, // Number of links to link
    pub size: usize, // Size of file bytes 
}

impl Stat {
    pub const fn new() -> Self {
        Self {
            dev: 0,
            inum: 0,
            itype: InodeType::Empty,
            nlink: 0,
            size: 0
        }
    }
}