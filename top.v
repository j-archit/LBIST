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
    1. MidSection (mid.v) (Contains FIC and the CUTs)
        (In Progress)
    2. BIST Controller (bist_c.v)
        (In Progress)
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
parameter INPUT_BITS = 4; // No of Inputs of CUT
parameter OUTPUT_BITS = 4; // NO of Outputs of CUT
parameter TOT_FAULTS = 100; // Total Number of Stuck at Faults Possible

// Test Patterns
parameter NUM_DTP = 100; // Number of Deterministic Test Patterns
parameter NUM_RTP = 100; // Number of Random Test Patterns
parameter ADD_BITS = 8;
    // Width of the Memory Address for correct responses of tests
    // Depends on total number of tests applied.

// ORA
parameter RC_BITS = 2; // Width of the Result Compactor Result

// Variables/Nets/Registers
reg clk; // Clock for BIST Controller

initial
begin
    clk = 0;
end

always
begin
    #10 assign clk = !clk;
end

initial begin
    #100 $finish;
end

endmodule