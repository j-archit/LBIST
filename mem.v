/*
    Memory Module
    
    Used in:
    1. ORA Fault Free Responses Storage
    2. Deterministic Test Patterns Storage
    3. Other RW Memories if Required

    Parameters:
    1.  word_size       : Determines the Word Size of Memory
    2.  address_bits    : Number of Address Bits required to Address the Memory
            (This number always determines the mem_size parameter as 2^(bits) by default)
    3.  mem_size        : Size of the Memory (Number of Addressable Words)

    Inputs:
    1.  clk
    2.  enable          : enable Memory RW Access
    2.  RW              : Read/Write
    3.  add             : Address
    4.  data_w          : Write Input

    Ouputs:
    1.  data_r          : Read Output

*/

module mem
#(parameter word_size = 8, parameter address_bits = 8, parameter mem_size = 2^(address_bits))
(
    input clk,
    input enable,
    input RW,
    input [0:address_bits-1] add,
    input [0:word_size-1] data_w,
    output reg [0:word_size-1] data_r
);
    reg [0:word_size-1] flash [0:mem_size-1];

    always @(posedge(clk) && enable == 1) begin
        if(RW == 0) begin
            data_r <= flash[add];
        end
       if(RW == 1) begin
            flash[add] <= data_w;
        end
    end

endmodule