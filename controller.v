/* 
    BIST Controller
        Controller of the blocks of BIST functionality
*/

`timescale 1ns/1ns

module controller
#(parameter ERR_BITS = 8, parameter SETUP_DELAY = 12)
(
    input clk,
    input TPG_END,
    input ORA_RES,
    input FIL_END,

    output reg RESET,
    output TPG_RESET,
    output FIL_INC,
    output [ERR_BITS-1:0] ERR_COUNTER
);
    reg TPG_R_INT;
    reg INC_INT;
   
    counter #(ERR_BITS) ERR_COUNT(.clk(clk), .rst(RESET), .inc(ORA_RES), .counter(ERR_COUNTER));

    initial begin
        RESET <= 1;
        TPG_R_INT <= 1;
        INC_INT <= 0;
        #SETUP_DELAY
        RESET <= 0;
        TPG_R_INT <= 0;
    end

    or OR_TPG(TPG_RESET, ORA_RES, TPG_R_INT);
    or OR_FIC(FIL_INC, ORA_RES, TPG_END, INC_INT);

endmodule