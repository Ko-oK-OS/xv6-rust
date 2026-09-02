# Toolchain policy

xv6-rust pins every Rust component needed by the root build in
`rust-toolchain.toml`. A dated nightly is intentional: a floating `nightly`
silently changes the compiler and LLVM version over time, which can break a
bare-metal kernel even when its source and `Cargo.lock` have not changed.

## Validated versions

| Component | Version | How it is controlled |
| --- | --- | --- |
| Rust | `nightly-2026-09-02` (`rustc 1.100.0-nightly`) | `rust-toolchain.toml` |
| Allocator standalone Rust | `nightly-2026-09-02` | `allocator/rust-toolchain` |
| LLVM tools | LLVM 23.1.0 from the same Rust snapshot | `llvm-tools-preview` component |
| RISC-V Rust target | `riscv64gc-unknown-none-elf` | `rust-toolchain.toml` |
| cargo-binutils | `0.4.0` | versioned install command in README |
| Cargo dependencies | exact versions in `kernel/Cargo.lock` | committed lockfile |
| QEMU | `11.1.1` | validated external runtime |

The host C compiler and RISC-V bare-metal GCC/binutils are platform packages,
so the repository does not install them automatically. The build accepts tool
prefixes `riscv64-unknown-elf-` and `riscv64-elf-`.

## Why nightly is still required

Most old feature gates have been removed because their APIs are now stable or
were unused. The kernel is still a `no_std` binary that uses `alloc`, and its
custom allocation error handler currently requires Rust's unstable
`alloc_error_handler` feature. Keeping this single feature next to an
explanatory source comment makes the reason for nightly auditable.

The `allocator/` directory is an independent Git submodule and pins the same
dated nightly for standalone work. When it is built as the kernel's path
dependency, Cargo and rustc are launched by the pinned root toolchain.

The Cargo packages remain on edition 2018 deliberately. An edition is a source
compatibility mode, not a compiler release: the pinned 2026 nightly fully
supports it. Moving to edition 2024 would make the project's widespread
`static mut` access patterns a separate architecture migration, so it should
be reviewed independently rather than hidden inside a toolchain update.

## Updating the snapshot

Do not replace the dated channel with floating `nightly`. To upgrade:

1. Choose an available nightly date and update `rust-toolchain.toml`.
2. Install it with its declared target and component by entering the repository
   or running `rustup show`.
3. Update dependencies deliberately with
   `cargo update --manifest-path kernel/Cargo.toml`.
4. Build the kernel and filesystem image.
5. Run every QEMU user-program regression, including system and user threads.
6. Commit the toolchain file and `kernel/Cargo.lock` together.

The date should only move after the complete runtime suite passes. A newer
nightly existing upstream is not, by itself, evidence that the kernel supports
it.
