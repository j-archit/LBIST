/* 
    Counter Module
       1. ORA #3
       2. 

    Counts UP on positive edge of clock
*/
module counter
#(parameter BITS = 32)
(
    input clk,
    output [0:BITS-1] count
);
    reg [0:BITS-1] counter;
    initial begin
        counter = {BITS{1'b0}};
    end

    always @(posedge(clk)) begin
        counter <= counter + 1;
    end
    assign count = counter;

endmodule