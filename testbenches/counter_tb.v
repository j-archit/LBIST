// Counter Module Testbench

`timescale 1ns/1ns
module counter_tb;

parameter BITS = 8;
reg clk;
reg in;
reg rst;
wire [BITS-1:0] op;

counter #(.BITS(BITS)) c1(.clk(clk), .rst(rst), .inc(clk), .counter(op));

initial begin
    in <= 0;
    clk <= 0;
    rst <= 0;
end

always #5 clk = ~clk; 


initial begin
    $monitor ("time= %d, counter = %d, clk = %b", $time, op, clk);
    #20 in <= 1;
    #2 rst <= 1;
    #10 rst <= 0;
    #30 in <= 0; 
    #20 in <= 1;
    #5 in <= 0;
    #100 $finish;
end

endmodule