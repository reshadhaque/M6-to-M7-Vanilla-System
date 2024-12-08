module gpo #(parameter W = 8) //Width of output port
(
    input logic clk,
    input logic reset,
    //Slot interface
    input logic cs,
    input logic read,
    input logic write,
    input logic [4:0] addr,
    input logic [31:0] wr_data,
    output logic [31:0] rd_data,
    //External port
    output logic [W-1:0] dout
)

    //declaration
    logic [N-1:0] buf_reg;
    logic wr_en;

        //Body
        //Output buffer register
        always_ff@(posedge clk, posedge reset)
        begin
            if(reset)
                buf_reg<=0;
            else
                if(wr_en)
                    buf_reg <= wr_data[W-1:0];
        end
    //decoding logic
    assign wr_en = cs && write;
    //slot read interface 
    assign rd_data = 0;
    //external output
    assign dout = buf_reg;


endmodule