/*
    Output Result Analyzer Test Bench

*/

module ora_tb
#(parameter  BIT = 4);

    reg clk;
    reg [BIT-1:0] A, B;
    wire result;

    ora ORA(.clk(clk), .CUT_OP(A), .FF_OP(B), .RES(result));

    initial begin
        clk <= 0;
        A <= {BIT{1'b0}};
        B <= {BIT{1'b0}};
    end
    always #5 clk <= ~clk;

    always begin
        $monitor("Time = %.0f, \nA = %h, B = %h, R = %b", $time, A, B, result);
    
        #10 
        A <= 'hF;
        #3
        B <= 'hC;
        #4
        A <= 'hC;
        #50 $finish;
    end

endmodule