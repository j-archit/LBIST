/* 
    Counter Module
        Counts Up when inc is 1

    Used in:
        1. ORA #3
    
    Parameters:
        1. BITS         : Number of Bits in the Counter

    Inputs: 
        1.  clk
        2.  inc         : Increment when 1

    Outputs:
        1. count        : Current State of Counter
*/
module counter
#(parameter BITS = 32)
(
    input clk,
    input inc,
    output [0:BITS-1] count
);
    reg [0:BITS-1] counter;
    initial begin
        counter = {BITS{1'b0}};
    end

    always @(posedge(clk) && inc == 1) begin
        counter <= counter + 1;
    end
    assign count = counter;

endmodule