`timescale 1ns/1ns
module counter_tb;

parameter BITS = 8;
reg clk;
wire [0:BITS-1] op;

counter #(.BITS(BITS)) counter1(.clk(clk), .count(op));

initial begin
    clk = 0;
end

always begin
    #5 clk = ~clk; 
end

initial begin
    $monitor ("counter = %d", op);
    #100 $finish;
end

endmodule