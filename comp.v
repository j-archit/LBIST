/* 
    Comparator Module (O)
        Compares the Inputs
        Outputs A xnor B (0 when A = B, 1 otherwise)

    Parameters:
        1.  BITS     : Number of Bits Received per input
    
    Inputs:
        1.  A           : Input 1
        2.  B           : Input 2
    
    Outputs:
        1.  res         : Result of Comparison
*/

`timescale 1ns/1ns

module comp
#(parameter BITS = 2)
(
    input [0 : BITS - 1] A,
    input [0 : BITS - 1] B,
    output res
);
    wire [0 : BITS - 1] r; 
    assign r = A ~^ B;
    assign res = ~&r;

endmodule