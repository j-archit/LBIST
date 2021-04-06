/* 
    Output Result Analyzer (ORA)

    Consists of 
        1. Result Compressor (rc.v)
        2. Comparator (comp.v)
            (Testbench - ok)
*/

module ora
#(parameter OP_WIDTH = 4, parameter IP_SIG_ADD_BITS = 4)
(
    input clk,
    input [0 : OP_WIDTH - 1] CUT_OP,
    input [0 : OP_WIDTH - 1] FF_OP,
    output reg RES
);
  
    wire [OP_WIDTH - 1:0] RC_CUT, RC_FF;
    wire COMP_RES;

    rc #(.OUTPUT_BITS(OP_WIDTH), .INPUT_BITS(OP_WIDTH)) CUT(.ip(CUT_OP), .op(RC_CUT));
    rc #(.OUTPUT_BITS(OP_WIDTH), .INPUT_BITS(OP_WIDTH)) FF(.ip(FF_OP), .op(RC_FF));
    
    comp #(.BITS(OP_WIDTH)) comparator1(.A(RC_CUT), .B(RC_FF), . res(COMP_RES));

    always @(posedge(clk)) begin
        RES <= COMP_RES;
    end

endmodule