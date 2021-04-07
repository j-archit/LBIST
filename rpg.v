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

module rpg 
#(parameter BITS = 4)
(
    input clk,
    input rst,

    output END,
    output reg [BITS-1:0] register
);
    // Stores Polynomial Coefficients and Seed Value
    reg [BITS-1:0] poly_seed [0:1];
    
    // For File Name Only
    reg [16 : 1] f = "00";
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
    end

    // LFSR Implementation from Here
    
    comp #(.BITS(BITS)) COMP1(.A(register), .B(poly_seed[1]), .res(END));

    reg reg_inp;
    integer i = 0;

    always @(posedge(clk) or posedge(rst)) begin
        if(rst == 1) begin
            register <= poly_seed[1];
        end
        else begin
            // For loop impliments a general LFSR
            for(i = 0; i < BITS; i = i + 1) begin
                // This statement has to be blocking, otherwise all the 
                // iterations are done simultaneously.
                reg_inp = reg_inp ^ (poly_seed[0][i] && register[i]);
            end
            register[BITS-2:0] <= register >> 1;
            register[BITS-1] <= reg_inp;          
            
            reg_inp <= 0;
        end
    end
endmodule