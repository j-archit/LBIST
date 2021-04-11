/*
    Device Mid Section
    Consists of
        1. Fault Injection Logic (FIL)
        2. CUT - For Fault Injection
        3. CUT - Fault Free CUT

    Parameters:
        1. IN_BITS  : Number of Inputs / Input Bits
        2. OUT_BITS : Number of Outputs / Output Bits

    Inputs:
        1. clk      : Synchronizing Clock Input
        2. rst      : Asynch Reset (For FIL only)
        3. inc      : FIC Increment Signal (FIL injects New Fault in CUT when inc goes High)
        3. TEST_IP  : Input Test Pattern

    Outputs:
        1. CUT_OP   : Faulty Circuit Output
        2. FF_OP    : Fault Free Output

    Architecture:
        FIL, CUT1 and CUT2 are placed parallel, TEST_IP is given to both the CUTs. 
*/

`timescale 1ns/1ns

module mid
#(parameter IN_BITS = 1, parameter OUT_BITS = 1) 
(
    input clk,
    input rst,
    input FIL_INC,
    output FIL_END,
    input [IN_BITS-1:0] TEST_IP,
    output [OUT_BITS-1:0] CUT_OP, FF_OP
);
    
    // Python Script makes changes using "// Anchor" Comment
    // Make NO CHANGES in this block manually
    // Anchor
	c17f #() faulty(
		FIL_INC, FIL_END, clk, rst, TEST_IP[4], TEST_IP[3], TEST_IP[2], TEST_IP[1], TEST_IP[0], CUT_OP[1], CUT_OP[0]
    );
	c17 #() faultf(
		TEST_IP[4], TEST_IP[3], TEST_IP[2], TEST_IP[1], TEST_IP[0], FF_OP[1], FF_OP[0]
    );
    // Block Ends
    
endmodule