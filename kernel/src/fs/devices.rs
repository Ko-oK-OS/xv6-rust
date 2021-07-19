use crate::define::param::NDEV;

type ReadFn = fn(usize, usize, usize) -> usize;
type WriteFn = fn(usize, usize, usize) -> usize;


/// map major device number to device functions.
#[derive(Clone, Copy)]
pub struct Device {
    pub read: Option<ReadFn>,
    pub write: Option<WriteFn> 
}

impl Device {
    const fn new() -> Self {
        Self {
            read: None,
            write: None
        }
    }
}

pub static mut DEVICES: [Device;NDEV] = [Device::new();NDEV];