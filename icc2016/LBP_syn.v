/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Tue Mar 29 14:13:39 2022
/////////////////////////////////////////////////////////////


module LBP_DW01_add_0 ( A, B, SUM );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  wire   n1;
  wire   [7:2] carry;

  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  XOR3XL U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .Y(SUM[7]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2XL U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module LBP_DW01_inc_0_DW01_inc_1 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  XOR2X1 U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  INVXL U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module LBP_DW01_inc_1_DW01_inc_2 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  XOR2X1 U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module LBP_DW01_inc_2_DW01_inc_3 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  XOR2X1 U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module LBP ( clk, reset, gray_addr, gray_req, gray_ready, gray_data, lbp_addr, 
        lbp_valid, lbp_data, finish );
  output [13:0] gray_addr;
  input [7:0] gray_data;
  output [13:0] lbp_addr;
  output [7:0] lbp_data;
  input clk, reset, gray_ready;
  output gray_req, lbp_valid, finish;
  wire   n399, n400, n401, n402, n403, n404, n405, n406, n407, n408, n409,
         n410, n411, n412, n413, n414, n415, n416, n417, n418, n419, n420,
         n421, n422, n423, n424, n425, n426, n427, n428, n429, n430, n431,
         n432, n433, N47, N49, N50, N51, N52, N53, N54, N55, N56, N59, N60,
         N61, N62, N63, N64, N65, N66, N85, N86, N87, N88, N89, N90, N91, N93,
         N120, N121, N122, N123, N124, N125, N126, N127, N128, N129, N130,
         N131, N132, N133, N158, N160, N225, n8, n9, n10, n12, n14, n15, n17,
         n19, n20, n21, n22, n24, n26, n28, n29, n46, n470, n490, n500, n510,
         n530, n540, n550, n560, n57, n58, n590, n600, n610, n620, n630, n640,
         n650, n660, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n850, n860, n870, n880, n890, n900,
         n910, n92, n930, n94, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n113, n114, n115, n116, n117,
         n118, n119, n1200, n1210, n1220, n1230, n1240, n1250, n1260, n1270,
         n1280, n1290, n1300, n1310, n1320, n1330, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n1580, n159,
         n1600, n161, n162, n163, n164, n165, n166, n167, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, N236, N235, N234, N233, N232, N231,
         N230, n436, n307, n308, n309, n310, n311, n312, n313, n314, n315,
         n316, n317, n318, n319, n320, n321, n322, n323, n324, n325, n326,
         n327, n328, n329, n330, n331, n332, n334, n335, n336, n337, n338,
         n339, n340, n341, n342, n343, n344, n345, n346, n347, n348, n349,
         n350, n351, n352, n353, n354, n355, n356, n357, n358, n359, n360,
         n361, n362, n363, n364, n365, n366, n367, n368, n369, n370, n371,
         n372, n373, n374, n375, n376, n377, n378, n379, n380, n381, n382,
         n383, n384, n385, n386, n387, n388, n389, n390, n391, n392, n393,
         n394, n396, n397, n398, n434;
  wire   [2:0] state;
  wire   [2:0] next_state;
  wire   [2:0] cnt7;
  wire   [6:0] addr1;
  wire   [6:0] addr2;
  wire   [6:0] addr1_after;
  wire   [6:0] addr1_before;
  wire   [6:0] addr2_after;
  wire   [6:1] addr2_before;
  wire   [7:1] threshold;
  wire   [6:0] outside_data;
  wire   [7:0] temp;

  DFFRX1 addr1_reg_6_ ( .D(n198), .CK(clk), .RN(n339), .Q(addr1[6]), .QN(n105)
         );
  DFFRX1 addr1_reg_4_ ( .D(n193), .CK(clk), .RN(n340), .Q(addr1[4]), .QN(n103)
         );
  DFFRX1 addr1_reg_5_ ( .D(n192), .CK(clk), .RN(n341), .Q(addr1[5]), .QN(n108)
         );
  DFFRX1 addr1_reg_2_ ( .D(n195), .CK(clk), .RN(n372), .Q(addr1[2]), .QN(n99)
         );
  DFFRX1 addr1_reg_3_ ( .D(n194), .CK(clk), .RN(n342), .Q(addr1[3]), .QN(n101)
         );
  DFFRX1 addr1_reg_1_ ( .D(n196), .CK(clk), .RN(n372), .Q(addr1[1]), .QN(n97)
         );
  DFFRX1 threshold_reg_6_ ( .D(n1310), .CK(clk), .RN(n341), .QN(n1260) );
  DFFRX1 outside_data_reg_6_ ( .D(n156), .CK(clk), .RN(n340), .Q(
        outside_data[6]), .QN(n115) );
  DFFRX1 outside_data_reg_0_ ( .D(n1580), .CK(clk), .RN(n341), .Q(
        outside_data[0]), .QN(n113) );
  DFFRX1 outside_data_reg_7_ ( .D(n157), .CK(clk), .RN(n342), .QN(n114) );
  DFFRX1 outside_data_reg_5_ ( .D(n155), .CK(clk), .RN(n340), .QN(n116) );
  DFFRX1 outside_data_reg_3_ ( .D(n153), .CK(clk), .RN(n341), .QN(n118) );
  DFFRX1 outside_data_reg_1_ ( .D(n151), .CK(clk), .RN(n340), .QN(n1200) );
  DFFRX1 threshold_reg_0_ ( .D(n1290), .CK(clk), .RN(n341), .QN(n1280) );
  DFFRX1 threshold_reg_7_ ( .D(n1300), .CK(clk), .RN(n341), .Q(threshold[7]), 
        .QN(n1270) );
  DFFRX1 outside_data_reg_2_ ( .D(n152), .CK(clk), .RN(n339), .Q(
        outside_data[2]), .QN(n119) );
  DFFRX1 threshold_reg_3_ ( .D(n134), .CK(clk), .RN(n341), .Q(threshold[3]), 
        .QN(n1230) );
  DFFRX1 threshold_reg_5_ ( .D(n1320), .CK(clk), .RN(n341), .Q(threshold[5]), 
        .QN(n1250) );
  DFFRX1 threshold_reg_2_ ( .D(n135), .CK(clk), .RN(n341), .Q(threshold[2]), 
        .QN(n1220) );
  DFFRX1 threshold_reg_4_ ( .D(n1330), .CK(clk), .RN(n341), .Q(threshold[4]), 
        .QN(n1240) );
  DFFRX1 threshold_reg_1_ ( .D(n136), .CK(clk), .RN(n341), .Q(threshold[1]), 
        .QN(n1210) );
  DFFRX1 outside_data_reg_4_ ( .D(n154), .CK(clk), .RN(n339), .Q(
        outside_data[4]), .QN(n117) );
  DFFRX1 totallbp_reg_0_ ( .D(n191), .CK(clk), .RN(n342), .Q(n433), .QN(n81)
         );
  DFFSX1 gray_addr_reg_0_ ( .D(n170), .CK(clk), .SN(n339), .Q(n412), .QN(n67)
         );
  DFFRX1 lbp_addr_reg_5_ ( .D(n141), .CK(clk), .RN(n340), .Q(n420), .QN(n930)
         );
  DFFRX1 lbp_addr_reg_6_ ( .D(n142), .CK(clk), .RN(n340), .Q(n419), .QN(n94)
         );
  DFFRX1 lbp_addr_reg_7_ ( .D(n143), .CK(clk), .RN(n340), .Q(n418), .QN(n96)
         );
  DFFRX1 lbp_addr_reg_8_ ( .D(n144), .CK(clk), .RN(n340), .Q(n417), .QN(n98)
         );
  DFFRX1 lbp_addr_reg_9_ ( .D(n145), .CK(clk), .RN(n340), .Q(n416), .QN(n100)
         );
  DFFRX1 lbp_addr_reg_10_ ( .D(n146), .CK(clk), .RN(n340), .Q(n415), .QN(n102)
         );
  DFFRX1 lbp_addr_reg_11_ ( .D(n147), .CK(clk), .RN(n340), .Q(n414), .QN(n104)
         );
  DFFRX1 lbp_addr_reg_13_ ( .D(n148), .CK(clk), .RN(n340), .Q(n413), .QN(n106)
         );
  DFFRX1 lbp_addr_reg_0_ ( .D(n149), .CK(clk), .RN(n340), .Q(n425), .QN(n107)
         );
  DFFRX1 lbp_addr_reg_12_ ( .D(n159), .CK(clk), .RN(n339), .QN(n109) );
  DFFRX1 lbp_addr_reg_1_ ( .D(n137), .CK(clk), .RN(n341), .Q(n424), .QN(n890)
         );
  DFFRX1 lbp_addr_reg_2_ ( .D(n138), .CK(clk), .RN(n341), .Q(n423), .QN(n900)
         );
  DFFRX1 lbp_addr_reg_3_ ( .D(n139), .CK(clk), .RN(n341), .Q(n422), .QN(n910)
         );
  DFFRX1 lbp_addr_reg_4_ ( .D(n140), .CK(clk), .RN(n340), .Q(n421), .QN(n92)
         );
  DFFRX1 gray_addr_reg_1_ ( .D(n171), .CK(clk), .RN(n342), .Q(n411), .QN(n68)
         );
  DFFRX1 gray_addr_reg_2_ ( .D(n172), .CK(clk), .RN(n342), .Q(n410), .QN(n69)
         );
  DFFRX1 gray_addr_reg_3_ ( .D(n173), .CK(clk), .RN(n342), .Q(n409), .QN(n70)
         );
  DFFRX1 gray_addr_reg_4_ ( .D(n174), .CK(clk), .RN(n342), .Q(n408), .QN(n71)
         );
  DFFRX1 gray_addr_reg_5_ ( .D(n175), .CK(clk), .RN(n342), .Q(n407), .QN(n72)
         );
  DFFRX1 gray_addr_reg_6_ ( .D(n176), .CK(clk), .RN(n342), .Q(n406), .QN(n73)
         );
  DFFRX1 totallbp_reg_6_ ( .D(n185), .CK(clk), .RN(n339), .Q(n427), .QN(n870)
         );
  DFFRX1 totallbp_reg_5_ ( .D(n186), .CK(clk), .RN(n339), .Q(n428), .QN(n860)
         );
  DFFRX1 totallbp_reg_4_ ( .D(n187), .CK(clk), .RN(n339), .Q(n429), .QN(n850)
         );
  DFFRX1 totallbp_reg_2_ ( .D(n189), .CK(clk), .RN(n339), .Q(n431), .QN(n83)
         );
  DFFRX1 totallbp_reg_1_ ( .D(n190), .CK(clk), .RN(n339), .Q(n432), .QN(n82)
         );
  DFFRX1 totallbp_reg_3_ ( .D(n188), .CK(clk), .RN(n339), .Q(n430), .QN(n84)
         );
  DFFRX1 totallbp_reg_7_ ( .D(n184), .CK(clk), .RN(n339), .Q(n426), .QN(n880)
         );
  DFFSX1 gray_addr_reg_7_ ( .D(n177), .CK(clk), .SN(n339), .Q(n405), .QN(n74)
         );
  DFFRX1 gray_addr_reg_13_ ( .D(n183), .CK(clk), .RN(n339), .Q(n399), .QN(n80)
         );
  DFFRX1 gray_addr_reg_12_ ( .D(n182), .CK(clk), .RN(n339), .Q(n400), .QN(n79)
         );
  DFFRX1 gray_addr_reg_8_ ( .D(n178), .CK(clk), .RN(n342), .Q(n404), .QN(n75)
         );
  DFFRX1 gray_addr_reg_9_ ( .D(n179), .CK(clk), .RN(n342), .Q(n403), .QN(n76)
         );
  DFFRX1 gray_addr_reg_10_ ( .D(n180), .CK(clk), .RN(n342), .Q(n402), .QN(n77)
         );
  DFFRX1 gray_addr_reg_11_ ( .D(n181), .CK(clk), .RN(n342), .Q(n401), .QN(n78)
         );
  DFFSX1 addr1_reg_0_ ( .D(n197), .CK(clk), .SN(n372), .Q(addr1[0]), .QN(
        addr1_before[0]) );
  DFFRX1 addr2_reg_5_ ( .D(n162), .CK(clk), .RN(n372), .Q(addr2[5]), .QN(n392)
         );
  DFFRX1 state_reg_2_ ( .D(next_state[2]), .CK(clk), .RN(n372), .Q(state[2]), 
        .QN(n397) );
  DFFRX1 state_reg_0_ ( .D(next_state[0]), .CK(clk), .RN(n372), .Q(state[0]), 
        .QN(n385) );
  DFFRX1 state_reg_1_ ( .D(next_state[1]), .CK(clk), .RN(n372), .Q(state[1]), 
        .QN(n396) );
  DFFRX1 addr2_reg_1_ ( .D(n166), .CK(clk), .RN(n372), .Q(addr2[1]), .QN(n389)
         );
  DFFRX1 addr2_reg_2_ ( .D(n165), .CK(clk), .RN(n372), .Q(addr2[2]), .QN(n390)
         );
  DFFRX1 addr2_reg_3_ ( .D(n164), .CK(clk), .RN(n372), .Q(addr2[3]), .QN(n391)
         );
  DFFRX1 addr2_reg_4_ ( .D(n163), .CK(clk), .RN(n372), .Q(addr2[4]), .QN(n357)
         );
  DFFRX1 addr2_reg_6_ ( .D(n161), .CK(clk), .RN(n372), .Q(addr2[6]), .QN(n393)
         );
  NAND2XL U223 ( .A(cnt7[1]), .B(cnt7[0]), .Y(n398) );
  NOR3XL U224 ( .A(n383), .B(cnt7[1]), .C(cnt7[0]), .Y(N53) );
  NOR3XL U225 ( .A(cnt7[0]), .B(cnt7[2]), .C(cnt7[1]), .Y(N49) );
  NOR3XL U226 ( .A(n382), .B(cnt7[2]), .C(cnt7[1]), .Y(N50) );
  NOR3XL U227 ( .A(n331), .B(cnt7[2]), .C(cnt7[0]), .Y(N51) );
  INVX3 U229 ( .A(reset), .Y(n372) );
  NOR2BX2 U230 ( .AN(n307), .B(n332), .Y(n316) );
  NOR2BX2 U231 ( .AN(n319), .B(cnt7[2]), .Y(n328) );
  NOR2BX2 U232 ( .AN(n320), .B(n383), .Y(n327) );
  OAI32X4 U233 ( .A0(n332), .A1(cnt7[2]), .A2(n331), .B0(cnt7[1]), .B1(n308), 
        .Y(n315) );
  BUFX12 U234 ( .A(n401), .Y(gray_addr[11]) );
  BUFX12 U235 ( .A(n402), .Y(gray_addr[10]) );
  BUFX12 U236 ( .A(n403), .Y(gray_addr[9]) );
  BUFX12 U237 ( .A(n404), .Y(gray_addr[8]) );
  BUFX12 U238 ( .A(n400), .Y(gray_addr[12]) );
  BUFX12 U239 ( .A(n399), .Y(gray_addr[13]) );
  BUFX12 U240 ( .A(n405), .Y(gray_addr[7]) );
  BUFX12 U241 ( .A(n426), .Y(lbp_data[7]) );
  BUFX12 U242 ( .A(n430), .Y(lbp_data[3]) );
  BUFX12 U243 ( .A(n432), .Y(lbp_data[1]) );
  BUFX12 U244 ( .A(n431), .Y(lbp_data[2]) );
  BUFX12 U245 ( .A(n429), .Y(lbp_data[4]) );
  BUFX12 U246 ( .A(n428), .Y(lbp_data[5]) );
  BUFX12 U247 ( .A(n427), .Y(lbp_data[6]) );
  OAI32X4 U248 ( .A0(n332), .A1(cnt7[1]), .A2(n383), .B0(n308), .B1(n331), .Y(
        n317) );
  BUFX12 U249 ( .A(n406), .Y(gray_addr[6]) );
  BUFX12 U250 ( .A(n407), .Y(gray_addr[5]) );
  BUFX12 U251 ( .A(n408), .Y(gray_addr[4]) );
  BUFX12 U252 ( .A(n409), .Y(gray_addr[3]) );
  BUFX12 U253 ( .A(n410), .Y(gray_addr[2]) );
  BUFX12 U254 ( .A(n411), .Y(gray_addr[1]) );
  BUFX12 U255 ( .A(n421), .Y(lbp_addr[4]) );
  BUFX12 U256 ( .A(n422), .Y(lbp_addr[3]) );
  BUFX12 U257 ( .A(n423), .Y(lbp_addr[2]) );
  BUFX12 U258 ( .A(n424), .Y(lbp_addr[1]) );
  INVX12 U259 ( .A(n109), .Y(lbp_addr[12]) );
  BUFX12 U260 ( .A(n425), .Y(lbp_addr[0]) );
  BUFX12 U261 ( .A(n413), .Y(lbp_addr[13]) );
  BUFX12 U262 ( .A(n414), .Y(lbp_addr[11]) );
  BUFX12 U263 ( .A(n415), .Y(lbp_addr[10]) );
  BUFX12 U264 ( .A(n416), .Y(lbp_addr[9]) );
  BUFX12 U265 ( .A(n417), .Y(lbp_addr[8]) );
  BUFX12 U266 ( .A(n418), .Y(lbp_addr[7]) );
  BUFX12 U267 ( .A(n419), .Y(lbp_addr[6]) );
  BUFX12 U268 ( .A(n420), .Y(lbp_addr[5]) );
  BUFX12 U269 ( .A(n412), .Y(gray_addr[0]) );
  BUFX12 U270 ( .A(N160), .Y(finish) );
  NOR3X1 U271 ( .A(n397), .B(n385), .C(n396), .Y(N160) );
  BUFX12 U272 ( .A(n433), .Y(lbp_data[0]) );
  OAI22X2 U273 ( .A0(n320), .A1(n383), .B0(cnt7[2]), .B1(n319), .Y(n329) );
  OAI21X2 U274 ( .A0(threshold[7]), .A1(n114), .B0(n371), .Y(N47) );
  NAND2X1 U275 ( .A(state[1]), .B(N93), .Y(n8) );
  INVX3 U276 ( .A(n345), .Y(n343) );
  CLKINVX1 U277 ( .A(n12), .Y(n344) );
  NAND2X2 U278 ( .A(n344), .B(n388), .Y(n26) );
  CLKBUFX3 U279 ( .A(n12), .Y(n345) );
  CLKBUFX3 U280 ( .A(n345), .Y(n346) );
  CLKBUFX3 U281 ( .A(n339), .Y(n342) );
  CLKBUFX3 U282 ( .A(n339), .Y(n341) );
  CLKBUFX3 U283 ( .A(n339), .Y(n340) );
  CLKINVX1 U284 ( .A(n308), .Y(n332) );
  OAI2BB2XL U285 ( .B0(n392), .B1(lbp_valid), .A0N(N90), .A1N(lbp_valid), .Y(
        n162) );
  OAI2BB2XL U286 ( .B0(n394), .B1(lbp_valid), .A0N(N85), .A1N(lbp_valid), .Y(
        n1600) );
  INVX3 U287 ( .A(n8), .Y(n384) );
  CLKINVX1 U288 ( .A(lbp_valid), .Y(n388) );
  OAI2BB2XL U289 ( .B0(n357), .B1(lbp_valid), .A0N(N89), .A1N(lbp_valid), .Y(
        n163) );
  OAI2BB2XL U290 ( .B0(n391), .B1(lbp_valid), .A0N(N88), .A1N(lbp_valid), .Y(
        n164) );
  OAI2BB2XL U291 ( .B0(n390), .B1(lbp_valid), .A0N(N87), .A1N(lbp_valid), .Y(
        n165) );
  OAI2BB2XL U292 ( .B0(n389), .B1(lbp_valid), .A0N(N86), .A1N(lbp_valid), .Y(
        n166) );
  CLKBUFX3 U293 ( .A(n17), .Y(n334) );
  NAND2X1 U294 ( .A(N93), .B(n396), .Y(n17) );
  CLKBUFX3 U295 ( .A(n28), .Y(n338) );
  NOR2X1 U296 ( .A(n388), .B(N225), .Y(n28) );
  CLKBUFX3 U297 ( .A(n500), .Y(n335) );
  NAND2X1 U298 ( .A(n334), .B(n8), .Y(n500) );
  INVX3 U299 ( .A(n336), .Y(n387) );
  INVX3 U300 ( .A(n337), .Y(n386) );
  CLKINVX1 U301 ( .A(n10), .Y(n381) );
  CLKBUFX3 U302 ( .A(n372), .Y(n339) );
  AND2XL U303 ( .A(N49), .B(N47), .Y(temp[0]) );
  OAI2BB2XL U304 ( .B0(n880), .B1(n26), .A0N(N66), .A1N(n346), .Y(n184) );
  AND2XL U305 ( .A(N56), .B(N47), .Y(temp[7]) );
  NOR2X1 U306 ( .A(n398), .B(n383), .Y(N56) );
  OAI2BB2XL U307 ( .B0(n870), .B1(n26), .A0N(N65), .A1N(n346), .Y(n185) );
  AND2XL U308 ( .A(N50), .B(N47), .Y(temp[1]) );
  AND2XL U309 ( .A(N51), .B(N47), .Y(temp[2]) );
  AND2XL U310 ( .A(N52), .B(N47), .Y(temp[3]) );
  NOR2X1 U311 ( .A(cnt7[2]), .B(n398), .Y(N52) );
  AND2XL U312 ( .A(N53), .B(N47), .Y(temp[4]) );
  AND2XL U313 ( .A(N54), .B(N47), .Y(temp[5]) );
  NOR3X1 U314 ( .A(n383), .B(cnt7[1]), .C(n382), .Y(N54) );
  AND2XL U315 ( .A(N55), .B(N47), .Y(temp[6]) );
  OAI2BB2XL U317 ( .B0(n860), .B1(n26), .A0N(N64), .A1N(n346), .Y(n186) );
  OAI2BB2XL U318 ( .B0(n850), .B1(n26), .A0N(N63), .A1N(n346), .Y(n187) );
  OAI2BB2XL U319 ( .B0(n84), .B1(n26), .A0N(N62), .A1N(n346), .Y(n188) );
  OAI2BB2XL U320 ( .B0(n83), .B1(n26), .A0N(N61), .A1N(n346), .Y(n189) );
  OAI2BB2XL U321 ( .B0(n82), .B1(n26), .A0N(N60), .A1N(n346), .Y(n190) );
  OAI2BB2XL U322 ( .B0(n81), .B1(n26), .A0N(N59), .A1N(n346), .Y(n191) );
  OAI22XL U323 ( .A0(n337), .A1(n1280), .B0(n386), .B1(n380), .Y(n1290) );
  OAI22XL U324 ( .A0(n337), .A1(n1270), .B0(n386), .B1(n373), .Y(n1300) );
  OAI22XL U325 ( .A0(n337), .A1(n1260), .B0(n386), .B1(n374), .Y(n1310) );
  OAI22XL U326 ( .A0(n337), .A1(n1250), .B0(n386), .B1(n375), .Y(n1320) );
  OAI22XL U327 ( .A0(n337), .A1(n1240), .B0(n386), .B1(n376), .Y(n1330) );
  OAI22XL U328 ( .A0(n337), .A1(n1230), .B0(n386), .B1(n377), .Y(n134) );
  OAI22XL U329 ( .A0(n337), .A1(n1220), .B0(n386), .B1(n378), .Y(n135) );
  OAI22XL U330 ( .A0(n337), .A1(n1210), .B0(n386), .B1(n379), .Y(n136) );
  OAI22XL U331 ( .A0(n336), .A1(n1200), .B0(n379), .B1(n387), .Y(n151) );
  OAI22XL U332 ( .A0(n336), .A1(n119), .B0(n378), .B1(n387), .Y(n152) );
  OAI22XL U333 ( .A0(n336), .A1(n118), .B0(n377), .B1(n387), .Y(n153) );
  OAI22XL U334 ( .A0(n336), .A1(n117), .B0(n376), .B1(n387), .Y(n154) );
  OAI22XL U335 ( .A0(n336), .A1(n116), .B0(n375), .B1(n387), .Y(n155) );
  OAI22XL U336 ( .A0(n336), .A1(n115), .B0(n374), .B1(n387), .Y(n156) );
  OAI22XL U337 ( .A0(n336), .A1(n114), .B0(n373), .B1(n387), .Y(n157) );
  OAI22XL U338 ( .A0(n336), .A1(n113), .B0(n380), .B1(n387), .Y(n1580) );
  CLKINVX1 U339 ( .A(gray_data[1]), .Y(n379) );
  CLKINVX1 U340 ( .A(gray_data[2]), .Y(n378) );
  CLKINVX1 U341 ( .A(gray_data[3]), .Y(n377) );
  CLKINVX1 U342 ( .A(gray_data[4]), .Y(n376) );
  CLKINVX1 U343 ( .A(gray_data[5]), .Y(n375) );
  CLKINVX1 U344 ( .A(gray_data[6]), .Y(n374) );
  CLKINVX1 U345 ( .A(gray_data[7]), .Y(n373) );
  CLKINVX1 U346 ( .A(gray_data[0]), .Y(n380) );
  OAI221XL U347 ( .A0(n73), .A1(n335), .B0(n393), .B1(n334), .C0(n58), .Y(n176) );
  NAND2X1 U348 ( .A(N126), .B(n384), .Y(n58) );
  OR2X1 U349 ( .A(addr2[1]), .B(addr2[0]), .Y(n352) );
  OR2X1 U350 ( .A(addr1[1]), .B(addr1[0]), .Y(n347) );
  OAI221XL U351 ( .A0(n67), .A1(n335), .B0(n394), .B1(n334), .C0(n510), .Y(
        n170) );
  NAND2X1 U352 ( .A(N120), .B(n384), .Y(n510) );
  OAI221XL U353 ( .A0(n74), .A1(n335), .B0(addr1_before[0]), .B1(n334), .C0(
        n590), .Y(n177) );
  NAND2X1 U354 ( .A(N127), .B(n384), .Y(n590) );
  OAI221XL U355 ( .A0(n70), .A1(n335), .B0(n391), .B1(n334), .C0(n550), .Y(
        n173) );
  NAND2X1 U356 ( .A(N123), .B(n384), .Y(n550) );
  OAI221XL U357 ( .A0(n68), .A1(n335), .B0(n389), .B1(n334), .C0(n530), .Y(
        n171) );
  NAND2X1 U358 ( .A(N121), .B(n384), .Y(n530) );
  OAI221XL U359 ( .A0(n69), .A1(n335), .B0(n390), .B1(n334), .C0(n540), .Y(
        n172) );
  NAND2X1 U360 ( .A(N122), .B(n384), .Y(n540) );
  OAI221XL U361 ( .A0(n71), .A1(n335), .B0(n357), .B1(n334), .C0(n560), .Y(
        n174) );
  NAND2X1 U362 ( .A(N124), .B(n384), .Y(n560) );
  OAI221XL U363 ( .A0(n72), .A1(n335), .B0(n392), .B1(n334), .C0(n57), .Y(n175) );
  NAND2X1 U364 ( .A(N125), .B(n384), .Y(n57) );
  OAI221XL U365 ( .A0(n80), .A1(n335), .B0(n105), .B1(n334), .C0(n650), .Y(
        n183) );
  NAND2X1 U366 ( .A(N133), .B(n384), .Y(n650) );
  OAI221XL U367 ( .A0(n79), .A1(n335), .B0(n108), .B1(n334), .C0(n640), .Y(
        n182) );
  NAND2X1 U368 ( .A(N132), .B(n384), .Y(n640) );
  OAI221XL U369 ( .A0(n75), .A1(n335), .B0(n97), .B1(n334), .C0(n600), .Y(n178) );
  NAND2X1 U370 ( .A(N128), .B(n384), .Y(n600) );
  OAI221XL U371 ( .A0(n76), .A1(n335), .B0(n99), .B1(n334), .C0(n610), .Y(n179) );
  NAND2X1 U372 ( .A(N129), .B(n384), .Y(n610) );
  OAI221XL U373 ( .A0(n77), .A1(n335), .B0(n101), .B1(n334), .C0(n620), .Y(
        n180) );
  NAND2X1 U374 ( .A(N130), .B(n384), .Y(n620) );
  OAI221XL U375 ( .A0(n78), .A1(n335), .B0(n103), .B1(n334), .C0(n630), .Y(
        n181) );
  NAND2X1 U376 ( .A(N131), .B(n384), .Y(n630) );
  NAND4X2 U377 ( .A(addr2[5]), .B(addr2[4]), .C(addr2[6]), .D(n660), .Y(N225)
         );
  NOR4X1 U378 ( .A(addr2[0]), .B(n389), .C(n390), .D(n391), .Y(n660) );
  OAI2BB2XL U379 ( .B0(n393), .B1(lbp_valid), .A0N(N91), .A1N(lbp_valid), .Y(
        n161) );
  BUFX16 U380 ( .A(N158), .Y(lbp_valid) );
  NOR3X1 U381 ( .A(n396), .B(state[0]), .C(n397), .Y(N158) );
  NOR3X1 U382 ( .A(n385), .B(state[1]), .C(n397), .Y(n12) );
  NOR2X1 U383 ( .A(n385), .B(state[2]), .Y(N93) );
  XNOR2X1 U384 ( .A(n331), .B(n46), .Y(n150) );
  NOR2X1 U385 ( .A(n382), .B(n343), .Y(n46) );
  OAI2BB2XL U386 ( .B0(addr1_before[0]), .B1(n338), .A0N(addr1_after[0]), 
        .A1N(n338), .Y(n197) );
  OAI2BB2XL U387 ( .B0(n108), .B1(n338), .A0N(addr1_after[5]), .A1N(n338), .Y(
        n192) );
  OAI2BB2XL U388 ( .B0(n103), .B1(n338), .A0N(addr1_after[4]), .A1N(n338), .Y(
        n193) );
  OAI2BB2XL U389 ( .B0(n101), .B1(n338), .A0N(addr1_after[3]), .A1N(n338), .Y(
        n194) );
  OAI2BB2XL U390 ( .B0(n99), .B1(n338), .A0N(addr1_after[2]), .A1N(n338), .Y(
        n195) );
  OAI2BB2XL U391 ( .B0(n97), .B1(n338), .A0N(addr1_after[1]), .A1N(n338), .Y(
        n196) );
  OAI2BB2XL U392 ( .B0(n105), .B1(n338), .A0N(addr1_after[6]), .A1N(n338), .Y(
        n198) );
  XNOR2X1 U393 ( .A(n383), .B(n490), .Y(n167) );
  NOR2X1 U394 ( .A(n381), .B(n343), .Y(n490) );
  NOR4X1 U395 ( .A(n890), .B(n900), .C(n910), .D(n92), .Y(n22) );
  XNOR2X1 U396 ( .A(n345), .B(n382), .Y(n169) );
  OAI22XL U397 ( .A0(n343), .A1(n357), .B0(n92), .B1(n12), .Y(n140) );
  OAI22XL U398 ( .A0(n343), .A1(n389), .B0(n890), .B1(n346), .Y(n137) );
  OAI22XL U399 ( .A0(n343), .A1(n390), .B0(n900), .B1(n345), .Y(n138) );
  OAI22XL U400 ( .A0(n343), .A1(n391), .B0(n910), .B1(n345), .Y(n139) );
  OAI22XL U401 ( .A0(n99), .A1(n343), .B0(n100), .B1(n345), .Y(n145) );
  OAI22XL U402 ( .A0(n101), .A1(n344), .B0(n102), .B1(n345), .Y(n146) );
  OAI22XL U403 ( .A0(n103), .A1(n344), .B0(n104), .B1(n345), .Y(n147) );
  OAI22XL U404 ( .A0(n105), .A1(n344), .B0(n106), .B1(n345), .Y(n148) );
  OAI22XL U405 ( .A0(n97), .A1(n343), .B0(n98), .B1(n345), .Y(n144) );
  OAI22XL U406 ( .A0(n343), .A1(n392), .B0(n930), .B1(n345), .Y(n141) );
  OAI22XL U407 ( .A0(n343), .A1(n393), .B0(n94), .B1(n345), .Y(n142) );
  OAI22XL U408 ( .A0(n108), .A1(n344), .B0(n109), .B1(n345), .Y(n159) );
  OAI22XL U409 ( .A0(n343), .A1(n394), .B0(n107), .B1(n345), .Y(n149) );
  OAI22XL U410 ( .A0(addr1_before[0]), .A1(n343), .B0(n96), .B1(n345), .Y(n143) );
  NOR2X1 U411 ( .A(n331), .B(n382), .Y(n10) );
  AND4X1 U412 ( .A(n19), .B(n20), .C(n21), .D(n22), .Y(n14) );
  NOR3X1 U413 ( .A(n98), .B(n930), .C(n94), .Y(n21) );
  AND3X2 U414 ( .A(lbp_addr[12]), .B(n96), .C(n107), .Y(n19) );
  NOR4X1 U415 ( .A(n100), .B(n102), .C(n104), .D(n106), .Y(n20) );
  OAI21XL U416 ( .A0(n24), .A1(n343), .B0(state[0]), .Y(next_state[0]) );
  NOR2X1 U417 ( .A(n383), .B(n381), .Y(n24) );
  NAND4X1 U418 ( .A(n15), .B(n386), .C(n334), .D(n343), .Y(next_state[1]) );
  NAND3X1 U419 ( .A(state[1]), .B(n385), .C(n14), .Y(n15) );
  NAND3X1 U420 ( .A(n387), .B(n8), .C(n9), .Y(next_state[2]) );
  AOI33X1 U421 ( .A0(n10), .A1(cnt7[2]), .A2(n12), .B0(state[2]), .B1(n385), 
        .B2(n14), .Y(n9) );
  CLKBUFX3 U422 ( .A(n470), .Y(n336) );
  NOR3X1 U423 ( .A(state[0]), .B(state[1]), .C(n397), .Y(n470) );
  CLKBUFX3 U424 ( .A(n29), .Y(n337) );
  NOR3X1 U425 ( .A(state[0]), .B(state[2]), .C(n396), .Y(n29) );
  AOI222XL U427 ( .A0(addr2_after[0]), .A1(n317), .B0(addr2[0]), .B1(n316), 
        .C0(n394), .C1(n315), .Y(n309) );
  CLKINVX1 U428 ( .A(n309), .Y(N120) );
  AOI222XL U429 ( .A0(addr2_after[1]), .A1(n317), .B0(addr2[1]), .B1(n316), 
        .C0(addr2_before[1]), .C1(n315), .Y(n310) );
  CLKINVX1 U430 ( .A(n310), .Y(N121) );
  AOI222XL U431 ( .A0(addr2_after[2]), .A1(n317), .B0(addr2[2]), .B1(n316), 
        .C0(addr2_before[2]), .C1(n315), .Y(n311) );
  CLKINVX1 U432 ( .A(n311), .Y(N122) );
  AOI222XL U433 ( .A0(addr2_after[3]), .A1(n317), .B0(addr2[3]), .B1(n316), 
        .C0(addr2_before[3]), .C1(n315), .Y(n312) );
  CLKINVX1 U434 ( .A(n312), .Y(N123) );
  AOI222XL U435 ( .A0(addr2_after[4]), .A1(n317), .B0(addr2[4]), .B1(n316), 
        .C0(addr2_before[4]), .C1(n315), .Y(n313) );
  CLKINVX1 U436 ( .A(n313), .Y(N124) );
  AOI222XL U437 ( .A0(addr2_after[5]), .A1(n317), .B0(addr2[5]), .B1(n316), 
        .C0(addr2_before[5]), .C1(n315), .Y(n314) );
  CLKINVX1 U438 ( .A(n314), .Y(N125) );
  AOI222XL U439 ( .A0(addr2_after[6]), .A1(n317), .B0(addr2[6]), .B1(n316), 
        .C0(addr2_before[6]), .C1(n315), .Y(n318) );
  CLKINVX1 U440 ( .A(n318), .Y(N126) );
  NAND2X1 U442 ( .A(cnt7[1]), .B(cnt7[0]), .Y(n319) );
  AOI222XL U443 ( .A0(addr1[0]), .A1(n329), .B0(addr1_before[0]), .B1(n328), 
        .C0(addr1_after[0]), .C1(n327), .Y(n321) );
  CLKINVX1 U444 ( .A(n321), .Y(N127) );
  AOI222XL U445 ( .A0(addr1[1]), .A1(n329), .B0(addr1_before[1]), .B1(n328), 
        .C0(addr1_after[1]), .C1(n327), .Y(n322) );
  CLKINVX1 U446 ( .A(n322), .Y(N128) );
  AOI222XL U447 ( .A0(addr1[2]), .A1(n329), .B0(addr1_before[2]), .B1(n328), 
        .C0(addr1_after[2]), .C1(n327), .Y(n323) );
  CLKINVX1 U448 ( .A(n323), .Y(N129) );
  AOI222XL U449 ( .A0(addr1[3]), .A1(n329), .B0(addr1_before[3]), .B1(n328), 
        .C0(addr1_after[3]), .C1(n327), .Y(n324) );
  CLKINVX1 U450 ( .A(n324), .Y(N130) );
  AOI222XL U451 ( .A0(addr1[4]), .A1(n329), .B0(addr1_before[4]), .B1(n328), 
        .C0(addr1_after[4]), .C1(n327), .Y(n325) );
  CLKINVX1 U452 ( .A(n325), .Y(N131) );
  AOI222XL U453 ( .A0(addr1[5]), .A1(n329), .B0(addr1_before[5]), .B1(n328), 
        .C0(addr1_after[5]), .C1(n327), .Y(n326) );
  CLKINVX1 U454 ( .A(n326), .Y(N132) );
  AOI222XL U455 ( .A0(addr1[6]), .A1(n329), .B0(addr1_before[6]), .B1(n328), 
        .C0(addr1_after[6]), .C1(n327), .Y(n330) );
  CLKINVX1 U456 ( .A(n330), .Y(N133) );
  AND2X1 U457 ( .A(addr2[0]), .B(N225), .Y(N230) );
  AND2X1 U458 ( .A(addr2[1]), .B(N225), .Y(N231) );
  AND2X1 U459 ( .A(addr2[2]), .B(N225), .Y(N232) );
  AND2X1 U460 ( .A(addr2[3]), .B(N225), .Y(N233) );
  AND2X1 U461 ( .A(addr2[4]), .B(N225), .Y(N234) );
  AND2X1 U462 ( .A(addr2[5]), .B(N225), .Y(N235) );
  AND2X1 U463 ( .A(N225), .B(addr2[6]), .Y(N236) );
  OAI2BB1X1 U464 ( .A0N(addr1[0]), .A1N(addr1[1]), .B0(n347), .Y(
        addr1_before[1]) );
  OR2X1 U465 ( .A(n347), .B(addr1[2]), .Y(n348) );
  OAI2BB1X1 U466 ( .A0N(n347), .A1N(addr1[2]), .B0(n348), .Y(addr1_before[2])
         );
  NOR2X1 U467 ( .A(n348), .B(addr1[3]), .Y(n349) );
  AO21X1 U468 ( .A0(n348), .A1(addr1[3]), .B0(n349), .Y(addr1_before[3]) );
  NAND2X1 U469 ( .A(n349), .B(n103), .Y(n350) );
  OAI21XL U470 ( .A0(n349), .A1(n103), .B0(n350), .Y(addr1_before[4]) );
  XNOR2X1 U471 ( .A(addr1[5]), .B(n350), .Y(addr1_before[5]) );
  NOR2X1 U472 ( .A(addr1[5]), .B(n350), .Y(n351) );
  XOR2X1 U473 ( .A(addr1[6]), .B(n351), .Y(addr1_before[6]) );
  OAI2BB1X1 U474 ( .A0N(addr2[0]), .A1N(addr2[1]), .B0(n352), .Y(
        addr2_before[1]) );
  OR2X1 U475 ( .A(n352), .B(addr2[2]), .Y(n353) );
  OAI2BB1X1 U476 ( .A0N(n352), .A1N(addr2[2]), .B0(n353), .Y(addr2_before[2])
         );
  NOR2X1 U477 ( .A(n353), .B(addr2[3]), .Y(n354) );
  AO21X1 U478 ( .A0(n353), .A1(addr2[3]), .B0(n354), .Y(addr2_before[3]) );
  NAND2X1 U479 ( .A(n354), .B(n357), .Y(n355) );
  OAI21XL U480 ( .A0(n354), .A1(n357), .B0(n355), .Y(addr2_before[4]) );
  XNOR2X1 U481 ( .A(addr2[5]), .B(n355), .Y(addr2_before[5]) );
  NOR2X1 U482 ( .A(addr2[5]), .B(n355), .Y(n356) );
  XOR2X1 U483 ( .A(addr2[6]), .B(n356), .Y(addr2_before[6]) );
  NAND2BX1 U484 ( .AN(threshold[4]), .B(outside_data[4]), .Y(n358) );
  OAI222XL U485 ( .A0(threshold[5]), .A1(n116), .B0(threshold[5]), .B1(n358), 
        .C0(n116), .C1(n358), .Y(n359) );
  OAI222XL U486 ( .A0(outside_data[6]), .A1(n359), .B0(n1260), .B1(n359), .C0(
        outside_data[6]), .C1(n1260), .Y(n370) );
  NOR2BX1 U487 ( .AN(threshold[4]), .B(outside_data[4]), .Y(n360) );
  OAI22XL U488 ( .A0(n360), .A1(n116), .B0(threshold[5]), .B1(n360), .Y(n368)
         );
  NAND2BX1 U489 ( .AN(threshold[2]), .B(outside_data[2]), .Y(n366) );
  OAI2BB2XL U490 ( .B0(outside_data[0]), .B1(n1280), .A0N(n1200), .A1N(
        threshold[1]), .Y(n361) );
  OAI21XL U491 ( .A0(threshold[1]), .A1(n1200), .B0(n361), .Y(n364) );
  NOR2BX1 U492 ( .AN(threshold[2]), .B(outside_data[2]), .Y(n362) );
  OAI22XL U493 ( .A0(n362), .A1(n118), .B0(threshold[3]), .B1(n362), .Y(n363)
         );
  AOI2BB2X1 U494 ( .B0(n364), .B1(n363), .A0N(n366), .A1N(n118), .Y(n365) );
  OAI221XL U495 ( .A0(threshold[3]), .A1(n366), .B0(threshold[3]), .B1(n118), 
        .C0(n365), .Y(n367) );
  OAI211X1 U496 ( .A0(outside_data[6]), .A1(n1260), .B0(n368), .C0(n367), .Y(
        n369) );
  AO22X1 U497 ( .A0(n114), .A1(threshold[7]), .B0(n370), .B1(n369), .Y(n371)
         );
  LBP_DW01_add_0 add_108_S2 ( .A({n426, n427, n428, n429, n430, n431, n432, 
        n433}), .B(temp), .SUM({N66, N65, N64, N63, N62, N61, N60, N59}) );
  LBP_DW01_inc_0_DW01_inc_1 add_82 ( .A(addr2), .SUM(addr2_after) );
  LBP_DW01_inc_1_DW01_inc_2 r386 ( .A(addr1), .SUM(addr1_after) );
  LBP_DW01_inc_2_DW01_inc_3 add_125_aco ( .A({N236, N235, N234, N233, N232, 
        N231, N230}), .SUM({N91, N90, N89, N88, N87, N86, N85}) );
  DFFSX1 addr2_reg_0_ ( .D(n1600), .CK(clk), .SN(n372), .Q(addr2[0]), .QN(n394) );
  DFFRX1 gray_req_reg ( .D(N93), .CK(clk), .RN(n372), .Q(n436) );
  DFFRX2 cnt7_reg_2_ ( .D(n167), .CK(clk), .RN(n372), .Q(cnt7[2]), .QN(n383)
         );
  DFFRX2 cnt7_reg_1_ ( .D(n150), .CK(clk), .RN(n372), .Q(cnt7[1]), .QN(n331)
         );
  DFFRX2 cnt7_reg_0_ ( .D(n169), .CK(clk), .RN(n372), .Q(cnt7[0]), .QN(n382)
         );
  XOR2X1 U222 ( .A(cnt7[0]), .B(cnt7[2]), .Y(n308) );
  NOR3XL U228 ( .A(n383), .B(cnt7[0]), .C(n331), .Y(N55) );
  NAND2BXL U316 ( .AN(cnt7[0]), .B(n331), .Y(n320) );
  XOR2XL U426 ( .A(n331), .B(cnt7[2]), .Y(n307) );
  INVXL U441 ( .A(n436), .Y(n434) );
  INVX12 U498 ( .A(n434), .Y(gray_req) );
endmodule

