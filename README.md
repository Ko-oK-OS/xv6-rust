# xv6-rust
## Introduction
This is a try to implement xv6 OS in Rust.

## Start  
### QEMU
**Linux**:  
```
wget https://download.qemu.org/qemu-5.2.0.tar.x  
tar xvJf qemu-5.2.0.tar.xz  
cd qemu-5.2.0  
./configure --target-list=riscv32-softmmu,riscv64-softmmu   
make -j$(nproc)  
sudo make install  
```   
If you find some errors when building, you can slove by following hints:  
`ERROR: pkg-config binary 'pkg-config' not found` : `sudo apt-get install pkg-config`  
`ERROR: glib-2.48 gthread-2.0 is required to compile QEMU`: `sudo apt-get install libglib2.0-dev`  
`ERROR: pixman >= 0.21.8 not present`: `sudo apt-get install libpixman-1-dev` 

### Rust
You need download rust to start our env. We suggest you to use offical shell:  
```
curl https://sh.rustup.rs -sSf | sh
```   
If you fail because of slow internet speed. You can try this to speed up:   
```
export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
curl https://sh.rustup.rs -sSf | sh
```   

If you have finished these, you can test your env by following comand:  
```
source $HOME/.cargo/env  
rustc --version

```   
Additionly, we'd better change the package mirror address crates.io used by the package manager cargo to the mirror server of the University of Science and Technology of China to speed up the download of the tripartite library. We open (create a new file if it doesn't exist) ~/.cargo/config and modify the content to:  
```
[source.crates-io]
registry = "https://github.com/rust-lang/crates.io-index"
replace-with = 'ustc'
[source.ustc]
registry = "git://mirrors.ustc.edu.cn/crates.io-index"
```  
Finally, you run this OS on your machine by excuting following commands:  
```
git clone https://github.com/KuangjuX/xv6-rust.git
cd xv6-rust/kernel

rustup target add riscv64imac-unknown-none-elf
cargo install cargo-binutils
rustup component add llvm-tools-preview


make run
```

## Some Useful Links
[Building a stupid Mutex in the Rust](https://medium.com/@Mnwa/building-a-stupid-mutex-in-the-rust-d55886538889)  
[Rust源码分析：std::sync::Mutex](https://zhuanlan.zhihu.com/p/50006335)