use crate::{process::*, arch::riscv::layout::PGSIZE};

impl Process {
    pub fn threadclone(&mut self, func: usize, arg: usize, ustack: usize) -> usize {
        let thread = unsafe{ PROC_MANAGER.alloc_proc().unwrap() };
        let pdata = unsafe { &mut *self.data.get() };
        let tdata = unsafe { &mut *thread.data.get() };
        
        // let page_table = pdata.pagetable.as_mut().unwrap();
        // tdata.pagetable = Some(page_table);
        // println!("In clone, assign page table");
        // tdata.pagetable = pdata.pagetable;
        // println!("In clone {} {}", tdata.pagetable as usize, pdata.pagetable as usize);
        tdata.size = pdata.size;
        tdata.name = pdata.name;    //to do
        
        let ptf = pdata.trapframe as *const Trapframe;
        let ttf = unsafe{ &mut *tdata.trapframe };
        unsafe{ copy_nonoverlapping(ptf, ttf, 1); }
        ttf.a0 = arg;
        ttf.epc = func;
        ttf.sp = ustack + PGSIZE;
        ttf.s0 = ttf.sp;

        tdata.thread_ustack = ustack;

        //file
        tdata.open_files.clone_from(&pdata.open_files);
        tdata.cwd.clone_from(&pdata.cwd);



        let mut tmeta = thread.meta.acquire();
        tmeta.state = ProcState::RUNNABLE;
        drop(tmeta);

        // let wait = unsafe{ PROC_MANAGER.wait_lock.acquire() };
        tdata.parent = Some(self as *mut Process);
        // drop(wait);

        // println!("Finshed Clone");

        //     Some(thread)
        // }else {
        //     println!("[Kernel] thread clone: None");
        //     None
        // }
        arg
    }

}
