import os

path = "../user/bin"
output_path = "../mkfs"
output_file = "userprog"
bin_dir = "../user/target/riscv64gc-unknown-none-elf/debug/"

for (root, dirs, files) in os.walk(path):
    for f in files:
        with open(output_file, 'a+') as of:
            of.write(bin + f + '\n')
