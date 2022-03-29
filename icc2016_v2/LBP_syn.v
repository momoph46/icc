/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Tue Mar 29 17:17:46 2022
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
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  XOR2X1 U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
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
  wire   n335, n336, n337, n338, n339, n340, n341, n342, n343, n344, n345,
         n346, n347, n348, n349, n350, n351, n352, n353, n354, n355, n356,
         n357, n358, n359, n360, n361, n362, n363, n364, n365, n366, n367,
         n368, n369, n370, n371, N44, N47, N48, N49, N50, N51, N52, N53, N54,
         N55, N56, N57, N61, N62, N63, N64, N65, N66, N67, N68, N87, N88, N89,
         N90, N91, N92, N93, N169, N239, n13, n14, n15, n16, n17, n18, n21,
         n24, n27, n36, n37, n41, n42, n43, n440, n45, n470, n490, n510, n530,
         n550, n570, n59, n60, n610, n620, n630, n640, n650, n660, n670, n680,
         n70, n71, n72, n73, n74, n76, n77, n79, n81, n82, n83, n86, n870,
         n890, n900, n910, n920, n930, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, n147, n148, n149, n150, n151, n152, n153, n154, n155, n156,
         n157, n158, n159, n160, n161, n162, n163, n164, n165, n166, n167,
         n168, n1690, n170, n171, n173, n174, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         sll_117_SH_0_, N249, N248, N247, N246, N245, N244, N243, n225, n264,
         n265, n266, n267, n268, n269, n270, n271, n272, n273, n274, n275,
         n276, n277, n278, n279, n280, n281, n282, n283, n284, n285, n286,
         n287, n288, n289, n290, n291, n292, n293, n294, n295, n296, n297,
         n298, n299, n300, n301, n302, n303, n304, n305, n306, n307, n308,
         n309, n310, n311, n312, n313, n314, n315, n316, n317, n318, n319,
         n320, n321, n322, n323, n324, n325, n326, n327, n328, n329, n330,
         n331, n332, n333, n334;
  wire   [1:0] state;
  wire   [1:0] next_state;
  wire   [6:0] addr1;
  wire   [6:0] addr2;
  wire   [6:0] addr1_after;
  wire   [6:0] addr1_before;
  wire   [6:0] addr2_after;
  wire   [6:1] addr2_before;
  wire   [7:1] threshold;
  wire   [6:0] outside_data;
  wire   [7:0] temp;

  OAI211X2 U114 ( .A0(n71), .A1(n72), .B0(n73), .C0(n74), .Y(n610) );
  OAI221X2 U116 ( .A0(n76), .A1(n71), .B0(n316), .B1(n319), .C0(n77), .Y(n60)
         );
  DFFRX1 addr1_reg_6_ ( .D(n222), .CK(clk), .RN(n273), .Q(addr1[6]), .QN(n139)
         );
  DFFRX1 addr1_reg_5_ ( .D(n216), .CK(clk), .RN(n274), .Q(addr1[5]), .QN(n127)
         );
  DFFRX1 addr1_reg_4_ ( .D(n217), .CK(clk), .RN(n276), .Q(addr1[4]), .QN(n129)
         );
  DFFRX1 addr1_reg_3_ ( .D(n218), .CK(clk), .RN(n275), .Q(addr1[3]), .QN(n131)
         );
  DFFSX1 addr2_reg_0_ ( .D(n170), .CK(clk), .SN(n276), .Q(addr2[0]), .QN(n225)
         );
  DFFRX1 addr1_reg_1_ ( .D(n220), .CK(clk), .RN(n273), .Q(addr1[1]), .QN(n135)
         );
  DFFRX1 addr1_reg_2_ ( .D(n219), .CK(clk), .RN(n274), .Q(addr1[2]), .QN(n133)
         );
  DFFRX1 threshold_reg_6_ ( .D(n193), .CK(clk), .RN(n274), .QN(n109) );
  DFFRX1 outside_data_reg_6_ ( .D(n189), .CK(clk), .RN(n274), .Q(
        outside_data[6]), .QN(n113) );
  DFFRX1 outside_data_reg_0_ ( .D(n191), .CK(clk), .RN(n274), .Q(
        outside_data[0]), .QN(n111) );
  DFFRX1 outside_data_reg_1_ ( .D(n184), .CK(clk), .RN(n276), .QN(n118) );
  DFFRX1 outside_data_reg_3_ ( .D(n186), .CK(clk), .RN(n273), .QN(n116) );
  DFFRX1 outside_data_reg_5_ ( .D(n188), .CK(clk), .RN(n274), .QN(n114) );
  DFFRX1 outside_data_reg_7_ ( .D(n190), .CK(clk), .RN(n274), .QN(n112) );
  DFFRX1 threshold_reg_0_ ( .D(n199), .CK(clk), .RN(n275), .QN(n103) );
  DFFRX1 threshold_reg_7_ ( .D(n192), .CK(clk), .RN(n274), .Q(threshold[7]), 
        .QN(n110) );
  DFFRX1 outside_data_reg_2_ ( .D(n185), .CK(clk), .RN(n273), .Q(
        outside_data[2]), .QN(n117) );
  DFFRX1 threshold_reg_3_ ( .D(n196), .CK(clk), .RN(n274), .Q(threshold[3]), 
        .QN(n106) );
  DFFRX1 threshold_reg_5_ ( .D(n194), .CK(clk), .RN(n274), .Q(threshold[5]), 
        .QN(n108) );
  DFFRX1 threshold_reg_4_ ( .D(n195), .CK(clk), .RN(n274), .Q(threshold[4]), 
        .QN(n107) );
  DFFRX1 threshold_reg_2_ ( .D(n197), .CK(clk), .RN(n274), .Q(threshold[2]), 
        .QN(n105) );
  DFFRX1 threshold_reg_1_ ( .D(n198), .CK(clk), .RN(n274), .Q(threshold[1]), 
        .QN(n104) );
  DFFRX1 outside_data_reg_4_ ( .D(n187), .CK(clk), .RN(n274), .Q(
        outside_data[4]), .QN(n115) );
  DFFRX1 totallbp_reg_0_ ( .D(n183), .CK(clk), .RN(n276), .Q(n371), .QN(n119)
         );
  DFFSX1 gray_addr_reg_0_ ( .D(n213), .CK(clk), .SN(n276), .Q(n348), .QN(n890)
         );
  DFFSX1 gray_addr_reg_7_ ( .D(n206), .CK(clk), .SN(n276), .Q(n341), .QN(n96)
         );
  DFFRX1 gray_addr_reg_6_ ( .D(n207), .CK(clk), .RN(n275), .Q(n342), .QN(n95)
         );
  DFFRX1 gray_addr_reg_12_ ( .D(n201), .CK(clk), .RN(n275), .Q(n336), .QN(n101) );
  DFFRX1 gray_addr_reg_13_ ( .D(n200), .CK(clk), .RN(n275), .Q(n335), .QN(n102) );
  DFFRX1 gray_addr_reg_4_ ( .D(n209), .CK(clk), .RN(n275), .Q(n344), .QN(n930)
         );
  DFFRX1 lbp_addr_reg_12_ ( .D(n150), .CK(clk), .RN(n273), .Q(n351), .QN(n128)
         );
  DFFRX1 lbp_addr_reg_11_ ( .D(n151), .CK(clk), .RN(n273), .Q(n352), .QN(n130)
         );
  DFFRX1 lbp_addr_reg_10_ ( .D(n152), .CK(clk), .RN(n273), .Q(n353), .QN(n132)
         );
  DFFRX1 lbp_addr_reg_9_ ( .D(n153), .CK(clk), .RN(n273), .Q(n354), .QN(n134)
         );
  DFFRX1 lbp_addr_reg_8_ ( .D(n154), .CK(clk), .RN(n273), .Q(n355), .QN(n136)
         );
  DFFRX1 lbp_addr_reg_7_ ( .D(n155), .CK(clk), .RN(n273), .Q(n356), .QN(n138)
         );
  DFFRX1 lbp_addr_reg_13_ ( .D(n156), .CK(clk), .RN(n273), .Q(n350), .QN(n140)
         );
  DFFRX1 lbp_addr_reg_1_ ( .D(n157), .CK(clk), .RN(n273), .Q(n362), .QN(n141)
         );
  DFFRX1 lbp_addr_reg_2_ ( .D(n159), .CK(clk), .RN(n273), .Q(n361), .QN(n142)
         );
  DFFRX1 lbp_addr_reg_0_ ( .D(n1690), .CK(clk), .RN(n302), .Q(n363), .QN(n148)
         );
  DFFRX1 lbp_addr_reg_3_ ( .D(n161), .CK(clk), .RN(n273), .Q(n360), .QN(n143)
         );
  DFFRX1 lbp_addr_reg_4_ ( .D(n163), .CK(clk), .RN(n273), .Q(n359), .QN(n144)
         );
  DFFRX1 lbp_addr_reg_5_ ( .D(n165), .CK(clk), .RN(n302), .Q(n358), .QN(n145)
         );
  DFFRX1 lbp_addr_reg_6_ ( .D(n167), .CK(clk), .RN(n302), .Q(n357), .QN(n146)
         );
  DFFRX1 gray_addr_reg_8_ ( .D(n205), .CK(clk), .RN(n275), .Q(n340), .QN(n97)
         );
  DFFRX1 gray_addr_reg_9_ ( .D(n204), .CK(clk), .RN(n275), .Q(n339), .QN(n98)
         );
  DFFRX1 gray_addr_reg_10_ ( .D(n203), .CK(clk), .RN(n275), .Q(n338), .QN(n99)
         );
  DFFRX1 gray_addr_reg_5_ ( .D(n208), .CK(clk), .RN(n275), .Q(n343), .QN(n94)
         );
  DFFRX1 gray_addr_reg_11_ ( .D(n202), .CK(clk), .RN(n275), .Q(n337), .QN(n100) );
  DFFRX1 gray_addr_reg_1_ ( .D(n212), .CK(clk), .RN(n276), .Q(n347), .QN(n900)
         );
  DFFRX1 gray_addr_reg_2_ ( .D(n211), .CK(clk), .RN(n275), .Q(n346), .QN(n910)
         );
  DFFRX1 gray_addr_reg_3_ ( .D(n210), .CK(clk), .RN(n275), .Q(n345), .QN(n920)
         );
  DFFRX1 gray_req_reg ( .D(n171), .CK(clk), .RN(n302), .Q(n349), .QN(n149) );
  DFFRX1 totallbp_reg_6_ ( .D(n177), .CK(clk), .RN(n276), .Q(n365), .QN(n125)
         );
  DFFRX1 totallbp_reg_5_ ( .D(n178), .CK(clk), .RN(n276), .Q(n366), .QN(n124)
         );
  DFFRX1 totallbp_reg_4_ ( .D(n179), .CK(clk), .RN(n276), .Q(n367), .QN(n123)
         );
  DFFRX1 totallbp_reg_3_ ( .D(n180), .CK(clk), .RN(n276), .Q(n368), .QN(n122)
         );
  DFFRX1 totallbp_reg_2_ ( .D(n181), .CK(clk), .RN(n276), .Q(n369), .QN(n121)
         );
  DFFRX1 totallbp_reg_1_ ( .D(n182), .CK(clk), .RN(n276), .Q(n370), .QN(n120)
         );
  DFFRX1 totallbp_reg_7_ ( .D(n176), .CK(clk), .RN(n276), .Q(n364), .QN(n126)
         );
  DFFRX1 cnt_reg_1_ ( .D(n214), .CK(clk), .RN(n302), .Q(n328), .QN(n174) );
  DFFRX1 cnt_reg_3_ ( .D(n223), .CK(clk), .RN(n302), .Q(n320), .QN(n147) );
  DFFRX1 cnt_reg_2_ ( .D(n215), .CK(clk), .RN(n302), .Q(n318), .QN(n173) );
  DFFRXL state_reg_1_ ( .D(next_state[1]), .CK(clk), .RN(n302), .Q(state[1]), 
        .QN(n322) );
  DFFRXL state_reg_0_ ( .D(next_state[0]), .CK(clk), .RN(n302), .Q(state[0]), 
        .QN(n324) );
  DFFRX1 addr2_reg_4_ ( .D(n164), .CK(clk), .RN(n302), .Q(addr2[4]), .QN(n287)
         );
  DFFSX1 addr1_reg_0_ ( .D(n221), .CK(clk), .SN(n302), .Q(addr1[0]), .QN(
        addr1_before[0]) );
  DFFRX1 addr2_reg_3_ ( .D(n162), .CK(clk), .RN(n302), .Q(addr2[3]), .QN(n325)
         );
  DFFRX1 addr2_reg_2_ ( .D(n160), .CK(clk), .RN(n302), .Q(addr2[2]), .QN(n326)
         );
  DFFRX1 addr2_reg_1_ ( .D(n158), .CK(clk), .RN(n302), .Q(addr2[1]), .QN(n327)
         );
  INVX3 U170 ( .A(reset), .Y(n302) );
  BUFX12 U171 ( .A(n364), .Y(lbp_data[7]) );
  BUFX12 U172 ( .A(n370), .Y(lbp_data[1]) );
  BUFX12 U173 ( .A(n369), .Y(lbp_data[2]) );
  BUFX12 U174 ( .A(n368), .Y(lbp_data[3]) );
  BUFX12 U175 ( .A(n367), .Y(lbp_data[4]) );
  BUFX12 U176 ( .A(n366), .Y(lbp_data[5]) );
  BUFX12 U177 ( .A(n365), .Y(lbp_data[6]) );
  INVX12 U178 ( .A(n21), .Y(lbp_valid) );
  BUFX12 U179 ( .A(n349), .Y(gray_req) );
  BUFX12 U180 ( .A(n345), .Y(gray_addr[3]) );
  BUFX12 U181 ( .A(n346), .Y(gray_addr[2]) );
  BUFX12 U182 ( .A(n347), .Y(gray_addr[1]) );
  BUFX12 U183 ( .A(n337), .Y(gray_addr[11]) );
  BUFX12 U184 ( .A(n343), .Y(gray_addr[5]) );
  BUFX12 U185 ( .A(n338), .Y(gray_addr[10]) );
  BUFX12 U186 ( .A(n339), .Y(gray_addr[9]) );
  BUFX12 U187 ( .A(n340), .Y(gray_addr[8]) );
  BUFX12 U188 ( .A(n357), .Y(lbp_addr[6]) );
  BUFX12 U189 ( .A(n358), .Y(lbp_addr[5]) );
  BUFX12 U190 ( .A(n359), .Y(lbp_addr[4]) );
  BUFX12 U191 ( .A(n360), .Y(lbp_addr[3]) );
  BUFX12 U192 ( .A(n363), .Y(lbp_addr[0]) );
  BUFX12 U193 ( .A(n361), .Y(lbp_addr[2]) );
  BUFX12 U194 ( .A(n362), .Y(lbp_addr[1]) );
  BUFX12 U195 ( .A(n350), .Y(lbp_addr[13]) );
  BUFX12 U196 ( .A(n356), .Y(lbp_addr[7]) );
  BUFX12 U197 ( .A(n355), .Y(lbp_addr[8]) );
  BUFX12 U198 ( .A(n354), .Y(lbp_addr[9]) );
  BUFX12 U199 ( .A(n353), .Y(lbp_addr[10]) );
  BUFX12 U200 ( .A(n352), .Y(lbp_addr[11]) );
  BUFX12 U201 ( .A(n351), .Y(lbp_addr[12]) );
  BUFX12 U202 ( .A(n344), .Y(gray_addr[4]) );
  BUFX12 U203 ( .A(n335), .Y(gray_addr[13]) );
  BUFX12 U204 ( .A(n336), .Y(gray_addr[12]) );
  BUFX12 U205 ( .A(n342), .Y(gray_addr[6]) );
  OR2X1 U206 ( .A(n322), .B(n324), .Y(N169) );
  INVX12 U207 ( .A(N169), .Y(finish) );
  BUFX12 U208 ( .A(n341), .Y(gray_addr[7]) );
  BUFX12 U209 ( .A(n348), .Y(gray_addr[0]) );
  BUFX12 U210 ( .A(n371), .Y(lbp_data[0]) );
  OAI21X2 U211 ( .A0(threshold[7]), .A1(n112), .B0(n301), .Y(N44) );
  OAI21XL U212 ( .A0(n315), .A1(n71), .B0(n86), .Y(N49) );
  NAND2X1 U213 ( .A(n147), .B(n173), .Y(n71) );
  NAND2X2 U214 ( .A(state[1]), .B(n324), .Y(n21) );
  CLKBUFX3 U215 ( .A(n312), .Y(n272) );
  CLKINVX1 U216 ( .A(n269), .Y(n312) );
  CLKINVX1 U217 ( .A(n72), .Y(n315) );
  NOR2X1 U218 ( .A(n315), .B(n313), .Y(n79) );
  NAND2X1 U219 ( .A(n315), .B(n317), .Y(n77) );
  CLKBUFX3 U220 ( .A(n42), .Y(n269) );
  OAI31XL U221 ( .A0(n43), .A1(n440), .A2(n45), .B0(n321), .Y(n42) );
  INVX3 U222 ( .A(n267), .Y(n319) );
  CLKBUFX3 U223 ( .A(n273), .Y(n276) );
  CLKBUFX3 U224 ( .A(n273), .Y(n275) );
  CLKBUFX3 U225 ( .A(n273), .Y(n274) );
  AND2XL U226 ( .A(N50), .B(N44), .Y(temp[0]) );
  NOR2X1 U227 ( .A(n330), .B(n329), .Y(N50) );
  NAND2X1 U228 ( .A(n328), .B(n316), .Y(n72) );
  OR2X1 U229 ( .A(N48), .B(N49), .Y(n329) );
  NAND2BX1 U230 ( .AN(N49), .B(N48), .Y(n334) );
  OAI21XL U231 ( .A0(n315), .A1(n318), .B0(n320), .Y(n86) );
  NAND2X1 U232 ( .A(N47), .B(n316), .Y(n332) );
  NAND2X1 U233 ( .A(n316), .B(n314), .Y(n330) );
  CLKINVX1 U234 ( .A(N47), .Y(n314) );
  OAI22X2 U235 ( .A0(n316), .A1(n319), .B0(n328), .B1(n70), .Y(n45) );
  OAI21X2 U236 ( .A0(n79), .A1(n71), .B0(n268), .Y(n43) );
  OAI21X2 U237 ( .A0(n79), .A1(n70), .B0(n74), .Y(n440) );
  OAI21X2 U238 ( .A0(n316), .A1(n70), .B0(n268), .Y(n620) );
  NAND2X2 U239 ( .A(n268), .B(n270), .Y(n37) );
  CLKINVX1 U240 ( .A(n76), .Y(n313) );
  CLKINVX1 U241 ( .A(n70), .Y(n317) );
  CLKBUFX3 U242 ( .A(n81), .Y(n266) );
  NOR2X1 U243 ( .A(n21), .B(N239), .Y(n81) );
  CLKBUFX3 U244 ( .A(n27), .Y(n267) );
  NOR2X1 U245 ( .A(n328), .B(n71), .Y(n27) );
  CLKBUFX3 U246 ( .A(n36), .Y(n268) );
  NAND2X1 U247 ( .A(n267), .B(n316), .Y(n36) );
  AO22X1 U248 ( .A0(N87), .A1(n323), .B0(n271), .B1(n21), .Y(n170) );
  INVX3 U249 ( .A(n21), .Y(n323) );
  INVX3 U250 ( .A(n270), .Y(n311) );
  CLKBUFX3 U251 ( .A(n24), .Y(n265) );
  NAND2X1 U252 ( .A(n264), .B(n21), .Y(n24) );
  INVX3 U253 ( .A(n264), .Y(n321) );
  CLKBUFX3 U254 ( .A(n302), .Y(n273) );
  OAI2BB2XL U255 ( .B0(n126), .B1(n265), .A0N(N68), .A1N(n321), .Y(n176) );
  AND2XL U256 ( .A(N57), .B(N44), .Y(temp[7]) );
  NOR2X1 U257 ( .A(n334), .B(n333), .Y(N57) );
  OAI2BB2XL U258 ( .B0(n125), .B1(n265), .A0N(N67), .A1N(n321), .Y(n177) );
  AND2XL U259 ( .A(N51), .B(N44), .Y(temp[1]) );
  NOR2X1 U260 ( .A(n331), .B(n329), .Y(N51) );
  AND2XL U261 ( .A(N52), .B(N44), .Y(temp[2]) );
  NOR2X1 U262 ( .A(n332), .B(n329), .Y(N52) );
  AND2XL U263 ( .A(N53), .B(N44), .Y(temp[3]) );
  NOR2X1 U264 ( .A(n333), .B(n329), .Y(N53) );
  AND2XL U265 ( .A(N54), .B(N44), .Y(temp[4]) );
  NOR2X1 U266 ( .A(n334), .B(n330), .Y(N54) );
  AND2XL U267 ( .A(N55), .B(N44), .Y(temp[5]) );
  NOR2X1 U268 ( .A(n334), .B(n331), .Y(N55) );
  AND2XL U269 ( .A(N56), .B(N44), .Y(temp[6]) );
  NOR2X1 U270 ( .A(n334), .B(n332), .Y(N56) );
  OAI2BB2XL U271 ( .B0(n124), .B1(n265), .A0N(N66), .A1N(n321), .Y(n178) );
  OAI2BB2XL U272 ( .B0(n123), .B1(n265), .A0N(N65), .A1N(n321), .Y(n179) );
  OAI2BB2XL U273 ( .B0(n122), .B1(n265), .A0N(N64), .A1N(n321), .Y(n180) );
  OAI2BB2XL U274 ( .B0(n121), .B1(n265), .A0N(N63), .A1N(n321), .Y(n181) );
  OAI2BB2XL U275 ( .B0(n120), .B1(n265), .A0N(N62), .A1N(n321), .Y(n182) );
  OAI2BB2XL U276 ( .B0(n119), .B1(n265), .A0N(N61), .A1N(n321), .Y(n183) );
  OAI22XL U277 ( .A0(n310), .A1(n268), .B0(n37), .B1(n103), .Y(n199) );
  OAI22XL U278 ( .A0(n309), .A1(n268), .B0(n37), .B1(n104), .Y(n198) );
  OAI22XL U279 ( .A0(n308), .A1(n268), .B0(n37), .B1(n105), .Y(n197) );
  OAI22XL U280 ( .A0(n307), .A1(n268), .B0(n37), .B1(n106), .Y(n196) );
  OAI22XL U281 ( .A0(n306), .A1(n268), .B0(n37), .B1(n107), .Y(n195) );
  OAI22XL U282 ( .A0(n305), .A1(n268), .B0(n37), .B1(n108), .Y(n194) );
  OAI22XL U283 ( .A0(n304), .A1(n268), .B0(n37), .B1(n109), .Y(n193) );
  OAI22XL U284 ( .A0(n303), .A1(n268), .B0(n37), .B1(n110), .Y(n192) );
  OAI22XL U285 ( .A0(n319), .A1(n111), .B0(n267), .B1(n310), .Y(n191) );
  OAI22XL U286 ( .A0(n319), .A1(n112), .B0(n267), .B1(n303), .Y(n190) );
  OAI22XL U287 ( .A0(n319), .A1(n113), .B0(n267), .B1(n304), .Y(n189) );
  OAI22XL U288 ( .A0(n319), .A1(n114), .B0(n267), .B1(n305), .Y(n188) );
  OAI22XL U289 ( .A0(n319), .A1(n115), .B0(n267), .B1(n306), .Y(n187) );
  OAI22XL U290 ( .A0(n319), .A1(n116), .B0(n267), .B1(n307), .Y(n186) );
  OAI22XL U291 ( .A0(n319), .A1(n117), .B0(n267), .B1(n308), .Y(n185) );
  OAI22XL U292 ( .A0(n319), .A1(n118), .B0(n267), .B1(n309), .Y(n184) );
  CLKINVX1 U293 ( .A(gray_data[0]), .Y(n310) );
  CLKINVX1 U294 ( .A(gray_data[7]), .Y(n303) );
  CLKINVX1 U295 ( .A(gray_data[6]), .Y(n304) );
  CLKINVX1 U296 ( .A(gray_data[5]), .Y(n305) );
  CLKINVX1 U297 ( .A(gray_data[4]), .Y(n306) );
  CLKINVX1 U298 ( .A(gray_data[3]), .Y(n307) );
  CLKINVX1 U299 ( .A(gray_data[2]), .Y(n308) );
  CLKINVX1 U300 ( .A(gray_data[1]), .Y(n309) );
  XOR2X1 U301 ( .A(n173), .B(n315), .Y(N48) );
  OR2X1 U302 ( .A(addr2[1]), .B(n271), .Y(n282) );
  OR2X1 U303 ( .A(addr1[1]), .B(addr1[0]), .Y(n277) );
  NAND4X2 U304 ( .A(addr2[5]), .B(addr2[4]), .C(addr2[6]), .D(n870), .Y(N239)
         );
  NOR4X1 U305 ( .A(n271), .B(n327), .C(n326), .D(n325), .Y(n870) );
  OAI21X1 U306 ( .A0(sll_117_SH_0_), .A1(n328), .B0(n76), .Y(N47) );
  NAND2X1 U307 ( .A(sll_117_SH_0_), .B(n328), .Y(n76) );
  OAI22XL U308 ( .A0(n920), .A1(n272), .B0(n650), .B1(n269), .Y(n210) );
  AOI222XL U309 ( .A0(addr2[3]), .A1(n60), .B0(addr2_after[3]), .B1(n610), 
        .C0(addr2_before[3]), .C1(n620), .Y(n650) );
  OAI22XL U310 ( .A0(n930), .A1(n272), .B0(n640), .B1(n269), .Y(n209) );
  AOI222XL U311 ( .A0(addr2[4]), .A1(n60), .B0(addr2_after[4]), .B1(n610), 
        .C0(addr2_before[4]), .C1(n620), .Y(n640) );
  OAI22XL U312 ( .A0(n94), .A1(n272), .B0(n630), .B1(n269), .Y(n208) );
  AOI222XL U313 ( .A0(addr2[5]), .A1(n60), .B0(addr2_after[5]), .B1(n610), 
        .C0(addr2_before[5]), .C1(n620), .Y(n630) );
  OAI22XL U314 ( .A0(n95), .A1(n272), .B0(n59), .B1(n269), .Y(n207) );
  AOI222XL U315 ( .A0(addr2[6]), .A1(n60), .B0(addr2_after[6]), .B1(n610), 
        .C0(addr2_before[6]), .C1(n620), .Y(n59) );
  OAI22XL U316 ( .A0(n100), .A1(n272), .B0(n490), .B1(n269), .Y(n202) );
  AOI222XL U317 ( .A0(addr1_before[4]), .A1(n43), .B0(addr1_after[4]), .B1(
        n440), .C0(n45), .C1(addr1[4]), .Y(n490) );
  OAI22XL U318 ( .A0(n101), .A1(n272), .B0(n470), .B1(n269), .Y(n201) );
  AOI222XL U319 ( .A0(addr1_before[5]), .A1(n43), .B0(addr1_after[5]), .B1(
        n440), .C0(n45), .C1(addr1[5]), .Y(n470) );
  OAI22XL U320 ( .A0(n102), .A1(n272), .B0(n41), .B1(n269), .Y(n200) );
  AOI222XL U321 ( .A0(addr1_before[6]), .A1(n43), .B0(addr1_after[6]), .B1(
        n440), .C0(n45), .C1(addr1[6]), .Y(n41) );
  NAND2X1 U322 ( .A(sll_117_SH_0_), .B(n314), .Y(n331) );
  NAND2X1 U323 ( .A(N47), .B(sll_117_SH_0_), .Y(n333) );
  CLKBUFX3 U324 ( .A(addr2[0]), .Y(n271) );
  AO22X1 U325 ( .A0(N92), .A1(n323), .B0(addr2[5]), .B1(n21), .Y(n166) );
  AO22X1 U326 ( .A0(N93), .A1(n323), .B0(addr2[6]), .B1(n21), .Y(n168) );
  NAND3X1 U327 ( .A(n174), .B(n316), .C(n317), .Y(n73) );
  NAND2X1 U328 ( .A(n147), .B(n318), .Y(n70) );
  OAI22XL U329 ( .A0(n890), .A1(n272), .B0(n680), .B1(n269), .Y(n213) );
  AOI222XL U330 ( .A0(n271), .A1(n60), .B0(addr2_after[0]), .B1(n610), .C0(
        n225), .C1(n620), .Y(n680) );
  OAI22XL U331 ( .A0(n900), .A1(n272), .B0(n670), .B1(n269), .Y(n212) );
  AOI222XL U332 ( .A0(addr2[1]), .A1(n60), .B0(addr2_after[1]), .B1(n610), 
        .C0(addr2_before[1]), .C1(n620), .Y(n670) );
  OAI22XL U333 ( .A0(n910), .A1(n272), .B0(n660), .B1(n269), .Y(n211) );
  AOI222XL U334 ( .A0(addr2[2]), .A1(n60), .B0(addr2_after[2]), .B1(n610), 
        .C0(addr2_before[2]), .C1(n620), .Y(n660) );
  OAI22XL U335 ( .A0(n96), .A1(n272), .B0(n570), .B1(n269), .Y(n206) );
  AOI222XL U336 ( .A0(addr1_before[0]), .A1(n43), .B0(addr1_after[0]), .B1(
        n440), .C0(n45), .C1(addr1[0]), .Y(n570) );
  OAI22XL U337 ( .A0(n97), .A1(n272), .B0(n550), .B1(n269), .Y(n205) );
  AOI222XL U338 ( .A0(addr1_before[1]), .A1(n43), .B0(addr1_after[1]), .B1(
        n440), .C0(n45), .C1(addr1[1]), .Y(n550) );
  OAI22XL U339 ( .A0(n98), .A1(n272), .B0(n530), .B1(n269), .Y(n204) );
  AOI222XL U340 ( .A0(addr1_before[2]), .A1(n43), .B0(addr1_after[2]), .B1(
        n440), .C0(n45), .C1(addr1[2]), .Y(n530) );
  OAI22XL U341 ( .A0(n99), .A1(n272), .B0(n510), .B1(n269), .Y(n203) );
  AOI222XL U342 ( .A0(addr1_before[3]), .A1(n43), .B0(addr1_after[3]), .B1(
        n440), .C0(n45), .C1(addr1[3]), .Y(n510) );
  NAND4X1 U343 ( .A(n174), .B(n173), .C(sll_117_SH_0_), .D(n320), .Y(n74) );
  OAI2BB2XL U344 ( .B0(addr1_before[0]), .B1(n266), .A0N(addr1_after[0]), 
        .A1N(n266), .Y(n221) );
  OAI2BB2XL U345 ( .B0(n127), .B1(n266), .A0N(addr1_after[5]), .A1N(n266), .Y(
        n216) );
  OAI2BB2XL U346 ( .B0(n129), .B1(n266), .A0N(addr1_after[4]), .A1N(n266), .Y(
        n217) );
  OAI2BB2XL U347 ( .B0(n131), .B1(n266), .A0N(addr1_after[3]), .A1N(n266), .Y(
        n218) );
  OAI2BB2XL U348 ( .B0(n133), .B1(n266), .A0N(addr1_after[2]), .A1N(n266), .Y(
        n219) );
  OAI2BB2XL U349 ( .B0(n135), .B1(n266), .A0N(addr1_after[1]), .A1N(n266), .Y(
        n220) );
  OAI2BB2XL U350 ( .B0(n139), .B1(n266), .A0N(addr1_after[6]), .A1N(n266), .Y(
        n222) );
  CLKBUFX3 U351 ( .A(n16), .Y(n270) );
  NAND3X1 U352 ( .A(n313), .B(n320), .C(n173), .Y(n16) );
  AO22X1 U353 ( .A0(N91), .A1(n323), .B0(addr2[4]), .B1(n21), .Y(n164) );
  AO22X1 U354 ( .A0(addr2[3]), .A1(n21), .B0(N90), .B1(n323), .Y(n162) );
  AO22X1 U355 ( .A0(addr2[2]), .A1(n21), .B0(N89), .B1(n323), .Y(n160) );
  AO22X1 U356 ( .A0(addr2[1]), .A1(n21), .B0(N88), .B1(n323), .Y(n158) );
  OAI32X1 U357 ( .A0(n13), .A1(n14), .A2(n15), .B0(n270), .B1(n264), .Y(
        next_state[1]) );
  OR4X1 U358 ( .A(n134), .B(n132), .C(n130), .D(n128), .Y(n14) );
  OR4X1 U359 ( .A(n142), .B(n141), .C(n140), .D(n136), .Y(n15) );
  NAND4X1 U360 ( .A(n148), .B(n323), .C(n138), .D(n18), .Y(n13) );
  NOR4X1 U361 ( .A(n143), .B(n144), .C(n145), .D(n146), .Y(n18) );
  OAI22XL U362 ( .A0(n173), .A1(n265), .B0(N48), .B1(n264), .Y(n215) );
  OAI22XL U363 ( .A0(sll_117_SH_0_), .A1(n265), .B0(n316), .B1(n264), .Y(n224)
         );
  OAI22XL U364 ( .A0(n127), .A1(n270), .B0(n128), .B1(n311), .Y(n150) );
  OAI22XL U365 ( .A0(n129), .A1(n270), .B0(n130), .B1(n311), .Y(n151) );
  OAI22XL U366 ( .A0(n131), .A1(n270), .B0(n132), .B1(n311), .Y(n152) );
  OAI22XL U367 ( .A0(n133), .A1(n270), .B0(n134), .B1(n311), .Y(n153) );
  OAI22XL U368 ( .A0(n135), .A1(n270), .B0(n136), .B1(n311), .Y(n154) );
  OAI22XL U369 ( .A0(addr1_before[0]), .A1(n270), .B0(n138), .B1(n311), .Y(
        n155) );
  OAI22XL U370 ( .A0(n139), .A1(n270), .B0(n140), .B1(n311), .Y(n156) );
  OAI22XL U371 ( .A0(n270), .A1(n327), .B0(n141), .B1(n311), .Y(n157) );
  OAI22XL U372 ( .A0(n270), .A1(n326), .B0(n142), .B1(n311), .Y(n159) );
  OAI22XL U373 ( .A0(n270), .A1(n325), .B0(n143), .B1(n311), .Y(n161) );
  OAI2BB2XL U374 ( .B0(n174), .B1(n265), .A0N(N47), .A1N(n321), .Y(n214) );
  OAI2BB2XL U375 ( .B0(n144), .B1(n311), .A0N(n311), .A1N(addr2[4]), .Y(n163)
         );
  OAI2BB2XL U376 ( .B0(n145), .B1(n311), .A0N(n311), .A1N(addr2[5]), .Y(n165)
         );
  OAI2BB2XL U377 ( .B0(n146), .B1(n311), .A0N(n311), .A1N(addr2[6]), .Y(n167)
         );
  OAI2BB2XL U378 ( .B0(n148), .B1(n311), .A0N(n311), .A1N(n271), .Y(n1690) );
  OAI2BB2XL U379 ( .B0(n264), .B1(n77), .A0N(n82), .A1N(n320), .Y(n223) );
  OAI21XL U380 ( .A0(n83), .A1(n264), .B0(n265), .Y(n82) );
  NOR2X1 U381 ( .A(n173), .B(n72), .Y(n83) );
  OAI21XL U382 ( .A0(n311), .A1(n264), .B0(state[0]), .Y(next_state[0]) );
  CLKBUFX3 U383 ( .A(n17), .Y(n264) );
  NAND2X1 U384 ( .A(state[0]), .B(n322), .Y(n17) );
  NAND2X1 U385 ( .A(n149), .B(n264), .Y(n171) );
  AND2X1 U386 ( .A(n271), .B(N239), .Y(N243) );
  AND2X1 U387 ( .A(addr2[1]), .B(N239), .Y(N244) );
  AND2X1 U388 ( .A(addr2[2]), .B(N239), .Y(N245) );
  AND2X1 U389 ( .A(addr2[3]), .B(N239), .Y(N246) );
  AND2X1 U390 ( .A(addr2[4]), .B(N239), .Y(N247) );
  AND2X1 U391 ( .A(addr2[5]), .B(N239), .Y(N248) );
  AND2X1 U392 ( .A(N239), .B(addr2[6]), .Y(N249) );
  OAI2BB1X1 U393 ( .A0N(addr1[0]), .A1N(addr1[1]), .B0(n277), .Y(
        addr1_before[1]) );
  OR2X1 U394 ( .A(n277), .B(addr1[2]), .Y(n278) );
  OAI2BB1X1 U395 ( .A0N(n277), .A1N(addr1[2]), .B0(n278), .Y(addr1_before[2])
         );
  NOR2X1 U396 ( .A(n278), .B(addr1[3]), .Y(n279) );
  AO21X1 U397 ( .A0(n278), .A1(addr1[3]), .B0(n279), .Y(addr1_before[3]) );
  NAND2X1 U398 ( .A(n279), .B(n129), .Y(n280) );
  OAI21XL U399 ( .A0(n279), .A1(n129), .B0(n280), .Y(addr1_before[4]) );
  XNOR2X1 U400 ( .A(addr1[5]), .B(n280), .Y(addr1_before[5]) );
  NOR2X1 U401 ( .A(addr1[5]), .B(n280), .Y(n281) );
  XOR2X1 U402 ( .A(addr1[6]), .B(n281), .Y(addr1_before[6]) );
  OAI2BB1X1 U403 ( .A0N(n271), .A1N(addr2[1]), .B0(n282), .Y(addr2_before[1])
         );
  OR2X1 U404 ( .A(n282), .B(addr2[2]), .Y(n283) );
  OAI2BB1X1 U405 ( .A0N(n282), .A1N(addr2[2]), .B0(n283), .Y(addr2_before[2])
         );
  NOR2X1 U406 ( .A(n283), .B(addr2[3]), .Y(n284) );
  AO21X1 U407 ( .A0(n283), .A1(addr2[3]), .B0(n284), .Y(addr2_before[3]) );
  NAND2X1 U408 ( .A(n284), .B(n287), .Y(n285) );
  OAI21XL U409 ( .A0(n284), .A1(n287), .B0(n285), .Y(addr2_before[4]) );
  XNOR2X1 U410 ( .A(addr2[5]), .B(n285), .Y(addr2_before[5]) );
  NOR2X1 U411 ( .A(addr2[5]), .B(n285), .Y(n286) );
  XOR2X1 U412 ( .A(addr2[6]), .B(n286), .Y(addr2_before[6]) );
  NAND2BX1 U413 ( .AN(threshold[4]), .B(outside_data[4]), .Y(n288) );
  OAI222XL U414 ( .A0(threshold[5]), .A1(n114), .B0(threshold[5]), .B1(n288), 
        .C0(n114), .C1(n288), .Y(n289) );
  OAI222XL U415 ( .A0(outside_data[6]), .A1(n289), .B0(n109), .B1(n289), .C0(
        outside_data[6]), .C1(n109), .Y(n300) );
  NOR2BX1 U416 ( .AN(threshold[4]), .B(outside_data[4]), .Y(n290) );
  OAI22XL U417 ( .A0(n290), .A1(n114), .B0(threshold[5]), .B1(n290), .Y(n298)
         );
  NAND2BX1 U418 ( .AN(threshold[2]), .B(outside_data[2]), .Y(n296) );
  OAI2BB2XL U419 ( .B0(outside_data[0]), .B1(n103), .A0N(n118), .A1N(
        threshold[1]), .Y(n291) );
  OAI21XL U420 ( .A0(threshold[1]), .A1(n118), .B0(n291), .Y(n294) );
  NOR2BX1 U421 ( .AN(threshold[2]), .B(outside_data[2]), .Y(n292) );
  OAI22XL U422 ( .A0(n292), .A1(n116), .B0(threshold[3]), .B1(n292), .Y(n293)
         );
  AOI2BB2X1 U423 ( .B0(n294), .B1(n293), .A0N(n296), .A1N(n116), .Y(n295) );
  OAI221XL U424 ( .A0(threshold[3]), .A1(n296), .B0(threshold[3]), .B1(n116), 
        .C0(n295), .Y(n297) );
  OAI211X1 U425 ( .A0(outside_data[6]), .A1(n109), .B0(n298), .C0(n297), .Y(
        n299) );
  AO22X1 U426 ( .A0(n112), .A1(threshold[7]), .B0(n300), .B1(n299), .Y(n301)
         );
  LBP_DW01_add_0 add_121_S2 ( .A({n364, n365, n366, n367, n368, n369, n370, 
        n371}), .B(temp), .SUM({N68, N67, N66, N65, N64, N63, N62, N61}) );
  LBP_DW01_inc_0_DW01_inc_1 add_101 ( .A({addr2[6:1], n271}), .SUM(addr2_after) );
  LBP_DW01_inc_1_DW01_inc_2 r394 ( .A(addr1), .SUM(addr1_after) );
  LBP_DW01_inc_2_DW01_inc_3 add_138_aco ( .A({N249, N248, N247, N246, N245, 
        N244, N243}), .SUM({N93, N92, N91, N90, N89, N88, N87}) );
  DFFRX2 cnt_reg_0_ ( .D(n224), .CK(clk), .RN(n302), .Q(n316), .QN(
        sll_117_SH_0_) );
  DFFRX2 addr2_reg_5_ ( .D(n166), .CK(clk), .RN(n302), .Q(addr2[5]) );
  DFFRX2 addr2_reg_6_ ( .D(n168), .CK(clk), .RN(n302), .Q(addr2[6]) );
endmodule

