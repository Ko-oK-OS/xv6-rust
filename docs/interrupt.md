# 中断
## 内核中断机制
### 中断代理
```Rust
// delegate all interrupts and exceptions to supervisor mode.
    medeleg::write(0xffff);
    mideleg::write(0xffff);
    sie::write(sie::read() | sie::SIE::SEIE as usize | sie::SIE::STIE as usize | sie::SIE::SSIE as usize);
```  
首先，我们在bootloader阶段进行中断代理，此时，我们仍处在M特权级，而我们的内核需要运行在S特权级。默认情况下，所有的陷阱中断都会在M态进行处理，因此我们需要将其代理到S态以便我们进行处理。    
   

这里首先简要介绍一下`medeleg`(machine exception delegation register),`mideleg`(machine interrupt delegation register)以及`sie`（supervisor interrupt register）寄存器的作用：  
  

`medeleg`和`mideleg`表明表明当前的中断或者异常应当处理在更低的特权级。在系统中我们拥有3个特权级（M/S/U），通过设置`medeleg`和`mideleg`可以将发生在系统的中断代理到S态进行处理。如果支持U态的话，我们也可以通过设置`sedeleg`和`sideleg`寄存器来将中断代理到U态进行处理。 


而`sie`则是中断使能寄存器的意思，0-15位被分配为标准中断原因，16位以上则为特定的平台或者客户端所设置。  
在这里我们需要设置`sie`寄存器为可写的并且设置其`SEIE`、`STIE`以及`SSIE`位。    
   

其中，`SEIE`设置表明开启S态外部中断；`STIE`表示开启S态时钟中断；`SSIE`设置表明开启S态软件中断。
 
### 开启中断
首先我们在`trapinit`函数里面将`kernelvec`作为地址写入`stvec`寄存器中，`stvec`寄存器为`Supervisor Trap Vector Base Address Register `，包括向量基地址以及向量模式。如此一来，当我们的操作系统内核检测到发生中断后，就去`stvec`去查看处理陷阱函数的地址，随后进入其中进行陷阱处理。  
   
其中，我们的陷阱处理函数由一段汇编表示:
```asm
.section .text
.global kertrap
.globl kernelvec
.align 4
kernelvec:
        // make room to save registers.
        addi sp, sp, -256

        // save the registers.
        sd ra, 0(sp)
        sd sp, 8(sp)
        sd gp, 16(sp)
        sd tp, 24(sp)
        sd t0, 32(sp)
        sd t1, 40(sp)
        sd t2, 48(sp)
        sd s0, 56(sp)
        sd s1, 64(sp)
        sd a0, 72(sp)
        sd a1, 80(sp)
        sd a2, 88(sp)
        sd a3, 96(sp)
        sd a4, 104(sp)
        sd a5, 112(sp)
        sd a6, 120(sp)
        sd a7, 128(sp)
        sd s2, 136(sp)
        sd s3, 144(sp)
        sd s4, 152(sp)
        sd s5, 160(sp)
        sd s6, 168(sp)
        sd s7, 176(sp)
        sd s8, 184(sp)
        sd s9, 192(sp)
        sd s10, 200(sp)
        sd s11, 208(sp)
        sd t3, 216(sp)
        sd t4, 224(sp)
        sd t5, 232(sp)
        sd t6, 240(sp)

	// call the C trap handler in trap.rs
        call kerneltrap

        // restore registers.
        ld ra, 0(sp)
        ld sp, 8(sp)
        ld gp, 16(sp)
        // not this, in case we moved CPUs: ld tp, 24(sp)
        ld t0, 32(sp)
        ld t1, 40(sp)
        ld t2, 48(sp)
        ld s0, 56(sp)
        ld s1, 64(sp)
        ld a0, 72(sp)
        ld a1, 80(sp)
        ld a2, 88(sp)
        ld a3, 96(sp)
        ld a4, 104(sp)
        ld a5, 112(sp)
        ld a6, 120(sp)
        ld a7, 128(sp)
        ld s2, 136(sp)
        ld s3, 144(sp)
        ld s4, 152(sp)
        ld s5, 160(sp)
        ld s6, 168(sp)
        ld s7, 176(sp)
        ld s8, 184(sp)
        ld s9, 192(sp)
        ld s10, 200(sp)
        ld s11, 208(sp)
        ld t3, 216(sp)
        ld t4, 224(sp)
        ld t5, 232(sp)
        ld t6, 240(sp)

        addi sp, sp, 256

        // return to whatever we were doing in the kernel.
        sret
```
  
可以看到，我们将必要的寄存器值保存进栈里，然后调用`kerneltrap`这个函数进行内核陷阱的处理，当我们执行完`kerneltrap`函数返回后，我们将栈内容恢复，并将保存的上下文内容恢复，随后执行`sret`指令返回发生陷阱的指令后继续进行运行。