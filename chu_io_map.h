#ifndef _CHU_IO_MAP_INCLUDED
#define _CHU_IO_MAP_INCLUDED

#ifdef _cplusplus
extern "C" {
#endif

//System clock frequency for the timer and uart
#define SYS_CLK_FREQ 100

//I/O BASE ADDRESS for the micrblaze MCS
#define BRIDGE_BASE 0xc0000000

//Slot Module Definition
//format: Slot#_ModuleType_Name
#define S0_SYS_TIMER 0
#define S1_UART1 1
#define S2_LED 2
#define S3_SW 3

#ifdef _cplusplus
} //extern "C"
#endif



#endif //_CHU_IO_MAP_INCLUDED

