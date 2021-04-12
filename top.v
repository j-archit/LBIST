/*
    Top Level Module for the MTE Project - TDDS

    Submitted to
        A. Prof. Kriti Suneja
    Submitted by
        Archit Jain 2K18/EC/041
        Arpan Katiyar 2K18/EC/043

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

`timescale 1ns/1ns

module top;

// Parameters
    // CUT

    // No of Inputs/Outputs of CUT
    // Python Scripts Edits this using "// Params" Comment
    // Do NOT MANUALLY EDIT
    // Params
	parameter IN_BITS = 41;
	parameter OUT_BITS = 32;
	parameter RC_OUT_BITS = 2;
	parameter TOT_FAULT_BITS = 10;
	parameter ERR_TOTAL = 528;
	parameter clk_period = 5;
    // Params

// Parameters End

// Variables/Nets/Registers
    wire TPG_END, ORA_RES;
    wire SYS_RESET, TPG_RESET;
    wire FIL_INC, FIL_END;
    wire [TOT_FAULT_BITS-1:0] ERR_COUNT;
    wire [IN_BITS-1:0] TEST_PATTERN;
    wire [OUT_BITS-1:0] CUT_OP, FF_OP;
// End

// clk Control
    reg clk;
    initial clk <= 0;
    always #clk_period clk <= ~clk;
// clk ends

// Module Instantiations
    controller #(.ERR_BITS(TOT_FAULT_BITS)) B0(.clk(clk), .TPG_END(TPG_END), .ORA_RES(ORA_RES), .FIL_END(FIL_END), .RESET(SYS_RESET), .TPG_RESET(TPG_RESET), .FIL_INC(FIL_INC), .ERR_COUNTER(ERR_COUNT));
    tpg #(.BITS(IN_BITS)) B1(.clk(clk), .rst(TPG_RESET), .END(TPG_END), .TEST_PATTERN(TEST_PATTERN));
    mid #(.IN_BITS(IN_BITS), .OUT_BITS(OUT_BITS)) B2(.clk(clk), .rst(SYS_RESET), .FIL_INC(FIL_INC), .FIL_END(FIL_END), .TEST_IP(TEST_PATTERN), .CUT_OP(CUT_OP), .FF_OP(FF_OP));
    ora #(.OUT_BITS(OUT_BITS)) B3(.clk(clk), .rst(SYS_RESET), .CUT_OP(CUT_OP), .FF_OP(FF_OP), .RES(ORA_RES));
// Instantiations End


// Complete Simulation
    // As soon as FIL ends Injections, Stop Simulation
    always @(posedge(FIL_END)) begin
        #(2*clk_period)
        $display("Errors Detected = %.0f, Total Errors = %.0f\n", ERR_COUNT, ERR_TOTAL);
        $finish;
    end
    
    // Finish Simulation if it takes more than 10^9 simulation time
    always begin
        #1000000
        $display("Errors Detected = %.0f, Total Errors = %.0f", ERR_COUNT, ERR_TOTAL);
        $finish;
    end

    // always begin
    //     #1000000
    //     $display("Errors Detected = %.0f, Total Errors = %.0f", ERR_COUNT, ERR_TOTAL);
    // end

    // always @(clk) begin
    //     $display("T=%.0f,R=%b,TR=%b,TE=%b,FI=%b,FE=%b,TP=%b,OP_F=%b,OP_FF=%b,OR=%b,ERRORS=%.0f", $time, SYS_RESET, TPG_RESET, TPG_END, FIL_INC, FIL_END, TEST_PATTERN, CUT_OP, FF_OP, ORA_RES,ERR_COUNT);
    // end

    // initial begin
    //     $dumpfile("vars3.vcd");
    //     $dumpvars(1, top);
    //     $dumplimit(100000000);
    // end

endmodule
