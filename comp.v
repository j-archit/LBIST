/* 
    ORA #2 - Comparator Module

        Outputs A xnor B (0 when A = B, 1 otherwise)
        Compares the Inputs present at the clock edge.
*/

module comp
#(parameter RC_BITS = 2)
(
    input [0 : RC_BITS - 1] rc_op,
    input [0 : RC_BITS - 1] ff_sig,
    input clk,
    output res
);

reg result;
always @(posedge(clk)) begin
    if(rc_op == ff_sig) result <= 0;
    else result <= 1;
end
assign res = result;
    
endmodule