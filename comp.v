/* 
    Comparator Module
        Outputs A xnor B (0 when A = B, 1 otherwise)
        Compares the Inputs present at the clock edge.

    Used in:
        1.  ORA #2
    
    Parameters:
        1.  RC_BITS     : Number of Bits Received per input
    
    Inputs:
        1.  clk
        2.  A           : Input 1
        3.  B           : Input 2
    
    Outputs:
        1.  res         : Result of Comparison
*/

module comp
#(parameter RC_BITS = 2)
(
    input clk,
    input [0 : RC_BITS - 1] A,
    input [0 : RC_BITS - 1] B,
    output res
);

reg result;
always @(posedge(clk)) begin
    if(A == B) result <= 0;
    else result <= 1;
end
assign res = result;
    
endmodule