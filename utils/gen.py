import os
import shutil

output_dir = "../bin/"
bin_dir = "../user/target/riscv64gc-unknown-none-elf/debug/"

user_programes = [
    "init",
    "hello_world",
    "sh"
]

for (root, dirs, files) in os.walk(bin_dir):
    for f in files:
        if f in user_programes:
            shutil.copy(src = bin_dir + f, dst = output_dir + f)
            print("copy file form" + bin_dir+f + " to " + output_dir+f + "\n")
print("success.")
