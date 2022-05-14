mod proc;
mod file;
mod ipc;
pub use proc::*;
pub use file::*;
pub use ipc::*;

use crate::arch::riscv::qemu::fs::NOFILE;
use crate::{println, process::*};
use crate::fs::VFile;

use core::borrow::BorrowMut;
use core::mem::size_of;
use core::ops::IndexMut;
use core::str::from_utf8;
use alloc::sync::Arc;

type SyscallFn = fn() -> SysResult;
pub type SysResult = Result<usize, ()>;

pub const SYSCALL_NUM:usize = 21;
pub const SHUTDOWN: usize = 8;
pub const REBOOT: usize = 9;

#[no_mangle]
pub unsafe fn handle_syscall() {
    let proc = CPU_MANAGER.myproc().unwrap();
    let mut syscall = Syscall{ process: proc };
    if let Ok(res) = syscall.syscall() {
        let pdata = &mut *proc.data.get();
        let tf = &mut *pdata.trapframe;
        tf.a0 = res;
    }else{
        let pdata = &mut *proc.data.get();
        let tf = &mut *pdata.trapframe;
        tf.a0 = -1 as isize as usize
    }
    
}


#[repr(usize)]
#[derive(Debug)]
pub enum SysCallID {
    SysFork = 1,
    SysExit = 2,
    SysWait = 3,
    SysPipe = 4,
    SysRead = 5,
    SysKill = 6,
    SysExec = 7,
    SysFstat = 8,
    SysChdir = 9,
    SysDup = 10,
    SysGetPid = 11,
    SysSbrk = 12,
    SysSleep = 13,
    SysUptime = 14,
    SysOpen = 15,
    SysWrite = 16,
    SysMknod = 17,
    SysUnlink = 18,
    SysLink = 19,
    SysMkdir = 20,
    SysClose = 21,

    SysSemGet = 22,
    SysSemPut = 23,
    SysSemUp  = 24,
    SysSemDown= 25,
    SysSemInit= 26,

    SysClone  =  40,
    SysJoin   =  41,

    Unknown
}

impl SysCallID {
    pub fn new(id: usize) -> Self {
        match id {
            1 => { Self::SysFork },
            2 => { Self::SysExit },
            3 => { Self::SysWait },
            4 => { Self::SysPipe },
            5 => { Self::SysRead },
            6 => { Self::SysKill },
            7 => { Self::SysExec },
            8 => { Self::SysFstat },
            9 => { Self::SysChdir },
            10 => { Self::SysDup },
            11 => { Self::SysGetPid },
            12 => { Self::SysSbrk },
            13 => { Self::SysSleep },
            14 => { Self::SysUptime },
            15 => { Self::SysOpen },
            16 => { Self::SysWrite },
            17 => { Self::SysMknod },
            18 => { Self::SysUnlink },
            19 => { Self::SysLink },
            20 => { Self::SysMkdir },
            21 => { Self::SysClose },

            22 => { Self::SysSemGet},
            23 => { Self::SysSemPut},
            24 => { Self::SysSemUp},
            25 => { Self::SysSemDown},
            26 => { Self::SysSemInit},

            40 => { Self::SysClone},
            41 => { Self::SysJoin},

            _ => { Self::Unknown }
        }
    }
}

pub struct Syscall<'a>{
    process: &'a mut Process
}

impl Syscall<'_> {
    pub fn syscall(&mut self) -> SysResult {
        let pdata = self.process.data.get_mut();
        // 获取进程的trapframe
        let tf = unsafe{ &mut *pdata.trapframe };
        // 获取系统调用 id 号
        let sys_id = SysCallID::new(tf.a7);
        
        match sys_id {
            SysCallID::SysFork => { self.sys_fork() },
            SysCallID::SysExit => { self.sys_exit() },
            SysCallID::SysWait => { self.sys_wait() },
            SysCallID::SysRead => { self.sys_read() },
            SysCallID::SysWrite => { self.sys_write() },
            SysCallID::SysOpen => { self.sys_open() },
            SysCallID::SysExec => { self.sys_exec() },
            SysCallID::SysMknod => { self.sys_mknod() },
            SysCallID::SysClose => { self.sys_close() },
            SysCallID::SysDup => { self.sys_dup() },
            SysCallID::SysUptime => { Ok(0) },
            SysCallID::SysSbrk => { self.sys_sbrk() },
            SysCallID::SysFstat => { self.sys_fstat() },
            SysCallID::SysChdir => { self.sys_chdir()},
            SysCallID::SysPipe => { self.sys_pipe() },
            SysCallID::SysUnlink => { self.sys_unlink() },
            SysCallID::SysLink => { self.sys_link() },
            SysCallID::SysMkdir => { self.sys_mkdir() },

            SysCallID::SysSemGet => { self.sys_sem_get() },
            SysCallID::SysSemPut => { self.sys_sem_put() },
            SysCallID::SysSemUp => { self.sys_sem_up() },
            SysCallID::SysSemDown => { self.sys_sem_down() },
            SysCallID::SysSemInit => { self.sys_sem_init() },

            SysCallID::SysClone   => { self.sys_clone() },
            SysCallID::SysJoin    => { self.sys_join() },
            
            _ => { panic!("Invalid syscall id: {:?}", sys_id) }
        }
    }

    /// 获取第n个位置的参数
    pub fn arg(&self, id: usize) -> usize {
        let pdata = unsafe{ &mut* self.process.data.get() };
        let tf = unsafe{ &*pdata.trapframe };
        match id {
            0 => tf.a0,
            1 => tf.a1,
            2 => tf.a2,
            3 => tf.a3,
            4 => tf.a4,
            5 => tf.a5,
            _ => panic!("不能获取参数")
        }
    }

    /// 通过地址获取str并将其填入到缓冲区中
    pub fn copy_from_str(&self, addr: usize, buf: &mut [u8], max_len: usize) -> Result<(), ()> {
        let pdata = unsafe{ &mut *self.process.data.get() };
        let pgt = pdata.pagetable.as_mut().unwrap();
        if pgt.copy_in_str(buf.as_mut_ptr(), addr, max_len).is_err() {
            println!("Fail to copy in str");
            return Err(())
        }
        Ok(())
    }

    pub fn copy_form_addr(&self, addr: usize, buf: &mut [u8], len: usize) -> Result<(), ()> {
        let pdata = unsafe{ &mut *self.process.data.get() };
    
        if addr > pdata.size || addr + size_of::<usize>() > pdata.size {
            println!("[Debug] addr: 0x{:x}", addr);
            println!("[Debug] pdata size: 0x{:x}", pdata.size);
            panic!("拷贝的地址值超出了进程")
        }
    
        let pgt = pdata.pagetable.as_mut().unwrap();
        if pgt.copy_in(buf.as_mut_ptr(), addr, len).is_err() {
            println!("Fail copy data from pagetable!");
            return Err(())
        }
        
        
        Ok(())
    }
}

#[inline]
pub fn kernel_env_call(
    which: usize,
    arg0: usize,
    arg1: usize,
    arg2: usize,   
) -> usize {
    let mut ret;
    unsafe {
        llvm_asm!("ecall"
            : "={x10}" (ret)
            : "{x10}" (arg0), "{x11}" (arg1), "{x12}" (arg2), "{x17}" (which)
            : "memory"
            : "volatile"
        );
    }
    ret
}
