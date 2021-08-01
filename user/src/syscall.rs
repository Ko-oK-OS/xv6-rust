pub const SYS_FORK:usize = 0;
pub const SYS_EXIT:usize = 1;
pub const SYS_WAIT:usize = 2;
pub const SYS_PIPE:usize = 3;
pub const SYS_READ:usize = 4;
pub const SYS_WRITE:usize = 5;
pub const SYS_CLOSE:usize = 6;
pub const SYS_KILL:usize = 7;
pub const SYS_EXEC:usize = 8;
pub const SYS_OPEN:usize = 9;
pub const SYS_MKNOD:usize = 10;
pub const SYS_UNLINKE:usize = 11;
pub const SYS_FSTAT:usize = 12;
pub const SYS_LINK:usize = 13;
pub const SYS_MKDIR:usize = 14;
pub const SYS_CHDIR:usize = 15;
pub const SYS_DUP:usize = 16;
pub const SYS_GETPID:usize = 17;
pub const SYS_SBRK:usize = 18;
pub const SYS_SLEEP:usize = 19;
pub const SYS_UPTIME:usize = 20;

fn syscall(id: usize, args:[usize; 3]) -> isize {
    let ret:isize;
    unsafe{
        llvm_asm!("ecall"
            : "={x10}" (ret)
            : "{x10}" (args[0]), "{x11}" (args[1]), "{x12}" (args[2]), "{x17}" (id)
            : "memory"
            : "volatile"
        );
    }
    ret
}

pub fn sys_fork() -> isize {
    syscall(SYS_FORK, [0, 0, 0])
}

pub fn sys_exit(exit_code: i32) -> ! {
    syscall(SYS_EXIT, [exit_code as usize, 0, 0]);
    panic!("exit never return");
}

pub fn sys_wait(status: isize) -> isize {
    syscall(SYS_WAIT, [status as usize, 0, 0])
}

pub fn sys_pipe(pipe: &mut [usize]) -> isize {
    syscall(SYS_PIPE, [pipe.as_mut_ptr() as usize, 0, 0])
}

pub fn sys_read(fd:usize, buf: &mut [u8], n:usize) -> isize {
    syscall(SYS_READ, [fd, buf.as_mut_ptr() as usize, n])
}

pub fn sys_write(fd:usize, buf: &[u8], n:usize) -> isize {
    syscall(SYS_WRITE, [fd, buf.as_ptr() as usize, n])
}

pub fn sys_open(path: &str, flags: u32) -> isize {
    syscall(SYS_OPEN, [path.as_ptr() as usize, flags as usize, 0])
}

pub fn sys_close(fd: usize) -> isize {
    syscall(SYS_CLOSE, [fd, 0, 0])
}

pub fn sys_dup(fd: usize) -> isize {
    syscall(SYS_DUP, [fd, 0, 0])
}

pub fn sys_mknod(path: &str, mode: usize, dev: usize) -> isize {
    syscall(SYS_MKNOD, [path.as_ptr() as usize, mode, dev])
}

pub fn sys_exec(path: &str, args: &[*const u8]) -> isize {
    syscall(SYS_EXEC, [path.as_ptr() as usize, args.as_ptr() as usize, 0])
}


 
