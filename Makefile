K=kernel
U=user

TARGET      := riscv64gc-unknown-none-elf
MODE        := debug
CPUS		:= 3

KERNEL_FILE := $K/target/$(TARGET)/$(MODE)/kernel
BIN_FILE    := $K/target/$(TARGET)/$(MODE)/kernel.bin
fs			:= $K/fs.img

OBJDUMP     := rust-objdump --arch-name=riscv64
OBJCOPY     := rust-objcopy --binary-architecture=riscv64

QEMU 		:= qemu-system-riscv64

QEMUOPTS     = -machine virt -bios none -kernel $(KERNEL_FILE) -m 3G -smp $(CPUS) -nographic
QEMUOPTS    += -drive file=$(fs),if=none,format=raw,id=x0
QEMUOPTS	+= -device virtio-blk-device,drive=x0,bus=virtio-mmio-bus.0



.PHONY: qemu run clean kernel build

build: $(BIN_FILE)

$(BIN_FILE): kernel
	$(OBJCOPY) $(KERNEL_FILE) --strip-all -O binary $@ 

kernel:
	cd kernel && cargo build

clean:
	cd kernel && cargo clean

qemu: build
	$(QEMU) $(QEMUOPTS)

run: build qemu