use crate::{lock::spinlock::Spinlock, memory::{ RawPage, PageAllocator }, process::{CPU, CPU_MANAGER, PROC_MANAGER}};
use crate::fs::{FileType, VFile};
use crate::fs::{Pipe, PipeData};
use core::ptr::drop_in_place;


use array_macro::array;

pub const NAME_LEN: usize = 24;
pub const N_FIFOS: usize = 64;


pub struct Fifo_t {
    fifo: Option<*mut Pipe>,
    name: [u8; NAME_LEN]
}

// pub struct SemTable{
//     sems: [sem_t; N_SEM],
//     st_lock: Spinlock<()>,
//     semID: i32,
// }

// pub static mut SEM_MANAGER: SemTable = SemTable::new();


impl Fifo_t {
    pub const fn new() -> Self {
        Fifo_t{
            fifo: None,
            name: [0; NAME_LEN]
        }
    }

    // pub fn alloc(s: [u8; NAME_LEN]) -> Self {
    //     let pipe_guard = unsafe{ *PipeGuard::alloc() }; 
    //     let mut pipe = Pipe {
    //         guard: Spinlock::new(pipe_guard, "pipe")
    //     };
    //     Fifo_t{
    //         fifo: Some(&mut pipe as *mut Pipe),
    //         name: s
    //     }
    // }

    pub fn read(& self, addr: usize, len: usize) -> Result<usize, &'static str> {
        let pipe = unsafe{&*self.fifo.unwrap()};

        println!("In Fifo_t read");
        pipe.read(addr, len)
    }

    pub fn write(&self, addr: usize, len: usize) -> Result<usize, &'static str> {
        let pipe = unsafe{&*self.fifo.unwrap()};

        println!("In Fifo_t write");
        pipe.write(addr, len)
    }

    pub fn close(&self){
        let pipe = unsafe{&*self.fifo.unwrap()};

        println!("In Fifo_t close");
        pipe.close(true);
        pipe.close(false);
    }


}


pub struct FifoTable{
    fifos: [Fifo_t; N_FIFOS],
    fifos_lock: Spinlock<()>
}

pub static mut FIFO_MANAGER: FifoTable = FifoTable::new();

impl FifoTable {
    pub const fn new() -> Self {
        Self{
            fifos: array![_ => Fifo_t::new(); N_FIFOS],
            fifos_lock: Spinlock::new((), "fifos_lock")
        }
    }

    pub fn alloc(&mut self, s: [u8; NAME_LEN]) -> Option<&Fifo_t>{
        let pipe_guard = unsafe{ *PipeData::alloc() }; 
        let mut pipe = Pipe {
            guard: Spinlock::new(pipe_guard, "pipe")
        };

        // let pipe_guard = unsafe{ *PipeGuard::alloc() }; 
        // let mut pipe = Self {
        //     guard: Spinlock::new(pipe_guard, "pipe")
        // };

        let fifo_guard = self.fifos_lock.acquire();

        let fifo_ret: &mut Fifo_t;
        for fifo_iter in self.fifos.iter_mut() {
            if fifo_iter.name == [0; NAME_LEN] {
                fifo_iter.fifo = Some(&mut pipe as *mut Pipe);
                fifo_iter.name = s;

                // fifo_ret = fifo_iter;
                // break;
                // println!("In alloc, the name is {}", s[0]);

                drop(fifo_guard);
                return Some(fifo_iter);
            }
        }
        drop(fifo_guard);
        None
    }

    pub fn get(&mut self, s: [u8; NAME_LEN]) -> Option<&Fifo_t> {
        let fifo_guard = self.fifos_lock.acquire();

        let fifo_ret: &mut Fifo_t;
        for fifo_iter in self.fifos.iter_mut() {
            if fifo_iter.name == s {
                
                println!("In FifoTable get, the name is {}", s[0]);
                drop(fifo_guard);
                return Some(fifo_iter);
            }
        }
        drop(fifo_guard);
        None
    }

    pub fn put(&mut self, s: [u8; NAME_LEN]) -> Option<usize>{
        let fifo_guard = self.fifos_lock.acquire();

        for fifo_iter in self.fifos.iter_mut() {
            if fifo_iter.name == s {

                fifo_iter.close();

                fifo_iter.fifo = None;
                fifo_iter.name = [0; NAME_LEN];
                
                println!("In FifoTable put, the name is {}", s[0]);
                
                drop(fifo_guard);
                return Some(0);
            }
        }
        drop(fifo_guard);
        None
    }
}


