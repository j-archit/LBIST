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

module ora
#(parameter BITWIDTH = 4)
(
    input clk,
    input [0 : BITWIDTH - 1] CUT_OP,
    input [0 : BITWIDTH - 1] FF_OP,
    input rst,
    output reg RES
);
  
    wire [BITWIDTH - 1:0] RC_CUT, RC_FF;
    wire COMP_RES;

    rc #(.OUTPUT_BITS(BITWIDTH), .INPUT_BITS(BITWIDTH)) R1(.ip(CUT_OP), .op(RC_CUT));
    rc #(.OUTPUT_BITS(BITWIDTH), .INPUT_BITS(BITWIDTH)) R2(.ip(FF_OP), .op(RC_FF));

    comp #(.BITS(BITWIDTH)) comparator1(.A(RC_CUT), .B(RC_FF), . res(COMP_RES));

    always @(posedge(clk)) begin
        RES <= COMP_RES;
    end

    always begin
        if(rst == 1) begin
            RES <= 0;
        end
    end

endmodule