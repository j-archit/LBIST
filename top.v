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
    1. CUT
    2. Fault Injection Circuitry (fic.v)
    3. BIST Controller (bist_c.v)
    4. Test Pattern Generator (tpg.v)
    5. Output Result Analyzer (ora.v)
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
reg clk; // Common Clock for BIST Controller 

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