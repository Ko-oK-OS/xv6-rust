TYPE=debug
RELEASE_FLAG=
K=kernel/src
U=user/src
TARGET=riscv64gc-unknown-none-elf
RISCVCC?=riscv64-unknown-elf-gcc
CFLAGS=-Wall -Wextra -pedantic
CFLAGS+=-static -ffreestanding -nostdlib -fno-exceptions
CFLAGS+=-march=rv64gc -mabi=lp64 \
		-Wall -Werror -O -fno-omit-frame-pointer -ggdb -MD -mcmodel=medany \
		-ffreestanding -fno-common -nostdlib -mno-relax -I. -fno-stack-protector \
		-fno-pie -no-pie
OBJCOPY=riscv64-unknown-elf-objcopy
TARGET_PATH=./target/$(TARGET)/$(TYPE)
KERNEL_LIBS=$(TARGET_PATH)
USER_LIBS=$(TARGET_PATH)
KERNEL_LIB=-lkernel -lgcc
KERNEL_LINKER_SCRIPT=$K/kernel.ld
KERNEL_LIB_OUT=$(KERNEL_LIBS)/libkernel.a
KERNEL_OUT=kernel.elf
USER_LIB_OUT=$(USER_LIBS)/libuser.rlib
USER_LINKER_SCRIPT=$U/user.ld

QEMU_BINARY=qemu-system-riscv64
MACH=virt
CPU=rv64
CPUS=4
MEM=128M
QEMU_DRIVE=hdd.img

all: $(USER_LIB_OUT) $(KERNEL_OUT)

K_AUTOGEN_FILES = $K/asm/symbols.S $K/symbols/gen.rs $K/syscall/gen.rs
U_AUTOGEN_FILES = $U/usys.S $U/syscall.h

ASSEMBLY_FILES = $K/asm/boot.S \
				 $K/asm/trampoline.S $K/asm/symbols.S \
				 $K/asm/swtch.S $K/asm/kernelvec.S

CXX_FILES = 

$(KERNEL_LIB_OUT): $(K_AUTOGEN_FILES) $(USER_LIBS)/initcode $(USER_LIB_OUT) FORCE
	cd kernel && cargo xbuild --target=$(TARGET) $(RELEASE_FLAG)

$(KERNEL_OUT): $(KERNEL_LIB_OUT) $(ASSEMBLY_FILES) $(LINKER_SCRIPT) $(CXX_FILES)
	$(RISCVCC) $(CFLAGS) -T$(KERNEL_LINKER_SCRIPT) -o $@ $(ASSEMBLY_FILES) $(CXX_FILES) -L$(KERNEL_LIBS) $(KERNEL_LIB)

$(USER_LIB_OUT): $(U_AUTOGEN_FILES) FORCE
	cd user && RUSTFLAGS="-C link-arg=-T$(USER_LINKER_SCRIPT)" cargo xbuild --target=$(TARGET) $(RELEASE_FLAG)

$(USER_LIBS)/initcode: $U/initcode.S $U/syscall.h
	$(RISCVCC) $(CFLAGS) -T$(USER_LINKER_SCRIPT) -o $@.elf $<
	$(OBJCOPY) -S -O binary $@.elf $@

$K/asm/symbols.S: utils/symbols.S.py utils/symbols.py
	$< > $@
$K/symbols/gen.rs: utils/symbols_gen.rs.py utils/symbols.py
	$< > $@
$K/syscall/gen.rs: utils/syscall_gen.rs.py utils/syscall.py
	$< > $@
$U/usys.S: utils/usys.S.py utils/syscall.py
	$< > $@
$U/syscall.h: utils/syscall.h.py utils/syscall.py
	$< > $@

QEMUOPTS =  -machine $(MACH) -cpu $(CPU) -smp $(CPUS) -m $(MEM) \
            -nographic -serial mon:stdio -bios none -kernel $(KERNEL_OUT)
QEMUOPTS += -drive file=$(QEMU_DRIVE),if=none,format=raw,id=x0 -device virtio-blk-device,drive=x0,bus=virtio-mmio-bus.0

qemu: all $(QEMU_DRIVE)
	$(QEMU_BINARY) $(QEMUOPTS)

qemudbg: all $(QEMU_DRIVE)
	$(QEMU_BINARY) $(QEMUOPTS) -d int -D qemu.log

qemuasm: all $(QEMU_DRIVE)
	$(QEMU_BINARY) $(QEMUOPTS) -d int,in_asm -D qemu.log

qemugdb: all $(QEMU_DRIVE)
	$(QEMU_BINARY) $(QEMUOPTS) -S -gdb tcp::1234

objdump: $(KERNEL_OUT)
	cd kernel && cargo objdump --target $(TARGET) -- -disassemble -no-show-raw-insn -print-imm-hex ../$(KERNEL_OUT)

readelf: $(KERNEL_OUT)
	readelf -a $<

UPROGS = $(USER_LIBS)/init \
		 $(USER_LIBS)/test1 \
		 $(USER_LIBS)/test2 \
		 $(USER_LIBS)/test3

target/mkfs: fs/fs.cpp
	g++ $< -o $@ --std=c++11

$(QEMU_DRIVE): $(UPROGS) target/mkfs
	dd if=/dev/zero of=$@ count=32 bs=1048576
	./target/mkfs hdd.img $(UPROGS) ./fs/test.txt

userobjdump: $(USERPROG)
	cargo objdump --target $(TARGET) -- -disassemble -no-show-raw-insn -print-imm-hex $<

userreadelf: $(USERPROG)
	readelf -a $<

CARGO_RUSTDOC_PARA = -- \
					--no-defaults \
					--passes strip-hidden \
					--passes collapse-docs \
					--passes unindent-comments \
					--passes strip-priv-imports

docs:
	cd user && cargo rustdoc --lib $(CARGO_RUSTDOC_PARA)
	cd kernel && cargo rustdoc --open $(CARGO_RUSTDOC_PARA)

ci:
	mkdir -p $(USER_LIBS)
	touch $(USER_LIBS)/initcode
	touch $(UPROGS)

.PHONY: clean
clean:
	cargo clean
	rm -f $(KERNEL_OUT) $(OUTPUT)
	rm -f $(K_AUTOGEN_FILES) $(U_AUTOGEN_FILES)

FORCE:
