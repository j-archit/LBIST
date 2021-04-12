/*
    Random Pattern Generator Module
        Implements an N-Bit External XOR LFSR

    Parameters:
        1. BITS         : Bitwidth of LFSR
    
    Inputs:
        1. clk          : Clock
        2. rst          : Asnych Reset
    
    Outputs
        1. END          : End of Pattern Cycle Signal
        2. register    : LFSR

*/

`timescale 1ns/1ns

module rpg
#(parameter BITS = 4)
(
    input clk,
    input rst,

    output reg END,
    output reg [BITS-1:0] register
);
    // Stores Polynomial Coefficients and Seed Value
    reg [BITS-1:0] poly_seed [0:1];
    
    // For File Name Only
    reg [64 : 1] f = "poly\\00";
    integer t0, t1;
    
    // Initialize the Polynomial Coeffs and Seed from Memory   
    initial begin
        
        // Make Filename and Read from the File
        t0 = BITS % 10;
        t1 = (BITS - t0)/10;
        f[8:1] = "0" + t0;
        f[16:9] = "0" + t1;
        $readmemb(f, poly_seed);

        // Initialize Register to Seed
        register <= poly_seed[1];
        reg_inp <= 0;
        END <= 0;
    end

    // LFSR Implementation from Here
    reg reg_inp;
    wire END_t;
    integer i = 0;
    
    always @(posedge(clk) or posedge(rst)) begin
        if(rst == 1) begin
            register <= poly_seed[1];
        end
        else if (rst != 1) begin
            // For loop implements a general LFSR
            for(i = 0; i < BITS; i = i + 1) begin
                // This statement has to be blocking, otherwise all the 
                // iterations are done simultaneously.
                reg_inp = reg_inp ^ (poly_seed[0][i] && register[i]);
            end
            register[BITS-2:0] <= register >> 1;
            register[BITS-1] <= reg_inp;
            reg_inp <= 0;
        end
        if (register == poly_seed[1] && rst != 1) begin
            if (END != 1) END <= 1;
            else END <= 0;
        end
        if (END == 1) END <= 0;
    end
endmodule