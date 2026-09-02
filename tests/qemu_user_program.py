#!/usr/bin/env python3
"""Run a focused xv6 user-program regression test through QEMU."""

from __future__ import annotations

import argparse
import os
import select
import signal
import shutil
import subprocess
import sys
import tempfile
import time


PROMPT = b"xv6 Rust >>> "
PANIC_MARKERS = (b"panicked at", b"Kernel panic")


def read_until(process: subprocess.Popen[bytes], marker: bytes, timeout: float) -> bytes:
    output = bytearray()
    deadline = time.monotonic() + timeout

    while marker not in output:
        if process.poll() is not None:
            remainder = process.stdout.read() if process.stdout else b""
            output.extend(remainder)
            raise RuntimeError(
                f"QEMU exited with status {process.returncode} before {marker!r}\n"
                + output.decode(errors="replace")
            )

        remaining = deadline - time.monotonic()
        if remaining <= 0:
            raise TimeoutError(
                f"timed out waiting for {marker!r}\n"
                + output.decode(errors="replace")
            )

        readable, _, _ = select.select([process.stdout], [], [], min(remaining, 0.25))
        if readable:
            chunk = os.read(process.stdout.fileno(), 4096)
            if not chunk:
                continue
            output.extend(chunk)

    return bytes(output)


def run_commands(commands: list[str], timeout: float = 15.0) -> list[bytes]:
    build = subprocess.run(
        ["make", "-C", "kernel", "build"],
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
    )
    if build.returncode != 0:
        raise RuntimeError("kernel build failed\n" + build.stdout.decode(errors="replace"))

    with tempfile.TemporaryDirectory(prefix="xv6-user-test-") as temp_dir:
        test_image = os.path.join(temp_dir, "fs.img")
        shutil.copyfile("fs.img", test_image)
        process = subprocess.Popen(
            [
                "qemu-system-riscv64",
                "-machine",
                "virt",
                "-bios",
                "none",
                "-kernel",
                "kernel/target/riscv64gc-unknown-none-elf/debug/kernel",
                "-m",
                "3G",
                "-smp",
                "3",
                "-nographic",
                "-drive",
                f"file={test_image},if=none,format=raw,id=x0",
                "-device",
                "virtio-blk-device,drive=x0,bus=virtio-mmio-bus.0",
            ],
            stdin=subprocess.PIPE,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            start_new_session=True,
        )

        try:
            read_until(process, PROMPT, timeout)
            assert process.stdin is not None
            outputs = []
            for command in commands:
                process.stdin.write(command.encode() + b"\n")
                process.stdin.flush()
                outputs.append(read_until(process, PROMPT, timeout))
            return outputs
        finally:
            if process.poll() is None:
                os.killpg(process.pid, signal.SIGTERM)
                try:
                    process.wait(timeout=2)
                except subprocess.TimeoutExpired:
                    os.killpg(process.pid, signal.SIGKILL)
                    process.wait(timeout=2)


def run_command(command: str, timeout: float = 15.0) -> bytes:
    return run_commands([command], timeout)[0]


def test_cat_eof() -> None:
    output = run_command("cat README.md")
    decoded = output.decode(errors="replace")
    failures = []

    if b"MIT License" not in output:
        failures.append("cat did not print the final line of README.md")
    if b"cat: read error" in output:
        failures.append("cat reported a read error at EOF")
    for marker in PANIC_MARKERS:
        if marker in output:
            failures.append(f"kernel output contained {marker!r}")

    if failures:
        raise AssertionError("; ".join(failures) + "\n\n" + decoded)


def test_repeated_exec_failure() -> None:
    outputs = run_commands(["badcmd", "noexec"], timeout=5.0)
    combined = b"".join(outputs)
    for marker in PANIC_MARKERS:
        if marker in combined:
            raise AssertionError(f"kernel output contained {marker!r}")


def test_long_path_component() -> None:
    outputs = run_commands(["touch filename123456789", "ls"], timeout=5.0)
    output = b"".join(outputs)
    for marker in PANIC_MARKERS:
        if marker in output:
            raise AssertionError(f"kernel output contained {marker!r}")
    if b"filename123456" not in outputs[1]:
        raise AssertionError("ls did not find the DIRSIZ-truncated file name")


TESTS = {
    "cat-eof": test_cat_eof,
    "long-path-component": test_long_path_component,
    "repeated-exec-failure": test_repeated_exec_failure,
}


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("test", choices=TESTS)
    args = parser.parse_args()

    try:
        TESTS[args.test]()
    except (AssertionError, RuntimeError, TimeoutError) as error:
        print(f"FAIL {args.test}: {error}", file=sys.stderr)
        return 1

    print(f"PASS {args.test}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
