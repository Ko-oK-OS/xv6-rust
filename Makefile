KERNEL = kernel/target/riscv64gc-unknown-none-elf/debug/kernel
USER = xv6-user
INCLUDE = xv6-user/include
CPUS = 3

CC = riscv64-unknown-elf-gcc
LD = riscv64-unknown-elf-ld
OBJCOPY = riscv64-unknown-elf-objcopy
OBJDUMP = riscv64-unknown-elf-objdump

CFLAGS = -Wall -Werror -O -fno-omit-frame-pointer -ggdb
CFLAGS += -MD
CFLAGS += -mcmodel=medany
CFLAGS += -ffreestanding -fno-common -nostdlib -mno-relax
CFLAGS += -I./xv6-user
CFLAGS += $(shell $(CC) -fno-stack-protector -E -x c /dev/null >/dev/null 2>&1 && echo -fno-stack-protector)

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
	$(UPROGS)

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
	$(USER)/_forktest \
	$(USER)/_stressfs \
	$(USER)/_sem_test1 \
	$(USER)/_sem_test2 

fs.img: xv6-mkfs/mkfs README.md $(UPROGS)
	xv6-mkfs/mkfs fs.img README.md $(UPROGS)

-include user/*.d