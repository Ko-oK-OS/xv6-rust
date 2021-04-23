.PHONY: run build

build:
	make -C kernel build

run:
	make -C kernel run