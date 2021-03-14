# GDB调试

我们需要使用`riscv64-unknown-elf-gdb`来对我们的程序进行调试

1. 前往[清华镜像站](https://mirrors.tuna.tsinghua.edu.cn/gnu/gdb/?C=M&O=D)下载最新的GDB源码、
2. 解压源代码，并定位到目录
3. 执行以下命令：

```shell
mkdir build
cd build
../configure --prefix=/usr/local  --target=riscv64-unknown-elf
```

4. 编译安装

```shell
make -j$(nproc)
sudo make install
```

5. 使用`make debug`指令对程序进行gdb调试

