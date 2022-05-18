use crate::{lock::spinlock::Spinlock, memory::{ RawPage, PageAllocator }, process::{CPU, CPU_MANAGER, PROC_MANAGER}};
use crate::fs::{FileType, VFile};
use crate::fs::Pipe;
use core::ptr::drop_in_place;


use array_macro::array;

pub const NAME_LEN: usize = 24;
pub const N_FIFOS: usize = 64;


pub struct Fifo_t {
    pub pipe: Option<*mut Pipe>,
    pub name: [u8; NAME_LEN],
    pub used: bool,
    pub ID:   usize
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
            pipe: None,
            name: [0; NAME_LEN],
            used: false,
            ID:    0
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
        let pipe = unsafe{&mut *self.pipe.unwrap()};

        println!("In Fifo_t read");
        pipe.read(addr, len)
    }

    pub fn write(&self, addr: usize, len: usize) -> Result<usize, &'static str> {
        let pipe = unsafe{&mut *self.pipe.unwrap()};

        println!("In Fifo_t write");
        pipe.write(addr, len)
    }

    pub fn close(&self){
        let pipe = unsafe{&mut *self.pipe.unwrap()};

        println!("In Fifo_t close");
        pipe.close(true);
        pipe.close(false);

        drop(self);
    }


}


pub struct FifoTable{
    fifos: [Fifo_t; N_FIFOS],
    fifos_lock: Spinlock<()>,
    fifoID: usize
}

pub static mut FIFO_MANAGER: FifoTable = FifoTable::new();

impl FifoTable {
    pub const fn new() -> Self {
        Self{
            fifos: array![_ => Fifo_t::new(); N_FIFOS],
            fifos_lock: Spinlock::new((), "fifos_lock"),
            fifoID: 5
        }
    }

    pub fn alloc(&mut self, s: [u8; NAME_LEN]) -> Option<usize>{
        
        let pipe = Pipe::init();

        // let pipe_guard = unsafe{ *PipeGuard::alloc() }; 
        // let mut pipe = Self {
        //     guard: Spinlock::new(pipe_guard, "pipe")
        // };

        let guard = self.fifos_lock.acquire();

      
        for fifo_iter in self.fifos.iter_mut() {
            if fifo_iter.used == false {

                fifo_iter.pipe = Some(pipe);
                fifo_iter.name = s;
                fifo_iter.used = true;
                fifo_iter.ID   = self.fifoID;
                self.fifoID   += 1;

                drop(guard);
                return Some(fifo_iter.ID);
            }
        }
        drop(guard);
        None
    }

    pub fn get(&mut self, name: [u8; NAME_LEN]) -> Option<usize> {
        let fifo_guard = self.fifos_lock.acquire();

        // let fifo_ret: &mut Fifo_t;
        for fifo_iter in self.fifos.iter_mut() {
            if fifo_iter.name == name {
                
                println!("In FifoTable get, the id is {}", fifo_iter.ID);
                drop(fifo_guard);
                return Some(fifo_iter.ID);
            }
        }
        drop(fifo_guard);
        None
    }

    pub fn getByID(&mut self, id: usize) -> Option<*mut Fifo_t>{
        let guard = self.fifos_lock.acquire();
        for it in self.fifos.iter_mut() {
            if it.ID == id {
                drop(guard);
                return Some(it as *mut Fifo_t);
            }
        }
        drop(guard);
        None
    }

    pub fn put(&mut self, id: usize) -> Option<usize>{
        let fifo_guard = self.fifos_lock.acquire();

        for fifo_iter in self.fifos.iter_mut() {
            if fifo_iter.ID == id {

                fifo_iter.close();

                fifo_iter.pipe = None;
                fifo_iter.name = [0; NAME_LEN];
                fifo_iter.used = false;
                fifo_iter.ID   = 0;
                
                println!("In FifoTable put, the id is {}", id);
                
                drop(fifo_guard);
                return Some(0);
            }
        }
        drop(fifo_guard);
        None
    }
}


