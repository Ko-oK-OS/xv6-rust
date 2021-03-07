# Boot

## 禁用标准库

项目默认是链接 Rust 标准库 std 的，它依赖于操作系统，因此我们需要显式通过 `#![no_std]` 将其禁用。

## 移除运行时环境依赖

对于大多数语言，他们都使用了**运行时系统**（Runtime System），这可能导致 `main` 函数并不是实际执行的第一个函数。

以 Rust 语言为例，一个典型的链接了标准库的 Rust 程序会首先跳转到 C 语言运行时环境中的 `crt0`（C Runtime Zero）进入 C 语言运行时环境设置 C 程序运行所需要的环境（如创建堆栈或设置寄存器参数等）。

然后 C 语言运行时环境会跳转到 Rust 运行时环境的入口点（Entry Point）进入 Rust 运行时入口函数继续设置 Rust 运行环境，而这个 Rust 的运行时入口点就是被 `start` 语义项标记的。Rust 运行时环境的入口点结束之后才会调用 `main` 函数进入主程序。

C 语言运行时环境和 Rust 运行时环境都需要标准库支持，我们的程序无法访问。如果覆盖了 `start` 语义项，仍然需要 `crt0`，并不能解决问题。所以需要重写覆盖整个 `crt0` 入口点：

我们使用`#![no_main]`来声明不使用`main`函数作为项目入口点。

## 编译为裸机目标

在默认情况下，Rust 尝试适配当前的系统环境，编译可执行程序。举个例子，如果你使用` x86_64 `平台的 Windows 系统，Rust 将尝试编译一个扩展名为 `.exe` 的 Windows 可执行程序，并使用 `x86_64` 指令集。这个环境又被称作为你的宿主系统（Host System）。

为了描述不同的环境，Rust 使用一个称为目标三元组（Target Triple）的字符串 `<arch><sub>-<vendor>-<sys>-<abi>`。要查看当前系统的目标三元组，我们可以运行 `rustc --version --verbose`。

这里我们使用`riscv64gc-unknown-none-elf`作为运行环境，这个运行环境没有操作系统，这是由`none`来决定的。

## 调整内存布局

我们使用**Linker Script（链接脚本）**来为指定程序生成内存布局：

**`kernel.ld:`**

```linker script
OUTPUT_ARCH("riscv")
ENTRY(_entry)

SECTIONS
{
  /*
   * ensure that entry.S / _entry is at 0x80000000,
   * where qemu's -kernel jumps.
   */
  . = 0x80000000;

  .text :
  {
    *(.text .text.*)
    . = ALIGN(0x1000);
    *(trampsec)
  }

  .rodata :
  {
    *(.rodata .rodata.*)
  }

  . = ALIGN(0x1000);
  PROVIDE(etext = .);

  /*
   * make sure end is after data and bss.
   */
  .data : {
    *(.data .data.*)
  }
  .bss : {
    *(.bss .bss.*)
    *(.sbss* .sbss.*)
  }
  PROVIDE(end = .);
}
```

在这里我们首先使用`OUPUT_ARCH`指定了指令集架构，然后使用`ENTRY`指定了程序的入口点，在这里我们指定为`_entry`，随后我们将操作系统的启动地址设置为`0x80000000`，然后设置`text`、`rodata`、`data`等段的地址，然后最后最后的地址标记为`end`，以便在内存分配的时候作为起始地址（注：`end`的地址随着我们程序的不断开发会进行变化，并不是不变的值）。

## 重写程序入口点

由于我们在`kernel.ld`中指定了程序的入口点，因此我们需要在`entry.asm`中填写程序的入口点：

```assembly
# qemu -kernel starts at 0x1000. the instructions
    # there seem to be provided by qemu, as if it
    # were a ROM. the code at 0x1000 jumps to
    # 0x80000000, the _entry function here,
    # in machine mode. each CPU starts here.
    .text
    .globl _entry
_entry:
	# set up a stack for Rust.
    # stack0 is declared below,
    # with a 4096-byte stack per CPU.
    # sp = stack0 + (hartid * 4096)
    la sp, stack0
    li a0, 1024*4
	csrr a1, mhartid
    addi a1, a1, 1
    mul a0, a0, a1
    add sp, sp, a0
	# jump to start() in start.rs
    call start


    .section .data
    .align 4
stack0:
    .space 4096 * 8 # 8 is NCPU in param.rs
```

在汇编文件里我们声明`text`段并且编写`_entry`汇编，在这里我们声明了栈地址，并将栈地址放在了`text`段里，`_entry`主要通过读取`mhartid`寄存器获取当前硬件CPU个数（我们使用QEMU硬件模拟器来模拟，可以在编译规则里修改CPU格式）并且将`sp`寄存器（栈寄存器）移动到对应的位置，随后调用`start`函数来进行`bootloader`，`start`函数定义在`start.rs`中：

```rust
use crate::register::{
    mstatus, mepc, satp, medeleg, mideleg, sie, mhartid, tp, clint, 
    mscratch, mtvec, mie
};

use crate::rust_main::rust_main;
use crate::define::param::NCPU;

static mut timer_scratch:[[u64; 5]; NCPU] = [[0u64; 5]; NCPU];

#[no_mangle]
pub unsafe fn start() -> !{
    // Set M Previlege mode to Supervisor, for mret
    mstatus::set_mpp();

    // set M Exception Program Counter to main, for mret.
    // requires gcc -mcmodel=medany
    mepc::write(rust_main as usize);

    // disable paging for now.
    satp::write(0);

    // delegate all interrupts and exceptions to supervisor mode.
    medeleg::write(0xffff);
    mideleg::write(0xffff);
    sie::write(sie::read() | sie::SIE::SEIE as usize | sie::SIE::STIE as usize | sie::SIE::SSIE as usize);

    // ask for clock interrupts.
    timerinit();

    // keep each CPU's hartid in its tp register, for cpuid().
    let id:usize = mhartid::read(); 
    tp::write(id);

    // switch to supervisor mode and jump to main().
    llvm_asm!("mret"::::"volatile");

    loop{}
    
}

// set up to receive timer interrupts in machine mode,
// which arrive at timervec in kernelvec.S,
// which turns them into software interrupts for
// devintr() in trap.rs.
unsafe fn timerinit(){
    // each CPU has a separate source of timer interrupts.
    let id = mhartid::read();

    // ask the CLINT for a timer interrupt.
    let interval = 1000000;// cycles; about 1/10th second in qemu.
    clint::add_mtimecmp(id, interval);


    // prepare information in scratch[] for timervec.
    // scratch[0..2] : space for timervec to save registers.
    // scratch[3] : address of CLINT MTIMECMP register.
    // scratch[4] : desired interval (in cycles) between timer interrupts.

    timer_scratch[id][3] = clint::count_mtiecmp(id) as u64;
    timer_scratch[id][4] = interval;
    mscratch::write(timer_scratch[id].as_ptr() as usize);

    // set the machine-mode trap handler.
    extern "C" {
        fn timervec();
    }

    mtvec::write(timervec as usize);

    // enable machine-mode interrupts.
    mstatus::enable_interrupt();

    // enable machine-mode timer interrupts.
    mie::write(mie::read() | mie::MIE::MTIE as usize);

}
```

 在`start`函数中我们对M态的寄存器做一些初始化的操作，具体操作见代码中的注释。我们对寄存器的一系列操作均定义在`register/`目录下作为`mod`，我们可以将其作为包来调用。

在做了一系列初始化的操作之后我们执行`mret`指令从M Mode切换到S Mode，正式开始操作系统内核。