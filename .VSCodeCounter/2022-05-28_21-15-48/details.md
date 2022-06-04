# Details

Date : 2022-05-28 21:15:48

Directory /home/rand/xv6-rust/kernel

Total : 89 files,  7711 codes, 2023 comments, 1907 blanks, all 11641 lines

[Summary](results.md) / Details / [Diff Summary](diff.md) / [Diff Details](diff-details.md)

## Files
| filename | language | code | comment | blank | total |
| :--- | :--- | ---: | ---: | ---: | ---: |
| [kernel/Makefile](/kernel/Makefile) | Makefile | 45 | 8 | 22 | 75 |
| [kernel/src/arch/mod.rs](/kernel/src/arch/mod.rs) | Rust | 1 | 1 | 0 | 2 |
| [kernel/src/arch/riscv/mod.rs](/kernel/src/arch/riscv/mod.rs) | Rust | 4 | 0 | 1 | 5 |
| [kernel/src/arch/riscv/qemu/devices.rs](/kernel/src/arch/riscv/qemu/devices.rs) | Rust | 1 | 0 | 0 | 1 |
| [kernel/src/arch/riscv/qemu/e1000.rs](/kernel/src/arch/riscv/qemu/e1000.rs) | Rust | 79 | 8 | 9 | 96 |
| [kernel/src/arch/riscv/qemu/fs.rs](/kernel/src/arch/riscv/qemu/fs.rs) | Rust | 55 | 14 | 15 | 84 |
| [kernel/src/arch/riscv/qemu/layout.rs](/kernel/src/arch/riscv/qemu/layout.rs) | Rust | 24 | 42 | 24 | 90 |
| [kernel/src/arch/riscv/qemu/mod.rs](/kernel/src/arch/riscv/qemu/mod.rs) | Rust | 35 | 0 | 9 | 44 |
| [kernel/src/arch/riscv/qemu/param.rs](/kernel/src/arch/riscv/qemu/param.rs) | Rust | 7 | 2 | 3 | 12 |
| [kernel/src/arch/riscv/qemu/virtio.rs](/kernel/src/arch/riscv/qemu/virtio.rs) | Rust | 33 | 17 | 7 | 57 |
| [kernel/src/arch/riscv/register/clint.rs](/kernel/src/arch/riscv/register/clint.rs) | Rust | 20 | 1 | 10 | 31 |
| [kernel/src/arch/riscv/register/mcounteren.rs](/kernel/src/arch/riscv/register/mcounteren.rs) | Rust | 10 | 1 | 1 | 12 |
| [kernel/src/arch/riscv/register/medeleg.rs](/kernel/src/arch/riscv/register/medeleg.rs) | Rust | 10 | 0 | 1 | 11 |
| [kernel/src/arch/riscv/register/mepc.rs](/kernel/src/arch/riscv/register/mepc.rs) | Rust | 4 | 3 | 0 | 7 |
| [kernel/src/arch/riscv/register/mhartid.rs](/kernel/src/arch/riscv/register/mhartid.rs) | Rust | 6 | 1 | 0 | 7 |
| [kernel/src/arch/riscv/register/mideleg.rs](/kernel/src/arch/riscv/register/mideleg.rs) | Rust | 10 | 0 | 1 | 11 |
| [kernel/src/arch/riscv/register/mie.rs](/kernel/src/arch/riscv/register/mie.rs) | Rust | 15 | 1 | 2 | 18 |
| [kernel/src/arch/riscv/register/mod.rs](/kernel/src/arch/riscv/register/mod.rs) | Rust | 29 | 1 | 2 | 32 |
| [kernel/src/arch/riscv/register/mscratch.rs](/kernel/src/arch/riscv/register/mscratch.rs) | Rust | 4 | 0 | 0 | 4 |
| [kernel/src/arch/riscv/register/mstatus.rs](/kernel/src/arch/riscv/register/mstatus.rs) | Rust | 27 | 4 | 8 | 39 |
| [kernel/src/arch/riscv/register/mtvec.rs](/kernel/src/arch/riscv/register/mtvec.rs) | Rust | 10 | 1 | 1 | 12 |
| [kernel/src/arch/riscv/register/ra.rs](/kernel/src/arch/riscv/register/ra.rs) | Rust | 6 | 0 | 0 | 6 |
| [kernel/src/arch/riscv/register/satp.rs](/kernel/src/arch/riscv/register/satp.rs) | Rust | 10 | 4 | 2 | 16 |
| [kernel/src/arch/riscv/register/scause.rs](/kernel/src/arch/riscv/register/scause.rs) | Rust | 111 | 11 | 21 | 143 |
| [kernel/src/arch/riscv/register/sepc.rs](/kernel/src/arch/riscv/register/sepc.rs) | Rust | 10 | 3 | 1 | 14 |
| [kernel/src/arch/riscv/register/sie.rs](/kernel/src/arch/riscv/register/sie.rs) | Rust | 20 | 3 | 3 | 26 |
| [kernel/src/arch/riscv/register/sip.rs](/kernel/src/arch/riscv/register/sip.rs) | Rust | 16 | 1 | 4 | 21 |
| [kernel/src/arch/riscv/register/sp.rs](/kernel/src/arch/riscv/register/sp.rs) | Rust | 6 | 0 | 0 | 6 |
| [kernel/src/arch/riscv/register/sscratch.rs](/kernel/src/arch/riscv/register/sscratch.rs) | Rust | 4 | 1 | 1 | 6 |
| [kernel/src/arch/riscv/register/sstatus.rs](/kernel/src/arch/riscv/register/sstatus.rs) | Rust | 46 | 11 | 12 | 69 |
| [kernel/src/arch/riscv/register/stval.rs](/kernel/src/arch/riscv/register/stval.rs) | Rust | 10 | 1 | 1 | 12 |
| [kernel/src/arch/riscv/register/stvec.rs](/kernel/src/arch/riscv/register/stvec.rs) | Rust | 10 | 2 | 1 | 13 |
| [kernel/src/arch/riscv/register/time.rs](/kernel/src/arch/riscv/register/time.rs) | Rust | 6 | 1 | 0 | 7 |
| [kernel/src/arch/riscv/register/tp.rs](/kernel/src/arch/riscv/register/tp.rs) | Rust | 10 | 2 | 1 | 13 |
| [kernel/src/driver/console.rs](/kernel/src/driver/console.rs) | Rust | 138 | 33 | 28 | 199 |
| [kernel/src/driver/mod.rs](/kernel/src/driver/mod.rs) | Rust | 5 | 0 | 2 | 7 |
| [kernel/src/driver/pci.rs](/kernel/src/driver/pci.rs) | Rust | 0 | 43 | 12 | 55 |
| [kernel/src/driver/plic.rs](/kernel/src/driver/plic.rs) | Rust | 58 | 5 | 17 | 80 |
| [kernel/src/driver/uart.rs](/kernel/src/driver/uart.rs) | Rust | 184 | 48 | 46 | 278 |
| [kernel/src/driver/virtio_disk.rs](/kernel/src/driver/virtio_disk.rs) | Rust | 348 | 49 | 63 | 460 |
| [kernel/src/fs/bio.rs](/kernel/src/fs/bio.rs) | Rust | 219 | 38 | 37 | 294 |
| [kernel/src/fs/bitmap.rs](/kernel/src/fs/bitmap.rs) | Rust | 62 | 12 | 12 | 86 |
| [kernel/src/fs/devices.rs](/kernel/src/fs/devices.rs) | Rust | 40 | 1 | 9 | 50 |
| [kernel/src/fs/dinode.rs](/kernel/src/fs/dinode.rs) | Rust | 55 | 1 | 7 | 63 |
| [kernel/src/fs/file.rs](/kernel/src/fs/file.rs) | Rust | 186 | 35 | 44 | 265 |
| [kernel/src/fs/inode.rs](/kernel/src/fs/inode.rs) | Rust | 552 | 110 | 71 | 733 |
| [kernel/src/fs/log.rs](/kernel/src/fs/log.rs) | Rust | 197 | 29 | 22 | 248 |
| [kernel/src/fs/mod.rs](/kernel/src/fs/mod.rs) | Rust | 39 | 7 | 10 | 56 |
| [kernel/src/fs/pipe.rs](/kernel/src/fs/pipe.rs) | Rust | 129 | 65 | 42 | 236 |
| [kernel/src/fs/stat.rs](/kernel/src/fs/stat.rs) | Rust | 20 | 0 | 3 | 23 |
| [kernel/src/fs/superblock.rs](/kernel/src/fs/superblock.rs) | Rust | 89 | 19 | 20 | 128 |
| [kernel/src/ipc/bitmap.rs](/kernel/src/ipc/bitmap.rs) | Rust | 70 | 0 | 29 | 99 |
| [kernel/src/ipc/fifo.rs](/kernel/src/ipc/fifo.rs) | Rust | 112 | 21 | 44 | 177 |
| [kernel/src/ipc/mod.rs](/kernel/src/ipc/mod.rs) | Rust | 5 | 0 | 0 | 5 |
| [kernel/src/ipc/msgqueue.rs](/kernel/src/ipc/msgqueue.rs) | Rust | 166 | 4 | 60 | 230 |
| [kernel/src/ipc/semaphore.rs](/kernel/src/ipc/semaphore.rs) | Rust | 144 | 38 | 24 | 206 |
| [kernel/src/ipc/sharemem.rs](/kernel/src/ipc/sharemem.rs) | Rust | 209 | 7 | 52 | 268 |
| [kernel/src/lock/mod.rs](/kernel/src/lock/mod.rs) | Rust | 2 | 0 | 0 | 2 |
| [kernel/src/lock/sleeplock.rs](/kernel/src/lock/sleeplock.rs) | Rust | 75 | 7 | 16 | 98 |
| [kernel/src/lock/spinlock.rs](/kernel/src/lock/spinlock.rs) | Rust | 84 | 7 | 28 | 119 |
| [kernel/src/logo/mod.rs](/kernel/src/logo/mod.rs) | Rust | 1 | 0 | 1 | 2 |
| [kernel/src/main.rs](/kernel/src/main.rs) | Rust | 120 | 25 | 34 | 179 |
| [kernel/src/memory/address.rs](/kernel/src/memory/address.rs) | Rust | 122 | 2 | 42 | 166 |
| [kernel/src/memory/kalloc.rs](/kernel/src/memory/kalloc.rs) | Rust | 46 | 2 | 13 | 61 |
| [kernel/src/memory/mapping/kernel_map.rs](/kernel/src/memory/mapping/kernel_map.rs) | Rust | 92 | 17 | 19 | 128 |
| [kernel/src/memory/mapping/mod.rs](/kernel/src/memory/mapping/mod.rs) | Rust | 13 | 0 | 5 | 18 |
| [kernel/src/memory/mapping/page_table.rs](/kernel/src/memory/mapping/page_table.rs) | Rust | 535 | 130 | 95 | 760 |
| [kernel/src/memory/mapping/page_table_entry.rs](/kernel/src/memory/mapping/page_table_entry.rs) | Rust | 132 | 8 | 38 | 178 |
| [kernel/src/memory/mod.rs](/kernel/src/memory/mod.rs) | Rust | 80 | 8 | 14 | 102 |
| [kernel/src/misc.rs](/kernel/src/misc.rs) | Rust | 51 | 3 | 7 | 61 |
| [kernel/src/net/e1000.rs](/kernel/src/net/e1000.rs) | Rust | 0 | 194 | 43 | 237 |
| [kernel/src/net/mbuf.rs](/kernel/src/net/mbuf.rs) | Rust | 77 | 8 | 19 | 104 |
| [kernel/src/net/mod.rs](/kernel/src/net/mod.rs) | Rust | 3 | 0 | 0 | 3 |
| [kernel/src/net/protocol.rs](/kernel/src/net/protocol.rs) | Rust | 0 | 315 | 67 | 382 |
| [kernel/src/printf.rs](/kernel/src/printf.rs) | Rust | 79 | 6 | 10 | 95 |
| [kernel/src/process/context.rs](/kernel/src/process/context.rs) | Rust | 63 | 2 | 7 | 72 |
| [kernel/src/process/cpu.rs](/kernel/src/process/cpu.rs) | Rust | 152 | 50 | 39 | 241 |
| [kernel/src/process/elf.rs](/kernel/src/process/elf.rs) | Rust | 270 | 38 | 49 | 357 |
| [kernel/src/process/manager.rs](/kernel/src/process/manager.rs) | Rust | 284 | 116 | 76 | 476 |
| [kernel/src/process/mod.rs](/kernel/src/process/mod.rs) | Rust | 42 | 37 | 24 | 103 |
| [kernel/src/process/process.rs](/kernel/src/process/process.rs) | Rust | 303 | 161 | 134 | 598 |
| [kernel/src/process/thread.rs](/kernel/src/process/thread.rs) | Rust | 32 | 14 | 22 | 68 |
| [kernel/src/process/trapframe.rs](/kernel/src/process/trapframe.rs) | Rust | 44 | 13 | 5 | 62 |
| [kernel/src/shutdown.rs](/kernel/src/shutdown.rs) | Rust | 38 | 3 | 12 | 53 |
| [kernel/src/syscall/file.rs](/kernel/src/syscall/file.rs) | Rust | 458 | 33 | 65 | 556 |
| [kernel/src/syscall/ipc.rs](/kernel/src/syscall/ipc.rs) | Rust | 255 | 26 | 60 | 341 |
| [kernel/src/syscall/mod.rs](/kernel/src/syscall/mod.rs) | Rust | 232 | 7 | 45 | 284 |
| [kernel/src/syscall/proc.rs](/kernel/src/syscall/proc.rs) | Rust | 99 | 3 | 34 | 136 |
| [kernel/src/trap.rs](/kernel/src/trap.rs) | Rust | 206 | 78 | 67 | 351 |

[Summary](results.md) / Details / [Diff Summary](diff.md) / [Diff Details](diff-details.md)