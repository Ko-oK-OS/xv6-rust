use alloc::string::String;

use super::Inode;
/// Look up and return the inode for a path name.
/// If parent != 0, return the inode for the parent and copy the final
/// path element into name, which must have room for DIRSIZ bytes.
/// Must be called inside a transaction since it calls iput().
pub fn namex(path: &str, nameiparent: isize, name: String) -> Option<Inode> {
    None
}

pub fn namei(path: &str) -> Option<Inode> {
    let name:String = String::new();
    namex(path, 0, name)
}

pub fn nameiparent(path: &str, name: &str) -> Option<Inode> {
    namex(path, 1, String::from(name))
}
