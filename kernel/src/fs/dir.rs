use alloc::string::String;
/// Look up and return the inode for a path name.
/// If parent != 0, return the inode for the parent and copy the final
/// path element into name, which must have room for DIRSIZ bytes.
/// Must be called inside a transaction since it calls iput().
pub(crate) fn namex(path: &str, nameiparent: isize, name: String) -> Option<Box<Self>> {
    None
}

pub fn namei(path: &str) -> Option<Box<Self>> {
    let name:String = String::new();
    Self::namex(path, 0, name)
}

pub fn nameiparent(path: &str, name: &str) -> Option<Box<Self>> {
    Self::namex(path, 1, String::from(name))
}
