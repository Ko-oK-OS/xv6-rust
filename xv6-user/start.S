.globl main
.globl exit

.section .text
.globl _start
_start:

    jal ra, main

    jal x0, exit