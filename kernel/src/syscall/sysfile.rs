use crate::fs::VFS;
use super::*;

pub fn sys_read() -> bool {
    let mut file: VFS = VFS::init();
    let mut addr: usize = 0;
    let mut size: usize = 0;
    if argfd(0, &mut 0, &mut file).is_err() || argint(2, &mut size).is_err() || argint(1, &mut addr).is_err() {
        return false
    }
    true
}