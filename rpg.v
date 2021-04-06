/*
    Random Pattern Generator 
    External XOR LFSR
*/

module rpg 
#(parameter BITS = 4)
(
    input clk,
    input rst,

    output reg END,
    output reg [BITS-1:0] register
);
    reg [BITS-1:0] poly_seed [0:1];
    
    reg [16 : 1] f = "00";
    integer t0, t1;
    
    // Initialize the Polynomial Coeffs and Seed from Memory   
    initial begin
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
    integer i = 0;

    always @(posedge(clk) or posedge(rst)) begin
        if(rst == 1) begin
            register <= poly_seed[1];
            END <= 0;
        end
        else begin

            register <= register >> 1;
            // For loop implicates a general LFSR
            for(i = 0; i < BITS; i = i + 1) begin
                reg_inp = reg_inp ^ (poly_seed[0][i] && register[i]);
            end
            
            register[BITS-1] <= reg_inp;          
            reg_inp <= 0;
        end
    end
endmodule