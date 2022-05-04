use crate::{lock::spinlock::Spinlock, memory::{ RawPage, PageAllocator }, process::{CPU, CPU_MANAGER, PROC_MANAGER}};
use core::sync::atomic::{AtomicI32, Ordering, fence};
use core::ptr::drop_in_place;
use array_macro::array;
// pub struct semaphore {
//     counter : AtomicI32,

// }

// impl semaphore {
//     pub fn new(cnt: i32) -> Self{
//         let sem = AtomicI32::new(cnt);
//         sem
//     }
//     pub fn semaphore_down(&self){
//         let cnt = self.counter.load(Ordering::Relaxed);
//         if cnt > 0 {
//             self.counter.fetch_sub(1, Ordering::Relaxed);
//         }else{
//             let my_proc = unsafe {
//                 CPU_MANAGER.myproc().ok_or("Fail to get my process")?
//             };
//             my_proc.sleep(
//                 &pipe_guard.read_number as *const _ as usize, 
//                 pipe_guard
//             );
//         }
//     }
// }

pub const N_SEM: usize = 128;

pub struct semaphore{
    cnt: i32,
    sem_lock: Spinlock<()>,
}

impl semaphore{
    pub const fn new(value: i32) -> Self{
        Self{
            cnt: value,
            sem_lock: Spinlock::new((), "sem_lock"),
        }
    }
    pub fn semaphore_down(&mut self){
        println!("semaphore down");
        let guard = self.sem_lock.acquire();
        self.cnt -= 1;
        drop(guard);
    }
    pub fn semaphore_up(&mut self){
        let guard = self.sem_lock.acquire();
        self.cnt += 1;
        drop(guard);
    }

    pub fn get_value(&self) -> i32{
        self.cnt
    }
}

pub struct sem_t{
    sem: semaphore,
    used: bool,
    
    id: i32,
    // sem_lock: Spinlock<usize>,
}

impl sem_t{
    pub const fn new(cnt: i32) -> Self{
        sem_t{
            sem: semaphore::new(cnt),
            used: false,
            id: -1,
            // sem_lock: Spinlock::new(0, "Nope"),
        }
    }

    pub fn sem_init(&mut self, cnt: i32) -> i32{
        println!("sem_init in semaphore.rs");
        let sem_guard = self.sem.sem_lock.acquire();
        self.sem.cnt = cnt;
        drop(sem_guard);
        0
    }

    pub fn sem_down(&mut self){
        while self.sem.get_value() <= 0{
            
            let my_proc = unsafe { CPU_MANAGER.myproc().unwrap() };
            let sem_guard = self.sem.sem_lock.acquire();
            println!("ready to sleep {} {} {} {}", &self.id, &self.sem.cnt, &self.sem as *const _ as usize, &sem_guard as *const _ as usize);
            // println!("SEM_MANAGER in sem_down {}",unsafe{&SEM_MANAGER.sems as *const _ as usize});
            my_proc.sleep(
                &self.sem as *const _ as usize, 
                sem_guard
            );
        }
        println!("sem down");
        self.sem.semaphore_down();
    }

    pub fn sem_up(&mut self){
        println!("sem up");
        self.sem.semaphore_up();
        if self.sem.get_value() > 0{
            let sem_guard = self.sem.sem_lock.acquire();
            unsafe {
                PROC_MANAGER.wake_up(&self.sem as *const _ as usize);
            }
            println!("wake up in semaphore.rs {} {} {} {}", &self.id, &self.sem.cnt, &self.sem as *const _ as usize, &sem_guard as *const _ as usize);
            // println!("SEM_MANAGER in sem_down {}",unsafe{&SEM_MANAGER.sems as *const _ as usize});
        }
    }
}

pub struct SemTable{
    sems: [sem_t; N_SEM],
    st_lock: Spinlock<()>,
    semID: i32,
}

pub static mut SEM_MANAGER: SemTable = SemTable::new();

impl SemTable{
    pub const fn new() -> Self{
        Self{
            sems: array![_ => sem_t::new(0); N_SEM],
            st_lock: Spinlock::new((), "st_lock"),
            semID: 36
        }

        // let semsTmp = array![_ => sem_t::new(0); N_SEM];
        // let mut id = 0;
        // for sem in semsTmp.iter_mut(){
        //     sem.id = id;
        //     id += 1;
        // }

        // Self{
        //     sems: semsTmp,
        //     st_lock: Spinlock::new((), "st_lock")
        // }
    }
    pub fn alloc(&mut self) -> i32{
        println!("sem alloc");
        let st_guard = self.st_lock.acquire();
        let mut resId = 0;
        for sem in self.sems.iter_mut(){
            if sem.used == false{
                sem.id = self.semID;
                self.semID += 1;
                resId = sem.id;
                sem.used = true;

                println!("alloc in semaphore.rs, find one unused {}", resId);
                break;
            }
        }
        drop(st_guard);
        resId
    }

    pub fn get(&mut self, id: i32) -> i32{
        
        if id == -1{
            println!("sem alloc in semaphore.rs");
            self.alloc()
        }else{
            let mut res = -1;
            for sem in self.sems.iter_mut(){
                if sem.id == id{
                    res = id;
                }
            }
            println!("sem get in semaphore.rs {}", res);
            res
        }
    }

    pub fn put(&mut self, id: i32) -> i32{
        println!("sem put");
        let mut res = -1;
        for sem in self.sems.iter_mut(){
            if sem.id == id{
                sem.used = false;
                res = 0;
            }
        }
        res
    }

    pub fn getSemById(&mut self, id: i32) -> Option<&mut sem_t>{
        println!("sem find");
        // let mut semRes: &mut sem_t;
        for sem in self.sems.iter_mut(){
            if sem.id == id{
                println!("sem find !!!!{}", id);
                return Some(sem)
            }
        }
        None
    }
}
