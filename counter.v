/* 
    Counter Module
        Counts Up when inc is 1
    Used in:
        1. ORA #3
    
    Parameters:
        1. BITS         : Number of Bits in the Counter
    Inputs: 
        1.  clk
        2.  rst         : Asynch Reset
        2.  inc         : Increment when 1
    Outputs:
        1. count        : Current State of Counter
*/

`timescale 1ns/1ns

module counter
#(parameter BITS = 32)
(
    input clk,
    input rst,
    input inc,
    output reg [BITS-1:0] counter
);
    initial begin
        counter = {BITS{1'b0}};
    end

    always @(posedge(clk) or posedge(rst)) begin
        if(inc == 1  && rst == 0) counter <= counter + 1;
        if(rst == 1) counter <= {BITS{1'b0}};
    
    end
    assign count = counter;

endmodule