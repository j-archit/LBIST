/* 
    BIST Controller
        Controller of all the blocks of BIST functionality
*/

module bist_c
(
    input clk,
    input TPG_END,
    input ORA_RES,

    output reg RESET,
    output reg TPG_INC,
    output reg TPG_RESET,
    output reg FIC_INC
);
    parameter SETUP_DELAY = 100;

    initial begin
        RESET <= 1;
        TPG_RESET <= 1;
        #SETUP_DELAY
        RESET <= 0;
        TPG_RESET <= 0;
    end

    always @(posedge(clk)) begin
        if(ORA_RES == 1) begin
            TPG_RESET <= 1;
            FIC_INC <= 1;
        end
    end

endmodule