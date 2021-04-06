/*
    Device Mid Section
    Consists of
        1. Fault Injection Design (FIC)
        2. CUT - For Fault Injection
        3. CUT - Fault Free CUT

    Parameters:
        1. IN_BITS  : Number of Inputs / Input Bits
        2. OUT_BITS : Number of Outputs / Output Bits

    Inputs:
        1. clk      : Synchronizing Clock Input
        2. rst      : Asynch FIC Reset
        3. inc      : FIC Increment Signal (FIC injects New Fault in CUT when inc goes High)
        3. TEST_IP  : Input Test Pattern

    Outputs:
        1. CUT_OP   : Faulty Circuit Output
        2. FF_OP    : Fault Free Output

    Architecture:
        FIC, CUT1 and CUT2 are placed parallel, TEST_IP is given to both the CUTs. 
*/

module CUT ();
    
endmodule

module mid
#(parameter IN_BITS = 4, parameter OUT_BITS = 4) 
(
    input clk,
    input rst,
    input inc,
    input [IN_BITS-1:0] TEST_IP,
    output [OUT_BITS-1:0] CUT_OP, FF_OP
);

    CUT faulty();
    CUT FF();
    
endmodule