/* 
    Output Result Analyzer (ORA) Block
        (Testbench - OK)

    Consists of 
        1. Result Compressor (rc.v)
        2. Comparator (comp.v)
            (Testbench - OK)

    Parameters:
        1. BITWIDTH : Bit Width of the Circuit Output
                        (Default, 4)

    Inputs:
        1. clk      : Clock Signal
        2. CUT_OP   : Faulty Circuit Output
        3. FF_OP    : Fault Free Output
        4. rst      : Asynch Output Reset
                        (Active HIGH)

    Outputs:
        1. RES      : Result of the Comparison
                        ( 1 - Different, 0 - Equal Inputs )

    Architecture:
        The Faulty Circuit Output and the Fault Free Output both go into a Response Compactor
        Then the Outputs of both the RCs go to the comparator and on the Rising Edge of the Clock
        the result of the comparison is stored into the output RES register.

                         ----               ---------------
        FaultyOP--------| R1 |--RC_CUT-----|               |
                         ----              |  comparator1  |----- RES
        F.FreeOP--------| R2 |--RC_FF------|               |
                         ----               ---------------
*/

`timescale 1ns/1ns

module ora
#(parameter OUT_BITS = 4)
(
    input clk,
    input rst,
    input [OUT_BITS - 1 : 0] CUT_OP,
    input [OUT_BITS - 1 : 0] FF_OP,
    output reg RES
);
  
    wire [OUT_BITS - 1:0] RC_CUT, RC_FF;
    wire COMP_RES;

    rc #(.OUTPUT_BITS(OUT_BITS), .INPUT_BITS(OUT_BITS)) R1(.ip(CUT_OP), .op(RC_CUT));
    rc #(.OUTPUT_BITS(OUT_BITS), .INPUT_BITS(OUT_BITS)) R2(.ip(FF_OP), .op(RC_FF));

    comp #(.BITS(OUT_BITS)) comparator1(.A(RC_CUT), .B(RC_FF), . res(COMP_RES));

    always @(posedge(clk) or posedge(rst)) begin
        if(rst != 1) RES <= COMP_RES;
        else RES <= 0;
    end

endmodule