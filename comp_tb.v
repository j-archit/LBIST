// Comparator Module Testbench

`timescale 1ns/1ns

module comp_tb;
    parameter BITS = 8;
    reg [BITS-1:0] A,B;
    reg clk;
    wire o;

    comp #(.RC_BITS(BITS)) comp1(.clk(clk), .A(A), .B(B), .res(o));

    initial begin
        clk <= 0;
        A <= {BITS{1'b0}};
        B <= {BITS{1'b0}};
        $monitor("Time = %d, A = %h, B = %h, Output = %b, clk = %b", $time, A, B, o, clk);
    end

    always #5 clk = ~clk;

    always begin
        #20 A <= 'hFC;
        #30 B <= 'hFC;
        #40 B <= 'hFF;
        #100 $finish;
    end
endmodule