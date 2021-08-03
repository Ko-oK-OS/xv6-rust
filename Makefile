.PHONY: run build fs kernel gen

build:
	make -C kernel build
	make -C user build

run: fs
	make -C kernel run
	make -C user run

kernel: fs gen
	make -C kernel run

fs:
	make -C mkfs run

gen:
	make -C utils run