/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Tue Feb 15 13:48:58 2022
/////////////////////////////////////////////////////////////


module DT_DW01_inc_0_DW01_inc_1 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  XOR2X1 U1 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module DT_DW01_inc_1_DW01_inc_2 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;
  wire   n1, n2;
  wire   [7:2] carry;

  CMPR22X2 U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(n2), .CO(carry[4]), .S(SUM[3]) );
  CMPR22X2 U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  AND2X2 U1 ( .A(A[1]), .B(A[0]), .Y(n1) );
  AND2X1 U2 ( .A(A[2]), .B(n1), .Y(n2) );
  XOR2X1 U3 ( .A(A[1]), .B(A[0]), .Y(SUM[1]) );
  XOR2XL U4 ( .A(A[2]), .B(n1), .Y(SUM[2]) );
  XOR2X1 U5 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
  CLKINVX1 U6 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module DT_DW01_inc_2_DW01_inc_3 ( A, SUM );
  input [9:0] A;
  output [9:0] SUM;

  wire   [9:2] carry;

  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  XOR2X1 U1 ( .A(carry[9]), .B(A[9]), .Y(SUM[9]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module DT_DW01_dec_0_DW01_dec_1 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15;

  CLKINVX1 U1 ( .A(n15), .Y(n1) );
  OR2X1 U2 ( .A(A[1]), .B(A[0]), .Y(n12) );
  CLKINVX1 U3 ( .A(A[10]), .Y(n3) );
  CLKINVX1 U4 ( .A(A[11]), .Y(n2) );
  AO21X1 U5 ( .A0(n4), .A1(A[9]), .B0(n5), .Y(SUM[9]) );
  OAI2BB1X1 U6 ( .A0N(n6), .A1N(A[8]), .B0(n4), .Y(SUM[8]) );
  OAI2BB1X1 U7 ( .A0N(n7), .A1N(A[7]), .B0(n6), .Y(SUM[7]) );
  OAI2BB1X1 U8 ( .A0N(n8), .A1N(A[6]), .B0(n7), .Y(SUM[6]) );
  OAI2BB1X1 U9 ( .A0N(n9), .A1N(A[5]), .B0(n8), .Y(SUM[5]) );
  OAI2BB1X1 U10 ( .A0N(n10), .A1N(A[4]), .B0(n9), .Y(SUM[4]) );
  OAI2BB1X1 U11 ( .A0N(n11), .A1N(A[3]), .B0(n10), .Y(SUM[3]) );
  OAI2BB1X1 U12 ( .A0N(n12), .A1N(A[2]), .B0(n11), .Y(SUM[2]) );
  OAI2BB1X1 U13 ( .A0N(A[0]), .A1N(A[1]), .B0(n12), .Y(SUM[1]) );
  XOR2X1 U14 ( .A(A[13]), .B(n13), .Y(SUM[13]) );
  NOR2X1 U15 ( .A(A[12]), .B(n14), .Y(n13) );
  XNOR2X1 U16 ( .A(A[12]), .B(n14), .Y(SUM[12]) );
  OAI21XL U17 ( .A0(n1), .A1(n2), .B0(n14), .Y(SUM[11]) );
  NAND2X1 U18 ( .A(n1), .B(n2), .Y(n14) );
  OAI21XL U19 ( .A0(n5), .A1(n3), .B0(n15), .Y(SUM[10]) );
  NAND2X1 U20 ( .A(n5), .B(n3), .Y(n15) );
  NOR2X1 U21 ( .A(n4), .B(A[9]), .Y(n5) );
  OR2X1 U22 ( .A(n6), .B(A[8]), .Y(n4) );
  OR2X1 U23 ( .A(n7), .B(A[7]), .Y(n6) );
  OR2X1 U24 ( .A(n8), .B(A[6]), .Y(n7) );
  OR2X1 U25 ( .A(n9), .B(A[5]), .Y(n8) );
  OR2X1 U26 ( .A(n10), .B(A[4]), .Y(n9) );
  OR2X1 U27 ( .A(n11), .B(A[3]), .Y(n10) );
  OR2X1 U28 ( .A(n12), .B(A[2]), .Y(n11) );
  CLKINVX1 U29 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module DT_DW01_inc_3_DW01_inc_4 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;

  wire   [13:2] carry;

  ADDHXL U1_1_12 ( .A(A[12]), .B(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  ADDHXL U1_1_11 ( .A(A[11]), .B(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  XOR2X1 U1 ( .A(carry[13]), .B(A[13]), .Y(SUM[13]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module DT ( clk, reset, done, sti_rd, sti_addr, sti_di, res_wr, res_rd, 
        res_addr, res_do, res_di, fw_finish );
  output [9:0] sti_addr;
  input [15:0] sti_di;
  output [13:0] res_addr;
  output [7:0] res_do;
  input [7:0] res_di;
  input clk, reset;
  output done, sti_rd, res_wr, res_rd, fw_finish;
  wire   N37, N38, N39, n605, n606, n607, n608, n609, n610, n611, n612, n613,
         n614, n615, n616, n617, n618, n619, n620, n621, n622, n623, n624,
         n625, n626, N133, N134, N135, N136, N137, N138, N139, N140, N141,
         N142, N143, N144, N157, N158, N159, N160, N161, N162, N163, N164,
         N165, N166, N167, N168, N169, N170, N189, N190, N191, N192, N193,
         N194, N195, N196, N197, N198, N199, N200, N201, N230, N232, N233,
         N234, N235, N236, N237, N238, N239, N240, N241, N242, N243, N296,
         N297, N298, N299, N300, N301, N302, N303, N304, N305, N306, N307,
         N308, N309, N310, N311, N312, N313, N314, N315, N316, N317, N318,
         N319, N320, N321, N322, N339, N340, N341, N342, N343, N344, N345,
         N346, N347, N348, N349, N350, N464, N465, N466, N467, N468, N469,
         N470, N471, N472, n210, n211, n212, n213, n214, n215, n216, n217,
         n219, n220, n231, n232, n233, n234, n235, n236, n237, n238, n239,
         n240, n241, n242, n244, n245, n246, n247, n248, n249, n250, n251,
         n252, n257, n260, n261, n262, n263, n264, n265, n266, n267, n268,
         n269, n270, n271, n272, n273, n274, n275, n276, n277, n278, n279,
         n280, n281, n282, n283, n284, n285, n286, n287, n288, n289, n290,
         n291, n292, n293, n294, \add_184/carry[2] , \add_184/carry[3] ,
         \add_184/carry[4] , \add_184/carry[5] , \add_184/carry[6] ,
         \add_184/carry[7] , \add_184/carry[8] , \add_184/carry[9] ,
         \add_184/carry[10] , \add_184/carry[11] , \add_184/carry[12] ,
         \add_184/carry[13] , \sub_174/carry[2] , \sub_174/carry[3] ,
         \sub_174/carry[4] , \sub_174/carry[5] , \sub_174/carry[6] ,
         \sub_174/carry[7] , \sub_174/carry[8] , \sub_174/carry[9] ,
         \sub_174/carry[10] , \sub_174/carry[11] , \sub_174/carry[12] ,
         \sub_174/carry[13] , n295, n296, n297, n298, n299, n300, n301, n302,
         n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, n313,
         n314, n315, n316, n317, n318, n319, n320, n321, n333, n334, n335,
         n336, n337, n338, n339, n340, n341, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n372, n373, n374, n375, n376, n377, n378, n379, n380, n381,
         n382, n383, n384, n385, n386, n387, n388, n389, n390, n391, n392,
         n393, n394, n395, n396, n397, n398, n399, n400, n401, n402, n403,
         n404, n405, n406, n407, n408, n409, n410, n411, n412, n413, n414,
         n415, n416, n417, n418, n419, n420, n421, n422, n423, n424, n425,
         n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, n436,
         n437, n438, n439, n440, n441, n442, n443, n444, n445, n446, n447,
         n448, n449, n450, n451, n452, n453, n454, n455, n456, n457, n458,
         n459, n460, n461, n462, n463, n464, n465, n466, n467, n468, n469,
         n470, n471, n472, n473, n474, n475, n476, n477, n478, n479, n480,
         n481, n482, n483, n484, n485, n486, n487, n488, n489, n490, n491,
         n492, n493, n494, n495, n496, n497, n498, n499, n500, n501, n502,
         n503, n504, n505, n506, n507, n508, n509, n510, n511, n512, n513,
         n514, n515, n516, n517, n518, n519, n520, n521, n522, n523, n524,
         n525, n526, n527, n528, n529, n530, n531, n532, n533, n534, n535,
         n536, n537, n538, n539, n540, n541, n542, n543, n544, n545, n546,
         n547, n548, n549, n550, n551, n552, n553, n554, n555, n556, n557,
         n558, n559, n560, n561, n562, n563, n564, n565, n566, n567, n568,
         n569, n570, n571, n572, n573, n574, n575, n576, n577, n578, n579,
         n580, n581, n582, n583, n584, n585, n586, n587, n588, n589, n590,
         n591, n592, n593, n594, n595, n596, n597, n598, n599, n600, n601,
         n602, n603, n604;
  wire   [3:0] next_State;
  wire   [7:0] res_di_addOne;
  wire   [7:0] minTemp;
  wire   [14:0] \sub_187/carry ;
  wire   [13:1] \add_177/carry ;

  DT_DW01_inc_0_DW01_inc_1 add_225_S2 ( .A(minTemp), .SUM({N472, N471, N470, 
        N469, N468, N467, N466, N465}) );
  DT_DW01_inc_1_DW01_inc_2 add_203 ( .A(res_di), .SUM(res_di_addOne) );
  DT_DW01_inc_2_DW01_inc_3 add_145_S2 ( .A({n605, n606, n607, n608, n609, n610, 
        n611, n612, n613, n299}), .SUM({N142, N141, N140, N139, N138, N137, 
        N136, N135, N134, N133}) );
  DT_DW01_dec_0_DW01_dec_1 r422 ( .A({n614, res_addr[12:0]}), .SUM({N322, N321, 
        N320, N319, N318, N317, N316, N315, N314, N313, N312, N311, N310, N309}) );
  DT_DW01_inc_3_DW01_inc_4 r418 ( .A(res_addr), .SUM({N170, N169, N168, N167, 
        N166, N165, N164, N163, N162, N161, N160, N159, N158, N157}) );
  DFFRX1 \minTemp_reg[5]  ( .D(n271), .CK(clk), .RN(n372), .Q(minTemp[5]), 
        .QN(n262) );
  DFFRX1 \minTemp_reg[4]  ( .D(n272), .CK(clk), .RN(n372), .Q(minTemp[4]), 
        .QN(n263) );
  DFFRX1 \minTemp_reg[3]  ( .D(n273), .CK(clk), .RN(n373), .Q(minTemp[3]), 
        .QN(n264) );
  DFFSX1 \res_addr_reg[12]  ( .D(n288), .CK(clk), .SN(n373), .Q(n615), .QN(
        n318) );
  DFFSX1 \res_addr_reg[11]  ( .D(n287), .CK(clk), .SN(n372), .Q(n616), .QN(
        n307) );
  DFFSX1 \res_addr_reg[10]  ( .D(n286), .CK(clk), .SN(n373), .Q(n617), .QN(
        n296) );
  DFFSX1 \res_addr_reg[9]  ( .D(n285), .CK(clk), .SN(n372), .Q(n618), .QN(n319) );
  DFFSX1 \res_addr_reg[8]  ( .D(n284), .CK(clk), .SN(n373), .Q(n619), .QN(n305) );
  DFFSX1 \res_addr_reg[3]  ( .D(n279), .CK(clk), .SN(n372), .Q(n624), .QN(n295) );
  DFFSX1 \res_addr_reg[4]  ( .D(n280), .CK(clk), .SN(n373), .Q(n623), .QN(n306) );
  DFFSX1 \res_addr_reg[5]  ( .D(n281), .CK(clk), .SN(n372), .Q(n622), .QN(n297) );
  DFFSX1 \res_addr_reg[6]  ( .D(n282), .CK(clk), .SN(n373), .Q(n621), .QN(n298) );
  DFFSX1 \res_addr_reg[7]  ( .D(n283), .CK(clk), .SN(n373), .Q(n620), .QN(n317) );
  DFFSX2 \counter_reg[1]  ( .D(n292), .CK(clk), .SN(reset), .Q(N38), .QN(n390)
         );
  DFFSX1 \res_addr_reg[0]  ( .D(n294), .CK(clk), .SN(reset), .Q(N230), .QN(
        n308) );
  DFFSX1 \res_addr_reg[1]  ( .D(n277), .CK(clk), .SN(n372), .Q(n626), .QN(n321) );
  DFFSX1 \res_addr_reg[2]  ( .D(n278), .CK(clk), .SN(n372), .Q(n625), .QN(n316) );
  DFFRX1 \minTemp_reg[0]  ( .D(n276), .CK(clk), .RN(n372), .Q(minTemp[0]), 
        .QN(n267) );
  DFFRX1 \minTemp_reg[6]  ( .D(n270), .CK(clk), .RN(n372), .Q(minTemp[6]), 
        .QN(n261) );
  DFFRX1 \minTemp_reg[1]  ( .D(n275), .CK(clk), .RN(n373), .Q(minTemp[1]), 
        .QN(n266) );
  DFFRX1 \minTemp_reg[7]  ( .D(n269), .CK(clk), .RN(n372), .Q(minTemp[7]), 
        .QN(n260) );
  DFFRX1 \current_State_reg[3]  ( .D(n252), .CK(clk), .RN(reset), .Q(n603), 
        .QN(n493) );
  DFFRX1 \current_State_reg[1]  ( .D(next_State[1]), .CK(clk), .RN(reset), .Q(
        n601), .QN(n580) );
  DFFRX1 \current_State_reg[0]  ( .D(next_State[0]), .CK(clk), .RN(reset), .Q(
        n602), .QN(n599) );
  DFFRX1 \sti_addr_reg[5]  ( .D(n237), .CK(clk), .RN(reset), .Q(n609), .QN(
        n310) );
  DFFRX1 \sti_addr_reg[4]  ( .D(n238), .CK(clk), .RN(reset), .Q(n610), .QN(
        n303) );
  DFFRX1 \sti_addr_reg[3]  ( .D(n239), .CK(clk), .RN(reset), .Q(n611), .QN(
        n302) );
  DFFRX1 \sti_addr_reg[2]  ( .D(n240), .CK(clk), .RN(reset), .Q(n612), .QN(
        n301) );
  DFFRX1 \sti_addr_reg[1]  ( .D(n241), .CK(clk), .RN(reset), .Q(n613), .QN(
        n300) );
  DFFRX1 \sti_addr_reg[0]  ( .D(n242), .CK(clk), .RN(reset), .Q(n299), .QN(
        n320) );
  DFFRX1 \sti_addr_reg[6]  ( .D(n236), .CK(clk), .RN(reset), .Q(n608), .QN(
        n304) );
  DFFRX1 \sti_addr_reg[7]  ( .D(n235), .CK(clk), .RN(n372), .Q(n607), .QN(n311) );
  DFFRX1 \sti_addr_reg[8]  ( .D(n234), .CK(clk), .RN(n372), .Q(n606), .QN(n312) );
  DFFRX1 \sti_addr_reg[9]  ( .D(n233), .CK(clk), .RN(n372), .Q(n605), .QN(n309) );
  DFFRX1 \minTemp_reg[2]  ( .D(n274), .CK(clk), .RN(n373), .Q(minTemp[2]), 
        .QN(n265) );
  DFFSX1 \counter_reg[0]  ( .D(n291), .CK(clk), .SN(reset), .Q(N37), .QN(n389)
         );
  DFFSX1 \counter_reg[2]  ( .D(n290), .CK(clk), .SN(reset), .Q(N39), .QN(n388)
         );
  DFFSX1 \res_addr_reg[13]  ( .D(n293), .CK(clk), .SN(reset), .Q(n614), .QN(
        n407) );
  DFFSX2 \counter_reg[3]  ( .D(n289), .CK(clk), .SN(n372), .Q(n425), .QN(n257)
         );
  DFFRX2 \current_State_reg[2]  ( .D(n251), .CK(clk), .RN(reset), .Q(n600), 
        .QN(n496) );
  DFFRX2 res_wr_reg ( .D(N144), .CK(clk), .RN(n372), .Q(res_wr) );
  DFFRX2 res_rd_reg ( .D(N143), .CK(clk), .RN(reset), .Q(res_rd) );
  DFFRX2 sti_rd_reg ( .D(n604), .CK(clk), .RN(n372), .Q(sti_rd) );
  DFFRX2 fw_finish_reg ( .D(n232), .CK(clk), .RN(reset), .Q(fw_finish), .QN(
        n220) );
  DFFRX2 done_reg ( .D(n231), .CK(clk), .RN(n372), .Q(done), .QN(n219) );
  DFFRX2 \res_do_reg[7]  ( .D(n244), .CK(clk), .RN(n373), .Q(res_do[7]), .QN(
        n210) );
  DFFRX2 \res_do_reg[6]  ( .D(n245), .CK(clk), .RN(n373), .Q(res_do[6]), .QN(
        n211) );
  DFFRX2 \res_do_reg[5]  ( .D(n246), .CK(clk), .RN(n373), .Q(res_do[5]), .QN(
        n212) );
  DFFRX2 \res_do_reg[4]  ( .D(n247), .CK(clk), .RN(n373), .Q(res_do[4]), .QN(
        n213) );
  DFFRX2 \res_do_reg[3]  ( .D(n248), .CK(clk), .RN(n373), .Q(res_do[3]), .QN(
        n214) );
  DFFRX2 \res_do_reg[2]  ( .D(n249), .CK(clk), .RN(n373), .Q(res_do[2]), .QN(
        n215) );
  DFFRX2 \res_do_reg[1]  ( .D(n250), .CK(clk), .RN(n373), .Q(res_do[1]), .QN(
        n216) );
  DFFRX2 \res_do_reg[0]  ( .D(n268), .CK(clk), .RN(n373), .Q(res_do[0]), .QN(
        n217) );
  NOR4X2 U257 ( .A(n493), .B(n488), .C(n602), .D(n600), .Y(n486) );
  CLKAND2X6 U258 ( .A(n422), .B(n252), .Y(n488) );
  OR2X1 U259 ( .A(n417), .B(n484), .Y(n350) );
  OA21X2 U260 ( .A0(n481), .A1(n484), .B0(n485), .Y(n352) );
  NOR2X4 U261 ( .A(n484), .B(n416), .Y(n314) );
  NAND2X2 U262 ( .A(n488), .B(n355), .Y(n484) );
  NAND2X2 U263 ( .A(res_di_addOne[5]), .B(n262), .Y(n540) );
  OR2X4 U264 ( .A(n544), .B(n261), .Y(n347) );
  AND2X2 U265 ( .A(N144), .B(n421), .Y(n334) );
  CLKINVX1 U266 ( .A(res_di_addOne[2]), .Y(n507) );
  NOR4X6 U267 ( .A(res_di[7]), .B(res_di[6]), .C(res_di[5]), .D(res_di[4]), 
        .Y(n598) );
  NOR3X4 U268 ( .A(n343), .B(res_di[0]), .C(res_di[1]), .Y(n597) );
  INVX3 U269 ( .A(n342), .Y(n343) );
  NOR2X4 U270 ( .A(res_di[2]), .B(res_di[3]), .Y(n342) );
  OAI31X1 U271 ( .A0(n496), .A1(n489), .A2(n497), .B0(n498), .Y(n495) );
  AOI32X1 U272 ( .A0(n539), .A1(n540), .A2(n541), .B0(n542), .B1(n543), .Y(
        n537) );
  NAND2X1 U273 ( .A(n544), .B(n261), .Y(n542) );
  NAND2X1 U274 ( .A(n347), .B(res_di_addOne[6]), .Y(n543) );
  NOR4X4 U275 ( .A(n592), .B(n593), .C(n594), .D(n595), .Y(n584) );
  CLKINVX1 U276 ( .A(res_di_addOne[7]), .Y(n517) );
  INVX12 U277 ( .A(n352), .Y(n398) );
  INVX8 U278 ( .A(n350), .Y(n399) );
  INVX6 U279 ( .A(n348), .Y(n401) );
  NOR2BX2 U280 ( .AN(next_State[1]), .B(next_State[0]), .Y(N144) );
  NAND3BX1 U281 ( .AN(n333), .B(n391), .C(n415), .Y(n290) );
  NAND3X1 U282 ( .A(n338), .B(n339), .C(n340), .Y(n274) );
  CLKBUFX3 U283 ( .A(n626), .Y(res_addr[1]) );
  NOR2X2 U284 ( .A(n334), .B(n431), .Y(n313) );
  OAI221X4 U285 ( .A0(n522), .A1(n521), .B0(n523), .B1(n520), .C0(n519), .Y(
        n501) );
  AND2X2 U286 ( .A(n313), .B(n429), .Y(n315) );
  CLKBUFX3 U287 ( .A(n615), .Y(res_addr[12]) );
  CLKBUFX3 U288 ( .A(n618), .Y(res_addr[9]) );
  INVX3 U289 ( .A(n312), .Y(sti_addr[8]) );
  INVX3 U290 ( .A(n311), .Y(sti_addr[7]) );
  INVX3 U291 ( .A(n304), .Y(sti_addr[6]) );
  INVX3 U292 ( .A(n300), .Y(sti_addr[1]) );
  INVX3 U293 ( .A(n301), .Y(sti_addr[2]) );
  INVX3 U294 ( .A(n302), .Y(sti_addr[3]) );
  INVX3 U295 ( .A(n303), .Y(sti_addr[4]) );
  INVX3 U296 ( .A(n310), .Y(sti_addr[5]) );
  INVX3 U297 ( .A(n309), .Y(sti_addr[9]) );
  INVX3 U298 ( .A(n320), .Y(sti_addr[0]) );
  INVX3 U299 ( .A(n407), .Y(res_addr[13]) );
  INVX2 U300 ( .A(n429), .Y(n553) );
  NOR2X4 U301 ( .A(n575), .B(n519), .Y(n596) );
  OA21XL U302 ( .A0(n411), .A1(n418), .B0(N39), .Y(n333) );
  NOR2XL U303 ( .A(n421), .B(next_State[1]), .Y(N143) );
  NOR2BX2 U304 ( .AN(next_State[0]), .B(next_State[1]), .Y(n422) );
  OAI2BB1X4 U305 ( .A0N(n519), .A1N(n520), .B0(n501), .Y(n504) );
  AOI211X2 U306 ( .A0(n586), .A1(n587), .B0(n581), .C0(res_addr[0]), .Y(n585)
         );
  NAND2BX1 U307 ( .AN(n575), .B(n573), .Y(n587) );
  MXI2X4 U308 ( .A(n584), .B(n585), .S0(n317), .Y(n582) );
  NAND2X6 U309 ( .A(n341), .B(n296), .Y(n595) );
  NAND4BX2 U310 ( .AN(n569), .B(n576), .C(n577), .D(n358), .Y(next_State[1])
         );
  NAND2BX2 U311 ( .AN(n521), .B(n501), .Y(n503) );
  NAND2X4 U312 ( .A(n582), .B(n562), .Y(n569) );
  NAND3X1 U313 ( .A(n357), .B(n409), .C(n315), .Y(n414) );
  NAND2XL U314 ( .A(N144), .B(n251), .Y(n429) );
  OR2XL U315 ( .A(n508), .B(n504), .Y(n339) );
  NOR2XL U316 ( .A(n518), .B(n504), .Y(n336) );
  NOR2XL U317 ( .A(n517), .B(n503), .Y(n335) );
  NOR2XL U318 ( .A(n260), .B(n501), .Y(n337) );
  OR3X2 U319 ( .A(n335), .B(n336), .C(n337), .Y(n269) );
  NAND2X2 U320 ( .A(N144), .B(n421), .Y(n498) );
  OR2X1 U321 ( .A(n507), .B(n503), .Y(n338) );
  OR2XL U322 ( .A(n265), .B(n501), .Y(n340) );
  INVXL U323 ( .A(res_di[2]), .Y(n508) );
  NOR3X1 U324 ( .A(n493), .B(n600), .C(n580), .Y(n583) );
  OA21X4 U325 ( .A0(n596), .A1(n583), .B0(n308), .Y(n341) );
  NAND3X2 U326 ( .A(n429), .B(n498), .C(n357), .Y(n550) );
  OR2X2 U327 ( .A(n417), .B(n482), .Y(n348) );
  AND2X2 U328 ( .A(n422), .B(n251), .Y(n489) );
  BUFX20 U329 ( .A(n402), .Y(n355) );
  NOR3X2 U330 ( .A(n456), .B(n486), .C(n356), .Y(n491) );
  NAND2X1 U331 ( .A(n349), .B(n502), .Y(n276) );
  OR2X1 U332 ( .A(n267), .B(n501), .Y(n349) );
  NAND2X6 U333 ( .A(n597), .B(n598), .Y(n575) );
  MXI2XL U334 ( .A(n411), .B(n412), .S0(n390), .Y(n410) );
  OR2XL U335 ( .A(n505), .B(n503), .Y(n344) );
  OR2XL U336 ( .A(n506), .B(n504), .Y(n345) );
  OR2XL U337 ( .A(n266), .B(n501), .Y(n346) );
  NAND3X1 U338 ( .A(n344), .B(n345), .C(n346), .Y(n275) );
  INVXL U339 ( .A(res_di[1]), .Y(n506) );
  AOI32X2 U340 ( .A0(n540), .A1(n511), .A2(minTemp[4]), .B0(n513), .B1(
        minTemp[5]), .Y(n544) );
  INVX1 U341 ( .A(res_di_addOne[4]), .Y(n511) );
  XNOR2XL U342 ( .A(N37), .B(n414), .Y(n413) );
  NAND2XL U343 ( .A(N466), .B(n553), .Y(n554) );
  NAND2XL U344 ( .A(N467), .B(n553), .Y(n555) );
  NAND2XL U345 ( .A(N468), .B(n553), .Y(n556) );
  NAND2XL U346 ( .A(N469), .B(n553), .Y(n557) );
  NAND2XL U347 ( .A(N470), .B(n553), .Y(n558) );
  NAND2XL U348 ( .A(N471), .B(n553), .Y(n559) );
  NAND2XL U349 ( .A(N472), .B(n553), .Y(n560) );
  OAI211XL U350 ( .A0(n550), .A1(n217), .B0(n551), .C0(n552), .Y(n268) );
  NAND2XL U351 ( .A(N464), .B(n334), .Y(n551) );
  AOI2BB2XL U352 ( .B0(N465), .B1(n553), .A0N(n267), .A1N(n357), .Y(n552) );
  NOR2XL U353 ( .A(n313), .B(N37), .Y(n412) );
  MX2XL U354 ( .A(n313), .B(n409), .S0(n389), .Y(n419) );
  OA22XL U355 ( .A0(n416), .A1(n313), .B0(n417), .B1(n409), .Y(n415) );
  MXI2XL U356 ( .A(n313), .B(n409), .S0(n390), .Y(n418) );
  CLKBUFX3 U357 ( .A(n625), .Y(res_addr[2]) );
  CLKBUFX3 U358 ( .A(n624), .Y(res_addr[3]) );
  CLKBUFX3 U359 ( .A(n623), .Y(res_addr[4]) );
  CLKBUFX3 U360 ( .A(n622), .Y(res_addr[5]) );
  CLKBUFX3 U361 ( .A(n621), .Y(res_addr[6]) );
  CLKBUFX3 U362 ( .A(n620), .Y(res_addr[7]) );
  CLKBUFX3 U363 ( .A(n619), .Y(res_addr[8]) );
  CLKBUFX3 U364 ( .A(n617), .Y(res_addr[10]) );
  CLKBUFX3 U365 ( .A(n616), .Y(res_addr[11]) );
  MX2XL U366 ( .A(n503), .B(n504), .S0(res_di[0]), .Y(n502) );
  NAND2X1 U367 ( .A(n489), .B(n355), .Y(n482) );
  AOI22X1 U368 ( .A0(N305), .A1(n314), .B0(N319), .B1(n398), .Y(n442) );
  CLKBUFX3 U369 ( .A(n428), .Y(n357) );
  NAND2X1 U370 ( .A(N144), .B(n252), .Y(n428) );
  OA21X4 U371 ( .A0(n481), .A1(n482), .B0(n483), .Y(n351) );
  INVX6 U372 ( .A(n351), .Y(n396) );
  OR2X4 U373 ( .A(n416), .B(n482), .Y(n353) );
  INVX6 U374 ( .A(n353), .Y(n400) );
  CLKBUFX3 U375 ( .A(n397), .Y(n356) );
  CLKINVX1 U376 ( .A(n492), .Y(n397) );
  CLKBUFX3 U377 ( .A(n561), .Y(n358) );
  NAND2X1 U378 ( .A(n578), .B(n571), .Y(n561) );
  XOR2X1 U379 ( .A(n614), .B(n354), .Y(N350) );
  NOR2X1 U380 ( .A(res_addr[12]), .B(\sub_187/carry [12]), .Y(n354) );
  BUFX4 U381 ( .A(N230), .Y(res_addr[0]) );
  CLKBUFX3 U382 ( .A(reset), .Y(n373) );
  CLKBUFX3 U383 ( .A(reset), .Y(n372) );
  NAND4X4 U384 ( .A(n566), .B(n564), .C(n565), .D(n563), .Y(next_State[0]) );
  OAI211X2 U385 ( .A0(n425), .A1(n490), .B0(n483), .C0(n491), .Y(n402) );
  XOR2X1 U386 ( .A(n614), .B(\add_184/carry[13] ), .Y(N308) );
  AND2X1 U387 ( .A(\add_184/carry[12] ), .B(res_addr[12]), .Y(
        \add_184/carry[13] ) );
  XOR2X1 U388 ( .A(res_addr[12]), .B(\add_184/carry[12] ), .Y(N307) );
  AND2X1 U389 ( .A(\add_184/carry[11] ), .B(res_addr[11]), .Y(
        \add_184/carry[12] ) );
  XOR2X1 U390 ( .A(res_addr[11]), .B(\add_184/carry[11] ), .Y(N306) );
  AND2X1 U391 ( .A(\add_184/carry[10] ), .B(res_addr[10]), .Y(
        \add_184/carry[11] ) );
  XOR2X1 U392 ( .A(res_addr[10]), .B(\add_184/carry[10] ), .Y(N305) );
  AND2X1 U393 ( .A(\add_184/carry[9] ), .B(res_addr[9]), .Y(
        \add_184/carry[10] ) );
  XOR2X1 U394 ( .A(res_addr[9]), .B(\add_184/carry[9] ), .Y(N304) );
  AND2X1 U395 ( .A(\add_184/carry[8] ), .B(res_addr[8]), .Y(\add_184/carry[9] ) );
  XOR2X1 U396 ( .A(res_addr[8]), .B(\add_184/carry[8] ), .Y(N303) );
  OR2X1 U397 ( .A(res_addr[7]), .B(\add_184/carry[7] ), .Y(\add_184/carry[8] )
         );
  XNOR2X1 U398 ( .A(\add_184/carry[7] ), .B(res_addr[7]), .Y(N302) );
  AND2X1 U399 ( .A(\add_184/carry[6] ), .B(res_addr[6]), .Y(\add_184/carry[7] ) );
  XOR2X1 U400 ( .A(res_addr[6]), .B(\add_184/carry[6] ), .Y(N301) );
  AND2X1 U401 ( .A(\add_184/carry[5] ), .B(res_addr[5]), .Y(\add_184/carry[6] ) );
  XOR2X1 U402 ( .A(res_addr[5]), .B(\add_184/carry[5] ), .Y(N300) );
  AND2X1 U403 ( .A(\add_184/carry[4] ), .B(res_addr[4]), .Y(\add_184/carry[5] ) );
  XOR2X1 U404 ( .A(res_addr[4]), .B(\add_184/carry[4] ), .Y(N299) );
  AND2X1 U405 ( .A(\add_184/carry[3] ), .B(res_addr[3]), .Y(\add_184/carry[4] ) );
  XOR2X1 U406 ( .A(res_addr[3]), .B(\add_184/carry[3] ), .Y(N298) );
  AND2X1 U407 ( .A(\add_184/carry[2] ), .B(res_addr[2]), .Y(\add_184/carry[3] ) );
  XOR2X1 U408 ( .A(res_addr[2]), .B(\add_184/carry[2] ), .Y(N297) );
  AND2X1 U409 ( .A(res_addr[0]), .B(res_addr[1]), .Y(\add_184/carry[2] ) );
  XOR2X1 U410 ( .A(res_addr[1]), .B(res_addr[0]), .Y(N296) );
  XNOR2X1 U411 ( .A(n614), .B(\sub_174/carry[13] ), .Y(N201) );
  OR2X1 U412 ( .A(res_addr[12]), .B(\sub_174/carry[12] ), .Y(
        \sub_174/carry[13] ) );
  XNOR2X1 U413 ( .A(\sub_174/carry[12] ), .B(res_addr[12]), .Y(N200) );
  OR2X1 U414 ( .A(res_addr[11]), .B(\sub_174/carry[11] ), .Y(
        \sub_174/carry[12] ) );
  XNOR2X1 U415 ( .A(\sub_174/carry[11] ), .B(res_addr[11]), .Y(N199) );
  OR2X1 U416 ( .A(res_addr[10]), .B(\sub_174/carry[10] ), .Y(
        \sub_174/carry[11] ) );
  XNOR2X1 U417 ( .A(\sub_174/carry[10] ), .B(res_addr[10]), .Y(N198) );
  OR2X1 U418 ( .A(res_addr[9]), .B(\sub_174/carry[9] ), .Y(\sub_174/carry[10] ) );
  XNOR2X1 U419 ( .A(\sub_174/carry[9] ), .B(res_addr[9]), .Y(N197) );
  OR2X1 U420 ( .A(res_addr[8]), .B(\sub_174/carry[8] ), .Y(\sub_174/carry[9] )
         );
  XNOR2X1 U421 ( .A(\sub_174/carry[8] ), .B(res_addr[8]), .Y(N196) );
  AND2X1 U422 ( .A(\sub_174/carry[7] ), .B(res_addr[7]), .Y(\sub_174/carry[8] ) );
  XOR2X1 U423 ( .A(res_addr[7]), .B(\sub_174/carry[7] ), .Y(N195) );
  OR2X1 U424 ( .A(res_addr[6]), .B(\sub_174/carry[6] ), .Y(\sub_174/carry[7] )
         );
  XNOR2X1 U425 ( .A(\sub_174/carry[6] ), .B(res_addr[6]), .Y(N194) );
  OR2X1 U426 ( .A(res_addr[5]), .B(\sub_174/carry[5] ), .Y(\sub_174/carry[6] )
         );
  XNOR2X1 U427 ( .A(\sub_174/carry[5] ), .B(res_addr[5]), .Y(N193) );
  OR2X1 U428 ( .A(res_addr[4]), .B(\sub_174/carry[4] ), .Y(\sub_174/carry[5] )
         );
  XNOR2X1 U429 ( .A(\sub_174/carry[4] ), .B(res_addr[4]), .Y(N192) );
  OR2X1 U430 ( .A(res_addr[3]), .B(\sub_174/carry[3] ), .Y(\sub_174/carry[4] )
         );
  XNOR2X1 U431 ( .A(\sub_174/carry[3] ), .B(res_addr[3]), .Y(N191) );
  OR2X1 U432 ( .A(res_addr[2]), .B(\sub_174/carry[2] ), .Y(\sub_174/carry[3] )
         );
  XNOR2X1 U433 ( .A(\sub_174/carry[2] ), .B(res_addr[2]), .Y(N190) );
  OR2X1 U434 ( .A(res_addr[1]), .B(res_addr[0]), .Y(\sub_174/carry[2] ) );
  XNOR2X1 U435 ( .A(res_addr[0]), .B(res_addr[1]), .Y(N189) );
  XNOR2X1 U436 ( .A(\sub_187/carry [12]), .B(res_addr[12]), .Y(N349) );
  OR2X1 U437 ( .A(res_addr[11]), .B(\sub_187/carry [11]), .Y(
        \sub_187/carry [12]) );
  XNOR2X1 U438 ( .A(\sub_187/carry [11]), .B(res_addr[11]), .Y(N348) );
  OR2X1 U439 ( .A(res_addr[10]), .B(\sub_187/carry [10]), .Y(
        \sub_187/carry [11]) );
  XNOR2X1 U440 ( .A(\sub_187/carry [10]), .B(res_addr[10]), .Y(N347) );
  OR2X1 U441 ( .A(res_addr[9]), .B(\sub_187/carry [9]), .Y(\sub_187/carry [10]) );
  XNOR2X1 U442 ( .A(\sub_187/carry [9]), .B(res_addr[9]), .Y(N346) );
  OR2X1 U443 ( .A(res_addr[8]), .B(\sub_187/carry [8]), .Y(\sub_187/carry [9])
         );
  XNOR2X1 U444 ( .A(\sub_187/carry [8]), .B(res_addr[8]), .Y(N345) );
  OR2X1 U445 ( .A(res_addr[7]), .B(\sub_187/carry [7]), .Y(\sub_187/carry [8])
         );
  XNOR2X1 U446 ( .A(\sub_187/carry [7]), .B(res_addr[7]), .Y(N344) );
  AND2X1 U447 ( .A(\sub_187/carry [6]), .B(res_addr[6]), .Y(\sub_187/carry [7]) );
  XOR2X1 U448 ( .A(res_addr[6]), .B(\sub_187/carry [6]), .Y(N343) );
  AND2X1 U449 ( .A(\sub_187/carry [5]), .B(res_addr[5]), .Y(\sub_187/carry [6]) );
  XOR2X1 U450 ( .A(res_addr[5]), .B(\sub_187/carry [5]), .Y(N342) );
  AND2X1 U451 ( .A(\sub_187/carry [4]), .B(res_addr[4]), .Y(\sub_187/carry [5]) );
  XOR2X1 U452 ( .A(res_addr[4]), .B(\sub_187/carry [4]), .Y(N341) );
  AND2X1 U453 ( .A(\sub_187/carry [3]), .B(res_addr[3]), .Y(\sub_187/carry [4]) );
  XOR2X1 U454 ( .A(res_addr[3]), .B(\sub_187/carry [3]), .Y(N340) );
  AND2X1 U455 ( .A(res_addr[1]), .B(res_addr[2]), .Y(\sub_187/carry [3]) );
  XOR2X1 U456 ( .A(res_addr[2]), .B(res_addr[1]), .Y(N339) );
  XOR2X1 U457 ( .A(n614), .B(\add_177/carry [13]), .Y(N243) );
  AND2X1 U458 ( .A(\add_177/carry [12]), .B(res_addr[12]), .Y(
        \add_177/carry [13]) );
  XOR2X1 U459 ( .A(res_addr[12]), .B(\add_177/carry [12]), .Y(N242) );
  AND2X1 U460 ( .A(\add_177/carry [11]), .B(res_addr[11]), .Y(
        \add_177/carry [12]) );
  XOR2X1 U461 ( .A(res_addr[11]), .B(\add_177/carry [11]), .Y(N241) );
  AND2X1 U462 ( .A(\add_177/carry [10]), .B(res_addr[10]), .Y(
        \add_177/carry [11]) );
  XOR2X1 U463 ( .A(res_addr[10]), .B(\add_177/carry [10]), .Y(N240) );
  AND2X1 U464 ( .A(\add_177/carry [9]), .B(res_addr[9]), .Y(
        \add_177/carry [10]) );
  XOR2X1 U465 ( .A(res_addr[9]), .B(\add_177/carry [9]), .Y(N239) );
  AND2X1 U466 ( .A(\add_177/carry [8]), .B(res_addr[8]), .Y(\add_177/carry [9]) );
  XOR2X1 U467 ( .A(res_addr[8]), .B(\add_177/carry [8]), .Y(N238) );
  AND2X1 U468 ( .A(\add_177/carry [7]), .B(res_addr[7]), .Y(\add_177/carry [8]) );
  XOR2X1 U469 ( .A(res_addr[7]), .B(\add_177/carry [7]), .Y(N237) );
  OR2X1 U470 ( .A(res_addr[6]), .B(\add_177/carry [6]), .Y(\add_177/carry [7])
         );
  XNOR2X1 U471 ( .A(\add_177/carry [6]), .B(res_addr[6]), .Y(N236) );
  OR2X1 U472 ( .A(res_addr[5]), .B(\add_177/carry [5]), .Y(\add_177/carry [6])
         );
  XNOR2X1 U473 ( .A(\add_177/carry [5]), .B(res_addr[5]), .Y(N235) );
  OR2X1 U474 ( .A(res_addr[4]), .B(\add_177/carry [4]), .Y(\add_177/carry [5])
         );
  XNOR2X1 U475 ( .A(\add_177/carry [4]), .B(res_addr[4]), .Y(N234) );
  OR2X1 U476 ( .A(res_addr[3]), .B(\add_177/carry [3]), .Y(\add_177/carry [4])
         );
  XNOR2X1 U477 ( .A(\add_177/carry [3]), .B(res_addr[3]), .Y(N233) );
  OR2X1 U478 ( .A(res_addr[2]), .B(res_addr[1]), .Y(\add_177/carry [3]) );
  XNOR2X1 U479 ( .A(res_addr[1]), .B(res_addr[2]), .Y(N232) );
  NOR2X1 U480 ( .A(n390), .B(N37), .Y(n383) );
  NOR2X1 U481 ( .A(n390), .B(n389), .Y(n382) );
  NOR2X1 U482 ( .A(n389), .B(N38), .Y(n380) );
  NOR2X1 U483 ( .A(N37), .B(N38), .Y(n379) );
  AO22X1 U484 ( .A0(sti_di[5]), .A1(n380), .B0(sti_di[4]), .B1(n379), .Y(n374)
         );
  AOI221XL U485 ( .A0(sti_di[6]), .A1(n383), .B0(sti_di[7]), .B1(n382), .C0(
        n374), .Y(n377) );
  AO22X1 U486 ( .A0(sti_di[1]), .A1(n380), .B0(sti_di[0]), .B1(n379), .Y(n375)
         );
  AOI221XL U487 ( .A0(sti_di[2]), .A1(n383), .B0(sti_di[3]), .B1(n382), .C0(
        n375), .Y(n376) );
  OA22X1 U488 ( .A0(n388), .A1(n377), .B0(N39), .B1(n376), .Y(n387) );
  AO22X1 U489 ( .A0(sti_di[13]), .A1(n380), .B0(sti_di[12]), .B1(n379), .Y(
        n378) );
  AOI221XL U490 ( .A0(sti_di[14]), .A1(n383), .B0(sti_di[15]), .B1(n382), .C0(
        n378), .Y(n385) );
  AO22X1 U491 ( .A0(sti_di[9]), .A1(n380), .B0(sti_di[8]), .B1(n379), .Y(n381)
         );
  AOI221XL U492 ( .A0(sti_di[10]), .A1(n383), .B0(sti_di[11]), .B1(n382), .C0(
        n381), .Y(n384) );
  OAI22XL U493 ( .A0(n385), .A1(n388), .B0(N39), .B1(n384), .Y(n386) );
  OAI2BB2XL U494 ( .B0(n387), .B1(n425), .A0N(n425), .A1N(n386), .Y(N464) );
  CLKINVX1 U495 ( .A(n391), .Y(n604) );
  NAND4X1 U496 ( .A(n392), .B(n393), .C(n394), .D(n395), .Y(n294) );
  AOI21X1 U497 ( .A0(N157), .A1(n396), .B0(n356), .Y(n395) );
  AOI22X1 U498 ( .A0(n308), .A1(n314), .B0(N309), .B1(n398), .Y(n394) );
  AOI22X1 U499 ( .A0(res_addr[0]), .A1(n399), .B0(n308), .B1(n400), .Y(n393)
         );
  AOI2BB2X1 U500 ( .B0(res_addr[0]), .B1(n401), .A0N(n355), .A1N(n308), .Y(
        n392) );
  NAND4X1 U501 ( .A(n403), .B(n404), .C(n405), .D(n406), .Y(n293) );
  AOI21X1 U502 ( .A0(N170), .A1(n396), .B0(n356), .Y(n406) );
  AOI22X1 U503 ( .A0(N308), .A1(n314), .B0(N322), .B1(n398), .Y(n405) );
  AOI22X1 U504 ( .A0(N350), .A1(n399), .B0(N201), .B1(n400), .Y(n404) );
  AOI2BB2X1 U505 ( .B0(N243), .B1(n401), .A0N(n355), .A1N(n407), .Y(n403) );
  OAI211X1 U506 ( .A0(n408), .A1(n409), .B0(n391), .C0(n410), .Y(n292) );
  NAND2X1 U507 ( .A(n413), .B(n391), .Y(n291) );
  NAND2X1 U508 ( .A(n419), .B(n414), .Y(n411) );
  NAND2X1 U509 ( .A(n420), .B(n391), .Y(n289) );
  NAND2X1 U510 ( .A(n421), .B(n422), .Y(n391) );
  MXI2X1 U511 ( .A(n423), .B(n424), .S0(n425), .Y(n420) );
  OAI221XL U512 ( .A0(n313), .A1(n426), .B0(n427), .B1(n409), .C0(n414), .Y(
        n424) );
  OAI22XL U513 ( .A0(n430), .A1(n409), .B0(n313), .B1(n416), .Y(n423) );
  NAND2X1 U514 ( .A(N143), .B(next_State[0]), .Y(n409) );
  NAND4X1 U515 ( .A(n432), .B(n433), .C(n434), .D(n435), .Y(n288) );
  AOI21X1 U516 ( .A0(N169), .A1(n396), .B0(n356), .Y(n435) );
  AOI22X1 U517 ( .A0(N307), .A1(n314), .B0(N321), .B1(n398), .Y(n434) );
  AOI22X1 U518 ( .A0(N349), .A1(n399), .B0(N200), .B1(n400), .Y(n433) );
  AOI2BB2X1 U519 ( .B0(N242), .B1(n401), .A0N(n355), .A1N(n318), .Y(n432) );
  NAND4X1 U520 ( .A(n436), .B(n437), .C(n438), .D(n439), .Y(n287) );
  AOI21X1 U521 ( .A0(N168), .A1(n396), .B0(n356), .Y(n439) );
  AOI22X1 U522 ( .A0(N306), .A1(n314), .B0(N320), .B1(n398), .Y(n438) );
  AOI22X1 U523 ( .A0(N348), .A1(n399), .B0(N199), .B1(n400), .Y(n437) );
  AOI2BB2X1 U524 ( .B0(N241), .B1(n401), .A0N(n355), .A1N(n307), .Y(n436) );
  NAND4X1 U525 ( .A(n440), .B(n441), .C(n442), .D(n443), .Y(n286) );
  AOI21X1 U526 ( .A0(N167), .A1(n396), .B0(n356), .Y(n443) );
  AOI22X1 U527 ( .A0(N347), .A1(n399), .B0(N198), .B1(n400), .Y(n441) );
  AOI2BB2X1 U528 ( .B0(N240), .B1(n401), .A0N(n355), .A1N(n296), .Y(n440) );
  NAND4X1 U529 ( .A(n444), .B(n445), .C(n446), .D(n447), .Y(n285) );
  AOI21X1 U530 ( .A0(N166), .A1(n396), .B0(n356), .Y(n447) );
  AOI22X1 U531 ( .A0(N304), .A1(n314), .B0(N318), .B1(n398), .Y(n446) );
  AOI22X1 U532 ( .A0(N346), .A1(n399), .B0(N197), .B1(n400), .Y(n445) );
  AOI2BB2X1 U533 ( .B0(N239), .B1(n401), .A0N(n355), .A1N(n319), .Y(n444) );
  NAND4X1 U534 ( .A(n448), .B(n449), .C(n450), .D(n451), .Y(n284) );
  AOI21X1 U535 ( .A0(N165), .A1(n396), .B0(n356), .Y(n451) );
  AOI22X1 U536 ( .A0(N303), .A1(n314), .B0(N317), .B1(n398), .Y(n450) );
  AOI22X1 U537 ( .A0(N345), .A1(n399), .B0(N196), .B1(n400), .Y(n449) );
  AOI2BB2X1 U538 ( .B0(N238), .B1(n401), .A0N(n355), .A1N(n305), .Y(n448) );
  NAND4X1 U539 ( .A(n452), .B(n453), .C(n454), .D(n455), .Y(n283) );
  AOI21X1 U540 ( .A0(N164), .A1(n396), .B0(n456), .Y(n455) );
  AOI22X1 U541 ( .A0(N302), .A1(n314), .B0(N316), .B1(n398), .Y(n454) );
  AOI22X1 U542 ( .A0(N344), .A1(n399), .B0(N195), .B1(n400), .Y(n453) );
  AOI2BB2X1 U543 ( .B0(N237), .B1(n401), .A0N(n355), .A1N(n317), .Y(n452) );
  NAND4X1 U544 ( .A(n457), .B(n458), .C(n459), .D(n460), .Y(n282) );
  AOI21X1 U545 ( .A0(N163), .A1(n396), .B0(n356), .Y(n460) );
  AOI22X1 U546 ( .A0(N301), .A1(n314), .B0(N315), .B1(n398), .Y(n459) );
  AOI22X1 U547 ( .A0(N343), .A1(n399), .B0(N194), .B1(n400), .Y(n458) );
  AOI2BB2X1 U548 ( .B0(N236), .B1(n401), .A0N(n355), .A1N(n298), .Y(n457) );
  NAND4X1 U549 ( .A(n461), .B(n462), .C(n463), .D(n464), .Y(n281) );
  AOI21X1 U550 ( .A0(N162), .A1(n396), .B0(n356), .Y(n464) );
  AOI22X1 U551 ( .A0(N300), .A1(n314), .B0(N314), .B1(n398), .Y(n463) );
  AOI22X1 U552 ( .A0(N342), .A1(n399), .B0(N193), .B1(n400), .Y(n462) );
  AOI2BB2X1 U553 ( .B0(N235), .B1(n401), .A0N(n355), .A1N(n297), .Y(n461) );
  NAND4X1 U554 ( .A(n465), .B(n466), .C(n467), .D(n468), .Y(n280) );
  AOI21X1 U555 ( .A0(N161), .A1(n396), .B0(n356), .Y(n468) );
  AOI22X1 U556 ( .A0(N299), .A1(n314), .B0(N313), .B1(n398), .Y(n467) );
  AOI22X1 U557 ( .A0(N341), .A1(n399), .B0(N192), .B1(n400), .Y(n466) );
  AOI2BB2X1 U558 ( .B0(N234), .B1(n401), .A0N(n355), .A1N(n306), .Y(n465) );
  NAND4X1 U559 ( .A(n469), .B(n470), .C(n471), .D(n472), .Y(n279) );
  AOI21X1 U560 ( .A0(N160), .A1(n396), .B0(n356), .Y(n472) );
  AOI22X1 U561 ( .A0(N298), .A1(n314), .B0(N312), .B1(n398), .Y(n471) );
  AOI22X1 U562 ( .A0(N340), .A1(n399), .B0(N191), .B1(n400), .Y(n470) );
  AOI2BB2X1 U563 ( .B0(N233), .B1(n401), .A0N(n355), .A1N(n295), .Y(n469) );
  NAND4X1 U564 ( .A(n473), .B(n474), .C(n475), .D(n476), .Y(n278) );
  AOI21X1 U565 ( .A0(N159), .A1(n396), .B0(n356), .Y(n476) );
  AOI22X1 U566 ( .A0(N297), .A1(n314), .B0(N311), .B1(n398), .Y(n475) );
  AOI22X1 U567 ( .A0(N339), .A1(n399), .B0(N190), .B1(n400), .Y(n474) );
  AOI2BB2X1 U568 ( .B0(N232), .B1(n401), .A0N(n355), .A1N(n316), .Y(n473) );
  NAND4X1 U569 ( .A(n477), .B(n478), .C(n479), .D(n480), .Y(n277) );
  AOI21X1 U570 ( .A0(N158), .A1(n396), .B0(n356), .Y(n480) );
  AOI22X1 U571 ( .A0(N296), .A1(n314), .B0(N310), .B1(n398), .Y(n479) );
  CLKINVX1 U572 ( .A(n486), .Y(n485) );
  CLKINVX1 U573 ( .A(n487), .Y(n481) );
  AOI22X1 U574 ( .A0(n321), .A1(n399), .B0(N189), .B1(n400), .Y(n478) );
  AOI2BB2X1 U575 ( .B0(n321), .B1(n401), .A0N(n355), .A1N(n321), .Y(n477) );
  CLKINVX1 U576 ( .A(n494), .Y(n456) );
  CLKINVX1 U577 ( .A(n495), .Y(n483) );
  OAI32X1 U578 ( .A0(n487), .A1(n499), .A2(n426), .B0(n488), .B1(n489), .Y(
        n490) );
  CLKINVX1 U579 ( .A(n416), .Y(n426) );
  NAND3X1 U580 ( .A(n388), .B(n390), .C(n389), .Y(n416) );
  OAI22XL U581 ( .A0(n408), .A1(N39), .B0(n500), .B1(N37), .Y(n487) );
  XNOR2X1 U582 ( .A(n390), .B(n388), .Y(n500) );
  CLKINVX1 U583 ( .A(n499), .Y(n417) );
  NOR3X1 U584 ( .A(n390), .B(n389), .C(N39), .Y(n499) );
  CLKINVX1 U585 ( .A(res_di_addOne[1]), .Y(n505) );
  OAI222XL U586 ( .A0(n509), .A1(n503), .B0(n510), .B1(n504), .C0(n264), .C1(
        n501), .Y(n273) );
  OAI222XL U587 ( .A0(n511), .A1(n503), .B0(n512), .B1(n504), .C0(n263), .C1(
        n501), .Y(n272) );
  OAI222XL U588 ( .A0(n513), .A1(n503), .B0(n514), .B1(n504), .C0(n262), .C1(
        n501), .Y(n271) );
  OAI222XL U589 ( .A0(n515), .A1(n503), .B0(n516), .B1(n504), .C0(n261), .C1(
        n501), .Y(n270) );
  AOI221XL U590 ( .A0(minTemp[7]), .A1(n518), .B0(n524), .B1(n525), .C0(n526), 
        .Y(n523) );
  NOR3X1 U591 ( .A(N39), .B(n408), .C(n425), .Y(n526) );
  OAI32X1 U592 ( .A0(n527), .A1(n528), .A2(n529), .B0(n530), .B1(n531), .Y(
        n525) );
  NOR2X1 U593 ( .A(minTemp[6]), .B(n532), .Y(n531) );
  AOI21X1 U594 ( .A0(n532), .A1(minTemp[6]), .B0(n516), .Y(n530) );
  OAI32X1 U595 ( .A0(n528), .A1(res_di[4]), .A2(n263), .B0(res_di[5]), .B1(
        n262), .Y(n532) );
  AOI222XL U596 ( .A0(n510), .A1(n533), .B0(n534), .B1(n535), .C0(n536), .C1(
        minTemp[3]), .Y(n529) );
  ACHCONX2 U597 ( .A(res_di[1]), .B(n266), .CI(n267), .CON(n535) );
  AOI2BB2X1 U598 ( .B0(res_di[2]), .B1(n265), .A0N(n510), .A1N(minTemp[3]), 
        .Y(n534) );
  NAND2BX1 U599 ( .AN(n536), .B(n264), .Y(n533) );
  NOR2X1 U600 ( .A(res_di[2]), .B(n265), .Y(n536) );
  CLKINVX1 U601 ( .A(res_di[3]), .Y(n510) );
  NOR2X1 U602 ( .A(n514), .B(minTemp[5]), .Y(n528) );
  CLKINVX1 U603 ( .A(res_di[5]), .Y(n514) );
  OAI22XL U604 ( .A0(minTemp[4]), .A1(n512), .B0(minTemp[6]), .B1(n516), .Y(
        n527) );
  CLKINVX1 U605 ( .A(res_di[6]), .Y(n516) );
  CLKINVX1 U606 ( .A(res_di[4]), .Y(n512) );
  NAND2X1 U607 ( .A(res_di[7]), .B(n260), .Y(n524) );
  CLKINVX1 U608 ( .A(res_di[7]), .Y(n518) );
  OA22X1 U609 ( .A0(n260), .A1(res_di_addOne[7]), .B0(n537), .B1(n538), .Y(
        n522) );
  NOR2X1 U610 ( .A(minTemp[7]), .B(n517), .Y(n538) );
  CLKINVX1 U611 ( .A(res_di_addOne[5]), .Y(n513) );
  AOI2BB2X1 U612 ( .B0(res_di_addOne[4]), .B1(n263), .A0N(n515), .A1N(
        minTemp[6]), .Y(n541) );
  CLKINVX1 U613 ( .A(res_di_addOne[6]), .Y(n515) );
  OAI211X1 U614 ( .A0(n264), .A1(n545), .B0(n546), .C0(n547), .Y(n539) );
  AO21X1 U615 ( .A0(n545), .A1(n264), .B0(res_di_addOne[3]), .Y(n547) );
  OAI222XL U616 ( .A0(minTemp[2]), .A1(n507), .B0(minTemp[3]), .B1(n509), .C0(
        n548), .C1(n549), .Y(n546) );
  NOR2X1 U617 ( .A(res_di_addOne[1]), .B(n266), .Y(n549) );
  AOI211X1 U618 ( .A0(res_di_addOne[1]), .A1(n266), .B0(res_di_addOne[0]), 
        .C0(n267), .Y(n548) );
  CLKINVX1 U619 ( .A(res_di_addOne[3]), .Y(n509) );
  NAND2X1 U620 ( .A(n507), .B(minTemp[2]), .Y(n545) );
  OAI221XL U621 ( .A0(n550), .A1(n216), .B0(n266), .B1(n357), .C0(n554), .Y(
        n250) );
  OAI221XL U622 ( .A0(n550), .A1(n215), .B0(n265), .B1(n357), .C0(n555), .Y(
        n249) );
  OAI221XL U623 ( .A0(n550), .A1(n214), .B0(n264), .B1(n357), .C0(n556), .Y(
        n248) );
  OAI221XL U624 ( .A0(n550), .A1(n213), .B0(n263), .B1(n357), .C0(n557), .Y(
        n247) );
  OAI221XL U625 ( .A0(n550), .A1(n212), .B0(n262), .B1(n357), .C0(n558), .Y(
        n246) );
  OAI221XL U626 ( .A0(n550), .A1(n211), .B0(n261), .B1(n357), .C0(n559), .Y(
        n245) );
  OAI221XL U627 ( .A0(n550), .A1(n210), .B0(n260), .B1(n357), .C0(n560), .Y(
        n244) );
  CLKMX2X2 U628 ( .A(N133), .B(sti_addr[0]), .S0(n358), .Y(n242) );
  CLKMX2X2 U629 ( .A(N134), .B(sti_addr[1]), .S0(n358), .Y(n241) );
  CLKMX2X2 U630 ( .A(N135), .B(sti_addr[2]), .S0(n358), .Y(n240) );
  CLKMX2X2 U631 ( .A(N136), .B(sti_addr[3]), .S0(n358), .Y(n239) );
  CLKMX2X2 U632 ( .A(N137), .B(sti_addr[4]), .S0(n358), .Y(n238) );
  CLKMX2X2 U633 ( .A(N138), .B(sti_addr[5]), .S0(n358), .Y(n237) );
  CLKMX2X2 U634 ( .A(N139), .B(sti_addr[6]), .S0(n358), .Y(n236) );
  CLKMX2X2 U635 ( .A(N140), .B(sti_addr[7]), .S0(n358), .Y(n235) );
  CLKMX2X2 U636 ( .A(N141), .B(sti_addr[8]), .S0(n358), .Y(n234) );
  CLKMX2X2 U637 ( .A(N142), .B(sti_addr[9]), .S0(n358), .Y(n233) );
  NAND2X1 U638 ( .A(n220), .B(n492), .Y(n232) );
  NAND2X1 U639 ( .A(n219), .B(n562), .Y(n231) );
  AOI2BB1X1 U640 ( .A0N(n567), .A1N(n568), .B0(n569), .Y(n566) );
  CLKINVX1 U641 ( .A(n570), .Y(n567) );
  NAND2X1 U642 ( .A(n571), .B(n572), .Y(n565) );
  NAND3X1 U643 ( .A(n427), .B(n425), .C(n431), .Y(n564) );
  OAI21XL U644 ( .A0(n573), .A1(n574), .B0(n575), .Y(n563) );
  CLKINVX1 U645 ( .A(n519), .Y(n574) );
  NAND2X1 U646 ( .A(n568), .B(n570), .Y(n577) );
  NAND2X1 U647 ( .A(n521), .B(n520), .Y(n570) );
  NOR3X1 U648 ( .A(n408), .B(n388), .C(n425), .Y(n568) );
  NAND2X1 U649 ( .A(n390), .B(N37), .Y(n408) );
  OAI31XL U650 ( .A0(n430), .A1(n257), .A2(n579), .B0(n431), .Y(n576) );
  NOR3X1 U651 ( .A(n580), .B(n600), .C(n497), .Y(n431) );
  NOR3X1 U652 ( .A(n308), .B(n581), .C(n317), .Y(n579) );
  CLKINVX1 U653 ( .A(n427), .Y(n430) );
  NOR3X1 U654 ( .A(n390), .B(n389), .C(n388), .Y(n427) );
  NAND2X1 U655 ( .A(n602), .B(n583), .Y(n562) );
  NAND4X1 U656 ( .A(n588), .B(n589), .C(n590), .D(n591), .Y(n581) );
  NOR3X1 U657 ( .A(n318), .B(n296), .C(n307), .Y(n591) );
  NOR3X1 U658 ( .A(n316), .B(n407), .C(n321), .Y(n590) );
  NOR3X1 U659 ( .A(n297), .B(n295), .C(n306), .Y(n589) );
  NOR3X1 U660 ( .A(n319), .B(n298), .C(n305), .Y(n588) );
  NAND4X1 U661 ( .A(n307), .B(n318), .C(n407), .D(n321), .Y(n594) );
  NAND3X1 U662 ( .A(n295), .B(n306), .C(n316), .Y(n593) );
  NAND4X1 U663 ( .A(n297), .B(n298), .C(n305), .D(n319), .Y(n592) );
  NOR2X1 U664 ( .A(n251), .B(n252), .Y(n421) );
  NAND4BX1 U665 ( .AN(n583), .B(n492), .C(n521), .D(n519), .Y(n252) );
  NAND3X1 U666 ( .A(n603), .B(n599), .C(n571), .Y(n519) );
  NAND3X1 U667 ( .A(n602), .B(n603), .C(n571), .Y(n521) );
  NOR2X1 U668 ( .A(n600), .B(n601), .Y(n571) );
  NAND3X1 U669 ( .A(n600), .B(n601), .C(n578), .Y(n492) );
  NAND4BX1 U670 ( .AN(n573), .B(n494), .C(n520), .D(n586), .Y(n251) );
  NAND3X1 U671 ( .A(n572), .B(n601), .C(n600), .Y(n586) );
  NAND3X1 U672 ( .A(n600), .B(n580), .C(n578), .Y(n520) );
  NAND3X1 U673 ( .A(n601), .B(n496), .C(n578), .Y(n494) );
  NOR2X1 U674 ( .A(n599), .B(n603), .Y(n578) );
  NOR3X1 U675 ( .A(n497), .B(n601), .C(n496), .Y(n573) );
  CLKINVX1 U676 ( .A(n572), .Y(n497) );
  NOR2X1 U677 ( .A(n603), .B(n602), .Y(n572) );
endmodule

