/*
    Memory Module
    
    Used in:
    1. Deterministic Test Patterns Storage
    2. Other RW Memories if Required

    Parameters:
    1.  word_size       : Determines the Word Size of Memory
    2.  address_bits    : Number of Address Bits required to Address the Memory
            (This number always determines the mem_size parameter as 2^(bits) by default)
    3.  mem_size        : Size of the Memory (Number of Addressable Words)
    4.  file_name       : Memory File to read from

    Inputs:
    1.  clk
    2.  EN              : Chip Enable Pin
    4.  RW              : Read/Write
    5.  add             : Address
    6.  data_w          : Write Input

    Inout:
    1.  data            : Common Data Pin

    Note: 
        Data pin must be connected to a Net(outside) in all situations and a continuous 
        assignment is needed with conditional HighZ being driven on it as necessary when 
        writing to memory

*/

`timescale 1ns/1ns

module mem
#(parameter word_size = 8, parameter address_bits = 8, parameter mem_size = 2**(address_bits), parameter file_name = "mem.mem")
(
    input clk,
    input EN,
    input RW,
    input [address_bits-1:0] add,
    inout [word_size-1:0] data
);
    reg [word_size-1:0] flash [0:mem_size-1];
    // Required for Inout
    reg [word_size-1:0] out;

    initial begin
        $readmemb(file_name, flash);
    end

    assign data = (EN && RW) ? 'hz : out;

    always @(posedge(clk)) begin
        if(EN == 1) begin
            if(RW == 0) begin
                out <= flash[add];
            end
            else begin
                flash[add] <= data;
            end
        end
    end

endmodule