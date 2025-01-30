#include <inttypes.h>
/
class GpoCore{
    public:
    //register map
    enum{
        DATA_REG = 0    //Data register
    };

    GpoCore(uint32_t core_base_addr); //Constructor
    ~GpoCore();                      //Destructor

    void write(uint32_t data);      //Write a 32 bit word
    void write(int bit_value, int bit_pos);  //Write 1 bit (overloaded)

    private:
        uint32_t base_addr;
        uint32_t wr_data;          //Same as the GPO core data reg
};