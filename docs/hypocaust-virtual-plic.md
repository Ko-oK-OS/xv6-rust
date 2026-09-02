# Hypocaust virtual PLIC integration

PR #61 (`feature/sbi-virtual-plic`) changes the SBI payload from timer-polled
VirtIO completion to normal interrupt-driven completion when it runs on
Hypocaust.

The SBI build now programs the same architectural PLIC registers as the native
QEMU build: source priorities, per-hart enables, and the context threshold.
Hypocaust traps those accesses and routes them to the `VirtualPlic` owned by
the current VM.

When the mediated block backend observes a used-ring completion, it raises
virtual PLIC source 1 and injects SupervisorExternal into vCPU 0. The existing
external-interrupt handler claims source 1, calls `Disk::intr()` to wake the
sleeping request, acknowledges the VirtIO interrupt, and completes the PLIC
source. No disk completion work remains in the virtual timer handler.

This keeps the Guest driver portable: both native QEMU and Hypocaust use the
same VirtIO and PLIC programming model, while the hypervisor remains
responsible for VM isolation, checked DMA translation, and interrupt routing.

Validation:

```console
make fs.img
make sbi
make -C ../hypocaust xv6-rust
make -C ../hypocaust qemu SMP=2
```

The test is successful when Hypocaust reports asynchronous notification and
completion progress and xv6-rust completes file-system initialization without
calling a timer-based VirtIO poll function.
