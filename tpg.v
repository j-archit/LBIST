/* 
    Test Pattern Generator
        Combinational Circuit Wrapper Around RPG (and DPG**)

    Consists of 
    1. Random Pattern Generator Only(rpg.v)

*/

`timescale 1ns/1ns

module tpg
#(parameter BITS = 4)
(
    input clk,
    input rst,

    output END,
    output [BITS-1:0] TEST_PATTERN
);
    assign END = ~E;

    rpg #(.BITS(BITS)) PATTERN(.clk(clk), .END(E), .rst(rst), .register(TEST_PATTERN));
    
endmodule