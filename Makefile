.PHONY: run build fs

build:
	make -C kernel build
	make -C user build

run: fs
	make -C kernel run
	make -C user run

fs: fs.img
	make -C mkfs run