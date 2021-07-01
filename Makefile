.PHONY: run build

build:
	make -C kernel build
	make -C user build

run:
	make -C kernel run
	make -C user run