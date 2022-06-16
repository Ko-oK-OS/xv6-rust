# Details

Date : 2022-05-28 21:17:05

Directory /home/rand/xv6-rust/xv6-user

Total : 45 files,  1961 codes, 272 comments, 484 blanks, all 2717 lines

[Summary](results.md) / Details / [Diff Summary](diff.md) / [Diff Details](diff-details.md)

## Files
| filename | language | code | comment | blank | total |
| :--- | :--- | ---: | ---: | ---: | ---: |
| [xv6-user/README.md](/xv6-user/README.md) | Markdown | 2 | 0 | 1 | 3 |
| [xv6-user/cat.c](/xv6-user/cat.c) | C | 37 | 0 | 6 | 43 |
| [xv6-user/echo.c](/xv6-user/echo.c) | C | 17 | 1 | 3 | 21 |
| [xv6-user/fifo_test1.c](/xv6-user/fifo_test1.c) | C | 10 | 0 | 5 | 15 |
| [xv6-user/fifo_test2.c](/xv6-user/fifo_test2.c) | C | 11 | 0 | 4 | 15 |
| [xv6-user/fork_test.c](/xv6-user/fork_test.c) | C | 39 | 3 | 12 | 54 |
| [xv6-user/forktest.c](/xv6-user/forktest.c) | C | 45 | 2 | 14 | 61 |
| [xv6-user/include/fcntl.h](/xv6-user/include/fcntl.h) | C | 5 | 0 | 0 | 5 |
| [xv6-user/include/file.h](/xv6-user/include/file.h) | C++ | 32 | 2 | 6 | 40 |
| [xv6-user/include/fs.h](/xv6-user/include/fs.h) | C++ | 33 | 14 | 12 | 59 |
| [xv6-user/include/memlayout.h](/xv6-user/include/memlayout.h) | C++ | 21 | 36 | 10 | 67 |
| [xv6-user/include/param.h](/xv6-user/include/param.h) | C++ | 13 | 0 | 0 | 13 |
| [xv6-user/include/riscv.h](/xv6-user/include/riscv.h) | C++ | 263 | 38 | 53 | 354 |
| [xv6-user/include/sleeplock.h](/xv6-user/include/sleeplock.h) | C++ | 6 | 2 | 1 | 9 |
| [xv6-user/include/spinlock.h](/xv6-user/include/spinlock.h) | C++ | 5 | 2 | 2 | 9 |
| [xv6-user/include/stat.h](/xv6-user/include/stat.h) | C++ | 10 | 0 | 1 | 11 |
| [xv6-user/include/syscall.h](/xv6-user/include/syscall.h) | C++ | 41 | 1 | 5 | 47 |
| [xv6-user/include/types.h](/xv6-user/include/types.h) | C++ | 8 | 0 | 2 | 10 |
| [xv6-user/init.c](/xv6-user/init.c) | C | 43 | 5 | 6 | 54 |
| [xv6-user/ls.c](/xv6-user/ls.c) | C | 74 | 3 | 10 | 87 |
| [xv6-user/malloc_test.c](/xv6-user/malloc_test.c) | C | 14 | 0 | 5 | 19 |
| [xv6-user/mkdir.c](/xv6-user/mkdir.c) | C | 19 | 0 | 5 | 24 |
| [xv6-user/msgtest1.c](/xv6-user/msgtest1.c) | C | 8 | 0 | 5 | 13 |
| [xv6-user/msgtest2.c](/xv6-user/msgtest2.c) | C | 11 | 0 | 7 | 18 |
| [xv6-user/pipe_test.c](/xv6-user/pipe_test.c) | C | 30 | 0 | 23 | 53 |
| [xv6-user/printf.c](/xv6-user/printf.c) | C | 97 | 2 | 14 | 113 |
| [xv6-user/rm.c](/xv6-user/rm.c) | C | 19 | 0 | 4 | 23 |
| [xv6-user/sem_test1.c](/xv6-user/sem_test1.c) | C | 15 | 0 | 3 | 18 |
| [xv6-user/sem_test2.c](/xv6-user/sem_test2.c) | C | 9 | 1 | 5 | 15 |
| [xv6-user/sh.c](/xv6-user/sh.c) | C | 421 | 11 | 64 | 496 |
| [xv6-user/shmtest1.c](/xv6-user/shmtest1.c) | C | 22 | 17 | 13 | 52 |
| [xv6-user/shmtest2.c](/xv6-user/shmtest2.c) | C | 17 | 15 | 14 | 46 |
| [xv6-user/stressfs.c](/xv6-user/stressfs.c) | C | 31 | 8 | 11 | 50 |
| [xv6-user/thread.c](/xv6-user/thread.c) | C | 21 | 3 | 8 | 32 |
| [xv6-user/thread_test.c](/xv6-user/thread_test.c) | C | 19 | 16 | 20 | 55 |
| [xv6-user/touch.c](/xv6-user/touch.c) | C | 23 | 0 | 2 | 25 |
| [xv6-user/ulib.c](/xv6-user/ulib.c) | C | 120 | 0 | 21 | 141 |
| [xv6-user/umalloc.c](/xv6-user/umalloc.c) | C | 77 | 3 | 12 | 92 |
| [xv6-user/user.h](/xv6-user/user.h) | C | 60 | 2 | 9 | 71 |
| [xv6-user/usys.pl](/xv6-user/usys.pl) | Perl | 51 | 2 | 10 | 63 |
| [xv6-user/uthread/ucontext.c](/xv6-user/uthread/ucontext.c) | C | 9 | 2 | 4 | 15 |
| [xv6-user/uthread/ucontext.h](/xv6-user/uthread/ucontext.h) | C++ | 23 | 14 | 14 | 51 |
| [xv6-user/uthread/uthread.c](/xv6-user/uthread/uthread.c) | C | 83 | 26 | 22 | 131 |
| [xv6-user/uthread/uthread.h](/xv6-user/uthread/uthread.h) | C++ | 26 | 16 | 11 | 53 |
| [xv6-user/uthreadtest.c](/xv6-user/uthreadtest.c) | C | 21 | 25 | 25 | 71 |

[Summary](results.md) / Details / [Diff Summary](diff.md) / [Diff Details](diff-details.md)