OUTPUT_ARCH( "riscv" )

ENTRY( start )

SECTIONS
{
    .text :
    {
        *(.text.start) *(.text .text.*)
    }

    .rodata :
    {
        *(.rdata .rodata .rodata.*)
    }

    .data :
    {
        *(.data .data.*)
    }

    .bss :
    {
        *(.bss bss.*)
    }
}