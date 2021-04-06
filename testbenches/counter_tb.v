// Counter Module Testbench

`timescale 1ns/1ns
module counter_tb;

parameter BITS = 8;
reg clk;
reg in;
wire [0:BITS-1] op;

counter #(.BITS(BITS)) c1(.clk(clk), .inc(in), .count(op));

initial begin
    in <= 0;
    clk <= 0;
end

always #5 clk = ~clk; 


initial begin
    $monitor ("time= %d, counter = %b, clk = %b", $time, op, clk);
    #40 in <= 1;
    #30 in <= 0; 
    #20 in <= 1;
    #5 in <= 0;
    #100 $finish;
end

endmodule