KERNEL = kernel/target/riscv64gc-unknown-none-elf/debug/kernel
USER = xv6-user
INCLUDE = xv6-user/include
CPUS = 3

TOOLPREFIX = $(shell if command -v riscv64-unknown-elf-gcc >/dev/null 2>&1; then \
		echo riscv64-unknown-elf-; \
	elif command -v riscv64-elf-gcc >/dev/null 2>&1; then \
		echo riscv64-elf-; \
	else \
		echo riscv64-unknown-elf-; \
	fi)

CC = $(TOOLPREFIX)gcc
LD = $(TOOLPREFIX)ld
OBJCOPY = $(TOOLPREFIX)objcopy
OBJDUMP = $(TOOLPREFIX)objdump

CFLAGS = -Wall -Werror -O -fno-omit-frame-pointer -ggdb
CFLAGS += -MD
CFLAGS += -mcmodel=medany
CFLAGS += -ffreestanding -fno-common -nostdlib -mno-relax
CFLAGS += -I./xv6-user
CFLAGS += $(shell $(CC) -fno-stack-protector -E -x c /dev/null >/dev/null 2>&1 && echo -fno-stack-protector)
CFLAGS += $(shell $(CC) -Werror -Wno-error=infinite-recursion -E -x c /dev/null >/dev/null 2>&1 && echo -Wno-error=infinite-recursion)

# Disable PIE when possible (for Ubuntu 16.10 toolchain)
ifneq ($(shell $(CC) -dumpspecs 2>/dev/null | grep -e '[^f]no-pie'),)
CFLAGS += -fno-pie -no-pie
endif
ifneq ($(shell $(CC) -dumpspecs 2>/dev/null | grep -e '[^f]nopie'),)
CFLAGS += -fno-pie -nopie
endif

LDFLAGS = -z max-page-size=4096

run: fs.img $(UPROGS)
	make -C kernel run

$(KERNEL):
	make -C kernel

asm: $(KERNEL)
	$(OBJDUMP) -S $(KERNEL) > kernel.S

clean:
	rm -rf kernel.S
	make -C kernel clean
	rm -f $(USER)/*.o $(USER)/*.d $(USER)/*.asm $(USER)/*.sym \
	$(USER)/initcode $(USER)/initcode.out fs.img \
	xv6-mkfs/mkfs $(USER)/usys.S \
	$(UPROGS) tests/badfd.o tests/badfd.d tests/badfd.asm tests/badfd.sym

$(USER)/initcode: $(USER)/initcode.S
	$(CC) $(CFLAGS) -march=rv64g -nostdinc -I. -Iinclude -c $(USER)/initcode.S -o $(USER)/initcode.o
	$(LD) $(LDFLAGS) -N -e start -Ttext 0 -o $(USER)/initcode.out $(USER)/initcode.o
	$(OBJCOPY) -S -O binary $(USER)/initcode.out $(USER)/initcode
	$(OBJDUMP) -S $(USER)/initcode.o > $(USER)/initcode.asm

ULIB = $(USER)/ulib.o $(USER)/usys.o $(USER)/printf.o $(USER)/umalloc.o

_%: %.o $(ULIB)
	$(LD) $(LDFLAGS) -N -e main -Ttext 0 -o $@ $^
	$(OBJDUMP) -S $@ > $*.asm
	$(OBJDUMP) -t $@ | sed '1,/SYMBOL TABLE/d; s/ .* / /; /^$$/d' > $*.sym

$(USER)/usys.S : $(USER)/usys.pl
	perl $(USER)/usys.pl > $(USER)/usys.S

$(USER)/usys.o : $(USER)/usys.S
	$(CC) $(CFLAGS) -c -o $(USER)/usys.o $(USER)/usys.S

$(USER)/_forktest: $(USER)/forktest.o $(ULIB)
	# forktest has less library code linked in - needs to be small
	# in order to be able to max out the proc table.
	$(LD) $(LDFLAGS) -N -e main -Ttext 0 -o $(USER)/_forktest $(USER)/forktest.o $(USER)/ulib.o $(USER)/usys.o
	$(OBJDUMP) -S $(USER)/_forktest > $(USER)/forktest.asm

# Link the regression helper as a real xv6 user program so invalid descriptors
# cross the user/kernel boundary instead of being simulated by a host-side test.
_badfd: tests/badfd.o $(ULIB)
	$(LD) $(LDFLAGS) -N -e main -Ttext 0 -o $@ $^
	$(OBJDUMP) -S $@ > tests/badfd.asm
	$(OBJDUMP) -t $@ | sed '1,/SYMBOL TABLE/d; s/ .* / /; /^$$/d' > tests/badfd.sym

xv6-mkfs/mkfs: xv6-mkfs/mkfs.c $(INCLUDE)/fs.h $(INCLUDE)/param.h
	gcc -Werror -Wall -I./xv6-user -o xv6-mkfs/mkfs xv6-mkfs/mkfs.c

# Prevent deletion of intermediate files, e.g. cat.o, after first build, so
# that disk image changes after first build are persistent until clean.  More
# details:
# http://www.gnu.org/software/make/manual/html_node/Chained-Rules.html
.PRECIOUS: %.o

UPROGS=\
	$(USER)/_init \
	$(USER)/_sh \
	$(USER)/_echo \
	$(USER)/_ls \
	$(USER)/_mkdir \
	$(USER)/_touch \
	$(USER)/_cat \
	$(USER)/_rm \
	_badfd \
	$(USER)/_forktest \
	$(USER)/_stressfs

fs.img: xv6-mkfs/mkfs README.md $(UPROGS)
	xv6-mkfs/mkfs fs.img README.md $(UPROGS)

-include user/*.d
