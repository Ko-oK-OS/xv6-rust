    .section .text.entry
    .globl _entry
    # _entry is the entry of the OS
_entry:
    la sp, stack0
    li a0, 1024*4
    csrr a1, mhartid
    addi a1, a1, 1
    mul a0, a0, a1
    add sp, sp, a0
    jal start

stack0:
    # 16K 启动栈大小
    .space 4096 * 16