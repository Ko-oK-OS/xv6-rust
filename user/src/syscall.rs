pub const SYS_FORK:usize = 1;
pub const SYS_EXIT:usize = 2;
pub const SYS_WAIT:usize = 3;
pub const SYS_PIPE:usize = 4;
pub const SYS_READ:usize = 5;
pub const SYS_KILL:usize = 6;
pub const SYS_EXEC:usize = 7;
pub const SYS_FSTAT:usize = 8;
pub const SYS_CHDIR:usize = 9;
pub const SYS_DUP:usize = 10;
pub const SYS_GETPID:usize = 11;
pub const SYS_SBRK:usize = 12;
pub const SYS_SLEEP:usize = 13;
pub const SYS_UPTIME:usize = 14;
pub const SYS_OPEN:usize = 15;
pub const SYS_WRITE:usize = 16;
pub const SYS_MKNOD:usize = 17;
pub const SYS_UNLINKE:usize = 18;
pub const SYS_LINK:usize = 19;
pub const SYS_MKDIR:usize = 20;
pub const SYS_CLOSE:usize = 21;

pub type SysRet = isize;

fn syscall(id: usize, args:[usize; 3]) -> SysRet {
    let ret:isize;
    unsafe{
        core::arch::asm!("ecall"
            : "={x10}" (ret)
            : "{x10}" (args[0]), "{x11}" (args[1]), "{x12}" (args[2]), "{x17}" (id)
            : "memory"
            : "volatile"
        );
    }
    ret
}

pub fn sys_fork() -> SysRet {
    syscall(SYS_FORK, [0, 0, 0])
}

pub fn sys_exit(exit_code: i32) -> ! {
    syscall(SYS_EXIT, [exit_code as usize, 0, 0]);
    panic!("exit never return");
}

pub fn sys_wait(status: isize) -> SysRet {
    syscall(SYS_WAIT, [status as usize, 0, 0])
}

pub fn sys_pipe(pipe: &mut [usize]) -> SysRet {
    syscall(SYS_PIPE, [pipe.as_mut_ptr() as usize, 0, 0])
}

pub fn sys_read(fd: usize, buf: &mut [u8], n: usize) -> SysRet {
    syscall(SYS_READ, [fd, buf.as_mut_ptr() as usize, n])
}

pub fn sys_write(fd: usize, buf: &[u8], n: usize) -> SysRet {
    syscall(SYS_WRITE, [fd, buf.as_ptr() as usize, n])
}

pub fn sys_open(path: &str, flags: u32) -> SysRet {
    syscall(SYS_OPEN, [path.as_ptr() as usize, flags as usize, 0])
}

pub fn sys_close(fd: usize) -> SysRet {
    syscall(SYS_CLOSE, [fd, 0, 0])
}

pub fn sys_dup(fd: usize) -> SysRet {
    syscall(SYS_DUP, [fd, 0, 0])
}

pub fn sys_mknod(path: &str, mode: usize, dev: usize) -> SysRet {
    syscall(SYS_MKNOD, [path.as_ptr() as usize, mode, dev])
}

pub fn sys_exec(path: &str, args: &[*const u8]) -> SysRet {
    syscall(SYS_EXEC, [path.as_ptr() as usize, args.as_ptr() as usize, 0])
    // syscall(SYS_EXEC, [0, 0, 0])
}

pub fn sys_sbrk(bytes: usize) -> SysRet {
    syscall(SYS_SBRK, [bytes, 0, 0])
}