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
	c499f #() faulty(
		FIL_INC, FIL_END, clk, rst, TEST_IP[40], TEST_IP[39], TEST_IP[38], TEST_IP[37], TEST_IP[36], TEST_IP[35], TEST_IP[34], TEST_IP[33], TEST_IP[32], TEST_IP[31], TEST_IP[30], TEST_IP[29], TEST_IP[28], TEST_IP[27], TEST_IP[26], TEST_IP[25], TEST_IP[24], TEST_IP[23], TEST_IP[22], TEST_IP[21], TEST_IP[20], TEST_IP[19], TEST_IP[18], TEST_IP[17], TEST_IP[16], TEST_IP[15], TEST_IP[14], TEST_IP[13], TEST_IP[12], TEST_IP[11], TEST_IP[10], TEST_IP[9], TEST_IP[8], TEST_IP[7], TEST_IP[6], TEST_IP[5], TEST_IP[4], TEST_IP[3], TEST_IP[2], TEST_IP[1], TEST_IP[0], CUT_OP[31], CUT_OP[30], CUT_OP[29], CUT_OP[28], CUT_OP[27], CUT_OP[26], CUT_OP[25], CUT_OP[24], CUT_OP[23], CUT_OP[22], CUT_OP[21], CUT_OP[20], CUT_OP[19], CUT_OP[18], CUT_OP[17], CUT_OP[16], CUT_OP[15], CUT_OP[14], CUT_OP[13], CUT_OP[12], CUT_OP[11], CUT_OP[10], CUT_OP[9], CUT_OP[8], CUT_OP[7], CUT_OP[6], CUT_OP[5], CUT_OP[4], CUT_OP[3], CUT_OP[2], CUT_OP[1], CUT_OP[0]
    );
	c499 #() faultf(
		TEST_IP[40], TEST_IP[39], TEST_IP[38], TEST_IP[37], TEST_IP[36], TEST_IP[35], TEST_IP[34], TEST_IP[33], TEST_IP[32], TEST_IP[31], TEST_IP[30], TEST_IP[29], TEST_IP[28], TEST_IP[27], TEST_IP[26], TEST_IP[25], TEST_IP[24], TEST_IP[23], TEST_IP[22], TEST_IP[21], TEST_IP[20], TEST_IP[19], TEST_IP[18], TEST_IP[17], TEST_IP[16], TEST_IP[15], TEST_IP[14], TEST_IP[13], TEST_IP[12], TEST_IP[11], TEST_IP[10], TEST_IP[9], TEST_IP[8], TEST_IP[7], TEST_IP[6], TEST_IP[5], TEST_IP[4], TEST_IP[3], TEST_IP[2], TEST_IP[1], TEST_IP[0], FF_OP[31], FF_OP[30], FF_OP[29], FF_OP[28], FF_OP[27], FF_OP[26], FF_OP[25], FF_OP[24], FF_OP[23], FF_OP[22], FF_OP[21], FF_OP[20], FF_OP[19], FF_OP[18], FF_OP[17], FF_OP[16], FF_OP[15], FF_OP[14], FF_OP[13], FF_OP[12], FF_OP[11], FF_OP[10], FF_OP[9], FF_OP[8], FF_OP[7], FF_OP[6], FF_OP[5], FF_OP[4], FF_OP[3], FF_OP[2], FF_OP[1], FF_OP[0]
    );
    // Block Ends
    
endmodule