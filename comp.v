/* 
    Comparator Module
        Outputs A xnor B (0 when A = B, 1 otherwise)
        Compares the Inputs present at the clock edge.

    Used in:
        1.  ORA #2
    
    Parameters:
        1.  BITS     : Number of Bits Received per input
    
    Inputs:
        1.  A           : Input 1
        2.  B           : Input 2
    
    Outputs:
        1.  res         : Result of Comparison
*/

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