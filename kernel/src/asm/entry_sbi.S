    # An SBI implementation presents the kernel as an S-mode payload. a0 is
    # the hart ID; unlike the bare-metal path, no M-mode setup or mret is
    # required here.
    .section .text
    .globl _entry
_entry:
    la sp, stack0
    li t0, 16384
    addi t1, a0, 1
    mul t0, t0, t1
    add sp, sp, t0
    mv tp, a0
    call rust_main

1:
    wfi
    j 1b

    .section .data
    .align 4
stack0:
    .space 16384*8
