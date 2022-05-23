// use crate::{lock::spinlock::Spinlock, memory::{ RawPage, PageAllocator }, process::{CPU, CPU_MANAGER, PROC_MANAGER}};
// use crate::fs::{FileType, VFile};
// use crate::fs::Pipe;
// use core::ptr::{drop_in_place, null_mut};
// use array_macro::array;

// pub const MSG_LEN: usize = 128;

// struct msg {
//     data: [u8; MSG_LEN],
//     id: usize,
//     flags: usize
// }

// impl msg {
//     pub fn init() -> Self{
//         Self{
//             data: [0; MSG_LEN],
//             id: 0,
//             flags: 0
//         }
//     }

//     pub fn new(_data: [u8; MSG_LEN], _id: usize, _flags: usize) -> Self{
//         Self { 
//             data: _data,
//             id: _id,
//             flags: _flags
//         }
//     }

//     pub fn free(&mut self){`
//         drop(self);
//     }
// }



