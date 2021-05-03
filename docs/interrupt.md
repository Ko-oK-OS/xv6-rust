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
首先我们在`trapinit`函数里面将`kernelvec`作为地址写入`stvec`寄存器中，`stvec`寄存器为`Supervisor Trap Vector Base Address Register `，包括向量基地址以及向量模式。
