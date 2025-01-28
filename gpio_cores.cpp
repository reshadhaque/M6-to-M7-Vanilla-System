#include "gpio_cores.h"
#include "chu_io_rw.h"

GpoCore::GpoCore(uint32_t core_base_addr){
    base_addr = core_base_addr;
    wr_data = 0;
}

GpoCore::~GpoCore(){
}

void GpoCore::write(uint32_t data){
    wr_data = data;
    io_write(base_addr, DATA_REG, wr_data);
}


