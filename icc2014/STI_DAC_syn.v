/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03
// Date      : Sat Jul 20 02:02:34 2024
/////////////////////////////////////////////////////////////


module STI_DAC_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  XOR2X1 U1 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module STI_DAC ( clk, reset, load, pi_data, pi_length, pi_fill, pi_msb, pi_low, 
        pi_end, so_data, so_valid, oem_finish, oem_dataout, oem_addr, odd1_wr, 
        odd2_wr, odd3_wr, odd4_wr, even1_wr, even2_wr, even3_wr, even4_wr );
  input [15:0] pi_data;
  input [1:0] pi_length;
  output [7:0] oem_dataout;
  output [4:0] oem_addr;
  input clk, reset, load, pi_fill, pi_msb, pi_low, pi_end;
  output so_data, so_valid, oem_finish, odd1_wr, odd2_wr, odd3_wr, odd4_wr,
         even1_wr, even2_wr, even3_wr, even4_wr;
  wire   N102, N103, N104, N105, N106, n322, n323, n324, n325, n326, n327,
         n328, n329, n330, n331, n332, n333, n334, n335, n336, n337, n338,
         n339, n340, n341, n342, n343, n344, N153, N162, N163, N164, N165,
         N167, N168, N169, N170, addr_0, N186, N196, N197, N198, N199, N200,
         N201, N202, N203, N365, n9, n10, n12, n15, n17, n18, n19, n22, n23,
         n24, n25, n26, n27, n30, n31, n32, n33, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n67, n68, n77, n80, n81, n82, n85,
         n86, n87, n88, n89, n91, n94, n95, n96, n98, n100, n102, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n119, n120, n122,
         n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, n147, n148, n149, n150, n151, n152, n153, n154, n155, n156,
         n157, n158, n159, n160, n161, n162, n164, n165, n166, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n220,
         n224, n240, n242, n243, n244, n245, n246, n247, n248, n249, n250,
         n251, n252, n253, n254, n255, n256, n257, n258, n259, n260, n261,
         n262, n263, n264, n265, n266, n267, n268, n269, n270, n271, n272,
         n273, n274, n275, n276, n277, n278, n279, n280, n281, n282, n283,
         n285, n286, n287, n288, n289, n290, n291, n292, n293, n294, n295,
         n296, n297, n298, n299, n300, n301, n302, n303, n304, n305, n306,
         n307, n308, n309, n310, n311, n312, n313, n314, n315, n316, n317,
         n318, n319, n320, n321;
  wire   [1:0] state;
  wire   [1:0] nxt_state;
  wire   [31:0] data_buf;
  wire   [7:6] addr;
  wire   [4:2] \add_157_S2/carry ;
  assign N153 = pi_msb;

  STI_DAC_DW01_inc_0 add_218 ( .A({addr, n332, n333, n334, n335, n336, addr_0}), .SUM({N203, N202, N201, N200, N199, N198, N197, N196}) );
  DFFRX1 \s_reg[4]  ( .D(n187), .CK(clk), .RN(n287), .Q(N106), .QN(n166) );
  DFFRX1 \data_buf_reg[11]  ( .D(n200), .CK(clk), .RN(n288), .Q(data_buf[11]), 
        .QN(n139) );
  DFFRX1 \data_buf_reg[9]  ( .D(n198), .CK(clk), .RN(n287), .Q(data_buf[9]), 
        .QN(n135) );
  DFFRX1 \data_buf_reg[15]  ( .D(n204), .CK(clk), .RN(n287), .Q(data_buf[15]), 
        .QN(n147) );
  DFFRX1 \data_buf_reg[10]  ( .D(n199), .CK(clk), .RN(n288), .Q(data_buf[10]), 
        .QN(n133) );
  DFFRX1 \data_buf_reg[13]  ( .D(n202), .CK(clk), .RN(n287), .Q(data_buf[13]), 
        .QN(n143) );
  DFFRX1 \data_buf_reg[8]  ( .D(n213), .CK(clk), .RN(n287), .Q(data_buf[8]), 
        .QN(n146) );
  DFFRX1 \data_buf_reg[14]  ( .D(n203), .CK(clk), .RN(n287), .Q(data_buf[14]), 
        .QN(n141) );
  DFFRX1 \data_buf_reg[12]  ( .D(n201), .CK(clk), .RN(n287), .Q(data_buf[12]), 
        .QN(n137) );
  DFFRX1 \data_buf_reg[19]  ( .D(n208), .CK(clk), .RN(n287), .Q(data_buf[19]), 
        .QN(n140) );
  DFFRX1 \data_buf_reg[17]  ( .D(n206), .CK(clk), .RN(n287), .Q(data_buf[17]), 
        .QN(n136) );
  DFFRX1 \data_buf_reg[23]  ( .D(n212), .CK(clk), .RN(n287), .Q(data_buf[23]), 
        .QN(n148) );
  DFFRX1 \data_buf_reg[18]  ( .D(n207), .CK(clk), .RN(n287), .Q(data_buf[18]), 
        .QN(n134) );
  DFFRX1 \data_buf_reg[21]  ( .D(n210), .CK(clk), .RN(n287), .Q(data_buf[21]), 
        .QN(n144) );
  DFFRX1 \data_buf_reg[16]  ( .D(n205), .CK(clk), .RN(n287), .Q(data_buf[16]), 
        .QN(n145) );
  DFFRX1 \data_buf_reg[22]  ( .D(n211), .CK(clk), .RN(n287), .Q(data_buf[22]), 
        .QN(n142) );
  DFFRX1 \data_buf_reg[20]  ( .D(n209), .CK(clk), .RN(n287), .Q(data_buf[20]), 
        .QN(n138) );
  DFFSX1 \addr_reg[7]  ( .D(n214), .CK(clk), .SN(n294), .Q(addr[7]), .QN(n172)
         );
  DFFSX1 \addr_reg[0]  ( .D(n215), .CK(clk), .SN(n288), .Q(addr_0), .QN(n174)
         );
  DFFRX1 \s_reg[3]  ( .D(n188), .CK(clk), .RN(n294), .Q(N105), .QN(n280) );
  DFFRX1 \state_reg[1]  ( .D(nxt_state[1]), .CK(clk), .RN(n294), .Q(state[1]), 
        .QN(n243) );
  DFFSX1 \addr_reg[4]  ( .D(n192), .CK(clk), .SN(n288), .Q(n333), .QN(n240) );
  DFFSX1 \addr_reg[1]  ( .D(n189), .CK(clk), .SN(n288), .Q(n336), .QN(n244) );
  DFFSX1 \addr_reg[3]  ( .D(n191), .CK(clk), .SN(n288), .Q(n334), .QN(n245) );
  DFFRX1 o_f_reg ( .D(n155), .CK(clk), .RN(n288), .Q(n323), .QN(n154) );
  DFFRX1 \oem_reg_reg[0]  ( .D(n175), .CK(clk), .RN(n288), .Q(n331), .QN(n149)
         );
  DFFRX1 \oem_reg_reg[1]  ( .D(n176), .CK(clk), .RN(n288), .Q(n330), .QN(n132)
         );
  DFFRX1 \oem_reg_reg[2]  ( .D(n177), .CK(clk), .RN(n288), .Q(n329), .QN(n131)
         );
  DFFRX1 \oem_reg_reg[3]  ( .D(n178), .CK(clk), .RN(n288), .Q(n328), .QN(n130)
         );
  DFFRX1 \oem_reg_reg[4]  ( .D(n179), .CK(clk), .RN(n288), .Q(n327), .QN(n129)
         );
  DFFRX1 \oem_reg_reg[5]  ( .D(n180), .CK(clk), .RN(n288), .Q(n326), .QN(n128)
         );
  DFFRX1 \oem_reg_reg[6]  ( .D(n181), .CK(clk), .RN(n288), .Q(n325), .QN(n127)
         );
  DFFRX1 \oem_reg_reg[7]  ( .D(n182), .CK(clk), .RN(n288), .Q(n324), .QN(n126)
         );
  DFFSX1 \addr_reg[5]  ( .D(n193), .CK(clk), .SN(n294), .Q(n332), .QN(n224) );
  DFFSX1 \addr_reg[2]  ( .D(n190), .CK(clk), .SN(n288), .Q(n335), .QN(n220) );
  DFFRX1 \out_data_reg[5]  ( .D(n157), .CK(clk), .RN(n294), .QN(n313) );
  DFFRX1 \out_data_reg[4]  ( .D(n158), .CK(clk), .RN(n294), .QN(n312) );
  DFFRX1 \out_data_reg[3]  ( .D(n159), .CK(clk), .RN(n294), .QN(n311) );
  DFFRX1 \out_data_reg[2]  ( .D(n160), .CK(clk), .RN(n294), .QN(n310) );
  DFFRX1 \out_data_reg[1]  ( .D(n161), .CK(clk), .RN(n294), .QN(n309) );
  DFFRX1 \out_data_reg[0]  ( .D(n162), .CK(clk), .RN(n294), .QN(n308) );
  DFFRX1 \state_reg[0]  ( .D(nxt_state[0]), .CK(clk), .RN(n294), .Q(state[0]), 
        .QN(n304) );
  DFFSX1 \addr_reg[6]  ( .D(n194), .CK(clk), .SN(n294), .Q(addr[6]), .QN(n173)
         );
  DFFRXL delay_reg ( .D(N186), .CK(clk), .RN(n294), .Q(n303), .QN(n125) );
  DFFRXL msb_t_reg ( .D(n156), .CK(clk), .RN(n294), .Q(n317), .QN(n165) );
  DFFRXL \e_reg[2]  ( .D(n184), .CK(clk), .RN(n294), .QN(n153) );
  DFFRXL \e_reg[1]  ( .D(n183), .CK(clk), .RN(n294), .QN(n152) );
  DFFRXL \e_reg[0]  ( .D(n186), .CK(clk), .RN(n294), .QN(n151) );
  DFFRXL \e_reg[3]  ( .D(n185), .CK(clk), .RN(n294), .QN(n171) );
  DFFRXL \e_reg[4]  ( .D(n164), .CK(clk), .RN(n294), .QN(n150) );
  DFFRX2 \s_reg[2]  ( .D(n195), .CK(clk), .RN(n294), .Q(N104), .QN(n281) );
  DFFRX2 \s_reg[1]  ( .D(n196), .CK(clk), .RN(n294), .Q(N103), .QN(n282) );
  DFFRX2 \s_reg[0]  ( .D(n197), .CK(clk), .RN(n294), .Q(N102), .QN(n283) );
  OAI222XL U198 ( .A0(n51), .A1(n306), .B0(n53), .B1(n305), .C0(n18), .C1(n303), .Y(n124) );
  CLKINVX1 U199 ( .A(n10), .Y(n301) );
  XOR2X1 U200 ( .A(n174), .B(n321), .Y(n10) );
  CLKINVX1 U201 ( .A(n322), .Y(n315) );
  CLKINVX1 U202 ( .A(n334), .Y(n321) );
  OR3XL U203 ( .A(n174), .B(n172), .C(n173), .Y(n246) );
  NOR3XL U204 ( .A(n9), .B(n173), .C(n10), .Y(n340) );
  NOR3XL U205 ( .A(n12), .B(n173), .C(n10), .Y(n338) );
  NOR3XL U206 ( .A(n301), .B(n173), .C(n9), .Y(n344) );
  INVX4 U207 ( .A(reset), .Y(n294) );
  NAND2X2 U208 ( .A(n283), .B(n282), .Y(n268) );
  OR4X2 U209 ( .A(n244), .B(n245), .C(n246), .D(n247), .Y(n95) );
  NAND2X2 U210 ( .A(N103), .B(n283), .Y(n270) );
  BUFX12 U211 ( .A(n339), .Y(odd3_wr) );
  NOR3X1 U212 ( .A(addr[6]), .B(n10), .C(n9), .Y(n339) );
  NAND2BX1 U213 ( .AN(n172), .B(n124), .Y(n9) );
  BUFX12 U214 ( .A(n342), .Y(even2_wr) );
  NOR3X1 U215 ( .A(n301), .B(n173), .C(n12), .Y(n342) );
  NAND2X1 U216 ( .A(n172), .B(n124), .Y(n12) );
  NAND2X2 U217 ( .A(N102), .B(n282), .Y(n269) );
  BUFX12 U218 ( .A(n344), .Y(even4_wr) );
  BUFX12 U219 ( .A(n337), .Y(odd1_wr) );
  NOR3X1 U220 ( .A(n12), .B(n10), .C(addr[6]), .Y(n337) );
  INVX12 U221 ( .A(n220), .Y(oem_addr[1]) );
  NAND2X2 U222 ( .A(N103), .B(N102), .Y(n271) );
  BUFX12 U223 ( .A(n343), .Y(even3_wr) );
  NOR3X1 U224 ( .A(n301), .B(n9), .C(addr[6]), .Y(n343) );
  BUFX12 U225 ( .A(n338), .Y(odd2_wr) );
  INVX12 U226 ( .A(n224), .Y(oem_addr[4]) );
  BUFX12 U227 ( .A(n324), .Y(oem_dataout[7]) );
  BUFX12 U228 ( .A(n325), .Y(oem_dataout[6]) );
  BUFX12 U229 ( .A(n326), .Y(oem_dataout[5]) );
  BUFX12 U230 ( .A(n327), .Y(oem_dataout[4]) );
  BUFX12 U231 ( .A(n328), .Y(oem_dataout[3]) );
  BUFX12 U232 ( .A(n329), .Y(oem_dataout[2]) );
  BUFX12 U233 ( .A(n330), .Y(oem_dataout[1]) );
  BUFX12 U234 ( .A(n331), .Y(oem_dataout[0]) );
  BUFX12 U235 ( .A(n323), .Y(oem_finish) );
  BUFX12 U236 ( .A(n341), .Y(even1_wr) );
  NOR3X1 U237 ( .A(n301), .B(addr[6]), .C(n12), .Y(n341) );
  BUFX12 U238 ( .A(n340), .Y(odd4_wr) );
  INVX12 U239 ( .A(n315), .Y(so_data) );
  OAI33X1 U240 ( .A0(n279), .A1(N106), .A2(n278), .B0(n166), .B1(n277), .B2(
        n276), .Y(n322) );
  INVX12 U241 ( .A(n321), .Y(oem_addr[2]) );
  INVX12 U242 ( .A(n244), .Y(oem_addr[0]) );
  INVX12 U243 ( .A(n240), .Y(oem_addr[3]) );
  NAND4XL U244 ( .A(n335), .B(n333), .C(n332), .D(pi_end), .Y(n247) );
  OAI211XL U245 ( .A0(n173), .A1(n285), .B0(n95), .C0(n105), .Y(n194) );
  OAI211XL U246 ( .A0(n224), .A1(n285), .B0(n95), .C0(n104), .Y(n193) );
  OAI211XL U247 ( .A0(n240), .A1(n285), .B0(n95), .C0(n102), .Y(n192) );
  OAI211XL U248 ( .A0(n172), .A1(n285), .B0(n95), .C0(n112), .Y(n214) );
  OAI211XL U249 ( .A0(n174), .A1(n285), .B0(n95), .C0(n113), .Y(n215) );
  NOR2X1 U250 ( .A(n242), .B(N153), .Y(n81) );
  NAND2X1 U251 ( .A(state[0]), .B(state[1]), .Y(n18) );
  NAND2BX1 U252 ( .AN(n304), .B(n243), .Y(n242) );
  OAI22XL U253 ( .A0(n318), .A1(n53), .B0(n54), .B1(n55), .Y(n36) );
  OAI22XL U254 ( .A0(n319), .A1(n51), .B0(n45), .B1(n67), .Y(n59) );
  CLKINVX1 U255 ( .A(n88), .Y(n306) );
  NAND2XL U256 ( .A(n269), .B(n268), .Y(n273) );
  NAND2XL U257 ( .A(n271), .B(n270), .Y(n272) );
  NAND2XL U258 ( .A(n269), .B(n268), .Y(n257) );
  NAND2XL U259 ( .A(n271), .B(n270), .Y(n256) );
  OAI211XL U260 ( .A0(n321), .A1(n285), .B0(n95), .C0(n100), .Y(n191) );
  NAND2X1 U261 ( .A(N199), .B(n285), .Y(n100) );
  OAI211XL U262 ( .A0(n220), .A1(n285), .B0(n95), .C0(n98), .Y(n190) );
  NAND2X1 U263 ( .A(N198), .B(n285), .Y(n98) );
  OAI211XL U264 ( .A0(n244), .A1(n285), .B0(n95), .C0(n96), .Y(n189) );
  NAND2X1 U265 ( .A(N197), .B(n285), .Y(n96) );
  CLKBUFX3 U266 ( .A(n307), .Y(n286) );
  CLKINVX1 U267 ( .A(so_valid), .Y(n307) );
  CLKINVX1 U268 ( .A(n87), .Y(n305) );
  NOR2X2 U269 ( .A(n317), .B(n286), .Y(n88) );
  NAND3X1 U270 ( .A(N103), .B(N104), .C(N102), .Y(n53) );
  CLKINVX1 U271 ( .A(n30), .Y(n302) );
  CLKBUFX3 U272 ( .A(n94), .Y(n285) );
  OAI222XL U273 ( .A0(n306), .A1(n45), .B0(n305), .B1(n54), .C0(n18), .C1(n303), .Y(n94) );
  NAND2X2 U274 ( .A(n18), .B(n286), .Y(n31) );
  NAND2X1 U275 ( .A(n286), .B(n242), .Y(n82) );
  OAI22XL U276 ( .A0(n40), .A1(n41), .B0(n42), .B1(n43), .Y(n39) );
  OAI22XL U277 ( .A0(n44), .A1(n45), .B0(n46), .B1(n47), .Y(n38) );
  OAI22XL U278 ( .A0(n48), .A1(n49), .B0(n50), .B1(n51), .Y(n37) );
  OAI22XL U279 ( .A0(n50), .A1(n49), .B0(n42), .B1(n54), .Y(n62) );
  OAI22XL U280 ( .A0(n44), .A1(n47), .B0(n46), .B1(n41), .Y(n61) );
  OAI22XL U281 ( .A0(n48), .A1(n43), .B0(n40), .B1(n53), .Y(n60) );
  INVX3 U282 ( .A(n242), .Y(n289) );
  OAI22XL U283 ( .A0(n286), .A1(n312), .B0(so_valid), .B1(n313), .Y(n157) );
  OAI22XL U284 ( .A0(n286), .A1(n311), .B0(so_valid), .B1(n312), .Y(n158) );
  OAI22XL U285 ( .A0(n286), .A1(n310), .B0(so_valid), .B1(n311), .Y(n159) );
  OAI22XL U286 ( .A0(n286), .A1(n309), .B0(so_valid), .B1(n310), .Y(n160) );
  OAI22XL U287 ( .A0(n286), .A1(n308), .B0(so_valid), .B1(n309), .Y(n161) );
  INVX3 U288 ( .A(n242), .Y(n290) );
  CLKBUFX3 U289 ( .A(n294), .Y(n288) );
  CLKBUFX3 U290 ( .A(n294), .Y(n287) );
  NAND2XL U291 ( .A(n269), .B(n268), .Y(n267) );
  NAND2XL U292 ( .A(n271), .B(n270), .Y(n266) );
  NAND2XL U293 ( .A(n269), .B(n268), .Y(n255) );
  NAND2XL U294 ( .A(n271), .B(n270), .Y(n254) );
  OAI222XL U295 ( .A0(n298), .A1(n77), .B0(n296), .B1(n242), .C0(n150), .C1(
        n289), .Y(n164) );
  CLKINVX1 U296 ( .A(n86), .Y(n298) );
  CLKINVX1 U297 ( .A(pi_length[0]), .Y(n299) );
  CLKINVX1 U298 ( .A(n122), .Y(n296) );
  OAI33X1 U299 ( .A0(pi_length[0]), .A1(pi_low), .A2(pi_length[1]), .B0(n299), 
        .B1(pi_fill), .B2(n297), .Y(n122) );
  CLKINVX1 U300 ( .A(pi_length[1]), .Y(n297) );
  OAI221XL U301 ( .A0(n166), .A1(n82), .B0(n296), .B1(n242), .C0(n85), .Y(n187) );
  AOI222XL U302 ( .A0(n81), .A1(n86), .B0(N165), .B1(n87), .C0(N170), .C1(n88), 
        .Y(n85) );
  OAI211X1 U303 ( .A0(pi_low), .A1(pi_length[1]), .B0(n289), .C0(n91), .Y(n80)
         );
  OA21XL U304 ( .A0(n297), .A1(pi_fill), .B0(n299), .Y(n91) );
  OAI221XL U305 ( .A0(n280), .A1(n82), .B0(n299), .B1(n77), .C0(n89), .Y(n188)
         );
  AOI221XL U306 ( .A0(N169), .A1(n88), .B0(N164), .B1(n87), .C0(n295), .Y(n89)
         );
  CLKINVX1 U307 ( .A(n80), .Y(n295) );
  NAND2X1 U308 ( .A(N202), .B(n285), .Y(n105) );
  NAND2X1 U309 ( .A(N203), .B(n285), .Y(n112) );
  NAND2X1 U310 ( .A(N196), .B(n285), .Y(n113) );
  NAND2X1 U311 ( .A(N201), .B(n285), .Y(n104) );
  NAND2X1 U312 ( .A(N200), .B(n285), .Y(n102) );
  XNOR2X1 U313 ( .A(pi_length[1]), .B(n299), .Y(n86) );
  OAI221XL U314 ( .A0(n300), .A1(n299), .B0(n171), .B1(n289), .C0(n80), .Y(
        n185) );
  CLKINVX1 U315 ( .A(n81), .Y(n300) );
  NAND2X1 U316 ( .A(N153), .B(n289), .Y(n77) );
  OAI211X1 U317 ( .A0(n281), .A1(n82), .B0(n106), .C0(n107), .Y(n195) );
  NAND2X1 U318 ( .A(N168), .B(n88), .Y(n106) );
  AOI21X1 U319 ( .A0(N163), .A1(n87), .B0(n81), .Y(n107) );
  OAI211X1 U320 ( .A0(n282), .A1(n82), .B0(n108), .C0(n109), .Y(n196) );
  NAND2X1 U321 ( .A(N167), .B(n88), .Y(n108) );
  AOI21X1 U322 ( .A0(N162), .A1(n87), .B0(n81), .Y(n109) );
  OAI211X1 U323 ( .A0(n283), .A1(n82), .B0(n110), .C0(n111), .Y(n197) );
  NAND2X1 U324 ( .A(n283), .B(n88), .Y(n110) );
  AOI21X1 U325 ( .A0(n283), .A1(n87), .B0(n81), .Y(n111) );
  OAI21XL U326 ( .A0(n151), .A1(n289), .B0(n77), .Y(n186) );
  OAI21XL U327 ( .A0(n153), .A1(n289), .B0(n77), .Y(n184) );
  OAI21XL U328 ( .A0(n152), .A1(n289), .B0(n77), .Y(n183) );
  OAI21XL U329 ( .A0(n165), .A1(n289), .B0(n77), .Y(n156) );
  OAI21XL U330 ( .A0(n302), .A1(n18), .B0(n19), .Y(nxt_state[0]) );
  AOI33X1 U331 ( .A0(n314), .A1(so_valid), .A2(pi_end), .B0(n304), .B1(n316), 
        .B2(load), .Y(n19) );
  CLKINVX1 U332 ( .A(n17), .Y(n314) );
  OAI22XL U333 ( .A0(n302), .A1(n304), .B0(n15), .B1(n286), .Y(nxt_state[1])
         );
  NOR2X1 U334 ( .A(pi_end), .B(n17), .Y(n15) );
  BUFX16 U335 ( .A(N365), .Y(so_valid) );
  NOR2X1 U336 ( .A(n316), .B(state[0]), .Y(N365) );
  NOR2X2 U337 ( .A(n286), .B(n165), .Y(n87) );
  INVX3 U338 ( .A(state[1]), .Y(n316) );
  OAI2BB2XL U339 ( .B0(n316), .B1(n146), .A0N(pi_data[15]), .A1N(n289), .Y(
        n213) );
  OAI2BB2XL U340 ( .B0(n316), .B1(n148), .A0N(pi_data[0]), .A1N(n289), .Y(n212) );
  OAI2BB2XL U341 ( .B0(n316), .B1(n142), .A0N(pi_data[1]), .A1N(n289), .Y(n211) );
  OAI2BB2XL U342 ( .B0(n316), .B1(n144), .A0N(pi_data[2]), .A1N(n289), .Y(n210) );
  OAI2BB2XL U343 ( .B0(n316), .B1(n138), .A0N(pi_data[3]), .A1N(n289), .Y(n209) );
  OAI2BB2XL U344 ( .B0(n316), .B1(n140), .A0N(pi_data[4]), .A1N(n289), .Y(n208) );
  OAI2BB2XL U345 ( .B0(n316), .B1(n134), .A0N(pi_data[5]), .A1N(n289), .Y(n207) );
  OAI2BB2XL U346 ( .B0(n316), .B1(n136), .A0N(pi_data[6]), .A1N(n290), .Y(n206) );
  OAI2BB2XL U347 ( .B0(n316), .B1(n145), .A0N(pi_data[7]), .A1N(n290), .Y(n205) );
  OAI2BB2XL U348 ( .B0(n316), .B1(n147), .A0N(pi_data[8]), .A1N(n290), .Y(n204) );
  OAI2BB2XL U349 ( .B0(n316), .B1(n141), .A0N(pi_data[9]), .A1N(n290), .Y(n203) );
  OAI2BB2XL U350 ( .B0(n316), .B1(n143), .A0N(pi_data[10]), .A1N(n290), .Y(
        n202) );
  OAI2BB2XL U351 ( .B0(n316), .B1(n137), .A0N(pi_data[11]), .A1N(n290), .Y(
        n201) );
  OAI2BB2XL U352 ( .B0(n316), .B1(n139), .A0N(pi_data[12]), .A1N(n290), .Y(
        n200) );
  OAI2BB2XL U353 ( .B0(n316), .B1(n133), .A0N(pi_data[13]), .A1N(n290), .Y(
        n199) );
  OAI2BB2XL U354 ( .B0(n316), .B1(n135), .A0N(pi_data[14]), .A1N(n289), .Y(
        n198) );
  NAND3X1 U355 ( .A(n282), .B(n283), .C(n281), .Y(n51) );
  NAND4XL U356 ( .A(n333), .B(n119), .C(n332), .D(n120), .Y(n30) );
  NOR3X1 U357 ( .A(n321), .B(n172), .C(n173), .Y(n120) );
  NOR4X1 U358 ( .A(n220), .B(n244), .C(n18), .D(n174), .Y(n119) );
  NAND2X1 U359 ( .A(n154), .B(n30), .Y(n155) );
  AND2X2 U360 ( .A(n119), .B(n125), .Y(N186) );
  OAI22XL U361 ( .A0(n286), .A1(n308), .B0(n31), .B1(n131), .Y(n177) );
  OAI22XL U362 ( .A0(n286), .A1(n309), .B0(n31), .B1(n130), .Y(n178) );
  OAI22XL U363 ( .A0(n286), .A1(n310), .B0(n31), .B1(n129), .Y(n179) );
  OAI22XL U364 ( .A0(n286), .A1(n311), .B0(n31), .B1(n128), .Y(n180) );
  OAI22XL U365 ( .A0(n286), .A1(n312), .B0(n31), .B1(n127), .Y(n181) );
  OAI22XL U366 ( .A0(n286), .A1(n313), .B0(n31), .B1(n126), .Y(n182) );
  OAI2BB2XL U367 ( .B0(n31), .B1(n149), .A0N(so_valid), .A1N(n32), .Y(n175) );
  OAI22XL U368 ( .A0(n33), .A1(n317), .B0(n165), .B1(n35), .Y(n32) );
  NOR4X1 U369 ( .A(n59), .B(n60), .C(n61), .D(n62), .Y(n33) );
  NOR4X1 U370 ( .A(n36), .B(n37), .C(n38), .D(n39), .Y(n35) );
  NAND3X1 U371 ( .A(N103), .B(N104), .C(n283), .Y(n54) );
  ADDHXL U372 ( .A(N103), .B(N102), .CO(\add_157_S2/carry [2]), .S(N162) );
  ADDHXL U373 ( .A(N104), .B(\add_157_S2/carry [2]), .CO(\add_157_S2/carry [3]), .S(N163) );
  ADDHXL U374 ( .A(N105), .B(\add_157_S2/carry [3]), .CO(\add_157_S2/carry [4]), .S(N164) );
  NAND3X1 U375 ( .A(n282), .B(N102), .C(n281), .Y(n45) );
  OA22X1 U376 ( .A0(n148), .A1(n56), .B0(n147), .B1(n57), .Y(n55) );
  CLKINVX1 U377 ( .A(n58), .Y(n318) );
  OAI32X1 U378 ( .A0(n320), .A1(n146), .A2(N106), .B0(n57), .B1(n145), .Y(n58)
         );
  NAND2X2 U379 ( .A(n280), .B(N106), .Y(n56) );
  OA22X1 U380 ( .A0(n143), .A1(n57), .B0(n144), .B1(n56), .Y(n42) );
  OA22X1 U381 ( .A0(n137), .A1(n57), .B0(n138), .B1(n56), .Y(n46) );
  OA22X1 U382 ( .A0(n135), .A1(n57), .B0(n136), .B1(n56), .Y(n50) );
  CLKINVX1 U383 ( .A(n280), .Y(n320) );
  OA22X1 U384 ( .A0(n141), .A1(n57), .B0(n142), .B1(n56), .Y(n40) );
  OA22X1 U385 ( .A0(n133), .A1(n57), .B0(n134), .B1(n56), .Y(n44) );
  NAND2X2 U386 ( .A(n166), .B(n320), .Y(n57) );
  OA22X1 U387 ( .A0(n139), .A1(n57), .B0(n140), .B1(n56), .Y(n48) );
  OA22X1 U388 ( .A0(n145), .A1(n56), .B0(n146), .B1(n57), .Y(n67) );
  CLKINVX1 U389 ( .A(n68), .Y(n319) );
  OAI32X1 U390 ( .A0(n166), .A1(n148), .A2(n280), .B0(n56), .B1(n147), .Y(n68)
         );
  NAND3X1 U391 ( .A(n283), .B(N104), .C(n282), .Y(n43) );
  NAND3X1 U392 ( .A(N102), .B(N104), .C(n282), .Y(n41) );
  NAND3X1 U393 ( .A(N102), .B(N103), .C(n281), .Y(n47) );
  NAND3X1 U394 ( .A(n283), .B(N103), .C(n281), .Y(n49) );
  NAND4X1 U395 ( .A(n22), .B(n23), .C(n24), .D(n25), .Y(n17) );
  XNOR2X1 U396 ( .A(n153), .B(n281), .Y(n22) );
  XNOR2X1 U397 ( .A(n152), .B(n282), .Y(n23) );
  XNOR2X1 U398 ( .A(n151), .B(n283), .Y(n25) );
  NOR2X1 U399 ( .A(n26), .B(n27), .Y(n24) );
  XNOR2X1 U400 ( .A(n320), .B(n171), .Y(n26) );
  XNOR2X1 U401 ( .A(n150), .B(N106), .Y(n27) );
  OAI22XL U402 ( .A0(data_buf[13]), .A1(n269), .B0(data_buf[12]), .B1(n268), 
        .Y(n249) );
  OAI22XL U403 ( .A0(data_buf[15]), .A1(n271), .B0(data_buf[14]), .B1(n270), 
        .Y(n248) );
  OAI21XL U404 ( .A0(n249), .A1(n248), .B0(N104), .Y(n253) );
  OAI22XL U405 ( .A0(data_buf[9]), .A1(n269), .B0(data_buf[8]), .B1(n268), .Y(
        n251) );
  OAI22XL U406 ( .A0(data_buf[11]), .A1(n271), .B0(data_buf[10]), .B1(n270), 
        .Y(n250) );
  OAI21XL U407 ( .A0(n251), .A1(n250), .B0(n281), .Y(n252) );
  AOI21X1 U408 ( .A0(n253), .A1(n252), .B0(n280), .Y(n279) );
  OAI21XL U409 ( .A0(n255), .A1(n254), .B0(N104), .Y(n259) );
  OAI21XL U410 ( .A0(n257), .A1(n256), .B0(n281), .Y(n258) );
  AOI21X1 U411 ( .A0(n259), .A1(n258), .B0(N105), .Y(n278) );
  OAI22XL U412 ( .A0(data_buf[21]), .A1(n269), .B0(data_buf[20]), .B1(n268), 
        .Y(n261) );
  OAI22XL U413 ( .A0(data_buf[23]), .A1(n271), .B0(data_buf[22]), .B1(n270), 
        .Y(n260) );
  OAI21XL U414 ( .A0(n261), .A1(n260), .B0(N104), .Y(n265) );
  OAI22XL U415 ( .A0(data_buf[17]), .A1(n269), .B0(data_buf[16]), .B1(n268), 
        .Y(n263) );
  OAI22XL U416 ( .A0(data_buf[19]), .A1(n271), .B0(data_buf[18]), .B1(n270), 
        .Y(n262) );
  OAI21XL U417 ( .A0(n263), .A1(n262), .B0(n281), .Y(n264) );
  AOI21X1 U418 ( .A0(n265), .A1(n264), .B0(N105), .Y(n277) );
  OAI21XL U419 ( .A0(n267), .A1(n266), .B0(N104), .Y(n275) );
  OAI21XL U420 ( .A0(n273), .A1(n272), .B0(n281), .Y(n274) );
  AOI21X1 U421 ( .A0(n275), .A1(n274), .B0(n280), .Y(n276) );
  OAI22XL U422 ( .A0(n286), .A1(n315), .B0(n31), .B1(n132), .Y(n176) );
  OAI22XL U423 ( .A0(n286), .A1(n315), .B0(so_valid), .B1(n308), .Y(n162) );
  XOR2X1 U424 ( .A(\add_157_S2/carry [4]), .B(N106), .Y(N165) );
  NOR2X1 U425 ( .A(N103), .B(N102), .Y(n291) );
  AO21X1 U426 ( .A0(N102), .A1(N103), .B0(n291), .Y(N167) );
  NAND2X1 U427 ( .A(n291), .B(n281), .Y(n292) );
  OAI21XL U428 ( .A0(n291), .A1(n281), .B0(n292), .Y(N168) );
  XNOR2X1 U429 ( .A(N105), .B(n292), .Y(N169) );
  NOR2X1 U430 ( .A(N105), .B(n292), .Y(n293) );
  XOR2X1 U431 ( .A(N106), .B(n293), .Y(N170) );
endmodule

