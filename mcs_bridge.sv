module mcs_bridge #(parameter BRG_BASE = 32'h4000_0000)
(
    //Nios II processor Avalon to External Bus Bridge
    input logic io_rw,
    input logic [3:0] io_byte_enable,
    input logic [29:0] io_address,
    input logic [31:0] io_write_data,
    input logic [31:0] io_read_data,

    //FPRO Bus
    output logic fp_video_cs,
    output logic fp_mmio_cs,
    output logic fp_wr,
    output logic fp_rd,
    output logic [20:0] fp_addr,
    output logic [31:0] fp_wr_data,
    input logic [31:0] fp_rd_data
);

    //Signal declaration
    logic mcs_bridge_en;
    logic [29:0] word_address;

    //Body
    //Address translation and decoding
    assign word_address = io_address;
    assign mcs_bridge_en = (io_address[29:22] == BRG_BASE[31:24]);
    assign fp_video_cs = (mcs_bridge_en && io_address[21] == 1);
    assign fp_mmio_cs = (mcs_bridge_en && io_address[21] == 0);
    assign fp_addr = word_address[20:0];

    //control line conversions
    assign fp_wr = io_rw;
    assign fp_rd = ~io_rw;

    //data line conversions
    assign fp_wr_data = io_write_data;
    assign io_read_data = fp_rd_data;
    
endmodule