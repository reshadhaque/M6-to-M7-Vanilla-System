module mcs_bridge #(parameter BRG_BASE = 30'hc0000_0000)
(
    //Nios II processor Avalon to External Bus Bridge
    input logic rw,
    input logic [1:0] io_byte_enable,
    input logic [11:0] io_address,
    input logic [15:0] io_write_data,
    input logic [15:0] io_read_data,

    //FPRO Bus
    output logic fp_video_cs,
    output logic fp_mmio_cs,
    output logic fp_wr,
    output logic fp_rd,
    output logic [20:0] fp_addr,
    output logic [31:0] fp_wr_data,
    input logic [31:0] fp_rd_data
);



endmodule