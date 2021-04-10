/*
    Controller Testbench
*/

module controller_tb;

    parameter ERR_BITS = 8;

    reg clk;
    wire rst;
    reg TPG_E;
    wire TPG_R;
    reg ORA_R;
    wire FIC_I;
    wire [ERR_BITS-1:0] ERR;
    

    initial clk <= 0;
    always #5 clk <= ~clk;

    controller C1(clk, TPG_E, ORA_R, rst, TPG_R, FIC_I, ERR);

    initial begin
        ORA_R <= 0;
        TPG_E <= 0;
    end

    always begin
        $monitor("T = %.0f, TE = %b, O_R = %b, R = %b, TR = %b, FI = %b, ERR = %b, %0.0f", $time, TPG_E, ORA_R, rst, TPG_R, FIC_I, ERR, clk);
        #28 ORA_R <= 1;
        #15 ORA_R <= 0;
        #14 TPG_E <= 1;
        #22 TPG_E <= 0;
        #9 ORA_R <= 1;
        #9 ORA_R <= 0;
        #20 $finish;
    end 

    
endmodule