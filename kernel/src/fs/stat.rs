pub struct Stat {
    dev: u32, // file
    ino: u32, // Inode number
    file_type: u16, // Type of file
    nlink: u16, // Number of links to link
    size: usize, // Size of file bytes 
}