OUTPUT_ARCH( "riscv" )

ENTRY( _start )

SECTIONS
{
    .text :
    {
        *(.text._start) *(.text .text.*)
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