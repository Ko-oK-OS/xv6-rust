# 中断
## 内核中断机制
### 开启中断
首先我们在`trapinit`函数里面将`kernelvec`作为地址写入`stvec`寄存器中，`stvec`寄存器为`Supervisor Trap Vector Base Address Register `，包括向量基地址以及向量模式。
