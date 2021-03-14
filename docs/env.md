# 环境配置

### QEMU配置

```shell
wget https://download.qemu.org/qemu-5.0.0.tar.x  
tar xvJf qemu-5.0.0.tar.xz  
cd qemu-5.0.0  
./configure --target-list=riscv32-softmmu,riscv64-softmmu   
make -j$(nproc)  
sudo make install  
```

**注**：我们使用QEMU-5.0.0来进行程序构建，建议不去使用其他版本，这可能会造成我们的程序无法运行

当安装QEMU的时候你可能会遇到一些问题，我们这里给出了一些可能的问题列表以及解决方案：

`ERROR: pkg-config binary 'pkg-config' not found`：`sudo apt-get install pkg-config`

`ERROR: glib-2.48 gthread-2.0 is required to compile QEMU`：`sudo apt-get install libglib2.0-dev`

`ERROR: pixman >= 0.21.8 not present`：`sudo apt-get install libpixman-1-dev`

以上为可能遇到的问题，如果你遇到其他问题，只需要根据提示安装对应的依赖即可。

### Rust环境配置

我们推荐使用官方的脚本去构建环境：

```shell
curl https://sh.rustup.rs -sSf | sh
```

由于Rust的服务器设置在国外，如果没有代理则很可能会超时，因此我们可以使用中科大的镜像来构建环境：

```shell
export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
curl https://sh.rustup.rs -sSf | sh
```

在这之后，你可以通过一些命令来测试是否完成了rust环境的配置：

```shell
source $HOME/.cargo/env  
rustc --version
```

安装完Rust之后，我们建议你在`.cargo/config`文件下添加一些内容（没有就创建），这将会加速你安装依赖的速度：

```shell
[source.crates-io]
registry = "https://github.com/rust-lang/crates.io-index"
replace-with = 'ustc'
[source.ustc]
registry = "git://mirrors.ustc.edu.cn/crates.io-index"
```

除此之外，你还需要去安装一些Rust的工具用来构建我们的程序：

```shell
rustup target add riscv64gc-unknown-none-elf
cargo install cargo-binutils
rustup component add llvm-tools-preview
```

在这之后，你就可以clone我们的项目来开始你的OS之旅了！

```shell
git clone https://github.com/Ko-ok-OS/xv6-rust.git
cd xv6-rust/kernel
make run
```

