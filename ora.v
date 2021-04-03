/* 
    Output Result Analyzer (ORA)

    Consists of 
        1. Result Compressor (rc.v) ** Pending
        2. Comparator (comp.v)
            (Testbench - ok)
        3. Detected Fault Counter (counter.v - instance)
            (Testbench - ok)
        4. Fault Free Signatures Memory Storage (mem.v - instance)
            (Testbench - ok)

*/

module ora
#(parameter OP_WIDTH = 4, parameter IP_SIG_ADD_BITS = 4)
(
    input clk,
    input [0 : OP_WIDTH - 1] CUT_OP,
    input [0 : IP_SIG_ADD_BITS - 1] IP_SIG_ADD

);
  
endmodule