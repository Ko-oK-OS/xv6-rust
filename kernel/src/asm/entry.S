    # qemu -kernel starts at 0x1000. the instructions
    # there seem to be provided by qemu, as if it
    # were a ROM. the code at 0x1000 jumps to
    # 0x80000000, the _entry function here,
    # in machine mode. each CPU starts here.
    .section .text
    .globl _entry
_entry:
	# set up a stack for Rust.
    # stack0 is declared below,
    # with a 16KB stack per CPU.
    # sp = stack0 + (hartid * 16384)
    # PS: 16KB stack for few stack bump
    la sp, stack0
    li a0, 16384
	csrr a1, mhartid
    addi a1, a1, 1
    mul a0, a0, a1
    add sp, sp, a0
	# jump to start() in start.rs
    call start

    .section .data
    .align 4
stack0:
    .space 16384*8 # 8 is NCPU in param.rs