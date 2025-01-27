`ifndef _CHU_IO_MAP_INCLUDED
`define _CHU_IO_MAP_INCLUDED

// System Clock Rate in MHz, used for the timer and uart

`define _SYS_CLK_FREQ 100

//I/O Base address for the Microblaze MCS
`define BRIDGE_BASE 0xc0000000

//Slot Module Definition
//Format: SLOT_ModuleTypeName

`define S0_SYS_TIMER 0
`define S1_UART1 1
`define S2_LED 2
`define S2_SW 3

`endif //_CHU_IO_MAP