use crate::arch::riscv::qemu::param::NDEV;

use core::mem::transmute;

type ReadFn = fn(bool, usize, usize) -> Option<usize>;
type WriteFn = fn(bool, usize, usize) -> Option<usize>;

pub static mut DEVICE_LIST: DeviceList = DeviceList::uninit();

pub struct DeviceList {
    pub table: [Device;NDEV]
}

impl DeviceList {
    const fn uninit() -> Self {
        Self{
            table: [Device::new();NDEV]
        }
    }
}

/// map major device number to device functions.
#[derive(Clone, Copy)]
pub struct Device {
    pub read: *const u8,
    pub write: *const u8
}

impl Device {
    const fn new() -> Self {
        Self {
            read: 0 as *const u8,
            write: 0 as *const u8
        }
    }

    pub fn read(&self) -> ReadFn {
        let func = unsafe {
            transmute::<*const u8, ReadFn>(self.read)
        };
        func
    }

    pub fn write(&self) -> WriteFn {
        let func = unsafe {
            transmute::<*const u8, WriteFn>(self.write)
        };
        func
    }
}