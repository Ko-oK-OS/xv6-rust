use crate::define::param::NDEV;

/// map major device number to device functions.
pub struct Device {
    pub read: Option<fn(usize, usize, &mut [u8]) -> usize>,
    pub write: Option<fn(usize, usize, &[u8]) -> usize> 
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