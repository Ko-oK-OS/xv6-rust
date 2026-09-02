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
    # Rebuild fs.img as well as the kernel so regression-only user programs,
    # such as badfd, are always present in the image under test.
    build = subprocess.run(
        ["make", "fs.img"],
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
    )
    if build.returncode != 0:
        raise RuntimeError("kernel build failed\n" + build.stdout.decode(errors="replace"))

    with tempfile.TemporaryDirectory(prefix="xv6-user-test-") as temp_dir:
        test_image = os.path.join(temp_dir, "fs.img")
        # Filesystem tests write to the disk. Give every case a private image so
        # a crash or successful mutation cannot affect later tests or the repo.
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
            # The harness does not attach networking: avoiding host forwarding
            # keeps repeated/parallel runs independent of host UDP port state.
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


def run_command_until_qemu_exit(command: str, timeout: float = 5.0) -> tuple[int, bytes]:
    build = subprocess.run(
        ["make", "fs.img"],
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
            process.stdin.write(command.encode() + b"\n")
            process.stdin.flush()

            try:
                process.wait(timeout=timeout)
            except subprocess.TimeoutExpired as error:
                raise TimeoutError(f"QEMU did not exit after {command!r}") from error

            output = process.stdout.read() if process.stdout else b""
            return process.returncode, output
        finally:
            if process.poll() is None:
                os.killpg(process.pid, signal.SIGTERM)
                process.wait(timeout=2)


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


def test_create_remove() -> None:
    outputs = run_commands(["touch tfile", "rm tfile", "ls"], timeout=5.0)
    combined = b"".join(outputs)
    for marker in PANIC_MARKERS:
        if marker in combined:
            raise AssertionError(f"kernel output contained {marker!r}")
    if b"tfile" in outputs[2]:
        raise AssertionError("removed file is still present in ls output")


def test_forktest() -> None:
    output = run_command("forktest", timeout=15.0)
    if b"fork test OK" not in output:
        raise AssertionError("forktest did not report success")
    for marker in PANIC_MARKERS:
        if marker in output:
            raise AssertionError(f"kernel output contained {marker!r}")


def test_stressfs() -> None:
    output = run_command("stressfs", timeout=20.0)
    if b"fd: -1" in output:
        raise AssertionError("stressfs could not open a worker file\n\n" + output.decode(errors="replace"))
    for marker in PANIC_MARKERS:
        if marker in output:
            raise AssertionError(f"kernel output contained {marker!r}")


def test_invalid_fd_boundary() -> None:
    output = run_command("badfd", timeout=5.0)
    if b"bad fd test OK" not in output:
        raise AssertionError("badfd did not report success")
    for marker in PANIC_MARKERS:
        if marker in output:
            raise AssertionError(f"invalid fd caused kernel output containing {marker!r}")


def test_quit() -> None:
    returncode, output = run_command_until_qemu_exit("quit")
    if returncode != 0:
        raise AssertionError(f"QEMU exited with status {returncode}")
    if b"Shutdown!" not in output:
        raise AssertionError("kernel did not report a clean shutdown")


TESTS = {
    "cat-eof": test_cat_eof,
    "create-remove": test_create_remove,
    "forktest": test_forktest,
    "invalid-fd-boundary": test_invalid_fd_boundary,
    "long-path-component": test_long_path_component,
    "quit": test_quit,
    "repeated-exec-failure": test_repeated_exec_failure,
    "stressfs": test_stressfs,
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
