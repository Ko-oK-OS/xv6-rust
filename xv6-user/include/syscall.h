// System call numbers
#define SYS_fork    1
#define SYS_exit    2
#define SYS_wait    3
#define SYS_pipe    4
#define SYS_read    5
#define SYS_kill    6
#define SYS_exec    7
#define SYS_fstat   8
#define SYS_chdir   9
#define SYS_dup    10
#define SYS_getpid 11
#define SYS_sbrk   12
#define SYS_sleep  13
#define SYS_uptime 14
#define SYS_open   15
#define SYS_write  16
#define SYS_mknod  17
#define SYS_unlink 18
#define SYS_link   19
#define SYS_mkdir  20
#define SYS_close  21

#define SYS_sem_get 22
#define SYS_sem_put 23
#define SYS_sem_up  24
#define SYS_sem_down 25
#define SYS_sem_init 26

#define SYS_mkfifo   27
#define SYS_fifo_get 28
#define SYS_fifo_put 29
#define SYS_fifo_read 30
#define SYS_fifo_write 31

#define SYS_msg_alloc  32
#define SYS_msg_get    33
#define SYS_msg_send   34
#define SYS_msg_recv   35

#define SYS_shm_get    36
#define SYS_shm_put    37
#define SYS_shm_map    38
#define SYS_shm_unmap  39

#define SYS_clone    40
#define SYS_join     41