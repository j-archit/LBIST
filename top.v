/*
    Top Level Module for the MTE Project - TDDS

    Submitted to
        A. Prof. Kriti Suneja
    Submitted by
        Archit Jain 2K18/EC/041
        Arpan Katiyar 2K18/EC/043

    Local Parameters and Variables/Nets/Registers
    1. System Parameters
        Constant System Parameters
    2. BIST Circuit Common Clock
        Common Clock used by the BIST components

    Blocks
    1. MidSection (mid.v) (Contains FIL and the CUTs)
        (In Progress)
    2. BIST Controller (controller.v)
        (Completed)
    3. Test Pattern Generator (tpg.v)
        (Completed)
    4. Output Result Analyzer (ora.v) 
        (Completed)


    Rules to Follow:
    1. Each Module's First Input should be the clock (sequential module only)
    2. Each Top level Block should have an Asynch Reset
    3. Each Module's testbench must be named <module>_tb.v
    4. Each Module Must contain a description of the Module Params, IP/OPs in it's Header
    5.
*/

module top;

// Parameters
    // CUT
    parameter IN_BITS = 4; // No of Inputs of CUT
    parameter OUT_BITS = 4; // NO of Outputs of CUT
    parameter TOT_FAULT_BITS = 16; // Bits required to store "Number of Stuck at Faults Possible"

    // ORA
    parameter RC_OUT_BITS = 4; // Width of the Result Compactor Result
// Parameters End

// Variables/Nets/Registers
    // Input Side
    wire TPG_END, ORA_RES;
    wire SYS_RESET, TPG_RESET;
    wire FIL_INC;
    wire [TOT_FAULT_BITS-1:0] ERR_COUNT;
    wire [IN_BITS-1:0] TEST_PATTERN;
    
    // Output Side
    wire [OUT_BITS-1:0] CUT_OP, FF_OP;
// End

// Module Instantiations
    controller #(.ERR_BITS(TOT_FAULT_BITS)) B0(.clk(clk), .TPG_END(TPG_END), .ORA_RES(ORA_RES), .RESET(SYS_RESET), .TPG_RESET(TPG_RESET), .FIL_INC(FIL_INC), .ERR_COUNTER(ERR_COUNT));
    tpg #(.BITS(IN_BITS)) B1(.clk(clk), .rst(TPG_RESET), .END(TPG_END), .TEST_PATTERN(TEST_PATTERN));
    mid #(.IN_BITS(IN_BITS), .OUT_BITS(OUT_BITS)) B2(.clk(clk), .rst(SYS_RESET), .FIL_INC(FIL_INC), .TEST_IP(TEST_PATTERN), .CUT_OP(CUT_OP), .FF_OP(FF_OP));
    ora #(.OUT_BITS(OUT_BITS)) B3(.clk(clk), .rst(SYS_RESET), .CUT_OP(CUT_OP), .FF_OP(FF_OP), .RES(ORA_RES));
// Instantiations End

// clk Control
    reg clk;
    initial clk <= 0;
    always #10 clk <= ~clk;
// clk ends

    initial begin
        #100 $finish;
    end

endmodule