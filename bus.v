module bus
#(parameter BUS_WIDTH = 4)
(
    input LD,
    input [0 : BUS_WIDTH-1] DATA_IN,
    output reg [0 : BUS_WIDTH-1] DATA
);

always @(posedge LD) begin
        DATA = DATA_IN;
    end
    
endmodule