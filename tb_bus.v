module bus_tb;

reg [0 : WIDTH-1] DATA_BUS;
wire [0 : WIDTH-1] DATA_OP;
reg len;
localparam WIDTH = 16;
 
bus #(.BUS_WIDTH(WIDTH)) b(.LD(len), .DATA_IN(DATA_BUS), .DATA(DATA_OP));

initial
begin
    len = 0;
    $monitor("DATA = %h, Output = %h", DATA_BUS, DATA_OP);
    DATA_BUS <= 'hFFFD;
    #10
    len = 1;
    len = 0;
    #10
    DATA_BUS = 'h0B56;
    len = 0;
    len = 0;
    #10
    DATA_BUS <= 'hBDC7;
    #10
    len = 1;
    len = 0;
end
    
endmodule