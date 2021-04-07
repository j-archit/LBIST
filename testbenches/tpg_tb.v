// Test Pattern Generator testbench

`timescale 1ns/1ns

module tpg_tb;
    
    parameter BITS = 3;

    reg clk;
    reg rst;
    wire END;
    wire [BITS-1:0] op;

    tpg #(.BITS(BITS)) TPG(.clk(clk), .rst(rst), .END(END), .TEST_PATTERN(op));

    initial clk <= 0;
    always #5 clk <= ~clk;
    
    always begin
        $monitor("Time = %.0f, Pattern = %b, RST = %b, END_F = %b", $time, op, rst, END);
        #3
        rst <= 1;
        #3
        rst <= 0;

        #30 rst <= 1;
        #1 rst <= 0;
        #120 $finish;
    end
endmodule