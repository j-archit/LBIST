// Verilog
// c17
// Ninputs 5
// Noutputs 2
// NtotalGates 6
// NAND2 6
// Nfaults 20

`timescale 1ns/1ns

module c17f (INC,END,clk,rst,N1,N2,N3,N6,N7,N22,N23);

input N1,N2,N3,N6,N7;

output N22,N23;

wire N10,N11,N16,N19;

// FaultModel
input INC,clk,rst;
output reg END;
reg fault;
wire N1_t,N2_t,N6_t,N7_t;
wire N3_t0,N3_t1,N11_t0,N11_t1,N16_t0,N16_t1;
reg [9:0] FEN;
fim PI_N1( .fault(fault), .net(N1), .FEN(FEN[0]), .op(N1_t) );
fim PI_N2( .fault(fault), .net(N2), .FEN(FEN[1]), .op(N2_t) );
fim PI_N6( .fault(fault), .net(N6), .FEN(FEN[2]), .op(N6_t) );
fim PI_N7( .fault(fault), .net(N7), .FEN(FEN[3]), .op(N7_t) );
fim FAN_N3_0 ( .fault(fault), .net(N3), .FEN(FEN[4]), .op(N3_t0) );
fim FAN_N3_1 ( .fault(fault), .net(N3), .FEN(FEN[5]), .op(N3_t1) );
fim FAN_N11_0 ( .fault(fault), .net(N11), .FEN(FEN[6]), .op(N11_t0) );
fim FAN_N11_1 ( .fault(fault), .net(N11), .FEN(FEN[7]), .op(N11_t1) );
fim FAN_N16_0 ( .fault(fault), .net(N16), .FEN(FEN[8]), .op(N16_t0) );
fim FAN_N16_1 ( .fault(fault), .net(N16), .FEN(FEN[9]), .op(N16_t1) );
initial begin
    FEN <= {9'b0, 1'b1};
    fault <= 1'b0;
    END <= 1'b0;
    //$display("FEN = %.0f, F = %b", FEN, fault);
    end
    always @(posedge(clk) or posedge(rst)) begin
    if(rst == 1) begin
        FEN <= {9'b0, 1'b1};
        fault <= 1'b0;
        END <= 1'b0;
    end
    else if(clk == 1 && INC == 1) begin
        if (FEN == {1'b1,9'b0} && fault == 1'b0) begin
            fault <= 1;
        end
        if (FEN == {1'b1,9'b0} && fault == 1'b1) begin
            END <= 1;
            fault <= 1;
        end
        FEN <= {FEN[8:0], FEN[9]};
    end
    end
    //always @(FEN or fault) $monitor("FEN = %.0f, F = %b", FEN, fault);
// EndFaultModel

//Anchor
nand NAND2_1 (N10, N1_t, N3_t0);
nand NAND2_2 (N11, N3_t1, N6_t);
nand NAND2_3 (N16, N2_t, N11_t0);
nand NAND2_4 (N19, N11_t1, N7_t);
nand NAND2_5 (N22, N10, N16_t0);
nand NAND2_6 (N23, N16_t1, N19);

endmodule
