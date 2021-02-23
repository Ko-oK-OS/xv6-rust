    .section .text.entry
    .globl _entry
# 目前 _start 的功能：将预留的栈空间写入 $sp，然后跳转至 rust_main
_entry:
    la sp, boot_stack_top
    jal main

    # 回忆：bss 段是 ELF 文件中只记录长度，而全部初始化为 0 的一段内存空间
    # 这里声明字段 .bss.stack 作为操作系统启动时的栈
    .section .bss.stack
    .global boot_stack
boot_stack:
    # 16K 启动栈大小
    .space 4096 * 16
    .global boot_stack_top
boot_stack_top:
    # 栈结尾