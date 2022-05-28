use crate::{lock::spinlock::Spinlock, memory::{ RawPage, PageAllocator }, process::{CPU, CPU_MANAGER, PROC_MANAGER}};
use crate::fs::{FileType, VFile};

use crate::fs::Pipe;
use core::ptr::{drop_in_place, null_mut, null};
use array_macro::array;

use alloc::{boxed::Box, sync::Arc};


pub const MSG_LEN: usize = 128;

struct msg {
    data: [u8; MSG_LEN],
    dataID: usize,
    flags: usize,

    next: *mut msg
}

impl msg {

    pub fn init() -> *mut msg{
        let boxMsg: Box<msg> = unsafe { Box::new_zeroed().assume_init() };
        let pmsg = Box::into_raw(boxMsg);
        let msg = unsafe {&mut *pmsg };

        msg.dataID = 0;
        msg.next = null_mut();
        msg.flags = 0;

        pmsg
    }

    pub fn new(_data: [u8; MSG_LEN], _id: usize, _flags: usize) -> Self{
        Self { 
            data: _data,
            dataID: _id,
            flags: _flags,
            
            next: null_mut()
        }
    }

    pub fn free(&mut self){
        drop(self);
    }
}

struct msgque {
    pmsgHead: *mut msg,
    pmsgTail: *mut msg,
    id: usize,
    name: [u8; 16],
    used: bool,
    lock: Spinlock<()>,

}

impl msgque {
    pub const fn new() -> Self{
        Self{ 
            pmsgHead: null_mut(),
            pmsgTail: null_mut(),
            id: 0, 
            name: [0; 16],
            used: false,
            lock: Spinlock::new((), "Msgqueue Lock")
        }
    }

    pub fn write(&mut self, addr: usize, len: usize){
        let pmsg = msg::init();
        let msg = unsafe {&mut *pmsg };

        let curTask = unsafe { CPU_MANAGER.myproc().unwrap() };
        let pgt = unsafe {&mut *curTask.pagetable };
        
        let dst = &mut msg.data as *mut u8;

        pgt.copy_in(dst, addr, len);
        

        let guard = self.lock.acquire();
        if self.pmsgHead == null_mut() && self.pmsgTail == null_mut() {
            self.pmsgHead = pmsg;
            self.pmsgTail = pmsg;
        }else{
            let tail = unsafe {&mut *self.pmsgTail };
            tail.next = pmsg;
            self.pmsgTail = pmsg;
        }
        drop(guard);
    }

    pub fn read(&mut self, addr: usize, len: usize){
        let curTask = unsafe { CPU_MANAGER.myproc().unwrap() };
        let pgt = unsafe {&mut *curTask.pagetable };
        
        let pmsg = self.pmsgHead;
        let msg = unsafe{&mut *pmsg };
        let dst = &mut msg.data as *mut u8;

        pgt.copy_out(addr, dst, len);

        let guard = self.lock.acquire();

        let next = msg.next;
        self.pmsgHead = next;

        msg.free();

        drop(guard);
    }

}

pub const N_MSG_QUEUES: usize = 16;
pub static mut msgQueueID: usize = 1;

pub static mut MSG_QUE_MANAGER: MsgQueManager = MsgQueManager::new();
pub struct MsgQueManager {
    msg_queues: [msgque; N_MSG_QUEUES],
    lock: Spinlock<()>
}

impl MsgQueManager{
    pub const fn new() -> Self{
        Self{
            msg_queues: array![_=> msgque::new(); N_MSG_QUEUES],
            lock: Spinlock::new((), "Msg Queue Lock")
        }
    }

    pub fn alloc(&mut self, name: [u8; 16]) -> Option<usize> {
        let guard = self.lock.acquire();

        let mut ret: usize = 0;
        for i in 0..N_MSG_QUEUES {
            let msg_q = &mut self.msg_queues[i];
            if msg_q.used == false {

                unsafe {
                    msg_q.id = msgQueueID;
                    msgQueueID += 1;
                }
                
                msg_q.name = name;
                msg_q.used = true;

                ret = msg_q.id;
                
                drop(guard);
                return Some(ret);
            }
        }

        drop(guard);
        None
    }

    pub fn get(&mut self, name: [u8; 16]) -> Option<usize> {
        let guard = self.lock.acquire();

        let mut ret: usize = 0;
        for i in 0..N_MSG_QUEUES {
            let msg_q = &mut self.msg_queues[i];
            if msg_q.name == name {

                ret = msg_q.id;
                
                drop(guard);
                return Some(ret);
            }
        }

        drop(guard);
        None
    }

    // Borrow twice !!!! TODO

    pub fn getMsgQueByID(id: usize) -> usize{
        let mq_manager = unsafe { &mut MSG_QUE_MANAGER };
        let guard = mq_manager.lock.acquire();

        let mut ret: usize = N_MSG_QUEUES + 1;
        for i in 0..N_MSG_QUEUES {
            let msg_q = &mut mq_manager.msg_queues[i];
            if msg_q.id == id {
                
                ret = i;
                drop(guard);
                return ret;
            }
        }

        drop(guard);
        ret
    }

    pub fn write(&mut self, id: usize, addr: usize, len: usize) -> Option<usize>{
        let index = MsgQueManager::getMsgQueByID(id);
        let mq = unsafe { &mut MSG_QUE_MANAGER.msg_queues[index] };
        mq.write(addr, len);

        Some(0)
    }

    pub fn read(&mut self, id: usize, addr: usize, len: usize) -> Option<usize> {
        let index = MsgQueManager::getMsgQueByID(id);
        let mq = unsafe { &mut MSG_QUE_MANAGER.msg_queues[index] };
        mq.read(addr, len);

        Some(0)
    }

    pub fn put(&mut self, id: usize){
        let index = MsgQueManager::getMsgQueByID(id);
        let mq = unsafe { &mut MSG_QUE_MANAGER.msg_queues[index] };

        // mq.name = [0; 16];
        // mq.pmsgHead = null_mut();
        // mq.pmsgTail = null_mut();
    }
}



