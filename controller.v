/* 
    BIST Controller
        Controller of the blocks of BIST functionality
*/

module controller
(
    input clk,
    input TPG_END,
    input ORA_RES,

    output reg RESET,
    output TPG_RESET,
    output INC
);
    parameter SETUP_DELAY = 10;
    
    reg TPG_R_INT;
    reg INC_INT;

    initial begin
        RESET <= 1;
        TPG_R_INT <= 1;
        INC_INT <= 0;
        #SETUP_DELAY
        RESET <= 0;
        TPG_R_INT <= 0;
    end

    or OR_TPG(TPG_RESET, ORA_RES, TPG_R_INT);
    or OR_FIC(INC, ORA_RES, TPG_END, INC_INT);

endmodule