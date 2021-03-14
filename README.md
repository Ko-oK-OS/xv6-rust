# xv6-rust
## Introduction

```
____   ___   _____      ____   ,--.     .______       __    __      _______.___________.  
 \\  \./ //   \\   \    //  /  /  /      |   _  \     |  |  |  |    /       |           |  
  \\    //     \\   \  //  /  /  / ---.  |  |_)  |    |  |  |  |   |   (----`---|  |----`
   \\   \\      \\    '   /   |   .-.  ' |      /     |  |  |  |    \   \       |  |
  //     \\      \\      /    \\  |  | | |  |\  ----. |  `--'  |.----)   |      |  |
 //  /'\  \\      \\    /      \\  `' /  | _| `._____| \______/ |_______/       |__|           
 '--'   '--'        `--'        `----'               

```



This is a try to implement xv6 OS in Rust. 

What's more, we are desired to add something new to our OS, like GUI and network.

## Start  
### QEMU
**Linux**:  
```
wget https://download.qemu.org/qemu-5.2.0.tar.x  
tar xvJf qemu-5.0.0.tar.xz  
cd qemu-5.0.0  
./configure --target-list=riscv32-softmmu,riscv64-softmmu   
make -j$(nproc)  
sudo make install  
```
If you find some errors when building, you can slove by following hints:  
`ERROR: pkg-config binary 'pkg-config' not found` : `sudo apt-get install pkg-config`  
`ERROR: glib-2.48 gthread-2.0 is required to compile QEMU`: `sudo apt-get install libglib2.0-dev`  
`ERROR: pixman >= 0.21.8 not present`: `sudo apt-get install libpixman-1-dev` 

### Rust
You need download rust to start our environment. We suggest you to use official shell:  
```
curl https://sh.rustup.rs -sSf | sh
```
If you fail because of slow network speed. You can try this to speed up:   
```
export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
curl https://sh.rustup.rs -sSf | sh
```

If you have finished these, you can test your environment by following commands:  
```
source $HOME/.cargo/env  
rustc --version
```
In addition,  we'd better change the package mirror address crates.io used by the package manager cargo to the mirror server of the University of Science and Technology of China to speed up the download of the tripartite library. We open (create a new file if it doesn't exist) ~/.cargo/config and modify the content to:  
```
[source.crates-io]
registry = "https://github.com/rust-lang/crates.io-index"
replace-with = 'ustc'
[source.ustc]
registry = "git://mirrors.ustc.edu.cn/crates.io-index"
```
Besides,  you also update some tools in rust:

```
rustup target add riscv64gc-unknown-none-elf
cargo install cargo-binutils
rustup component add llvm-tools-preview
```

Finally, you run this OS on your machine by excuteing following commands:  

```
git clone https://github.com/KuangjuX/xv6-rust.git
cd xv6-rust/kernel
make run
```

## GDB Usage

terminal 1:
```
./kernel $ make qemu-gdb
```
terminal 2:
```
./kernel $ riscv64-unknown-elf-gdb
... (an example)
(gdb) b kvminit
(gdb) c
...
```

You can also use `make debug` .

## Some Useful Links

- [Building a stupid Mutex in the Rust](https://medium.com/@Mnwa/building-a-stupid-mutex-in-the-rust-d55886538889)  
- [Rust源码分析：std::sync::Mutex](https://zhuanlan.zhihu.com/p/50006335)   
- [buddy_system_allocator](https://github.com/rcore-os/buddy_system_allocator)  
- [Write a OS in Rust](https://os.phil-opp.com)  
- [rCore Tutorial](https://rcore-os.github.io/rCore-Tutorial-deploy/)  
- [xv6-riscv](https://github.com/mit-pdos/xv6-riscv)
- [xv6-riscv-rust](https://github.com/Jaic1/xv6-riscv-rust)