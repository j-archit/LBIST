/* 
    Result Compressor Module 
*/

module rc
#(parameter OUTPUT_BITS = 4, INPUT_BITS = 4)
(
    input [INPUT_BITS-1:0] ip,
    output [OUTPUT_BITS-1:0] op
);

    assign op = ip;
    
endmodule