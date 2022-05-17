use crate::{process::*, arch::riscv::layout::PGSIZE};

impl task_struct {
    pub fn threadclone(&mut self, func: usize, ustack: usize) -> usize {

        let thread = ProcManager::alloc_thread().unwrap();
        thread.parent = Some(self as *mut task_struct);
        
        // let pgt_p = self.pagetable.as_mut().unwrap();
        // let pgt_t = thread.pagetable.as_mut().unwrap();

        // pgt_p.copy_pagetable(pgt_t);
        thread.pagetable = self.pagetable;

        thread.open_files.clone_from(&self.open_files);
        thread.cwd.clone_from(&self.cwd);

        // check page table copy

        // unsafe { (*self.pagetable).print_pagetable() };
        // println!("-----------------------");
        // unsafe { (*thread.pagetable).print_pagetable() };
        // println!("++++++++++++++++++++++");
        // while (true){

        // }
        println!("In threadclone pid is {} the child is {} func is {} ustack is {}", self.pid, thread.pid, func, ustack);
        thread.size = self.size;
        thread.name = self.name;    //to do
        thread.thread_ustack = ustack;
        
        let ptf = self.trapframe as *const Trapframe;
        let ttf = unsafe{ &mut *thread.trapframe };
        unsafe{ copy_nonoverlapping(ptf, ttf, 1); }
        // ttf.a0 = 0;
       
        ttf.epc = func;
       
        ttf.sp = ustack + PGSIZE;
        // ttf.s0 = ttf.sp;
        //file  

        let guard = unsafe { PROC_MANAGER.tasks_lock.acquire() };
        thread.state = ProcState::RUNNABLE;
        drop(guard);

       
        let tf = unsafe{ &mut *thread.trapframe };
        println!("In threadclone pid {} epc {}", thread.pid, tf.epc);
        0
    }

}
