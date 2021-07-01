OUTPUT_ARCH("riscv")
ENTRY(_entry)

SECTIONS
{
  /*
   * ensure that entry.S / _entry is at 0x80000000,
   * where qemu's -kernel jumps.
   */
  . = 0x80000000;

  .text :
  {
    /* *(.text .text.*) */
    *(.text)
    . = ALIGN(0x1000);
    *(trampsec)
  }

  .rodata :
  {
    *(.rodata .rodata.*)
    *(.srodata .srodata.*)
  }

  . = ALIGN(0x1000);
  PROVIDE(etext = .);

  /*
   * make sure end is after data and bss.
   */
  .data : {
    *(.data .data.*)
    *(.sdata .sdata.*)
  }

  . = ALIGN(0x1000);

  .bss : {
    sbss = .;
    *(.sbss* .sbss.*)
    bss = .;
     *(.bss .bss.*)
  }

  /* .bss :
    {
      sbss = .;
      *(.sbss .sbss.*)
      *(.dynsbss)
      *(.bss .bss.*)
      *(.dynbss)
      ebss = .;
      . = ALIGN(4K);
    } */


  PROVIDE(end = .);
}
