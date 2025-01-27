#ifndef _CHU_IO_RW_INCLUDED
#define _CHU_IO_RW_INCLUDED

//library
#include <inttypes.h> //To use different integer types
#ifndef __cplusplus
extern "C"{
#endif

#define io_read(base_addr, offset) (*((volatile uint32_t*) (base_addr + 4*offset)))

#define io_write(base_addr, offset, data) (*((voltatile uint32_t*)(base_addr + 4*offset)) = (data))

#define get_slot_addr(base, slot) ((uint32_t)((base)+(slot_*32*4)))



#ifndef __cplusplus
} //extern "C"
#endif

#endif //_CHU_IO_RW_INCLUDED