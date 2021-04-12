// Verilog
// c432
// Ninputs 36
// Noutputs 7
// NtotalGates 160
// NOT1 40
// NAND2 64
// NOR2 19
// AND9 3
// XOR2 18
// NAND4 14
// AND8 1
// NAND3 1
// Ntotalnets
// Nfaults 472

`timescale 1ns/1ns

module c432f (INC,END,clk,rst,N1,N4,N8,N11,N14,N17,N21,N24,N27,N30,
             N34,N37,N40,N43,N47,N50,N53,N56,N60,N63,
             N66,N69,N73,N76,N79,N82,N86,N89,N92,N95,
             N99,N102,N105,N108,N112,N115,N223,N329,N370,N421,
             N430,N431,N432);

input N1,N4,N8,N11,N14,N17,N21,N24,N27,N30,
      N34,N37,N40,N43,N47,N50,N53,N56,N60,N63,
      N66,N69,N73,N76,N79,N82,N86,N89,N92,N95,
      N99,N102,N105,N108,N112,N115;

output N223,N329,N370,N421,N430,N431,N432;

wire N118,N119,N122,N123,N126,N127,N130,N131,N134,N135,
     N138,N139,N142,N143,N146,N147,N150,N151,N154,N157,
     N158,N159,N162,N165,N168,N171,N174,N177,N180,N183,
     N184,N185,N186,N187,N188,N189,N190,N191,N192,N193,
     N194,N195,N196,N197,N198,N199,N203,N213,N224,N227,
     N230,N233,N236,N239,N242,N243,N246,N247,N250,N251,
     N254,N255,N256,N257,N258,N259,N260,N263,N264,N267,
     N270,N273,N276,N279,N282,N285,N288,N289,N290,N291,
     N292,N293,N294,N295,N296,N300,N301,N302,N303,N304,
     N305,N306,N307,N308,N309,N319,N330,N331,N332,N333,
     N334,N335,N336,N337,N338,N339,N340,N341,N342,N343,
     N344,N345,N346,N347,N348,N349,N350,N351,N352,N353,
     N354,N355,N356,N357,N360,N371,N372,N373,N374,N375,
     N376,N377,N378,N379,N380,N381,N386,N393,N399,N404,
     N407,N411,N414,N415,N416,N417,N418,N419,N420,N422,
     N425,N428,N429;

// FaultModel
input INC,clk,rst;
output reg END;
reg fault;
wire N1_t0,N1_t1,N4_t0,N4_t1,N4_t2,N11_t0,N11_t1,N17_t0,N17_t1,
     N17_t2,N24_t0,N24_t1,N30_t0,N30_t1,N30_t2,N37_t0,N37_t1,N43_t0,N43_t1,
     N43_t2,N50_t0,N50_t1,N56_t0,N56_t1,N56_t2,N63_t0,N63_t1,N69_t0,N69_t1,
     N69_t2,N76_t0,N76_t1,N82_t0,N82_t1,N82_t2,N89_t0,N89_t1,N95_t0,N95_t1,
     N95_t2,N102_t0,N102_t1,N108_t0,N108_t1,N108_t2,N8_t0,N8_t1,N119_t0,N119_t1,
     N14_t0,N14_t1,N21_t0,N21_t1,N123_t0,N123_t1,N27_t0,N27_t1,N34_t0,N34_t1,
     N127_t0,N127_t1,N40_t0,N40_t1,N47_t0,N47_t1,N131_t0,N131_t1,N53_t0,N53_t1,
     N60_t0,N60_t1,N135_t0,N135_t1,N66_t0,N66_t1,N73_t0,N73_t1,N139_t0,N139_t1,
     N79_t0,N79_t1,N86_t0,N86_t1,N143_t0,N143_t1,N92_t0,N92_t1,N99_t0,N99_t1,
     N147_t0,N147_t1,N105_t0,N105_t1,N112_t0,N112_t1,N151_t0,N151_t1,N115_t0,N115_t1,
     N154_t0,N154_t1,N159_t0,N159_t1,N162_t0,N162_t1,N165_t0,N165_t1,N168_t0,N168_t1,
     N171_t0,N171_t1,N174_t0,N174_t1,N177_t0,N177_t1,N180_t0,N180_t1,N199_t0,N199_t1,
     N199_t2,N203_t0,N203_t1,N203_t2,N203_t3,N203_t4,N203_t5,N203_t6,N203_t7,N203_t8,
     N213_t0,N213_t1,N213_t2,N213_t3,N213_t4,N213_t5,N213_t6,N213_t7,N213_t8,N224_t0,
     N224_t1,N227_t0,N227_t1,N230_t0,N230_t1,N233_t0,N233_t1,N236_t0,N236_t1,N239_t0,
     N239_t1,N243_t0,N243_t1,N247_t0,N247_t1,N251_t0,N251_t1,N260_t0,N260_t1,N264_t0,
     N264_t1,N267_t0,N267_t1,N270_t0,N270_t1,N273_t0,N273_t1,N276_t0,N276_t1,N279_t0,
     N279_t1,N282_t0,N282_t1,N285_t0,N285_t1,N296_t0,N296_t1,N296_t2,N309_t0,N309_t1,
     N309_t2,N309_t3,N309_t4,N309_t5,N309_t6,N309_t7,N309_t8,N319_t0,N319_t1,N319_t2,
     N319_t3,N319_t4,N319_t5,N319_t6,N319_t7,N319_t8,N357_t0,N357_t1,N360_t0,N360_t1,
     N360_t2,N360_t3,N360_t4,N360_t5,N360_t6,N360_t7,N360_t8,N381_t0,N381_t1,N381_t2,
     N381_t3,N386_t0,N386_t1,N386_t2,N386_t3,N386_t4,N386_t5,N393_t0,N393_t1,N393_t2,
     N393_t3,N393_t4,N399_t0,N399_t1,N399_t2,N399_t3,N404_t0,N404_t1,N407_t0,N407_t1,
     N407_t2,N411_t0,N411_t1,N422_t0,N422_t1,N425_t0,N425_t1;
reg [235:0] FEN;
fim FAN_N1_0 ( .fault(fault), .net(N1), .FEN(FEN[0]), .op(N1_t0) );
fim FAN_N1_1 ( .fault(fault), .net(N1), .FEN(FEN[1]), .op(N1_t1) );
fim FAN_N4_0 ( .fault(fault), .net(N4), .FEN(FEN[2]), .op(N4_t0) );
fim FAN_N4_1 ( .fault(fault), .net(N4), .FEN(FEN[3]), .op(N4_t1) );
fim FAN_N4_2 ( .fault(fault), .net(N4), .FEN(FEN[4]), .op(N4_t2) );
fim FAN_N11_0 ( .fault(fault), .net(N11), .FEN(FEN[5]), .op(N11_t0) );
fim FAN_N11_1 ( .fault(fault), .net(N11), .FEN(FEN[6]), .op(N11_t1) );
fim FAN_N17_0 ( .fault(fault), .net(N17), .FEN(FEN[7]), .op(N17_t0) );
fim FAN_N17_1 ( .fault(fault), .net(N17), .FEN(FEN[8]), .op(N17_t1) );
fim FAN_N17_2 ( .fault(fault), .net(N17), .FEN(FEN[9]), .op(N17_t2) );
fim FAN_N24_0 ( .fault(fault), .net(N24), .FEN(FEN[10]), .op(N24_t0) );
fim FAN_N24_1 ( .fault(fault), .net(N24), .FEN(FEN[11]), .op(N24_t1) );
fim FAN_N30_0 ( .fault(fault), .net(N30), .FEN(FEN[12]), .op(N30_t0) );
fim FAN_N30_1 ( .fault(fault), .net(N30), .FEN(FEN[13]), .op(N30_t1) );
fim FAN_N30_2 ( .fault(fault), .net(N30), .FEN(FEN[14]), .op(N30_t2) );
fim FAN_N37_0 ( .fault(fault), .net(N37), .FEN(FEN[15]), .op(N37_t0) );
fim FAN_N37_1 ( .fault(fault), .net(N37), .FEN(FEN[16]), .op(N37_t1) );
fim FAN_N43_0 ( .fault(fault), .net(N43), .FEN(FEN[17]), .op(N43_t0) );
fim FAN_N43_1 ( .fault(fault), .net(N43), .FEN(FEN[18]), .op(N43_t1) );
fim FAN_N43_2 ( .fault(fault), .net(N43), .FEN(FEN[19]), .op(N43_t2) );
fim FAN_N50_0 ( .fault(fault), .net(N50), .FEN(FEN[20]), .op(N50_t0) );
fim FAN_N50_1 ( .fault(fault), .net(N50), .FEN(FEN[21]), .op(N50_t1) );
fim FAN_N56_0 ( .fault(fault), .net(N56), .FEN(FEN[22]), .op(N56_t0) );
fim FAN_N56_1 ( .fault(fault), .net(N56), .FEN(FEN[23]), .op(N56_t1) );
fim FAN_N56_2 ( .fault(fault), .net(N56), .FEN(FEN[24]), .op(N56_t2) );
fim FAN_N63_0 ( .fault(fault), .net(N63), .FEN(FEN[25]), .op(N63_t0) );
fim FAN_N63_1 ( .fault(fault), .net(N63), .FEN(FEN[26]), .op(N63_t1) );
fim FAN_N69_0 ( .fault(fault), .net(N69), .FEN(FEN[27]), .op(N69_t0) );
fim FAN_N69_1 ( .fault(fault), .net(N69), .FEN(FEN[28]), .op(N69_t1) );
fim FAN_N69_2 ( .fault(fault), .net(N69), .FEN(FEN[29]), .op(N69_t2) );
fim FAN_N76_0 ( .fault(fault), .net(N76), .FEN(FEN[30]), .op(N76_t0) );
fim FAN_N76_1 ( .fault(fault), .net(N76), .FEN(FEN[31]), .op(N76_t1) );
fim FAN_N82_0 ( .fault(fault), .net(N82), .FEN(FEN[32]), .op(N82_t0) );
fim FAN_N82_1 ( .fault(fault), .net(N82), .FEN(FEN[33]), .op(N82_t1) );
fim FAN_N82_2 ( .fault(fault), .net(N82), .FEN(FEN[34]), .op(N82_t2) );
fim FAN_N89_0 ( .fault(fault), .net(N89), .FEN(FEN[35]), .op(N89_t0) );
fim FAN_N89_1 ( .fault(fault), .net(N89), .FEN(FEN[36]), .op(N89_t1) );
fim FAN_N95_0 ( .fault(fault), .net(N95), .FEN(FEN[37]), .op(N95_t0) );
fim FAN_N95_1 ( .fault(fault), .net(N95), .FEN(FEN[38]), .op(N95_t1) );
fim FAN_N95_2 ( .fault(fault), .net(N95), .FEN(FEN[39]), .op(N95_t2) );
fim FAN_N102_0 ( .fault(fault), .net(N102), .FEN(FEN[40]), .op(N102_t0) );
fim FAN_N102_1 ( .fault(fault), .net(N102), .FEN(FEN[41]), .op(N102_t1) );
fim FAN_N108_0 ( .fault(fault), .net(N108), .FEN(FEN[42]), .op(N108_t0) );
fim FAN_N108_1 ( .fault(fault), .net(N108), .FEN(FEN[43]), .op(N108_t1) );
fim FAN_N108_2 ( .fault(fault), .net(N108), .FEN(FEN[44]), .op(N108_t2) );
fim FAN_N8_0 ( .fault(fault), .net(N8), .FEN(FEN[45]), .op(N8_t0) );
fim FAN_N8_1 ( .fault(fault), .net(N8), .FEN(FEN[46]), .op(N8_t1) );
fim FAN_N119_0 ( .fault(fault), .net(N119), .FEN(FEN[47]), .op(N119_t0) );
fim FAN_N119_1 ( .fault(fault), .net(N119), .FEN(FEN[48]), .op(N119_t1) );
fim FAN_N14_0 ( .fault(fault), .net(N14), .FEN(FEN[49]), .op(N14_t0) );
fim FAN_N14_1 ( .fault(fault), .net(N14), .FEN(FEN[50]), .op(N14_t1) );
fim FAN_N21_0 ( .fault(fault), .net(N21), .FEN(FEN[51]), .op(N21_t0) );
fim FAN_N21_1 ( .fault(fault), .net(N21), .FEN(FEN[52]), .op(N21_t1) );
fim FAN_N123_0 ( .fault(fault), .net(N123), .FEN(FEN[53]), .op(N123_t0) );
fim FAN_N123_1 ( .fault(fault), .net(N123), .FEN(FEN[54]), .op(N123_t1) );
fim FAN_N27_0 ( .fault(fault), .net(N27), .FEN(FEN[55]), .op(N27_t0) );
fim FAN_N27_1 ( .fault(fault), .net(N27), .FEN(FEN[56]), .op(N27_t1) );
fim FAN_N34_0 ( .fault(fault), .net(N34), .FEN(FEN[57]), .op(N34_t0) );
fim FAN_N34_1 ( .fault(fault), .net(N34), .FEN(FEN[58]), .op(N34_t1) );
fim FAN_N127_0 ( .fault(fault), .net(N127), .FEN(FEN[59]), .op(N127_t0) );
fim FAN_N127_1 ( .fault(fault), .net(N127), .FEN(FEN[60]), .op(N127_t1) );
fim FAN_N40_0 ( .fault(fault), .net(N40), .FEN(FEN[61]), .op(N40_t0) );
fim FAN_N40_1 ( .fault(fault), .net(N40), .FEN(FEN[62]), .op(N40_t1) );
fim FAN_N47_0 ( .fault(fault), .net(N47), .FEN(FEN[63]), .op(N47_t0) );
fim FAN_N47_1 ( .fault(fault), .net(N47), .FEN(FEN[64]), .op(N47_t1) );
fim FAN_N131_0 ( .fault(fault), .net(N131), .FEN(FEN[65]), .op(N131_t0) );
fim FAN_N131_1 ( .fault(fault), .net(N131), .FEN(FEN[66]), .op(N131_t1) );
fim FAN_N53_0 ( .fault(fault), .net(N53), .FEN(FEN[67]), .op(N53_t0) );
fim FAN_N53_1 ( .fault(fault), .net(N53), .FEN(FEN[68]), .op(N53_t1) );
fim FAN_N60_0 ( .fault(fault), .net(N60), .FEN(FEN[69]), .op(N60_t0) );
fim FAN_N60_1 ( .fault(fault), .net(N60), .FEN(FEN[70]), .op(N60_t1) );
fim FAN_N135_0 ( .fault(fault), .net(N135), .FEN(FEN[71]), .op(N135_t0) );
fim FAN_N135_1 ( .fault(fault), .net(N135), .FEN(FEN[72]), .op(N135_t1) );
fim FAN_N66_0 ( .fault(fault), .net(N66), .FEN(FEN[73]), .op(N66_t0) );
fim FAN_N66_1 ( .fault(fault), .net(N66), .FEN(FEN[74]), .op(N66_t1) );
fim FAN_N73_0 ( .fault(fault), .net(N73), .FEN(FEN[75]), .op(N73_t0) );
fim FAN_N73_1 ( .fault(fault), .net(N73), .FEN(FEN[76]), .op(N73_t1) );
fim FAN_N139_0 ( .fault(fault), .net(N139), .FEN(FEN[77]), .op(N139_t0) );
fim FAN_N139_1 ( .fault(fault), .net(N139), .FEN(FEN[78]), .op(N139_t1) );
fim FAN_N79_0 ( .fault(fault), .net(N79), .FEN(FEN[79]), .op(N79_t0) );
fim FAN_N79_1 ( .fault(fault), .net(N79), .FEN(FEN[80]), .op(N79_t1) );
fim FAN_N86_0 ( .fault(fault), .net(N86), .FEN(FEN[81]), .op(N86_t0) );
fim FAN_N86_1 ( .fault(fault), .net(N86), .FEN(FEN[82]), .op(N86_t1) );
fim FAN_N143_0 ( .fault(fault), .net(N143), .FEN(FEN[83]), .op(N143_t0) );
fim FAN_N143_1 ( .fault(fault), .net(N143), .FEN(FEN[84]), .op(N143_t1) );
fim FAN_N92_0 ( .fault(fault), .net(N92), .FEN(FEN[85]), .op(N92_t0) );
fim FAN_N92_1 ( .fault(fault), .net(N92), .FEN(FEN[86]), .op(N92_t1) );
fim FAN_N99_0 ( .fault(fault), .net(N99), .FEN(FEN[87]), .op(N99_t0) );
fim FAN_N99_1 ( .fault(fault), .net(N99), .FEN(FEN[88]), .op(N99_t1) );
fim FAN_N147_0 ( .fault(fault), .net(N147), .FEN(FEN[89]), .op(N147_t0) );
fim FAN_N147_1 ( .fault(fault), .net(N147), .FEN(FEN[90]), .op(N147_t1) );
fim FAN_N105_0 ( .fault(fault), .net(N105), .FEN(FEN[91]), .op(N105_t0) );
fim FAN_N105_1 ( .fault(fault), .net(N105), .FEN(FEN[92]), .op(N105_t1) );
fim FAN_N112_0 ( .fault(fault), .net(N112), .FEN(FEN[93]), .op(N112_t0) );
fim FAN_N112_1 ( .fault(fault), .net(N112), .FEN(FEN[94]), .op(N112_t1) );
fim FAN_N151_0 ( .fault(fault), .net(N151), .FEN(FEN[95]), .op(N151_t0) );
fim FAN_N151_1 ( .fault(fault), .net(N151), .FEN(FEN[96]), .op(N151_t1) );
fim FAN_N115_0 ( .fault(fault), .net(N115), .FEN(FEN[97]), .op(N115_t0) );
fim FAN_N115_1 ( .fault(fault), .net(N115), .FEN(FEN[98]), .op(N115_t1) );
fim FAN_N154_0 ( .fault(fault), .net(N154), .FEN(FEN[99]), .op(N154_t0) );
fim FAN_N154_1 ( .fault(fault), .net(N154), .FEN(FEN[100]), .op(N154_t1) );
fim FAN_N159_0 ( .fault(fault), .net(N159), .FEN(FEN[101]), .op(N159_t0) );
fim FAN_N159_1 ( .fault(fault), .net(N159), .FEN(FEN[102]), .op(N159_t1) );
fim FAN_N162_0 ( .fault(fault), .net(N162), .FEN(FEN[103]), .op(N162_t0) );
fim FAN_N162_1 ( .fault(fault), .net(N162), .FEN(FEN[104]), .op(N162_t1) );
fim FAN_N165_0 ( .fault(fault), .net(N165), .FEN(FEN[105]), .op(N165_t0) );
fim FAN_N165_1 ( .fault(fault), .net(N165), .FEN(FEN[106]), .op(N165_t1) );
fim FAN_N168_0 ( .fault(fault), .net(N168), .FEN(FEN[107]), .op(N168_t0) );
fim FAN_N168_1 ( .fault(fault), .net(N168), .FEN(FEN[108]), .op(N168_t1) );
fim FAN_N171_0 ( .fault(fault), .net(N171), .FEN(FEN[109]), .op(N171_t0) );
fim FAN_N171_1 ( .fault(fault), .net(N171), .FEN(FEN[110]), .op(N171_t1) );
fim FAN_N174_0 ( .fault(fault), .net(N174), .FEN(FEN[111]), .op(N174_t0) );
fim FAN_N174_1 ( .fault(fault), .net(N174), .FEN(FEN[112]), .op(N174_t1) );
fim FAN_N177_0 ( .fault(fault), .net(N177), .FEN(FEN[113]), .op(N177_t0) );
fim FAN_N177_1 ( .fault(fault), .net(N177), .FEN(FEN[114]), .op(N177_t1) );
fim FAN_N180_0 ( .fault(fault), .net(N180), .FEN(FEN[115]), .op(N180_t0) );
fim FAN_N180_1 ( .fault(fault), .net(N180), .FEN(FEN[116]), .op(N180_t1) );
fim FAN_N199_0 ( .fault(fault), .net(N199), .FEN(FEN[117]), .op(N199_t0) );
fim FAN_N199_1 ( .fault(fault), .net(N199), .FEN(FEN[118]), .op(N199_t1) );
fim FAN_N199_2 ( .fault(fault), .net(N199), .FEN(FEN[119]), .op(N199_t2) );
fim FAN_N203_0 ( .fault(fault), .net(N203), .FEN(FEN[120]), .op(N203_t0) );
fim FAN_N203_1 ( .fault(fault), .net(N203), .FEN(FEN[121]), .op(N203_t1) );
fim FAN_N203_2 ( .fault(fault), .net(N203), .FEN(FEN[122]), .op(N203_t2) );
fim FAN_N203_3 ( .fault(fault), .net(N203), .FEN(FEN[123]), .op(N203_t3) );
fim FAN_N203_4 ( .fault(fault), .net(N203), .FEN(FEN[124]), .op(N203_t4) );
fim FAN_N203_5 ( .fault(fault), .net(N203), .FEN(FEN[125]), .op(N203_t5) );
fim FAN_N203_6 ( .fault(fault), .net(N203), .FEN(FEN[126]), .op(N203_t6) );
fim FAN_N203_7 ( .fault(fault), .net(N203), .FEN(FEN[127]), .op(N203_t7) );
fim FAN_N203_8 ( .fault(fault), .net(N203), .FEN(FEN[128]), .op(N203_t8) );
fim FAN_N213_0 ( .fault(fault), .net(N213), .FEN(FEN[129]), .op(N213_t0) );
fim FAN_N213_1 ( .fault(fault), .net(N213), .FEN(FEN[130]), .op(N213_t1) );
fim FAN_N213_2 ( .fault(fault), .net(N213), .FEN(FEN[131]), .op(N213_t2) );
fim FAN_N213_3 ( .fault(fault), .net(N213), .FEN(FEN[132]), .op(N213_t3) );
fim FAN_N213_4 ( .fault(fault), .net(N213), .FEN(FEN[133]), .op(N213_t4) );
fim FAN_N213_5 ( .fault(fault), .net(N213), .FEN(FEN[134]), .op(N213_t5) );
fim FAN_N213_6 ( .fault(fault), .net(N213), .FEN(FEN[135]), .op(N213_t6) );
fim FAN_N213_7 ( .fault(fault), .net(N213), .FEN(FEN[136]), .op(N213_t7) );
fim FAN_N213_8 ( .fault(fault), .net(N213), .FEN(FEN[137]), .op(N213_t8) );
fim FAN_N224_0 ( .fault(fault), .net(N224), .FEN(FEN[138]), .op(N224_t0) );
fim FAN_N224_1 ( .fault(fault), .net(N224), .FEN(FEN[139]), .op(N224_t1) );
fim FAN_N227_0 ( .fault(fault), .net(N227), .FEN(FEN[140]), .op(N227_t0) );
fim FAN_N227_1 ( .fault(fault), .net(N227), .FEN(FEN[141]), .op(N227_t1) );
fim FAN_N230_0 ( .fault(fault), .net(N230), .FEN(FEN[142]), .op(N230_t0) );
fim FAN_N230_1 ( .fault(fault), .net(N230), .FEN(FEN[143]), .op(N230_t1) );
fim FAN_N233_0 ( .fault(fault), .net(N233), .FEN(FEN[144]), .op(N233_t0) );
fim FAN_N233_1 ( .fault(fault), .net(N233), .FEN(FEN[145]), .op(N233_t1) );
fim FAN_N236_0 ( .fault(fault), .net(N236), .FEN(FEN[146]), .op(N236_t0) );
fim FAN_N236_1 ( .fault(fault), .net(N236), .FEN(FEN[147]), .op(N236_t1) );
fim FAN_N239_0 ( .fault(fault), .net(N239), .FEN(FEN[148]), .op(N239_t0) );
fim FAN_N239_1 ( .fault(fault), .net(N239), .FEN(FEN[149]), .op(N239_t1) );
fim FAN_N243_0 ( .fault(fault), .net(N243), .FEN(FEN[150]), .op(N243_t0) );
fim FAN_N243_1 ( .fault(fault), .net(N243), .FEN(FEN[151]), .op(N243_t1) );
fim FAN_N247_0 ( .fault(fault), .net(N247), .FEN(FEN[152]), .op(N247_t0) );
fim FAN_N247_1 ( .fault(fault), .net(N247), .FEN(FEN[153]), .op(N247_t1) );
fim FAN_N251_0 ( .fault(fault), .net(N251), .FEN(FEN[154]), .op(N251_t0) );
fim FAN_N251_1 ( .fault(fault), .net(N251), .FEN(FEN[155]), .op(N251_t1) );
fim FAN_N260_0 ( .fault(fault), .net(N260), .FEN(FEN[156]), .op(N260_t0) );
fim FAN_N260_1 ( .fault(fault), .net(N260), .FEN(FEN[157]), .op(N260_t1) );
fim FAN_N264_0 ( .fault(fault), .net(N264), .FEN(FEN[158]), .op(N264_t0) );
fim FAN_N264_1 ( .fault(fault), .net(N264), .FEN(FEN[159]), .op(N264_t1) );
fim FAN_N267_0 ( .fault(fault), .net(N267), .FEN(FEN[160]), .op(N267_t0) );
fim FAN_N267_1 ( .fault(fault), .net(N267), .FEN(FEN[161]), .op(N267_t1) );
fim FAN_N270_0 ( .fault(fault), .net(N270), .FEN(FEN[162]), .op(N270_t0) );
fim FAN_N270_1 ( .fault(fault), .net(N270), .FEN(FEN[163]), .op(N270_t1) );
fim FAN_N273_0 ( .fault(fault), .net(N273), .FEN(FEN[164]), .op(N273_t0) );
fim FAN_N273_1 ( .fault(fault), .net(N273), .FEN(FEN[165]), .op(N273_t1) );
fim FAN_N276_0 ( .fault(fault), .net(N276), .FEN(FEN[166]), .op(N276_t0) );
fim FAN_N276_1 ( .fault(fault), .net(N276), .FEN(FEN[167]), .op(N276_t1) );
fim FAN_N279_0 ( .fault(fault), .net(N279), .FEN(FEN[168]), .op(N279_t0) );
fim FAN_N279_1 ( .fault(fault), .net(N279), .FEN(FEN[169]), .op(N279_t1) );
fim FAN_N282_0 ( .fault(fault), .net(N282), .FEN(FEN[170]), .op(N282_t0) );
fim FAN_N282_1 ( .fault(fault), .net(N282), .FEN(FEN[171]), .op(N282_t1) );
fim FAN_N285_0 ( .fault(fault), .net(N285), .FEN(FEN[172]), .op(N285_t0) );
fim FAN_N285_1 ( .fault(fault), .net(N285), .FEN(FEN[173]), .op(N285_t1) );
fim FAN_N296_0 ( .fault(fault), .net(N296), .FEN(FEN[174]), .op(N296_t0) );
fim FAN_N296_1 ( .fault(fault), .net(N296), .FEN(FEN[175]), .op(N296_t1) );
fim FAN_N296_2 ( .fault(fault), .net(N296), .FEN(FEN[176]), .op(N296_t2) );
fim FAN_N309_0 ( .fault(fault), .net(N309), .FEN(FEN[177]), .op(N309_t0) );
fim FAN_N309_1 ( .fault(fault), .net(N309), .FEN(FEN[178]), .op(N309_t1) );
fim FAN_N309_2 ( .fault(fault), .net(N309), .FEN(FEN[179]), .op(N309_t2) );
fim FAN_N309_3 ( .fault(fault), .net(N309), .FEN(FEN[180]), .op(N309_t3) );
fim FAN_N309_4 ( .fault(fault), .net(N309), .FEN(FEN[181]), .op(N309_t4) );
fim FAN_N309_5 ( .fault(fault), .net(N309), .FEN(FEN[182]), .op(N309_t5) );
fim FAN_N309_6 ( .fault(fault), .net(N309), .FEN(FEN[183]), .op(N309_t6) );
fim FAN_N309_7 ( .fault(fault), .net(N309), .FEN(FEN[184]), .op(N309_t7) );
fim FAN_N309_8 ( .fault(fault), .net(N309), .FEN(FEN[185]), .op(N309_t8) );
fim FAN_N319_0 ( .fault(fault), .net(N319), .FEN(FEN[186]), .op(N319_t0) );
fim FAN_N319_1 ( .fault(fault), .net(N319), .FEN(FEN[187]), .op(N319_t1) );
fim FAN_N319_2 ( .fault(fault), .net(N319), .FEN(FEN[188]), .op(N319_t2) );
fim FAN_N319_3 ( .fault(fault), .net(N319), .FEN(FEN[189]), .op(N319_t3) );
fim FAN_N319_4 ( .fault(fault), .net(N319), .FEN(FEN[190]), .op(N319_t4) );
fim FAN_N319_5 ( .fault(fault), .net(N319), .FEN(FEN[191]), .op(N319_t5) );
fim FAN_N319_6 ( .fault(fault), .net(N319), .FEN(FEN[192]), .op(N319_t6) );
fim FAN_N319_7 ( .fault(fault), .net(N319), .FEN(FEN[193]), .op(N319_t7) );
fim FAN_N319_8 ( .fault(fault), .net(N319), .FEN(FEN[194]), .op(N319_t8) );
fim FAN_N357_0 ( .fault(fault), .net(N357), .FEN(FEN[195]), .op(N357_t0) );
fim FAN_N357_1 ( .fault(fault), .net(N357), .FEN(FEN[196]), .op(N357_t1) );
fim FAN_N360_0 ( .fault(fault), .net(N360), .FEN(FEN[197]), .op(N360_t0) );
fim FAN_N360_1 ( .fault(fault), .net(N360), .FEN(FEN[198]), .op(N360_t1) );
fim FAN_N360_2 ( .fault(fault), .net(N360), .FEN(FEN[199]), .op(N360_t2) );
fim FAN_N360_3 ( .fault(fault), .net(N360), .FEN(FEN[200]), .op(N360_t3) );
fim FAN_N360_4 ( .fault(fault), .net(N360), .FEN(FEN[201]), .op(N360_t4) );
fim FAN_N360_5 ( .fault(fault), .net(N360), .FEN(FEN[202]), .op(N360_t5) );
fim FAN_N360_6 ( .fault(fault), .net(N360), .FEN(FEN[203]), .op(N360_t6) );
fim FAN_N360_7 ( .fault(fault), .net(N360), .FEN(FEN[204]), .op(N360_t7) );
fim FAN_N360_8 ( .fault(fault), .net(N360), .FEN(FEN[205]), .op(N360_t8) );
fim FAN_N381_0 ( .fault(fault), .net(N381), .FEN(FEN[206]), .op(N381_t0) );
fim FAN_N381_1 ( .fault(fault), .net(N381), .FEN(FEN[207]), .op(N381_t1) );
fim FAN_N381_2 ( .fault(fault), .net(N381), .FEN(FEN[208]), .op(N381_t2) );
fim FAN_N381_3 ( .fault(fault), .net(N381), .FEN(FEN[209]), .op(N381_t3) );
fim FAN_N386_0 ( .fault(fault), .net(N386), .FEN(FEN[210]), .op(N386_t0) );
fim FAN_N386_1 ( .fault(fault), .net(N386), .FEN(FEN[211]), .op(N386_t1) );
fim FAN_N386_2 ( .fault(fault), .net(N386), .FEN(FEN[212]), .op(N386_t2) );
fim FAN_N386_3 ( .fault(fault), .net(N386), .FEN(FEN[213]), .op(N386_t3) );
fim FAN_N386_4 ( .fault(fault), .net(N386), .FEN(FEN[214]), .op(N386_t4) );
fim FAN_N386_5 ( .fault(fault), .net(N386), .FEN(FEN[215]), .op(N386_t5) );
fim FAN_N393_0 ( .fault(fault), .net(N393), .FEN(FEN[216]), .op(N393_t0) );
fim FAN_N393_1 ( .fault(fault), .net(N393), .FEN(FEN[217]), .op(N393_t1) );
fim FAN_N393_2 ( .fault(fault), .net(N393), .FEN(FEN[218]), .op(N393_t2) );
fim FAN_N393_3 ( .fault(fault), .net(N393), .FEN(FEN[219]), .op(N393_t3) );
fim FAN_N393_4 ( .fault(fault), .net(N393), .FEN(FEN[220]), .op(N393_t4) );
fim FAN_N399_0 ( .fault(fault), .net(N399), .FEN(FEN[221]), .op(N399_t0) );
fim FAN_N399_1 ( .fault(fault), .net(N399), .FEN(FEN[222]), .op(N399_t1) );
fim FAN_N399_2 ( .fault(fault), .net(N399), .FEN(FEN[223]), .op(N399_t2) );
fim FAN_N399_3 ( .fault(fault), .net(N399), .FEN(FEN[224]), .op(N399_t3) );
fim FAN_N404_0 ( .fault(fault), .net(N404), .FEN(FEN[225]), .op(N404_t0) );
fim FAN_N404_1 ( .fault(fault), .net(N404), .FEN(FEN[226]), .op(N404_t1) );
fim FAN_N407_0 ( .fault(fault), .net(N407), .FEN(FEN[227]), .op(N407_t0) );
fim FAN_N407_1 ( .fault(fault), .net(N407), .FEN(FEN[228]), .op(N407_t1) );
fim FAN_N407_2 ( .fault(fault), .net(N407), .FEN(FEN[229]), .op(N407_t2) );
fim FAN_N411_0 ( .fault(fault), .net(N411), .FEN(FEN[230]), .op(N411_t0) );
fim FAN_N411_1 ( .fault(fault), .net(N411), .FEN(FEN[231]), .op(N411_t1) );
fim FAN_N422_0 ( .fault(fault), .net(N422), .FEN(FEN[232]), .op(N422_t0) );
fim FAN_N422_1 ( .fault(fault), .net(N422), .FEN(FEN[233]), .op(N422_t1) );
fim FAN_N425_0 ( .fault(fault), .net(N425), .FEN(FEN[234]), .op(N425_t0) );
fim FAN_N425_1 ( .fault(fault), .net(N425), .FEN(FEN[235]), .op(N425_t1) );
initial begin
    FEN <= {235'b0, 1'b1};
    fault <= 1'b0;
    END <= 1'b0;
    //$display("FEN = %.0f, F = %b", FEN, fault);
    end
    always @(posedge(clk) or posedge(rst)) begin
    if(rst == 1) begin
        FEN <= {235'b0, 1'b1};
        fault <= 1'b0;
        END <= 1'b0;
    end
    else if(clk == 1 && INC == 1) begin
        if (FEN == {1'b1,235'b0} && fault == 1'b0) begin
            fault <= 1;
        end
        if (FEN == {1'b1,235'b0} && fault == 1'b1) begin
            END <= 1;
            fault <= 1;
        end
        FEN = {FEN[234:0], FEN[235]};
        if (((FEN[41] || FEN[94] || FEN[98] || FEN[137] || FEN[194] || FEN[205]) && fault == 0) || (FEN[220] && fault)) FEN <= {FEN[234:0], FEN[235]};
    end
    end
    //always @(FEN or fault) $monitor("FEN = %.0f, F = %b", FEN, fault);
    // EndFaultModel

//Anchor
not NOT1_1 (N118, N1_t0);
not NOT1_2 (N119, N4_t0);
not NOT1_3 (N122, N11_t0);
not NOT1_4 (N123, N17_t0);
not NOT1_5 (N126, N24_t0);
not NOT1_6 (N127, N30_t0);
not NOT1_7 (N130, N37_t0);
not NOT1_8 (N131, N43_t0);
not NOT1_9 (N134, N50_t0);
not NOT1_10 (N135, N56_t0);
not NOT1_11 (N138, N63_t0);
not NOT1_12 (N139, N69_t0);
not NOT1_13 (N142, N76_t0);
not NOT1_14 (N143, N82_t0);
not NOT1_15 (N146, N89_t0);
not NOT1_16 (N147, N95_t0);
not NOT1_17 (N150, N102_t0);
not NOT1_18 (N151, N108_t0);
nand NAND2_19 (N154, N118, N4_t1);
nor NOR2_20 (N157, N8_t0, N119_t0);
nor NOR2_21 (N158, N14_t0, N119_t1);
nand NAND2_22 (N159, N122, N17_t1);
nand NAND2_23 (N162, N126, N30_t1);
nand NAND2_24 (N165, N130, N43_t1);
nand NAND2_25 (N168, N134, N56_t1);
nand NAND2_26 (N171, N138, N69_t1);
nand NAND2_27 (N174, N142, N82_t1);
nand NAND2_28 (N177, N146, N95_t1);
nand NAND2_29 (N180, N150, N108_t1);
nor NOR2_30 (N183, N21_t0, N123_t0);
nor NOR2_31 (N184, N27_t0, N123_t1);
nor NOR2_32 (N185, N34_t0, N127_t0);
nor NOR2_33 (N186, N40_t0, N127_t1);
nor NOR2_34 (N187, N47_t0, N131_t0);
nor NOR2_35 (N188, N53_t0, N131_t1);
nor NOR2_36 (N189, N60_t0, N135_t0);
nor NOR2_37 (N190, N66_t0, N135_t1);
nor NOR2_38 (N191, N73_t0, N139_t0);
nor NOR2_39 (N192, N79_t0, N139_t1);
nor NOR2_40 (N193, N86_t0, N143_t0);
nor NOR2_41 (N194, N92_t0, N143_t1);
nor NOR2_42 (N195, N99_t0, N147_t0);
nor NOR2_43 (N196, N105_t0, N147_t1);
nor NOR2_44 (N197, N112_t0, N151_t0);
nor NOR2_45 (N198, N115_t0, N151_t1);
and AND9_46 (N199, N154_t0, N159_t0, N162_t0, N165_t0, N168_t0, N171_t0, N174_t0, N177_t0, N180_t0);
not NOT1_47 (N203, N199_t0);
not NOT1_48 (N213, N199_t1);
not NOT1_49 (N223, N199_t2);
xor XOR2_50 (N224, N203_t0, N154_t1);
xor XOR2_51 (N227, N203_t1, N159_t1);
xor XOR2_52 (N230, N203_t2, N162_t1);
xor XOR2_53 (N233, N203_t3, N165_t1);
xor XOR2_54 (N236, N203_t4, N168_t1);
xor XOR2_55 (N239, N203_t5, N171_t1);
nand NAND2_56 (N242, N1_t1, N213_t0);
xor XOR2_57 (N243, N203_t6, N174_t1);
nand NAND2_58 (N246, N213_t1, N11_t1);
xor XOR2_59 (N247, N203_t7, N177_t1);
nand NAND2_60 (N250, N213_t2, N24_t1);
xor XOR2_61 (N251, N203_t8, N180_t1);
nand NAND2_62 (N254, N213_t3, N37_t1);
nand NAND2_63 (N255, N213_t4, N50_t1);
nand NAND2_64 (N256, N213_t5, N63_t1);
nand NAND2_65 (N257, N213_t6, N76_t1);
nand NAND2_66 (N258, N213_t7, N89_t1);
nand NAND2_67 (N259, N213_t8, N102_t1);
nand NAND2_68 (N260, N224_t0, N157);
nand NAND2_69 (N263, N224_t1, N158);
nand NAND2_70 (N264, N227_t0, N183);
nand NAND2_71 (N267, N230_t0, N185);
nand NAND2_72 (N270, N233_t0, N187);
nand NAND2_73 (N273, N236_t0, N189);
nand NAND2_74 (N276, N239_t0, N191);
nand NAND2_75 (N279, N243_t0, N193);
nand NAND2_76 (N282, N247_t0, N195);
nand NAND2_77 (N285, N251_t0, N197);
nand NAND2_78 (N288, N227_t1, N184);
nand NAND2_79 (N289, N230_t1, N186);
nand NAND2_80 (N290, N233_t1, N188);
nand NAND2_81 (N291, N236_t1, N190);
nand NAND2_82 (N292, N239_t1, N192);
nand NAND2_83 (N293, N243_t1, N194);
nand NAND2_84 (N294, N247_t1, N196);
nand NAND2_85 (N295, N251_t1, N198);
and AND9_86 (N296, N260_t0, N264_t0, N267_t0, N270_t0, N273_t0, N276_t0, N279_t0, N282_t0, N285_t0);
not NOT1_87 (N300, N263);
not NOT1_88 (N301, N288);
not NOT1_89 (N302, N289);
not NOT1_90 (N303, N290);
not NOT1_91 (N304, N291);
not NOT1_92 (N305, N292);
not NOT1_93 (N306, N293);
not NOT1_94 (N307, N294);
not NOT1_95 (N308, N295);
not NOT1_96 (N309, N296_t0);
not NOT1_97 (N319, N296_t1);
not NOT1_98 (N329, N296_t2);
xor XOR2_99 (N330, N309_t0, N260_t1);
xor XOR2_100 (N331, N309_t1, N264_t1);
xor XOR2_101 (N332, N309_t2, N267_t1);
xor XOR2_102 (N333, N309_t3, N270_t1);
nand NAND2_103 (N334, N8_t1, N319_t0);
xor XOR2_104 (N335, N309_t4, N273_t1);
nand NAND2_105 (N336, N319_t1, N21_t1);
xor XOR2_106 (N337, N309_t5, N276_t1);
nand NAND2_107 (N338, N319_t2, N34_t1);
xor XOR2_108 (N339, N309_t6, N279_t1);
nand NAND2_109 (N340, N319_t3, N47_t1);
xor XOR2_110 (N341, N309_t7, N282_t1);
nand NAND2_111 (N342, N319_t4, N60_t1);
xor XOR2_112 (N343, N309_t8, N285_t1);
nand NAND2_113 (N344, N319_t5, N73_t1);
nand NAND2_114 (N345, N319_t6, N86_t1);
nand NAND2_115 (N346, N319_t7, N99_t1);
nand NAND2_116 (N347, N319_t8, N112_t1);
nand NAND2_117 (N348, N330, N300);
nand NAND2_118 (N349, N331, N301);
nand NAND2_119 (N350, N332, N302);
nand NAND2_120 (N351, N333, N303);
nand NAND2_121 (N352, N335, N304);
nand NAND2_122 (N353, N337, N305);
nand NAND2_123 (N354, N339, N306);
nand NAND2_124 (N355, N341, N307);
nand NAND2_125 (N356, N343, N308);
and AND9_126 (N357, N348, N349, N350, N351, N352, N353, N354, N355, N356);
not NOT1_127 (N360, N357_t0);
not NOT1_128 (N370, N357_t1);
nand NAND2_129 (N371, N14_t1, N360_t0);
nand NAND2_130 (N372, N360_t1, N27_t1);
nand NAND2_131 (N373, N360_t2, N40_t1);
nand NAND2_132 (N374, N360_t3, N53_t1);
nand NAND2_133 (N375, N360_t4, N66_t1);
nand NAND2_134 (N376, N360_t5, N79_t1);
nand NAND2_135 (N377, N360_t6, N92_t1);
nand NAND2_136 (N378, N360_t7, N105_t1);
nand NAND2_137 (N379, N360_t8, N115_t1);
nand NAND4_138 (N380, N4_t2, N242, N334, N371);
nand NAND4_139 (N381, N246, N336, N372, N17_t2);
nand NAND4_140 (N386, N250, N338, N373, N30_t2);
nand NAND4_141 (N393, N254, N340, N374, N43_t2);
nand NAND4_142 (N399, N255, N342, N375, N56_t2);
nand NAND4_143 (N404, N256, N344, N376, N69_t2);
nand NAND4_144 (N407, N257, N345, N377, N82_t2);
nand NAND4_145 (N411, N258, N346, N378, N95_t2);
nand NAND4_146 (N414, N259, N347, N379, N108_t2);
not NOT1_147 (N415, N380);
and AND8_148 (N416, N381_t0, N386_t0, N393_t0, N399_t0, N404_t0, N407_t0, N411_t0, N414);
not NOT1_149 (N417, N393_t1);
not NOT1_150 (N418, N404_t1);
not NOT1_151 (N419, N407_t1);
not NOT1_152 (N420, N411_t1);
nor NOR2_153 (N421, N415, N416);
nand NAND2_154 (N422, N386_t1, N417);
nand NAND4_155 (N425, N386_t2, N393_t2, N418, N399_t1);
nand NAND3_156 (N428, N399_t2, N393_t3, N419);
nand NAND4_157 (N429, N386_t3, N393_t4, N407_t2, N420);
nand NAND4_158 (N430, N381_t1, N386_t4, N422_t0, N399_t3);
nand NAND4_159 (N431, N381_t2, N386_t5, N425_t0, N428);
nand NAND4_160 (N432, N381_t3, N422_t1, N425_t1, N429);

endmodule
