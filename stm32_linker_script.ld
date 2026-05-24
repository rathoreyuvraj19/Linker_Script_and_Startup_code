ENTRY(Reset_Handler)

MEMORY {
    FLASH (rx) : ORIGIN = 0x08000000, LENGTH = 1024K 
    SRAM  (rwx): ORIGIN = 0x20000000, LENGTH = 128K
}

SECTIONS{
    .text :
    {
        _text_start = .;
        *(.isr_vector)
        *(.text)
        *(.text*)
        *(.rodata)
        *(.rodata*)
        . = ALIGN(4);
        _text_end = .;
    } > FLASH

    .data : 
    {
        _data_start = .;
        *(.data)
        *(.data*)
        . = ALIGN(4);
        _data_end = .;
    } > SRAM AT > FLASH

    .bss :
    {
        _bss_start = .;
        *(.bss)
        *(.bss*)
        *(COMMON)
        . = ALIGN(4);
        _bss_end = .;
    } > SRAM

}