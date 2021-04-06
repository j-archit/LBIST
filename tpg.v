/* 
    Test Pattern Generator

    Consists of 
    1. Random Pattern Generator Only(rpg.v)

*/

module tpg
#(parameter OUT_BITS = 4)
(
    input clk,
    input rst,
    
    output reg END,
    output reg [OUT_BITS-1:0] TEST_PATTERN
);

    wire [OUT_BITS-1:0] test;
    
    rpg #(.BITS(OUT_BITS)) PATTERN(.clk(clk), .rst(rst), .OP(test));

    always @(posedge(clk)) begin
        TEST_PATTERN <= test;
    end
    
endmodule