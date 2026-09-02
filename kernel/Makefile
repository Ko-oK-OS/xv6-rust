TARGET      := riscv64gc-unknown-none-elf
MODE        := debug
KERNEL_FILE := target/$(TARGET)/$(MODE)/kernel
BIN_FILE    := target/$(TARGET)/$(MODE)/kernel.bin
CPUS		:= 3

# Reproducible builds must fail instead of silently resolving dependency
# versions that differ from the reviewed kernel/Cargo.lock.
CARGO_FLAGS := --locked

FS_IMG		:= ../fs.img
KERNEL_ASM	:= kernel.S

OBJDUMP     := rust-objdump --arch-name=riscv64
OBJCOPY     := rust-objcopy --binary-architecture=riscv64

QEMU 		:= qemu-system-riscv64

# Pick a free UDP port instead of deriving a fixed one from the user ID. The
# latter collides when more than one checkout or QEMU instance is running.
FWDPORT := $(shell python3 -c 'import socket; s=socket.socket(socket.AF_INET, socket.SOCK_DGRAM); s.bind(("", 0)); print(s.getsockname()[1])' 2>/dev/null || expr `id -u` % 5000 + 25999)

QEMUOPTS     = -machine virt -bios none -kernel $(KERNEL_FILE) -m 3G -smp $(CPUS) -nographic
QEMUOPTS    += -drive file=${FS_IMG},if=none,format=raw,id=x0 
QEMUOPTS	+= -device virtio-blk-device,drive=x0,bus=virtio-mmio-bus.0
QEMUOPTS 	+= -netdev user,id=net0,hostfwd=udp::$(FWDPORT)-:2000 -object filter-dump,id=net0,netdev=net0,file=packets.pcap
QEMUOPTS 	+= -device e1000,netdev=net0,bus=pcie.0


QEMUGDB 	:= -gdb tcp::26000

GDB         := ~/riscv/riscv64-unknown-elf-gcc-8.3.0-2020.04.1-x86_64-linux-ubuntu14/bin/riscv64-unknown-elf-gdb

.PHONY: doc kernel build clean qemu run sbi test

# 默认 build 为输出二进制文件
build: $(BIN_FILE) 

# 通过 Rust 文件中的注释生成 os 的文档
doc:
	@cargo doc $(CARGO_FLAGS) --document-private-items

# 编译 kernel
kernel:
	@cargo build $(CARGO_FLAGS)

# 生成 kernel 的二进制文件
$(BIN_FILE): kernel
	@$(OBJCOPY) $(KERNEL_FILE) --strip-all -O binary $@

# 查看反汇编结果
asm:
	@cargo build $(CARGO_FLAGS)
	@$(OBJDUMP) -d $(KERNEL_FILE) > $(KERNEL_ASM)

# 清理编译出的文件
clean:
	@cargo clean

# 运行 QEMU
qemu: build
	$(QEMU) $(QEMUOPTS)

qemu-gdb:
	@cargo build $(CARGO_FLAGS)
	@echo "*** Now run 'gdb' in another window." 1>&2
	$(QEMU) $(QEMUOPTS) -S $(QEMUGDB)

# 一键运行
run: build qemu

# Build an ELF that enters directly in S-mode and uses legacy SBI services.
sbi:
	@cargo build $(CARGO_FLAGS) --features sbi

test: build
	@cargo test $(CARGO_FLAGS)


debug: build
	@tmux new-session -d \
		"$(QEMU) $(QEMUOPTS) -s -S" && \
		tmux split-window -h "$(GDB) -ex 'file $(KERNEL_FILE)' -ex 'set arch riscv:rv64' -ex 'target remote localhost:1234'" && \
		tmux -2 attach-session -d
