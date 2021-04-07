/*
    Controller Testbench
*/

module controller_tb;

    reg clk;
    wire rst;
    reg TPG_E;
    wire TPG_R;
    reg ORA_R;
    wire FIC_I;

    initial clk <= 0;
    always #5 clk <= ~clk;

    controller C1(clk, TPG_E, ORA_R, rst, TPG_R, FIC_I);

    initial begin
        ORA_R <= 0;
        TPG_E <= 0;
    end

    always begin
        $monitor("T = %.0f, TE = %b, O_R = %b, R = %b, TR = %b, FI = %b, %0.0f", $time, TPG_E, ORA_R, rst, TPG_R, FIC_I, clk);
        #28 ORA_R <= 1;
        #17 ORA_R <= 0;
        #12 TPG_E <= 1;
        #22 TPG_E <= 0;

        #20 $finish;
    end 

    
endmodule