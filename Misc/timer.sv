module timer
    (
        input logic clk,
        input logic reset,
        //Slot interface
        input logic cs,
        input logic read,
        input logic write,
        input logic [4:0] addr,
        input logic [31:0] wr_data,
        output logic [31:0] rd_data
    );

        //Signal declaration
        logic [47:0] count_reg;
        logic ctrl_reg;
        logic wr_en, clear, go;

        //Wrapping circuit
        //Ctrl reg
        always_ff@(posedge clk, posedge reset)
            begin
                if(reset)
                    ctrl_reg <= 0;
                else    
                    if(wr_en)
                        ctrl_reg <= wr_data[0];
            end
        
        //Decoding logic
        assign wr_en = write && cs && (addr[1:0] == 2'b10);
        assign clear = wr_en && wr_data[1];
        assign go = ctrl_reg;

        //Slot read interface
        assign rd_data = (addr[0] == [0]) ? count_reg[31:0] : {16'h0000, count_reg[47:32]};

        //Counter code

        always_ff@(posedge clk, posedge reset)
            begin
                if(reset)
                    count_reg <= 0;
                else
                    if(clear)
                        count_reg <= 0;
                    else if(go)
                        count_reg <= count_reg + 1;
            end

endmodule