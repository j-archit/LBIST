/* 
    Test Pattern Generator

    Consists of 
    1. Random Pattern Generator (rpg.v)
    2. Deterministic Pattern Generator (dpg.v)
    3. Selection Multiplexer

*/

/*module tpg
#(parameter INPUT_BITS = 4)
(
    input type
);
    
endmodule
*/

module tpg #( parameter INPUT_BITS=4)
                  (
                  input clk,
                  input reset_n,
                  output[1:N]q
                  );
                  
reg [ 1:INPUT_BITS ] qreg, qnext;
reg taps;

always @( posedge clk, reset_n)
begin 
  if (~reset_n)
    qreg <='d1;
  else
    qreg <= qnext; 
end

always @ ( taps , qreg )
  begin
    qnext={taps , qreg[1:N-1]} ;
  end
  
assign q = qreg;

always@(*)
  begin
    case (INPUT_BITS)
    3 : begin
          taps= qreg[3]~^qreg[2];
        end
    4 : begin
          taps= qreg[4]~^qreg[3];
        end            
    5 : begin
          taps= qreg[5]~^qreg[3];
        end
    6 : begin
          taps= qreg[6]~^qreg[5];
        end
    7 : begin
          taps= qreg[7]~^qreg[6];
        end
    8 : begin
          taps= qreg[8]~^qreg[6]~^qreg[5]~^qreg[4];
        end
    9 : begin
          taps= qreg[9]~^qreg[5];
        end
    10 : begin
          taps= qreg[10]~^qreg[7];
        end
    11 : begin
          taps= qreg[11]~^qreg[9];
        end
    12 : begin
          taps= qreg[12]~^qreg[6]~^qreg[4]~^qreg[1];
        end
    13 : begin
          taps= qreg[13]~^qreg[4]~^qreg[3]~^qreg[1];
        end
    14 : begin
          taps= qreg[14]~^qreg[5]~^qreg[3]~^qreg[1];
        end
    15 : begin
          taps= qreg[15]~^qreg[14];
        end
    16 : begin
          taps= qreg[16]~^qreg[15]~^qreg[13]~^qreg[4];
        end
    17 : begin
          taps= qreg[17]~^qreg[14];
        end
    18 : begin
          taps= qreg[18]~^qreg[11];
        end
    19 : begin
          taps= qreg[19]~^qreg[6]~^qreg[2]~^qreg[1];
        end
    20 : begin
          taps= qreg[20]~^qreg[17];
        end
    21 : begin
          taps= qreg[21]~^qreg[19];
        end                                                                                                                 
    22 : begin
          taps= qreg[22]~^qreg[21];
        end
    23 : begin
          taps= qreg[23]~^qreg[18];
        end
    24 : begin
          taps= qreg[24]~^qreg[23]~^qreg[22]~^qreg[17];
        end
    25 : begin
          taps= qreg[25]~^qreg[22];
        end
    26 : begin
          taps= qreg[26]~^qreg[6]~^qreg[2]~^qreg[1];
        end
    27 : begin
          taps= qreg[27]~^qreg[5]~^qreg[2]~^qreg[1];
        end
    28 : begin
          taps= qreg[28]~^qreg[25];
        end
    29 : begin
          taps= qreg[29]~^qreg[27];
        end
    30 : begin
          taps= qreg[30]~^qreg[6]~^qreg[4]~^qreg[1];
        end                                                                               
  endcase
end                   
endmodule
