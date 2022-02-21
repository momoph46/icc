/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Mon Feb 21 13:16:56 2022
/////////////////////////////////////////////////////////////


module SME ( clk, reset, chardata, isstring, ispattern, valid, match, 
        match_index );
  input [7:0] chardata;
  output [4:0] match_index;
  input clk, reset, isstring, ispattern;
  output valid, match;
  wire   N182, N183, N184, N225, N226, N227, N228, N229, N230,
         \pat_temp[7][7] , \pat_temp[7][6] , \pat_temp[7][5] ,
         \pat_temp[7][4] , \pat_temp[7][3] , \pat_temp[7][2] ,
         \pat_temp[7][1] , \pat_temp[7][0] , \pat_temp[6][7] ,
         \pat_temp[6][6] , \pat_temp[6][5] , \pat_temp[6][4] ,
         \pat_temp[6][3] , \pat_temp[6][2] , \pat_temp[6][1] ,
         \pat_temp[6][0] , \pat_temp[5][7] , \pat_temp[5][6] ,
         \pat_temp[5][5] , \pat_temp[5][4] , \pat_temp[5][3] ,
         \pat_temp[5][2] , \pat_temp[5][1] , \pat_temp[5][0] ,
         \pat_temp[4][7] , \pat_temp[4][6] , \pat_temp[4][5] ,
         \pat_temp[4][4] , \pat_temp[4][3] , \pat_temp[4][2] ,
         \pat_temp[4][1] , \pat_temp[4][0] , \pat_temp[3][7] ,
         \pat_temp[3][6] , \pat_temp[3][5] , \pat_temp[3][4] ,
         \pat_temp[3][3] , \pat_temp[3][2] , \pat_temp[3][1] ,
         \pat_temp[3][0] , \pat_temp[2][7] , \pat_temp[2][6] ,
         \pat_temp[2][5] , \pat_temp[2][4] , \pat_temp[2][3] ,
         \pat_temp[2][2] , \pat_temp[2][1] , \pat_temp[2][0] ,
         \pat_temp[1][7] , \pat_temp[1][6] , \pat_temp[1][5] ,
         \pat_temp[1][4] , \pat_temp[1][3] , \pat_temp[1][2] ,
         \pat_temp[1][1] , \pat_temp[1][0] , \pat_temp[0][7] ,
         \pat_temp[0][6] , \pat_temp[0][5] , \pat_temp[0][4] ,
         \pat_temp[0][3] , \pat_temp[0][2] , \pat_temp[0][1] ,
         \pat_temp[0][0] , star_mode, N304, N305, N306, N307, N336, N337, N338,
         N339, N340, N364, N366, N367, N368, N369, N371, N372, N373, N374,
         N375, N384, N385, N386, N387, N388, N588, N589, N590, N591, N592,
         N614, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n259, n260, n261, n262, n263, n264, n265,
         n266, n267, n268, n269, n270, n271, n272, n273, n274, n275, n276,
         n277, n278, n279, n280, n281, n282, n283, n284, n285, n286, n287,
         n288, n289, n290, n291, n292, n293, n294, n295, n296, n297, n298,
         n299, n300, n301, n302, n303, n304, n305, n306, n307, n308, n309,
         n310, n311, n312, n313, n314, n315, n316, n317, n318, n319, n320,
         n321, n322, n323, n324, n325, n326, n327, n328, n329, n330, n331,
         n332, n333, n334, n335, n336, n337, n338, n339, n340, n341, n342,
         n343, n344, n345, n346, n347, n348, n349, n350, n351, n352, n353,
         n354, n355, n356, n357, n358, n359, n360, n361, n362, n363, n365,
         n366, n375, n376, n377, n378, n379, n380, n381, n382, n383, n384,
         n385, n386, n387, n388, n389, n390, n391, n392, n393, n394, n395,
         n396, n397, n398, n399, n400, n401, n402, n403, n404, n405, n406,
         n407, n408, n409, n410, n411, n412, n413, n414, n415, n416, n417,
         n418, n419, n420, n421, n422, n423, n424, n425, n426, n427, n428,
         n429, n430, n431, n432, n433, n434, n435, n436, n437, n438, n439,
         n440, n441, n442, n443, n444, n445, n446, n447, n448, n449, n450,
         n451, n452, n453, n454, n455, n456, n457, n458, n459, n460, n461,
         n462, n463, n464, n465, n466, n467, n468, n469, n470, n471, n472,
         n473, n474, n475, n476, n477, n478, n479, n480, n481, n482, n483,
         n484, n485, n486, n487, n488, n489, n490, n491, n492, n493, n494,
         n495, n496, n497, n498, n499, n500, n501, n502, n503, n504, n505,
         n506, n507, n508, n509, n510, n511, n512, n513, n514, n515, n516,
         n517, n518, n519, n520, n521, n522, n523, n524, n525, n526, n527,
         n528, n529, n530, n531, n532, n533, n534, n535, n536, n537, n538,
         n539, n540, n541, n542, n543, n544, n545, n546, n547, n548, n549,
         n550, n551, n552, n553, n554, n555, n556, n557, n558, n559, n560,
         n561, n562, n563, n564, n565, n566, n567, n568, n569, n570, n571,
         n572, n573, n574, n575, n576, n577, n578, n579, n580, n581, n582,
         n583, n584, n585, n586, n587, n588, n589, n590, n591, n592, n593,
         n594, n595, n596, n597, n598, n599, n600, n601, n602, n603, n604,
         n605, n606, n607, n608, n609, n610, n611, n612, n613, n614, n615,
         n616, n617, n618, n619, n620, n621, n622, n623, n624, n625, n626,
         n627, n628, n629, n630, n631, n632, n633, n634, n635, n636, n637,
         n638, n639, n640, n641, n642, n643, n644, n645, n646, n647, n648,
         n649, n650, n651, n652, n653, n654, n655, n656, n657, n658, n659,
         n660, n661, n662, n663, n664, n665, n666, n667, n668, n669, n670,
         n671, n672, n673, n674, n675, n676, n677, n678, n679, n680, n681,
         n682, n683, n684, n685, n686, n687, n688, n689, n690, n691, n692,
         n693, n694, n695, n696, n697, n698, n699, n700, n701, n702, n703,
         n704, n705, n706, n707, n708, n709, n710, n711, n712, n713, n714,
         n715, n716, n717, n718, n719, n720, n721, n722, n723, n724, n725,
         n726, n727, n728, n729, n730, n731, n732, n733, n734, n735, n736,
         n737, n738, n739, n740, n741, n742, n743, n744, n745, n746, n747,
         n748, n749, n750, n751, n752, n753, n754, n755, n756, n757, n758,
         n759, n760, n761, n762, n763, n764, n765, n766, n767, n768, n769,
         n770, n771, n772, n773, n774, n775, n776, n777, n778, n779, n780,
         n781, n782, n783, n784, n785, n786, n787, n788, n789, n790, n791,
         n792, n793, n794, n795, n796, n797, n798, n799, n800, n801, n802,
         n803, n804, n805, n806, n807, n808, n809, n810, n811, n812, n813,
         n814, n815, n816, n817, n818, n819, n820, n821, n822, n823, n824,
         n825, n826, n827, n828, n829, n830, n831, n832, n833, n834, n835,
         n836, n837, n838, n839, n840, n841, n842, n843, n844, n845, n846,
         n847, n848, n849, n850, n851, n852, n853, n854, n855, n856, n857,
         n858, n859, n860, n861, n862, n863, n864, n865, n866, n867, n868,
         n869, n870, n871, n872, n873, n874, n875, n876, n877, n878, n879,
         n880, n881, n882, n883, n884, n885, n886, n887, n888, n889, n890,
         n891, n892, n893, n894, n895, n896, n897, n898, n899, n900, n901,
         n902, n903, n904, n905, n906, n907, n908, n909, n910, n911, n912,
         n913, n914, n915, n916, n917, n918, n919, n920, n921, n922, n923,
         n924, n925, n926, n927, n928, n929, n930, n931, n932, n933, n934,
         n935, n936, n937, n938, n939, n940, n941, n942, n943, n944, n945,
         n946, n947, n948, n949, n950, n951, n952, n953, n954, n955, n956,
         n957, n958, n959, n960, n961, n962, n963, n964, n965, n966, n967,
         n968, n969, n970, n971, n972, n973, n974, n975, n976, n977, n978,
         n979, n980, n981, n982, n983, n984, n985, n986, n987, n988, n989,
         n990, n991, n992, n993, n994, n995, n996, n997, n998, n999, n1000,
         n1001, n1002, n1003, n1004, n1005, n1006, n1007, n1008, n1009, n1010,
         n1011, n1012, n1013, n1014, n1015, n1016, n1017, n1018, n1019, n1020,
         n1021, n1022, n1023, n1024, n1025, n1026, n1027, n1028, n1029, n1030,
         n1031, n1032, n1033, n1034, n1035, n1036, n1037, n1038, n1039, n1040,
         n1041, n1042, n1043, n1044, n1045, n1046, n1047, n1048, n1049, n1050,
         n1051, n1052, n1053, n1054, n1055, n1056, n1057, n1058, n1059, n1060,
         n1061, n1062, n1063, n1064, n1065, n1066, n1067, n1068, n1069, n1070,
         n1071, n1072, n1073, n1074, n1075, n1076, n1077, n1078, n1079, n1080,
         n1081, n1082, n1083, n1084, n1085, n1086, n1087, n1088, n1089, n1090,
         n1091, n1092, n1093, n1094, n1095, n1096, n1097, n1098, n1099, n1100,
         n1101, n1102, n1103, n1104, n1105, n1106, n1107, n1108, n1109, n1110,
         n1111, n1112, n1113, n1114, n1115, n1116, n1117, n1118, n1119, n1120,
         n1121, n1122, n1123, n1124, n1125, n1126, n1127, n1128, n1129, n1130,
         n1131, n1132, n1133, n1134, n1135, n1136, n1137, n1138, n1139, n1140,
         n1141, n1142, n1143, n1144, n1145, n1146, n1147, n1148, n1149, n1150,
         \sub_103_aco/B[0] , n1151, n1152, n1153, n1154, n1155, n1156, n1163,
         n1164, n1165, n1166, n1167, n1168, n1169, n1170, n1171, n1172, n1173,
         n1174, n1175, n1176, n1177, n1178, n1179, n1180, n1181, n1182, n1183,
         n1184, n1185, n1186, n1187, n1188, n1189, n1190, n1191, n1192, n1193,
         n1194, n1195, n1196, n1197, n1198, n1199, n1200, n1201, n1202, n1203,
         n1204, n1205, n1206, n1207, n1208, n1209, n1210, n1211, n1212, n1213,
         n1214, n1215, n1216, n1217, n1218, n1219, n1220, n1221, n1222, n1223,
         n1224, n1225, n1226, n1227, n1228, n1229, n1230, n1231, n1232, n1233,
         n1234, n1235, n1236, n1237, n1238, n1239, n1240, n1241, n1242, n1243,
         n1244, n1245, n1246, n1247, n1248, n1249, n1250, n1251, n1252, n1253,
         n1254, n1255, n1256, n1257, n1258, n1259, n1260, n1261, n1262, n1263,
         n1264, n1265, n1266, n1267, n1268, n1269, n1270, n1271, n1272, n1273,
         n1274, n1275, n1276, n1277, n1278, n1279, n1280, n1281, n1282, n1283,
         n1284, n1285, n1286, n1287, n1288, n1289, n1290, n1291, n1292, n1293,
         n1294, n1295, n1296, n1297, n1298, n1299, n1300, n1301, n1302, n1303,
         n1304, n1305, n1306, n1307, n1308, n1309, n1310, n1311, n1312, n1313,
         n1314, n1315, n1316, n1317, n1318, n1319, n1320, n1321, n1322, n1323,
         n1324, n1325, n1326, n1327, n1328, n1329, n1330, n1331, n1332, n1333;
  wire   [3:0] state;
  wire   [3:0] next_state;
  wire   [5:0] counter;
  wire   [5:0] str_len;
  wire   [3:0] pat_len;
  wire   [7:0] pat_cell;
  wire   [3:0] m_reg;
  wire   [4:0] mat_idx2;
  wire   [5:2] \add_171_S2/carry ;
  wire   [5:2] \add_122_S2/carry ;
  wire   [5:1] \add_120/carry ;
  wire   [5:1] \add_119_S2/carry ;
  wire   [5:0] \sub_103_aco/carry ;
  wire   [5:2] \r427/carry ;

  OAI211X2 U508 ( .A0(n516), .A1(n1328), .B0(n401), .C0(n1329), .Y(
        next_state[1]) );
  DFFRX1 \mat_idx2_reg[0]  ( .D(n792), .CK(clk), .RN(n1251), .Q(N364) );
  DFFRX1 \m_reg_reg[3]  ( .D(N307), .CK(clk), .RN(n1261), .Q(m_reg[3]) );
  DFFRX1 \mat_idx2_reg[4]  ( .D(n788), .CK(clk), .RN(n1254), .Q(mat_idx2[4])
         );
  DFFRX1 \mat_idx2_reg[3]  ( .D(n789), .CK(clk), .RN(n1254), .Q(mat_idx2[3])
         );
  DFFRX1 \m_reg_reg[2]  ( .D(N306), .CK(clk), .RN(n1261), .Q(m_reg[2]) );
  DFFRX1 \m_reg_reg[1]  ( .D(N305), .CK(clk), .RN(n1261), .Q(m_reg[1]) );
  DFFRX1 \mat_idx2_reg[2]  ( .D(n790), .CK(clk), .RN(n1254), .Q(mat_idx2[2])
         );
  DFFRX1 \mat_idx2_reg[1]  ( .D(n791), .CK(clk), .RN(n1254), .Q(mat_idx2[1]), 
        .QN(n1156) );
  DFFRX1 \pat_temp_reg[1][0]  ( .D(n1136), .CK(clk), .RN(n1259), .Q(
        \pat_temp[1][0] ) );
  DFFRX1 \pat_temp_reg[0][0]  ( .D(n1144), .CK(clk), .RN(n1260), .Q(
        \pat_temp[0][0] ) );
  DFFRX1 \pat_temp_reg[3][0]  ( .D(n1120), .CK(clk), .RN(n1255), .Q(
        \pat_temp[3][0] ) );
  DFFRX1 \pat_temp_reg[2][0]  ( .D(n1128), .CK(clk), .RN(n1256), .Q(
        \pat_temp[2][0] ) );
  DFFRX1 \pat_temp_reg[4][0]  ( .D(n1112), .CK(clk), .RN(n1257), .Q(
        \pat_temp[4][0] ) );
  DFFRX1 \pat_temp_reg[5][1]  ( .D(n1097), .CK(clk), .RN(n1258), .Q(
        \pat_temp[5][1] ) );
  DFFRX1 \pat_temp_reg[5][3]  ( .D(n1099), .CK(clk), .RN(n1258), .Q(
        \pat_temp[5][3] ) );
  DFFRX1 \pat_temp_reg[5][5]  ( .D(n1101), .CK(clk), .RN(n1258), .Q(
        \pat_temp[5][5] ) );
  DFFRX1 \pat_temp_reg[5][0]  ( .D(n1104), .CK(clk), .RN(n1259), .Q(
        \pat_temp[5][0] ) );
  DFFRX1 \pat_temp_reg[6][0]  ( .D(n1096), .CK(clk), .RN(n1257), .Q(
        \pat_temp[6][0] ) );
  DFFRX1 \pat_temp_reg[7][1]  ( .D(n1081), .CK(clk), .RN(n1257), .Q(
        \pat_temp[7][1] ) );
  DFFRX1 \pat_temp_reg[7][3]  ( .D(n1083), .CK(clk), .RN(n1258), .Q(
        \pat_temp[7][3] ) );
  DFFRX1 \pat_temp_reg[7][5]  ( .D(n1085), .CK(clk), .RN(n1258), .Q(
        \pat_temp[7][5] ) );
  DFFRX1 \pat_temp_reg[7][0]  ( .D(n1088), .CK(clk), .RN(n1258), .Q(
        \pat_temp[7][0] ) );
  DFFRX1 \pat_temp_reg[1][1]  ( .D(n1129), .CK(clk), .RN(n1259), .Q(
        \pat_temp[1][1] ) );
  DFFRX1 \pat_temp_reg[1][2]  ( .D(n1130), .CK(clk), .RN(n1259), .Q(
        \pat_temp[1][2] ) );
  DFFRX1 \pat_temp_reg[1][3]  ( .D(n1131), .CK(clk), .RN(n1259), .Q(
        \pat_temp[1][3] ) );
  DFFRX1 \pat_temp_reg[1][4]  ( .D(n1132), .CK(clk), .RN(n1259), .Q(
        \pat_temp[1][4] ) );
  DFFRX1 \pat_temp_reg[1][5]  ( .D(n1133), .CK(clk), .RN(n1259), .Q(
        \pat_temp[1][5] ) );
  DFFRX1 \pat_temp_reg[1][6]  ( .D(n1134), .CK(clk), .RN(n1259), .Q(
        \pat_temp[1][6] ) );
  DFFRX1 \pat_temp_reg[1][7]  ( .D(n1135), .CK(clk), .RN(n1259), .Q(
        \pat_temp[1][7] ) );
  DFFRX1 \pat_temp_reg[0][1]  ( .D(n1137), .CK(clk), .RN(n1259), .Q(
        \pat_temp[0][1] ) );
  DFFRX1 \pat_temp_reg[0][2]  ( .D(n1138), .CK(clk), .RN(n1260), .Q(
        \pat_temp[0][2] ) );
  DFFRX1 \pat_temp_reg[0][3]  ( .D(n1139), .CK(clk), .RN(n1260), .Q(
        \pat_temp[0][3] ) );
  DFFRX1 \pat_temp_reg[0][4]  ( .D(n1140), .CK(clk), .RN(n1260), .Q(
        \pat_temp[0][4] ) );
  DFFRX1 \pat_temp_reg[0][5]  ( .D(n1141), .CK(clk), .RN(n1260), .Q(
        \pat_temp[0][5] ) );
  DFFRX1 \pat_temp_reg[0][6]  ( .D(n1142), .CK(clk), .RN(n1260), .Q(
        \pat_temp[0][6] ) );
  DFFRX1 \pat_temp_reg[0][7]  ( .D(n1143), .CK(clk), .RN(n1260), .Q(
        \pat_temp[0][7] ) );
  DFFRX1 \pat_temp_reg[3][1]  ( .D(n1113), .CK(clk), .RN(n1255), .Q(
        \pat_temp[3][1] ) );
  DFFRX1 \pat_temp_reg[3][2]  ( .D(n1114), .CK(clk), .RN(n1255), .Q(
        \pat_temp[3][2] ) );
  DFFRX1 \pat_temp_reg[3][3]  ( .D(n1115), .CK(clk), .RN(n1255), .Q(
        \pat_temp[3][3] ) );
  DFFRX1 \pat_temp_reg[3][4]  ( .D(n1116), .CK(clk), .RN(n1255), .Q(
        \pat_temp[3][4] ) );
  DFFRX1 \pat_temp_reg[3][5]  ( .D(n1117), .CK(clk), .RN(n1255), .Q(
        \pat_temp[3][5] ) );
  DFFRX1 \pat_temp_reg[3][6]  ( .D(n1118), .CK(clk), .RN(n1255), .Q(
        \pat_temp[3][6] ) );
  DFFRX1 \pat_temp_reg[3][7]  ( .D(n1119), .CK(clk), .RN(n1255), .Q(
        \pat_temp[3][7] ) );
  DFFRX1 \pat_temp_reg[2][1]  ( .D(n1121), .CK(clk), .RN(n1255), .Q(
        \pat_temp[2][1] ) );
  DFFRX1 \pat_temp_reg[2][2]  ( .D(n1122), .CK(clk), .RN(n1256), .Q(
        \pat_temp[2][2] ) );
  DFFRX1 \pat_temp_reg[2][3]  ( .D(n1123), .CK(clk), .RN(n1256), .Q(
        \pat_temp[2][3] ) );
  DFFRX1 \pat_temp_reg[2][4]  ( .D(n1124), .CK(clk), .RN(n1256), .Q(
        \pat_temp[2][4] ) );
  DFFRX1 \pat_temp_reg[2][5]  ( .D(n1125), .CK(clk), .RN(n1256), .Q(
        \pat_temp[2][5] ) );
  DFFRX1 \pat_temp_reg[2][6]  ( .D(n1126), .CK(clk), .RN(n1256), .Q(
        \pat_temp[2][6] ) );
  DFFRX1 \pat_temp_reg[2][7]  ( .D(n1127), .CK(clk), .RN(n1256), .Q(
        \pat_temp[2][7] ) );
  DFFRX1 \pat_temp_reg[4][1]  ( .D(n1105), .CK(clk), .RN(n1257), .Q(
        \pat_temp[4][1] ) );
  DFFRX1 \pat_temp_reg[4][2]  ( .D(n1106), .CK(clk), .RN(n1257), .Q(
        \pat_temp[4][2] ) );
  DFFRX1 \pat_temp_reg[4][3]  ( .D(n1107), .CK(clk), .RN(n1257), .Q(
        \pat_temp[4][3] ) );
  DFFRX1 \pat_temp_reg[4][4]  ( .D(n1108), .CK(clk), .RN(n1257), .Q(
        \pat_temp[4][4] ) );
  DFFRX1 \pat_temp_reg[4][5]  ( .D(n1109), .CK(clk), .RN(n1257), .Q(
        \pat_temp[4][5] ) );
  DFFRX1 \pat_temp_reg[4][6]  ( .D(n1110), .CK(clk), .RN(n1257), .Q(
        \pat_temp[4][6] ) );
  DFFRX1 \pat_temp_reg[4][7]  ( .D(n1111), .CK(clk), .RN(n1257), .Q(
        \pat_temp[4][7] ) );
  DFFRX1 \pat_temp_reg[5][2]  ( .D(n1098), .CK(clk), .RN(n1258), .Q(
        \pat_temp[5][2] ) );
  DFFRX1 \pat_temp_reg[5][4]  ( .D(n1100), .CK(clk), .RN(n1258), .Q(
        \pat_temp[5][4] ) );
  DFFRX1 \pat_temp_reg[5][6]  ( .D(n1102), .CK(clk), .RN(n1259), .Q(
        \pat_temp[5][6] ) );
  DFFRX1 \pat_temp_reg[5][7]  ( .D(n1103), .CK(clk), .RN(n1259), .Q(
        \pat_temp[5][7] ) );
  DFFRX1 \pat_temp_reg[6][1]  ( .D(n1089), .CK(clk), .RN(n1256), .Q(
        \pat_temp[6][1] ) );
  DFFRX1 \pat_temp_reg[6][2]  ( .D(n1090), .CK(clk), .RN(n1256), .Q(
        \pat_temp[6][2] ) );
  DFFRX1 \pat_temp_reg[6][3]  ( .D(n1091), .CK(clk), .RN(n1256), .Q(
        \pat_temp[6][3] ) );
  DFFRX1 \pat_temp_reg[6][4]  ( .D(n1092), .CK(clk), .RN(n1256), .Q(
        \pat_temp[6][4] ) );
  DFFRX1 \pat_temp_reg[6][5]  ( .D(n1093), .CK(clk), .RN(n1256), .Q(
        \pat_temp[6][5] ) );
  DFFRX1 \pat_temp_reg[6][6]  ( .D(n1094), .CK(clk), .RN(n1257), .Q(
        \pat_temp[6][6] ) );
  DFFRX1 \pat_temp_reg[6][7]  ( .D(n1095), .CK(clk), .RN(n1257), .Q(
        \pat_temp[6][7] ) );
  DFFRX1 \pat_temp_reg[7][2]  ( .D(n1082), .CK(clk), .RN(n1258), .Q(
        \pat_temp[7][2] ) );
  DFFRX1 \pat_temp_reg[7][4]  ( .D(n1084), .CK(clk), .RN(n1258), .Q(
        \pat_temp[7][4] ) );
  DFFRX1 \pat_temp_reg[7][6]  ( .D(n1086), .CK(clk), .RN(n1258), .Q(
        \pat_temp[7][6] ) );
  DFFRX1 \pat_temp_reg[7][7]  ( .D(n1087), .CK(clk), .RN(n1258), .Q(
        \pat_temp[7][7] ) );
  DFFRX1 \state_reg[2]  ( .D(next_state[2]), .CK(clk), .RN(n1253), .Q(state[2]) );
  DFFRX1 \state_reg[3]  ( .D(next_state[3]), .CK(clk), .RN(n1253), .Q(state[3]) );
  DFFRX1 \m_reg_reg[0]  ( .D(N304), .CK(clk), .RN(n1260), .Q(m_reg[0]) );
  DFFRX1 \pat_len_reg[2]  ( .D(n1146), .CK(clk), .RN(n1255), .Q(pat_len[2]) );
  DFFRX1 \pat_len_reg[3]  ( .D(n1145), .CK(clk), .RN(n1255), .Q(pat_len[3]) );
  DFFRX1 \state_reg[1]  ( .D(next_state[1]), .CK(clk), .RN(n1253), .Q(state[1]) );
  DFFRX1 \pat_len_reg[0]  ( .D(n1150), .CK(clk), .RN(n1165), .Q(pat_len[0]), 
        .QN(n366) );
  DFFRX1 \counter_reg[1]  ( .D(n796), .CK(clk), .RN(n1164), .Q(counter[1]), 
        .QN(n80) );
  DFFRX1 \str_len_reg[1]  ( .D(n1079), .CK(clk), .RN(n1165), .Q(str_len[1]), 
        .QN(n363) );
  DFFRX1 \str_len_reg[2]  ( .D(n1078), .CK(clk), .RN(n1166), .Q(str_len[2]), 
        .QN(n362) );
  DFFRX1 \match_index_reg[4]  ( .D(n798), .CK(clk), .RN(n1165), .QN(n1154) );
  DFFRX1 \match_index_reg[3]  ( .D(n799), .CK(clk), .RN(n1164), .QN(n1155) );
  DFFRX1 \match_index_reg[2]  ( .D(n800), .CK(clk), .RN(n1164), .QN(n1151) );
  DFFRX1 \match_index_reg[1]  ( .D(n801), .CK(clk), .RN(n1166), .QN(N371) );
  DFFRX1 \match_index_reg[0]  ( .D(n802), .CK(clk), .RN(n1165), .QN(n1152) );
  DFFRX1 \state_reg[0]  ( .D(next_state[0]), .CK(clk), .RN(n1166), .Q(state[0]), .QN(n70) );
  DFFRX1 star_mode_reg ( .D(n1148), .CK(clk), .RN(n1165), .Q(star_mode), .QN(
        n75) );
  DFFRX1 \pat_len_reg[1]  ( .D(n1147), .CK(clk), .RN(n1164), .Q(pat_len[1]), 
        .QN(n365) );
  DFFRX1 \counter_reg[5]  ( .D(n787), .CK(clk), .RN(n1164), .Q(counter[5]), 
        .QN(n76) );
  DFFRX1 \counter_reg[4]  ( .D(n793), .CK(clk), .RN(n1166), .Q(counter[4]), 
        .QN(n77) );
  DFFRX1 \counter_reg[3]  ( .D(n794), .CK(clk), .RN(n1165), .Q(counter[3]), 
        .QN(n78) );
  DFFRX1 \counter_reg[2]  ( .D(n795), .CK(clk), .RN(n1166), .Q(counter[2]), 
        .QN(n79) );
  DFFRX1 \str_len_reg[5]  ( .D(n1075), .CK(clk), .RN(n1165), .Q(str_len[5]), 
        .QN(n359) );
  DFFRX1 \str_len_reg[4]  ( .D(n1076), .CK(clk), .RN(n1164), .Q(str_len[4]), 
        .QN(n360) );
  DFFRX1 \str_len_reg[3]  ( .D(n1077), .CK(clk), .RN(n1164), .Q(str_len[3]), 
        .QN(n361) );
  DFFRX1 \pat_idx_reg[1]  ( .D(n782), .CK(clk), .RN(n1166), .Q(N183), .QN(
        n1204) );
  DFFRX1 \pat_idx_reg[2]  ( .D(n780), .CK(clk), .RN(n1165), .Q(N184), .QN(
        n1203) );
  DFFRX1 match_reg ( .D(N614), .CK(clk), .RN(n1166), .QN(n1153) );
  DFFRX1 \m_reg2_reg[3]  ( .D(n783), .CK(clk), .RN(n1165), .QN(n71) );
  DFFRX1 \m_reg2_reg[2]  ( .D(n784), .CK(clk), .RN(n1164), .QN(n72) );
  DFFRX1 \m_reg2_reg[1]  ( .D(n785), .CK(clk), .RN(n1164), .QN(n73) );
  DFFRX1 \m_reg2_reg[0]  ( .D(n786), .CK(clk), .RN(n1166), .QN(n74) );
  DFFRX1 head_reg ( .D(n1149), .CK(clk), .RN(n1165), .Q(n1281), .QN(
        \sub_103_aco/B[0] ) );
  DFFRX1 \pat_idx_reg[3]  ( .D(n779), .CK(clk), .RN(n1166), .QN(n82) );
  DFFRX1 \str_temp_reg[0][7]  ( .D(n1073), .CK(clk), .RN(n1165), .QN(n351) );
  DFFRX1 \str_temp_reg[0][6]  ( .D(n1072), .CK(clk), .RN(n1164), .QN(n352) );
  DFFRX1 \str_temp_reg[0][5]  ( .D(n1071), .CK(clk), .RN(n1164), .QN(n353) );
  DFFRX1 \str_temp_reg[0][4]  ( .D(n1070), .CK(clk), .RN(n1166), .QN(n354) );
  DFFRX1 \str_temp_reg[0][3]  ( .D(n1069), .CK(clk), .RN(n1165), .QN(n355) );
  DFFRX1 \str_temp_reg[0][2]  ( .D(n1068), .CK(clk), .RN(n1166), .QN(n356) );
  DFFRX1 \str_temp_reg[0][1]  ( .D(n1067), .CK(clk), .RN(n1165), .QN(n357) );
  DFFRX1 \str_temp_reg[0][0]  ( .D(n1074), .CK(clk), .RN(n1164), .QN(n358) );
  DFFRX1 \str_temp_reg[31][7]  ( .D(n833), .CK(clk), .RN(n1164), .QN(n103) );
  DFFRX1 \str_temp_reg[31][6]  ( .D(n832), .CK(clk), .RN(n1166), .QN(n104) );
  DFFRX1 \str_temp_reg[31][5]  ( .D(n831), .CK(clk), .RN(n1165), .QN(n105) );
  DFFRX1 \str_temp_reg[31][4]  ( .D(n830), .CK(clk), .RN(n1166), .QN(n106) );
  DFFRX1 \str_temp_reg[31][3]  ( .D(n829), .CK(clk), .RN(n1165), .QN(n107) );
  DFFRX1 \str_temp_reg[31][2]  ( .D(n828), .CK(clk), .RN(n1164), .QN(n108) );
  DFFRX1 \str_temp_reg[31][1]  ( .D(n827), .CK(clk), .RN(n1164), .QN(n109) );
  DFFRX1 \str_temp_reg[31][0]  ( .D(n834), .CK(clk), .RN(n1166), .QN(n110) );
  DFFRX1 \str_temp_reg[30][7]  ( .D(n841), .CK(clk), .RN(n1165), .QN(n111) );
  DFFRX1 \str_temp_reg[30][6]  ( .D(n840), .CK(clk), .RN(n1166), .QN(n112) );
  DFFRX1 \str_temp_reg[30][5]  ( .D(n839), .CK(clk), .RN(n1165), .QN(n113) );
  DFFRX1 \str_temp_reg[30][4]  ( .D(n838), .CK(clk), .RN(n1164), .QN(n114) );
  DFFRX1 \str_temp_reg[30][3]  ( .D(n837), .CK(clk), .RN(n1164), .QN(n115) );
  DFFRX1 \str_temp_reg[30][2]  ( .D(n836), .CK(clk), .RN(n1166), .QN(n116) );
  DFFRX1 \str_temp_reg[30][1]  ( .D(n835), .CK(clk), .RN(n1165), .QN(n117) );
  DFFRX1 \str_temp_reg[30][0]  ( .D(n842), .CK(clk), .RN(n1166), .QN(n118) );
  DFFRX1 \str_temp_reg[17][7]  ( .D(n945), .CK(clk), .RN(n1165), .QN(n215) );
  DFFRX1 \str_temp_reg[17][6]  ( .D(n944), .CK(clk), .RN(n1164), .QN(n216) );
  DFFRX1 \str_temp_reg[17][5]  ( .D(n943), .CK(clk), .RN(n1164), .QN(n217) );
  DFFRX1 \str_temp_reg[17][4]  ( .D(n942), .CK(clk), .RN(n1166), .QN(n218) );
  DFFRX1 \str_temp_reg[17][3]  ( .D(n941), .CK(clk), .RN(n1165), .QN(n219) );
  DFFRX1 \str_temp_reg[17][2]  ( .D(n940), .CK(clk), .RN(n1166), .QN(n220) );
  DFFRX1 \str_temp_reg[17][1]  ( .D(n939), .CK(clk), .RN(n1165), .QN(n221) );
  DFFRX1 \str_temp_reg[17][0]  ( .D(n946), .CK(clk), .RN(n1164), .QN(n222) );
  DFFRX1 \str_temp_reg[9][7]  ( .D(n1009), .CK(clk), .RN(n1164), .QN(n279) );
  DFFRX1 \str_temp_reg[9][6]  ( .D(n1008), .CK(clk), .RN(n1166), .QN(n280) );
  DFFRX1 \str_temp_reg[9][5]  ( .D(n1007), .CK(clk), .RN(n1165), .QN(n281) );
  DFFRX1 \str_temp_reg[9][4]  ( .D(n1006), .CK(clk), .RN(n1166), .QN(n282) );
  DFFRX1 \str_temp_reg[9][3]  ( .D(n1005), .CK(clk), .RN(n1165), .QN(n283) );
  DFFRX1 \str_temp_reg[9][2]  ( .D(n1004), .CK(clk), .RN(n1164), .QN(n284) );
  DFFRX1 \str_temp_reg[9][1]  ( .D(n1003), .CK(clk), .RN(n1164), .QN(n285) );
  DFFRX1 \str_temp_reg[9][0]  ( .D(n1010), .CK(clk), .RN(n1166), .QN(n286) );
  DFFRX1 \str_temp_reg[16][7]  ( .D(n953), .CK(clk), .RN(n1165), .QN(n223) );
  DFFRX1 \str_temp_reg[16][6]  ( .D(n952), .CK(clk), .RN(n1166), .QN(n224) );
  DFFRX1 \str_temp_reg[16][5]  ( .D(n951), .CK(clk), .RN(n1165), .QN(n225) );
  DFFRX1 \str_temp_reg[16][4]  ( .D(n950), .CK(clk), .RN(n1164), .QN(n226) );
  DFFRX1 \str_temp_reg[16][3]  ( .D(n949), .CK(clk), .RN(n1164), .QN(n227) );
  DFFRX1 \str_temp_reg[16][2]  ( .D(n948), .CK(clk), .RN(n1166), .QN(n228) );
  DFFRX1 \str_temp_reg[16][1]  ( .D(n947), .CK(clk), .RN(n1165), .QN(n229) );
  DFFRX1 \str_temp_reg[16][0]  ( .D(n954), .CK(clk), .RN(n1166), .QN(n230) );
  DFFRX1 \str_temp_reg[8][7]  ( .D(n1017), .CK(clk), .RN(n1165), .QN(n287) );
  DFFRX1 \str_temp_reg[8][6]  ( .D(n1016), .CK(clk), .RN(n1164), .QN(n288) );
  DFFRX1 \str_temp_reg[8][5]  ( .D(n1015), .CK(clk), .RN(n1164), .QN(n289) );
  DFFRX1 \str_temp_reg[8][4]  ( .D(n1014), .CK(clk), .RN(n1166), .QN(n290) );
  DFFRX1 \str_temp_reg[8][3]  ( .D(n1013), .CK(clk), .RN(n1165), .QN(n291) );
  DFFRX1 \str_temp_reg[8][2]  ( .D(n1012), .CK(clk), .RN(n1166), .QN(n292) );
  DFFRX1 \str_temp_reg[8][1]  ( .D(n1011), .CK(clk), .RN(n1165), .QN(n293) );
  DFFRX1 \str_temp_reg[8][0]  ( .D(n1018), .CK(clk), .RN(n1164), .QN(n294) );
  DFFRX1 \str_temp_reg[21][7]  ( .D(n913), .CK(clk), .RN(n1164), .QN(n183) );
  DFFRX1 \str_temp_reg[21][6]  ( .D(n912), .CK(clk), .RN(n1166), .QN(n184) );
  DFFRX1 \str_temp_reg[21][5]  ( .D(n911), .CK(clk), .RN(n1165), .QN(n185) );
  DFFRX1 \str_temp_reg[21][4]  ( .D(n910), .CK(clk), .RN(n1166), .QN(n186) );
  DFFRX1 \str_temp_reg[21][3]  ( .D(n909), .CK(clk), .RN(n1165), .QN(n187) );
  DFFRX1 \str_temp_reg[21][2]  ( .D(n908), .CK(clk), .RN(n1164), .QN(n188) );
  DFFRX1 \str_temp_reg[21][1]  ( .D(n907), .CK(clk), .RN(n1164), .QN(n189) );
  DFFRX1 \str_temp_reg[21][0]  ( .D(n914), .CK(clk), .RN(n1166), .QN(n190) );
  DFFRX1 \str_temp_reg[20][7]  ( .D(n921), .CK(clk), .RN(n1165), .QN(n191) );
  DFFRX1 \str_temp_reg[20][6]  ( .D(n920), .CK(clk), .RN(n1164), .QN(n192) );
  DFFRX1 \str_temp_reg[20][5]  ( .D(n919), .CK(clk), .RN(n1166), .QN(n193) );
  DFFRX1 \str_temp_reg[20][4]  ( .D(n918), .CK(clk), .RN(n1165), .QN(n194) );
  DFFRX1 \str_temp_reg[20][3]  ( .D(n917), .CK(clk), .RN(n1164), .QN(n195) );
  DFFRX1 \str_temp_reg[20][2]  ( .D(n916), .CK(clk), .RN(n1166), .QN(n196) );
  DFFRX1 \str_temp_reg[20][1]  ( .D(n915), .CK(clk), .RN(n1165), .QN(n197) );
  DFFRX1 \str_temp_reg[20][0]  ( .D(n922), .CK(clk), .RN(n1164), .QN(n198) );
  DFFRX1 \str_temp_reg[19][7]  ( .D(n929), .CK(clk), .RN(n1166), .QN(n199) );
  DFFRX1 \str_temp_reg[19][6]  ( .D(n928), .CK(clk), .RN(n1165), .QN(n200) );
  DFFRX1 \str_temp_reg[19][5]  ( .D(n927), .CK(clk), .RN(n1164), .QN(n201) );
  DFFRX1 \str_temp_reg[19][4]  ( .D(n926), .CK(clk), .RN(n1166), .QN(n202) );
  DFFRX1 \str_temp_reg[19][3]  ( .D(n925), .CK(clk), .RN(n1165), .QN(n203) );
  DFFRX1 \str_temp_reg[19][2]  ( .D(n924), .CK(clk), .RN(n1164), .QN(n204) );
  DFFRX1 \str_temp_reg[19][1]  ( .D(n923), .CK(clk), .RN(n1166), .QN(n205) );
  DFFRX1 \str_temp_reg[19][0]  ( .D(n930), .CK(clk), .RN(n1165), .QN(n206) );
  DFFRX1 \str_temp_reg[18][7]  ( .D(n937), .CK(clk), .RN(n1164), .QN(n207) );
  DFFRX1 \str_temp_reg[18][6]  ( .D(n936), .CK(clk), .RN(n1166), .QN(n208) );
  DFFRX1 \str_temp_reg[18][5]  ( .D(n935), .CK(clk), .RN(n1165), .QN(n209) );
  DFFRX1 \str_temp_reg[18][4]  ( .D(n934), .CK(clk), .RN(n1164), .QN(n210) );
  DFFRX1 \str_temp_reg[18][3]  ( .D(n933), .CK(clk), .RN(n1166), .QN(n211) );
  DFFRX1 \str_temp_reg[18][2]  ( .D(n932), .CK(clk), .RN(n1165), .QN(n212) );
  DFFRX1 \str_temp_reg[18][1]  ( .D(n931), .CK(clk), .RN(n1164), .QN(n213) );
  DFFRX1 \str_temp_reg[18][0]  ( .D(n938), .CK(clk), .RN(n1166), .QN(n214) );
  DFFRX1 \str_temp_reg[13][7]  ( .D(n977), .CK(clk), .RN(n1165), .QN(n247) );
  DFFRX1 \str_temp_reg[13][6]  ( .D(n976), .CK(clk), .RN(n1164), .QN(n248) );
  DFFRX1 \str_temp_reg[13][5]  ( .D(n975), .CK(clk), .RN(n1166), .QN(n249) );
  DFFRX1 \str_temp_reg[13][4]  ( .D(n974), .CK(clk), .RN(n1165), .QN(n250) );
  DFFRX1 \str_temp_reg[13][3]  ( .D(n973), .CK(clk), .RN(n1164), .QN(n251) );
  DFFRX1 \str_temp_reg[13][2]  ( .D(n972), .CK(clk), .RN(n1166), .QN(n252) );
  DFFRX1 \str_temp_reg[13][1]  ( .D(n971), .CK(clk), .RN(n1165), .QN(n253) );
  DFFRX1 \str_temp_reg[13][0]  ( .D(n978), .CK(clk), .RN(n1166), .QN(n254) );
  DFFRX1 \str_temp_reg[12][7]  ( .D(n985), .CK(clk), .RN(n1165), .QN(n255) );
  DFFRX1 \str_temp_reg[12][6]  ( .D(n984), .CK(clk), .RN(n1164), .QN(n256) );
  DFFRX1 \str_temp_reg[12][5]  ( .D(n983), .CK(clk), .RN(n1166), .QN(n257) );
  DFFRX1 \str_temp_reg[12][4]  ( .D(n982), .CK(clk), .RN(n1165), .QN(n258) );
  DFFRX1 \str_temp_reg[12][3]  ( .D(n981), .CK(clk), .RN(n1164), .QN(n259) );
  DFFRX1 \str_temp_reg[12][2]  ( .D(n980), .CK(clk), .RN(n1166), .QN(n260) );
  DFFRX1 \str_temp_reg[12][1]  ( .D(n979), .CK(clk), .RN(n1165), .QN(n261) );
  DFFRX1 \str_temp_reg[12][0]  ( .D(n986), .CK(clk), .RN(n1164), .QN(n262) );
  DFFRX1 \str_temp_reg[11][7]  ( .D(n993), .CK(clk), .RN(n1166), .QN(n263) );
  DFFRX1 \str_temp_reg[11][6]  ( .D(n992), .CK(clk), .RN(n1165), .QN(n264) );
  DFFRX1 \str_temp_reg[11][5]  ( .D(n991), .CK(clk), .RN(n1164), .QN(n265) );
  DFFRX1 \str_temp_reg[11][4]  ( .D(n990), .CK(clk), .RN(n1164), .QN(n266) );
  DFFRX1 \str_temp_reg[11][3]  ( .D(n989), .CK(clk), .RN(n1166), .QN(n267) );
  DFFRX1 \str_temp_reg[11][2]  ( .D(n988), .CK(clk), .RN(n1165), .QN(n268) );
  DFFRX1 \str_temp_reg[11][1]  ( .D(n987), .CK(clk), .RN(n1166), .QN(n269) );
  DFFRX1 \str_temp_reg[11][0]  ( .D(n994), .CK(clk), .RN(n1165), .QN(n270) );
  DFFRX1 \str_temp_reg[10][7]  ( .D(n1001), .CK(clk), .RN(n1164), .QN(n271) );
  DFFRX1 \str_temp_reg[10][6]  ( .D(n1000), .CK(clk), .RN(n1166), .QN(n272) );
  DFFRX1 \str_temp_reg[10][5]  ( .D(n999), .CK(clk), .RN(n1165), .QN(n273) );
  DFFRX1 \str_temp_reg[10][4]  ( .D(n998), .CK(clk), .RN(n1164), .QN(n274) );
  DFFRX1 \str_temp_reg[10][3]  ( .D(n997), .CK(clk), .RN(n1164), .QN(n275) );
  DFFRX1 \str_temp_reg[10][2]  ( .D(n996), .CK(clk), .RN(n1166), .QN(n276) );
  DFFRX1 \str_temp_reg[10][1]  ( .D(n995), .CK(clk), .RN(n1165), .QN(n277) );
  DFFRX1 \str_temp_reg[10][0]  ( .D(n1002), .CK(clk), .RN(n1166), .QN(n278) );
  DFFRX1 \str_temp_reg[23][7]  ( .D(n897), .CK(clk), .RN(n1165), .QN(n167) );
  DFFRX1 \str_temp_reg[23][6]  ( .D(n896), .CK(clk), .RN(n1164), .QN(n168) );
  DFFRX1 \str_temp_reg[23][5]  ( .D(n895), .CK(clk), .RN(n1166), .QN(n169) );
  DFFRX1 \str_temp_reg[23][4]  ( .D(n894), .CK(clk), .RN(n1165), .QN(n170) );
  DFFRX1 \str_temp_reg[23][3]  ( .D(n893), .CK(clk), .RN(n1164), .QN(n171) );
  DFFRX1 \str_temp_reg[23][2]  ( .D(n892), .CK(clk), .RN(n1166), .QN(n172) );
  DFFRX1 \str_temp_reg[23][1]  ( .D(n891), .CK(clk), .RN(n1165), .QN(n173) );
  DFFRX1 \str_temp_reg[23][0]  ( .D(n898), .CK(clk), .RN(n1164), .QN(n174) );
  DFFRX1 \str_temp_reg[22][7]  ( .D(n905), .CK(clk), .RN(n1166), .QN(n175) );
  DFFRX1 \str_temp_reg[22][6]  ( .D(n904), .CK(clk), .RN(n1165), .QN(n176) );
  DFFRX1 \str_temp_reg[22][5]  ( .D(n903), .CK(clk), .RN(n1164), .QN(n177) );
  DFFRX1 \str_temp_reg[22][4]  ( .D(n902), .CK(clk), .RN(n1164), .QN(n178) );
  DFFRX1 \str_temp_reg[22][3]  ( .D(n901), .CK(clk), .RN(n1166), .QN(n179) );
  DFFRX1 \str_temp_reg[22][2]  ( .D(n900), .CK(clk), .RN(n1165), .QN(n180) );
  DFFRX1 \str_temp_reg[22][1]  ( .D(n899), .CK(clk), .RN(n1166), .QN(n181) );
  DFFRX1 \str_temp_reg[22][0]  ( .D(n906), .CK(clk), .RN(n1165), .QN(n182) );
  DFFRX1 \str_temp_reg[15][7]  ( .D(n961), .CK(clk), .RN(n1164), .QN(n231) );
  DFFRX1 \str_temp_reg[15][6]  ( .D(n960), .CK(clk), .RN(n1166), .QN(n232) );
  DFFRX1 \str_temp_reg[15][5]  ( .D(n959), .CK(clk), .RN(n1165), .QN(n233) );
  DFFRX1 \str_temp_reg[15][4]  ( .D(n958), .CK(clk), .RN(n1164), .QN(n234) );
  DFFRX1 \str_temp_reg[15][3]  ( .D(n957), .CK(clk), .RN(n1164), .QN(n235) );
  DFFRX1 \str_temp_reg[15][2]  ( .D(n956), .CK(clk), .RN(n1166), .QN(n236) );
  DFFRX1 \str_temp_reg[15][1]  ( .D(n955), .CK(clk), .RN(n1165), .QN(n237) );
  DFFRX1 \str_temp_reg[15][0]  ( .D(n962), .CK(clk), .RN(n1166), .QN(n238) );
  DFFRX1 \str_temp_reg[14][7]  ( .D(n969), .CK(clk), .RN(n1165), .QN(n239) );
  DFFRX1 \str_temp_reg[14][6]  ( .D(n968), .CK(clk), .RN(n1164), .QN(n240) );
  DFFRX1 \str_temp_reg[14][5]  ( .D(n967), .CK(clk), .RN(n1166), .QN(n241) );
  DFFRX1 \str_temp_reg[14][4]  ( .D(n966), .CK(clk), .RN(n1165), .QN(n242) );
  DFFRX1 \str_temp_reg[14][3]  ( .D(n965), .CK(clk), .RN(n1164), .QN(n243) );
  DFFRX1 \str_temp_reg[14][2]  ( .D(n964), .CK(clk), .RN(n1166), .QN(n244) );
  DFFRX1 \str_temp_reg[14][1]  ( .D(n963), .CK(clk), .RN(n1165), .QN(n245) );
  DFFRX1 \str_temp_reg[14][0]  ( .D(n970), .CK(clk), .RN(n1164), .QN(n246) );
  DFFRX1 \str_temp_reg[33][7]  ( .D(n817), .CK(clk), .RN(n1166), .QN(n87) );
  DFFRX1 \str_temp_reg[33][6]  ( .D(n816), .CK(clk), .RN(n1165), .QN(n88) );
  DFFRX1 \str_temp_reg[33][5]  ( .D(n815), .CK(clk), .RN(n1164), .QN(n89) );
  DFFRX1 \str_temp_reg[33][4]  ( .D(n814), .CK(clk), .RN(n1164), .QN(n90) );
  DFFRX1 \str_temp_reg[33][3]  ( .D(n813), .CK(clk), .RN(n1166), .QN(n91) );
  DFFRX1 \str_temp_reg[33][2]  ( .D(n812), .CK(clk), .RN(n1165), .QN(n92) );
  DFFRX1 \str_temp_reg[33][1]  ( .D(n811), .CK(clk), .RN(n1166), .QN(n93) );
  DFFRX1 \str_temp_reg[33][0]  ( .D(n818), .CK(clk), .RN(n1165), .QN(n94) );
  DFFRX1 \str_temp_reg[32][7]  ( .D(n825), .CK(clk), .RN(n1164), .QN(n95) );
  DFFRX1 \str_temp_reg[32][6]  ( .D(n824), .CK(clk), .RN(n1166), .QN(n96) );
  DFFRX1 \str_temp_reg[32][5]  ( .D(n823), .CK(clk), .RN(n1165), .QN(n97) );
  DFFRX1 \str_temp_reg[32][4]  ( .D(n822), .CK(clk), .RN(n1164), .QN(n98) );
  DFFRX1 \str_temp_reg[32][3]  ( .D(n821), .CK(clk), .RN(n1164), .QN(n99) );
  DFFRX1 \str_temp_reg[32][2]  ( .D(n820), .CK(clk), .RN(n1166), .QN(n100) );
  DFFRX1 \str_temp_reg[32][1]  ( .D(n819), .CK(clk), .RN(n1165), .QN(n101) );
  DFFRX1 \str_temp_reg[32][0]  ( .D(n826), .CK(clk), .RN(n1164), .QN(n102) );
  DFFRX1 \str_temp_reg[25][7]  ( .D(n881), .CK(clk), .RN(n1166), .QN(n151) );
  DFFRX1 \str_temp_reg[25][6]  ( .D(n880), .CK(clk), .RN(n1165), .QN(n152) );
  DFFRX1 \str_temp_reg[25][5]  ( .D(n879), .CK(clk), .RN(n1166), .QN(n153) );
  DFFRX1 \str_temp_reg[25][4]  ( .D(n878), .CK(clk), .RN(n1165), .QN(n154) );
  DFFRX1 \str_temp_reg[25][3]  ( .D(n877), .CK(clk), .RN(n1164), .QN(n155) );
  DFFRX1 \str_temp_reg[25][2]  ( .D(n876), .CK(clk), .RN(n1166), .QN(n156) );
  DFFRX1 \str_temp_reg[25][1]  ( .D(n875), .CK(clk), .RN(n1165), .QN(n157) );
  DFFRX1 \str_temp_reg[25][0]  ( .D(n882), .CK(clk), .RN(n1164), .QN(n158) );
  DFFRX1 \str_temp_reg[24][7]  ( .D(n889), .CK(clk), .RN(n1164), .QN(n159) );
  DFFRX1 \str_temp_reg[24][6]  ( .D(n888), .CK(clk), .RN(n1166), .QN(n160) );
  DFFRX1 \str_temp_reg[24][5]  ( .D(n887), .CK(clk), .RN(n1165), .QN(n161) );
  DFFRX1 \str_temp_reg[24][4]  ( .D(n886), .CK(clk), .RN(n1164), .QN(n162) );
  DFFRX1 \str_temp_reg[24][3]  ( .D(n885), .CK(clk), .RN(n1166), .QN(n163) );
  DFFRX1 \str_temp_reg[24][2]  ( .D(n884), .CK(clk), .RN(n1165), .QN(n164) );
  DFFRX1 \str_temp_reg[24][1]  ( .D(n883), .CK(clk), .RN(n1166), .QN(n165) );
  DFFRX1 \str_temp_reg[24][0]  ( .D(n890), .CK(clk), .RN(n1165), .QN(n166) );
  DFFRX1 \str_temp_reg[29][7]  ( .D(n849), .CK(clk), .RN(n1164), .QN(n119) );
  DFFRX1 \str_temp_reg[29][6]  ( .D(n848), .CK(clk), .RN(n1166), .QN(n120) );
  DFFRX1 \str_temp_reg[29][5]  ( .D(n847), .CK(clk), .RN(n1165), .QN(n121) );
  DFFRX1 \str_temp_reg[29][4]  ( .D(n846), .CK(clk), .RN(n1164), .QN(n122) );
  DFFRX1 \str_temp_reg[29][3]  ( .D(n845), .CK(clk), .RN(n1164), .QN(n123) );
  DFFRX1 \str_temp_reg[29][2]  ( .D(n844), .CK(clk), .RN(n1166), .QN(n124) );
  DFFRX1 \str_temp_reg[29][1]  ( .D(n843), .CK(clk), .RN(n1165), .QN(n125) );
  DFFRX1 \str_temp_reg[29][0]  ( .D(n850), .CK(clk), .RN(n1164), .QN(n126) );
  DFFRX1 \str_temp_reg[28][7]  ( .D(n857), .CK(clk), .RN(n1166), .QN(n127) );
  DFFRX1 \str_temp_reg[28][6]  ( .D(n856), .CK(clk), .RN(n1165), .QN(n128) );
  DFFRX1 \str_temp_reg[28][5]  ( .D(n855), .CK(clk), .RN(n1166), .QN(n129) );
  DFFRX1 \str_temp_reg[28][4]  ( .D(n854), .CK(clk), .RN(n1165), .QN(n130) );
  DFFRX1 \str_temp_reg[28][3]  ( .D(n853), .CK(clk), .RN(n1164), .QN(n131) );
  DFFRX1 \str_temp_reg[28][2]  ( .D(n852), .CK(clk), .RN(n1166), .QN(n132) );
  DFFRX1 \str_temp_reg[28][1]  ( .D(n851), .CK(clk), .RN(n1165), .QN(n133) );
  DFFRX1 \str_temp_reg[28][0]  ( .D(n858), .CK(clk), .RN(n1164), .QN(n134) );
  DFFRX1 \str_temp_reg[27][7]  ( .D(n865), .CK(clk), .RN(n1164), .QN(n135) );
  DFFRX1 \str_temp_reg[27][6]  ( .D(n864), .CK(clk), .RN(n1166), .QN(n136) );
  DFFRX1 \str_temp_reg[27][5]  ( .D(n863), .CK(clk), .RN(n1165), .QN(n137) );
  DFFRX1 \str_temp_reg[27][4]  ( .D(n862), .CK(clk), .RN(n1164), .QN(n138) );
  DFFRX1 \str_temp_reg[27][3]  ( .D(n861), .CK(clk), .RN(n1166), .QN(n139) );
  DFFRX1 \str_temp_reg[27][2]  ( .D(n860), .CK(clk), .RN(n1165), .QN(n140) );
  DFFRX1 \str_temp_reg[27][1]  ( .D(n859), .CK(clk), .RN(n1166), .QN(n141) );
  DFFRX1 \str_temp_reg[27][0]  ( .D(n866), .CK(clk), .RN(n1165), .QN(n142) );
  DFFRX1 \str_temp_reg[26][7]  ( .D(n873), .CK(clk), .RN(n1164), .QN(n143) );
  DFFRX1 \str_temp_reg[26][6]  ( .D(n872), .CK(clk), .RN(n1166), .QN(n144) );
  DFFRX1 \str_temp_reg[26][5]  ( .D(n871), .CK(clk), .RN(n1165), .QN(n145) );
  DFFRX1 \str_temp_reg[26][4]  ( .D(n870), .CK(clk), .RN(n1164), .QN(n146) );
  DFFRX1 \str_temp_reg[26][3]  ( .D(n869), .CK(clk), .RN(n1164), .QN(n147) );
  DFFRX1 \str_temp_reg[26][2]  ( .D(n868), .CK(clk), .RN(n1166), .QN(n148) );
  DFFRX1 \str_temp_reg[26][1]  ( .D(n867), .CK(clk), .RN(n1165), .QN(n149) );
  DFFRX1 \str_temp_reg[26][0]  ( .D(n874), .CK(clk), .RN(n1164), .QN(n150) );
  DFFRX1 \str_temp_reg[1][5]  ( .D(n805), .CK(clk), .RN(n1166), .QN(n345) );
  DFFRX1 \str_temp_reg[5][7]  ( .D(n1041), .CK(clk), .RN(n1165), .QN(n311) );
  DFFRX1 \str_temp_reg[5][6]  ( .D(n1040), .CK(clk), .RN(n1166), .QN(n312) );
  DFFRX1 \str_temp_reg[5][5]  ( .D(n1039), .CK(clk), .RN(n1165), .QN(n313) );
  DFFRX1 \str_temp_reg[5][4]  ( .D(n1038), .CK(clk), .RN(n1164), .QN(n314) );
  DFFRX1 \str_temp_reg[5][3]  ( .D(n1037), .CK(clk), .RN(n1164), .QN(n315) );
  DFFRX1 \str_temp_reg[5][2]  ( .D(n1036), .CK(clk), .RN(n1166), .QN(n316) );
  DFFRX1 \str_temp_reg[5][1]  ( .D(n1035), .CK(clk), .RN(n1165), .QN(n317) );
  DFFRX1 \str_temp_reg[5][0]  ( .D(n1042), .CK(clk), .RN(n1164), .QN(n318) );
  DFFRX1 \str_temp_reg[4][7]  ( .D(n1049), .CK(clk), .RN(n1166), .QN(n319) );
  DFFRX1 \str_temp_reg[4][6]  ( .D(n1048), .CK(clk), .RN(n1165), .QN(n320) );
  DFFRX1 \str_temp_reg[4][5]  ( .D(n1047), .CK(clk), .RN(n1164), .QN(n321) );
  DFFRX1 \str_temp_reg[4][4]  ( .D(n1046), .CK(clk), .RN(n1166), .QN(n322) );
  DFFRX1 \str_temp_reg[4][3]  ( .D(n1045), .CK(clk), .RN(n1165), .QN(n323) );
  DFFRX1 \str_temp_reg[4][2]  ( .D(n1044), .CK(clk), .RN(n1164), .QN(n324) );
  DFFRX1 \str_temp_reg[4][1]  ( .D(n1043), .CK(clk), .RN(n1166), .QN(n325) );
  DFFRX1 \str_temp_reg[4][0]  ( .D(n1050), .CK(clk), .RN(n1165), .QN(n326) );
  DFFRX1 \str_temp_reg[3][7]  ( .D(n1057), .CK(clk), .RN(n1164), .QN(n327) );
  DFFRX1 \str_temp_reg[3][6]  ( .D(n1056), .CK(clk), .RN(n1166), .QN(n328) );
  DFFRX1 \str_temp_reg[3][5]  ( .D(n1055), .CK(clk), .RN(n1165), .QN(n329) );
  DFFRX1 \str_temp_reg[3][4]  ( .D(n1054), .CK(clk), .RN(n1164), .QN(n330) );
  DFFRX1 \str_temp_reg[3][3]  ( .D(n1053), .CK(clk), .RN(n1166), .QN(n331) );
  DFFRX1 \str_temp_reg[3][2]  ( .D(n1052), .CK(clk), .RN(n1165), .QN(n332) );
  DFFRX1 \str_temp_reg[3][1]  ( .D(n1051), .CK(clk), .RN(n1164), .QN(n333) );
  DFFRX1 \str_temp_reg[3][0]  ( .D(n1058), .CK(clk), .RN(n1166), .QN(n334) );
  DFFRX1 \str_temp_reg[2][7]  ( .D(n1065), .CK(clk), .RN(n1165), .QN(n335) );
  DFFRX1 \str_temp_reg[2][6]  ( .D(n1064), .CK(clk), .RN(n1164), .QN(n336) );
  DFFRX1 \str_temp_reg[2][5]  ( .D(n1063), .CK(clk), .RN(n1166), .QN(n337) );
  DFFRX1 \str_temp_reg[2][4]  ( .D(n1062), .CK(clk), .RN(n1165), .QN(n338) );
  DFFRX1 \str_temp_reg[2][3]  ( .D(n1061), .CK(clk), .RN(n1164), .QN(n339) );
  DFFRX1 \str_temp_reg[2][2]  ( .D(n1060), .CK(clk), .RN(n1166), .QN(n340) );
  DFFRX1 \str_temp_reg[2][1]  ( .D(n1059), .CK(clk), .RN(n1165), .QN(n341) );
  DFFRX1 \str_temp_reg[2][0]  ( .D(n1066), .CK(clk), .RN(n1164), .QN(n342) );
  DFFRX1 \str_temp_reg[7][7]  ( .D(n1025), .CK(clk), .RN(n1166), .QN(n295) );
  DFFRX1 \str_temp_reg[7][6]  ( .D(n1024), .CK(clk), .RN(n1165), .QN(n296) );
  DFFRX1 \str_temp_reg[7][5]  ( .D(n1023), .CK(clk), .RN(n1164), .QN(n297) );
  DFFRX1 \str_temp_reg[7][4]  ( .D(n1022), .CK(clk), .RN(n1166), .QN(n298) );
  DFFRX1 \str_temp_reg[7][3]  ( .D(n1021), .CK(clk), .RN(n1165), .QN(n299) );
  DFFRX1 \str_temp_reg[7][2]  ( .D(n1020), .CK(clk), .RN(n1164), .QN(n300) );
  DFFRX1 \str_temp_reg[7][1]  ( .D(n1019), .CK(clk), .RN(n1166), .QN(n301) );
  DFFRX1 \str_temp_reg[7][0]  ( .D(n1026), .CK(clk), .RN(n1165), .QN(n302) );
  DFFRX1 \str_temp_reg[6][7]  ( .D(n1033), .CK(clk), .RN(n1164), .QN(n303) );
  DFFRX1 \str_temp_reg[6][6]  ( .D(n1032), .CK(clk), .RN(n1166), .QN(n304) );
  DFFRX1 \str_temp_reg[6][5]  ( .D(n1031), .CK(clk), .RN(n1165), .QN(n305) );
  DFFRX1 \str_temp_reg[6][4]  ( .D(n1030), .CK(clk), .RN(n1164), .QN(n306) );
  DFFRX1 \str_temp_reg[6][3]  ( .D(n1029), .CK(clk), .RN(n1166), .QN(n307) );
  DFFRX1 \str_temp_reg[6][2]  ( .D(n1028), .CK(clk), .RN(n1165), .QN(n308) );
  DFFRX1 \str_temp_reg[6][1]  ( .D(n1027), .CK(clk), .RN(n1164), .QN(n309) );
  DFFRX1 \str_temp_reg[6][0]  ( .D(n1034), .CK(clk), .RN(n1166), .QN(n310) );
  DFFRX1 \str_temp_reg[1][7]  ( .D(n803), .CK(clk), .RN(n1165), .QN(n343) );
  DFFRX1 \str_temp_reg[1][6]  ( .D(n804), .CK(clk), .RN(n1164), .QN(n344) );
  DFFRX1 \str_temp_reg[1][4]  ( .D(n806), .CK(clk), .RN(n1166), .QN(n346) );
  DFFRX1 \str_temp_reg[1][3]  ( .D(n807), .CK(clk), .RN(n1165), .QN(n347) );
  DFFRX1 \str_temp_reg[1][2]  ( .D(n808), .CK(clk), .RN(n1164), .QN(n348) );
  DFFRX1 \str_temp_reg[1][1]  ( .D(n809), .CK(clk), .RN(n1166), .QN(n349) );
  DFFRX1 \str_temp_reg[1][0]  ( .D(n810), .CK(clk), .RN(n1165), .QN(n350) );
  DFFRX2 \pat_idx_reg[0]  ( .D(n781), .CK(clk), .RN(n1164), .Q(N182), .QN(
        n1205) );
  DFFRX2 \counter_reg[0]  ( .D(n797), .CK(clk), .RN(n1166), .Q(counter[0]), 
        .QN(n81) );
  DFFSX2 \str_len_reg[0]  ( .D(n1080), .CK(clk), .SN(n1166), .Q(str_len[0]), 
        .QN(N225) );
  AND4X2 U845 ( .A(str_len[3]), .B(n439), .C(n360), .D(n359), .Y(n465) );
  AND4X2 U846 ( .A(str_len[4]), .B(n439), .C(n361), .D(n359), .Y(n456) );
  AND4X2 U847 ( .A(str_len[4]), .B(str_len[3]), .C(n439), .D(n359), .Y(n442)
         );
  NAND2X2 U848 ( .A(n504), .B(chardata[6]), .Y(n491) );
  NAND2X2 U849 ( .A(n504), .B(chardata[4]), .Y(n489) );
  NAND2X2 U850 ( .A(n504), .B(chardata[2]), .Y(n487) );
  NOR2BX2 U851 ( .AN(n504), .B(chardata[5]), .Y(n490) );
  NAND2X2 U852 ( .A(n504), .B(chardata[3]), .Y(n488) );
  NAND2X2 U853 ( .A(n504), .B(chardata[1]), .Y(n486) );
  XOR2XL U854 ( .A(m_reg[0]), .B(n366), .Y(n525) );
  NAND3XL U855 ( .A(pat_len[1]), .B(n366), .C(n498), .Y(n500) );
  NAND3XL U856 ( .A(pat_len[1]), .B(n366), .C(n493), .Y(n492) );
  NAND3XL U857 ( .A(n366), .B(n365), .C(n493), .Y(n496) );
  INVX12 U858 ( .A(n1153), .Y(match) );
  INVX16 U859 ( .A(n1152), .Y(match_index[0]) );
  INVX16 U860 ( .A(N371), .Y(match_index[1]) );
  INVX16 U861 ( .A(n1151), .Y(match_index[2]) );
  INVX16 U862 ( .A(n1155), .Y(match_index[3]) );
  INVX16 U863 ( .A(n1154), .Y(match_index[4]) );
  INVX3 U864 ( .A(n1282), .Y(n1163) );
  INVX20 U865 ( .A(n1163), .Y(n1164) );
  INVX20 U866 ( .A(n1163), .Y(n1165) );
  INVX20 U867 ( .A(n1163), .Y(n1166) );
  OAI22X1 U868 ( .A0(n1205), .A1(n1170), .B0(N182), .B1(n1169), .Y(pat_cell[0]) );
  OAI22X1 U869 ( .A0(n1205), .A1(n1186), .B0(N182), .B1(n1185), .Y(pat_cell[4]) );
  OAI22X1 U870 ( .A0(n1205), .A1(n1190), .B0(N182), .B1(n1189), .Y(pat_cell[5]) );
  OAI22X1 U871 ( .A0(n1202), .A1(n1205), .B0(N182), .B1(n1201), .Y(pat_cell[7]) );
  OAI22X1 U872 ( .A0(n1205), .A1(n1194), .B0(N182), .B1(n1193), .Y(pat_cell[6]) );
  OAI22X1 U873 ( .A0(n1205), .A1(n1182), .B0(N182), .B1(n1181), .Y(pat_cell[3]) );
  OAI22X1 U874 ( .A0(n1205), .A1(n1174), .B0(N182), .B1(n1173), .Y(pat_cell[1]) );
  INVX12 U875 ( .A(n393), .Y(valid) );
  OAI22X1 U876 ( .A0(n1205), .A1(n1178), .B0(N182), .B1(n1177), .Y(pat_cell[2]) );
  XOR2XL U877 ( .A(match_index[2]), .B(match_index[1]), .Y(N372) );
  XNOR2XL U878 ( .A(pat_cell[7]), .B(n699), .Y(n676) );
  XNOR2XL U879 ( .A(pat_cell[5]), .B(n741), .Y(n674) );
  XNOR2XL U880 ( .A(pat_cell[4]), .B(n720), .Y(n675) );
  XNOR2XL U881 ( .A(pat_cell[6]), .B(n678), .Y(n677) );
  XOR2XL U882 ( .A(match_index[4]), .B(\add_120/carry [4]), .Y(N374) );
  AND2XL U883 ( .A(match_index[1]), .B(match_index[2]), .Y(\add_120/carry [3])
         );
  AND2XL U884 ( .A(\add_120/carry [3]), .B(match_index[3]), .Y(
        \add_120/carry [4]) );
  XOR2XL U885 ( .A(match_index[3]), .B(\add_120/carry [3]), .Y(N373) );
  AND2XL U886 ( .A(\add_120/carry [4]), .B(match_index[4]), .Y(N375) );
  NAND4BBXL U887 ( .AN(n415), .BN(next_state[1]), .C(next_state[2]), .D(n416), 
        .Y(n413) );
  OAI22X1 U888 ( .A0(n549), .A1(n550), .B0(n551), .B1(n552), .Y(n385) );
  NOR2BX1 U889 ( .AN(n756), .B(counter[0]), .Y(n751) );
  NOR2BX1 U890 ( .AN(n770), .B(counter[0]), .Y(n769) );
  NOR2BX1 U891 ( .AN(n763), .B(counter[0]), .Y(n761) );
  NOR2BX1 U892 ( .AN(n777), .B(counter[0]), .Y(n776) );
  OAI221XL U893 ( .A0(n533), .A1(n385), .B0(n518), .B1(n418), .C0(n534), .Y(
        next_state[0]) );
  NAND2X1 U894 ( .A(n1292), .B(chardata[7]), .Y(n425) );
  NAND2X1 U895 ( .A(chardata[0]), .B(n1292), .Y(n432) );
  NAND2X1 U896 ( .A(chardata[6]), .B(n1292), .Y(n426) );
  NAND2X1 U897 ( .A(chardata[4]), .B(n1292), .Y(n428) );
  NAND2X1 U898 ( .A(chardata[3]), .B(n1292), .Y(n429) );
  NAND2X1 U899 ( .A(chardata[2]), .B(n1292), .Y(n430) );
  NAND2X1 U900 ( .A(chardata[1]), .B(n1292), .Y(n431) );
  NOR3BX1 U901 ( .AN(pat_len[2]), .B(pat_len[3]), .C(n510), .Y(n493) );
  CLKBUFX3 U902 ( .A(n492), .Y(n1219) );
  CLKBUFX3 U903 ( .A(n500), .Y(n1215) );
  CLKBUFX3 U904 ( .A(n496), .Y(n1217) );
  NAND4X1 U905 ( .A(state[3]), .B(state[2]), .C(state[1]), .D(state[0]), .Y(
        n393) );
  NOR2X1 U906 ( .A(n417), .B(chardata[5]), .Y(n427) );
  NOR2BX1 U907 ( .AN(n756), .B(n81), .Y(n753) );
  NOR2BX1 U908 ( .AN(n777), .B(n81), .Y(n775) );
  NOR2BX1 U909 ( .AN(n770), .B(n81), .Y(n768) );
  NOR2BX1 U910 ( .AN(n763), .B(n81), .Y(n762) );
  NOR2X2 U911 ( .A(counter[1]), .B(counter[2]), .Y(n752) );
  OAI22XL U912 ( .A0(n1210), .A1(n356), .B0(n604), .B1(n348), .Y(n603) );
  OAI22XL U913 ( .A0(n1210), .A1(n357), .B0(n604), .B1(n349), .Y(n673) );
  OAI22XL U914 ( .A0(n1210), .A1(n355), .B0(n604), .B1(n347), .Y(n631) );
  OAI22XL U915 ( .A0(n1210), .A1(n358), .B0(n604), .B1(n350), .Y(n652) );
  OAI22XL U916 ( .A0(n1210), .A1(n354), .B0(n604), .B1(n346), .Y(n740) );
  OAI22XL U917 ( .A0(n1210), .A1(n352), .B0(n604), .B1(n344), .Y(n698) );
  OAI22XL U918 ( .A0(n1210), .A1(n351), .B0(n604), .B1(n343), .Y(n719) );
  OAI22XL U919 ( .A0(n1210), .A1(n353), .B0(n604), .B1(n345), .Y(n774) );
  OAI22XL U920 ( .A0(n609), .A1(n308), .B0(n610), .B1(n300), .Y(n600) );
  OAI22XL U921 ( .A0(n609), .A1(n309), .B0(n610), .B1(n301), .Y(n670) );
  OAI22XL U922 ( .A0(n609), .A1(n307), .B0(n610), .B1(n299), .Y(n628) );
  OAI22XL U923 ( .A0(n609), .A1(n310), .B0(n610), .B1(n302), .Y(n649) );
  OAI22XL U924 ( .A0(n585), .A1(n173), .B0(n586), .B1(n165), .Y(n662) );
  OAI22XL U925 ( .A0(n585), .A1(n171), .B0(n586), .B1(n163), .Y(n620) );
  OAI22XL U926 ( .A0(n585), .A1(n174), .B0(n586), .B1(n166), .Y(n641) );
  OAI22XL U927 ( .A0(n605), .A1(n340), .B0(n606), .B1(n332), .Y(n602) );
  OAI22XL U928 ( .A0(n605), .A1(n341), .B0(n606), .B1(n333), .Y(n672) );
  OAI22XL U929 ( .A0(n605), .A1(n339), .B0(n606), .B1(n331), .Y(n630) );
  OAI22XL U930 ( .A0(n605), .A1(n342), .B0(n606), .B1(n334), .Y(n651) );
  OAI22XL U931 ( .A0(n581), .A1(n204), .B0(n582), .B1(n196), .Y(n577) );
  OAI22XL U932 ( .A0(n581), .A1(n205), .B0(n582), .B1(n197), .Y(n664) );
  OAI22XL U933 ( .A0(n581), .A1(n203), .B0(n582), .B1(n195), .Y(n622) );
  OAI22XL U934 ( .A0(n581), .A1(n206), .B0(n582), .B1(n198), .Y(n643) );
  OAI22XL U935 ( .A0(n607), .A1(n324), .B0(n608), .B1(n316), .Y(n601) );
  OAI22XL U936 ( .A0(n607), .A1(n325), .B0(n608), .B1(n317), .Y(n671) );
  OAI22XL U937 ( .A0(n607), .A1(n323), .B0(n608), .B1(n315), .Y(n629) );
  OAI22XL U938 ( .A0(n607), .A1(n326), .B0(n608), .B1(n318), .Y(n650) );
  OAI22XL U939 ( .A0(n583), .A1(n188), .B0(n584), .B1(n180), .Y(n576) );
  OAI22XL U940 ( .A0(n583), .A1(n189), .B0(n584), .B1(n181), .Y(n663) );
  OAI22XL U941 ( .A0(n583), .A1(n187), .B0(n584), .B1(n179), .Y(n621) );
  OAI22XL U942 ( .A0(n583), .A1(n190), .B0(n584), .B1(n182), .Y(n642) );
  OAI22XL U943 ( .A0(n579), .A1(n220), .B0(n580), .B1(n212), .Y(n578) );
  OAI22XL U944 ( .A0(n579), .A1(n221), .B0(n580), .B1(n213), .Y(n665) );
  OAI22XL U945 ( .A0(n579), .A1(n219), .B0(n580), .B1(n211), .Y(n623) );
  OAI22XL U946 ( .A0(n579), .A1(n222), .B0(n580), .B1(n214), .Y(n644) );
  NOR2X2 U947 ( .A(n79), .B(n80), .Y(n755) );
  NOR2X2 U948 ( .A(n79), .B(counter[1]), .Y(n754) );
  NOR2X2 U949 ( .A(n80), .B(counter[2]), .Y(n750) );
  OAI222XL U950 ( .A0(n572), .A1(n101), .B0(n573), .B1(n93), .C0(n574), .C1(
        n109), .Y(n658) );
  OAI222XL U951 ( .A0(n572), .A1(n99), .B0(n573), .B1(n91), .C0(n574), .C1(
        n107), .Y(n616) );
  OAI222XL U952 ( .A0(n572), .A1(n102), .B0(n573), .B1(n94), .C0(n574), .C1(
        n110), .Y(n637) );
  OAI22XL U953 ( .A0(n609), .A1(n306), .B0(n610), .B1(n298), .Y(n737) );
  OAI22XL U954 ( .A0(n609), .A1(n304), .B0(n610), .B1(n296), .Y(n695) );
  OAI22XL U955 ( .A0(n609), .A1(n303), .B0(n610), .B1(n295), .Y(n716) );
  OAI22XL U956 ( .A0(n609), .A1(n305), .B0(n610), .B1(n297), .Y(n771) );
  OAI22XL U957 ( .A0(n585), .A1(n172), .B0(n586), .B1(n164), .Y(n575) );
  OAI22XL U958 ( .A0(n585), .A1(n170), .B0(n586), .B1(n162), .Y(n729) );
  OAI22XL U959 ( .A0(n585), .A1(n168), .B0(n586), .B1(n160), .Y(n687) );
  OAI22XL U960 ( .A0(n585), .A1(n167), .B0(n586), .B1(n159), .Y(n708) );
  OAI22XL U961 ( .A0(n585), .A1(n169), .B0(n586), .B1(n161), .Y(n757) );
  OAI22XL U962 ( .A0(n605), .A1(n338), .B0(n606), .B1(n330), .Y(n739) );
  OAI22XL U963 ( .A0(n605), .A1(n336), .B0(n606), .B1(n328), .Y(n697) );
  OAI22XL U964 ( .A0(n605), .A1(n335), .B0(n606), .B1(n327), .Y(n718) );
  OAI22XL U965 ( .A0(n605), .A1(n337), .B0(n606), .B1(n329), .Y(n773) );
  OAI22XL U966 ( .A0(n581), .A1(n202), .B0(n582), .B1(n194), .Y(n731) );
  OAI22XL U967 ( .A0(n581), .A1(n200), .B0(n582), .B1(n192), .Y(n689) );
  OAI22XL U968 ( .A0(n581), .A1(n199), .B0(n582), .B1(n191), .Y(n710) );
  OAI22XL U969 ( .A0(n581), .A1(n201), .B0(n582), .B1(n193), .Y(n759) );
  OAI22XL U970 ( .A0(n607), .A1(n322), .B0(n608), .B1(n314), .Y(n738) );
  OAI22XL U971 ( .A0(n607), .A1(n320), .B0(n608), .B1(n312), .Y(n696) );
  OAI22XL U972 ( .A0(n607), .A1(n319), .B0(n608), .B1(n311), .Y(n717) );
  OAI22XL U973 ( .A0(n607), .A1(n321), .B0(n608), .B1(n313), .Y(n772) );
  OAI22XL U974 ( .A0(n583), .A1(n186), .B0(n584), .B1(n178), .Y(n730) );
  OAI22XL U975 ( .A0(n583), .A1(n184), .B0(n584), .B1(n176), .Y(n688) );
  OAI22XL U976 ( .A0(n583), .A1(n183), .B0(n584), .B1(n175), .Y(n709) );
  OAI22XL U977 ( .A0(n583), .A1(n185), .B0(n584), .B1(n177), .Y(n758) );
  OAI22XL U978 ( .A0(n570), .A1(n125), .B0(n571), .B1(n117), .Y(n659) );
  OAI22XL U979 ( .A0(n570), .A1(n123), .B0(n571), .B1(n115), .Y(n617) );
  OAI22XL U980 ( .A0(n570), .A1(n126), .B0(n571), .B1(n118), .Y(n638) );
  OAI22XL U981 ( .A0(n568), .A1(n141), .B0(n569), .B1(n133), .Y(n660) );
  OAI22XL U982 ( .A0(n568), .A1(n139), .B0(n569), .B1(n131), .Y(n618) );
  OAI22XL U983 ( .A0(n568), .A1(n142), .B0(n569), .B1(n134), .Y(n639) );
  OAI22XL U984 ( .A0(n579), .A1(n218), .B0(n580), .B1(n210), .Y(n732) );
  OAI22XL U985 ( .A0(n579), .A1(n216), .B0(n580), .B1(n208), .Y(n690) );
  OAI22XL U986 ( .A0(n579), .A1(n215), .B0(n580), .B1(n207), .Y(n711) );
  OAI22XL U987 ( .A0(n579), .A1(n217), .B0(n580), .B1(n209), .Y(n760) );
  OAI22XL U988 ( .A0(n566), .A1(n157), .B0(n567), .B1(n149), .Y(n661) );
  OAI22XL U989 ( .A0(n566), .A1(n155), .B0(n567), .B1(n147), .Y(n619) );
  OAI22XL U990 ( .A0(n566), .A1(n158), .B0(n567), .B1(n150), .Y(n640) );
  NOR2X1 U991 ( .A(n519), .B(n70), .Y(n417) );
  NOR3X2 U992 ( .A(str_len[1]), .B(str_len[2]), .C(str_len[0]), .Y(n438) );
  NOR3X2 U993 ( .A(str_len[1]), .B(str_len[2]), .C(N225), .Y(n434) );
  NOR3X1 U994 ( .A(n363), .B(str_len[0]), .C(n362), .Y(n444) );
  NOR3X1 U995 ( .A(n363), .B(N225), .C(n362), .Y(n441) );
  NOR3X1 U996 ( .A(str_len[0]), .B(str_len[2]), .C(n363), .Y(n452) );
  NOR3X1 U997 ( .A(str_len[0]), .B(str_len[1]), .C(n362), .Y(n448) );
  NOR3X1 U998 ( .A(N225), .B(str_len[2]), .C(n363), .Y(n450) );
  NOR3X1 U999 ( .A(N225), .B(str_len[1]), .C(n362), .Y(n446) );
  CLKBUFX3 U1000 ( .A(n1264), .Y(n1260) );
  CLKBUFX3 U1001 ( .A(n1262), .Y(n1259) );
  CLKBUFX3 U1002 ( .A(n1262), .Y(n1258) );
  CLKBUFX3 U1003 ( .A(n1263), .Y(n1257) );
  CLKBUFX3 U1004 ( .A(n1263), .Y(n1256) );
  CLKBUFX3 U1005 ( .A(n1252), .Y(n1255) );
  CLKBUFX3 U1006 ( .A(n1251), .Y(n1254) );
  CLKBUFX3 U1007 ( .A(n1250), .Y(n1261) );
  INVX3 U1008 ( .A(n480), .Y(n1292) );
  NAND2X1 U1009 ( .A(n424), .B(n480), .Y(n482) );
  CLKBUFX3 U1010 ( .A(n1264), .Y(n1253) );
  CLKBUFX3 U1011 ( .A(n1250), .Y(n1262) );
  CLKBUFX3 U1012 ( .A(n1250), .Y(n1263) );
  INVX3 U1013 ( .A(n443), .Y(n1322) );
  INVX3 U1014 ( .A(n440), .Y(n1323) );
  INVX3 U1015 ( .A(n435), .Y(n1325) );
  INVX3 U1016 ( .A(n437), .Y(n1324) );
  INVX3 U1017 ( .A(n1221), .Y(n1293) );
  INVX3 U1018 ( .A(n1222), .Y(n1294) );
  INVX3 U1019 ( .A(n1223), .Y(n1295) );
  INVX3 U1020 ( .A(n1224), .Y(n1296) );
  INVX3 U1021 ( .A(n1225), .Y(n1297) );
  INVX3 U1022 ( .A(n1226), .Y(n1298) );
  INVX3 U1023 ( .A(n1227), .Y(n1300) );
  INVX3 U1024 ( .A(n1228), .Y(n1301) );
  INVX3 U1025 ( .A(n1229), .Y(n1302) );
  INVX3 U1026 ( .A(n1230), .Y(n1303) );
  INVX3 U1027 ( .A(n1231), .Y(n1304) );
  INVX3 U1028 ( .A(n1232), .Y(n1305) );
  INVX3 U1029 ( .A(n1233), .Y(n1306) );
  INVX3 U1030 ( .A(n1234), .Y(n1307) );
  INVX3 U1031 ( .A(n1235), .Y(n1308) );
  INVX3 U1032 ( .A(n1236), .Y(n1309) );
  INVX3 U1033 ( .A(n1237), .Y(n1310) );
  INVX3 U1034 ( .A(n1238), .Y(n1311) );
  INVX3 U1035 ( .A(n1239), .Y(n1312) );
  INVX3 U1036 ( .A(n1240), .Y(n1313) );
  INVX3 U1037 ( .A(n1241), .Y(n1314) );
  INVX3 U1038 ( .A(n1242), .Y(n1315) );
  INVX3 U1039 ( .A(n1243), .Y(n1316) );
  INVX3 U1040 ( .A(n1244), .Y(n1317) );
  INVX3 U1041 ( .A(n1245), .Y(n1318) );
  INVX3 U1042 ( .A(n1246), .Y(n1319) );
  INVX3 U1043 ( .A(n1247), .Y(n1320) );
  INVX3 U1044 ( .A(n1248), .Y(n1321) );
  INVX3 U1045 ( .A(n1220), .Y(n1291) );
  NAND2X2 U1046 ( .A(n484), .B(n1332), .Y(n424) );
  INVX3 U1047 ( .A(n1249), .Y(n1299) );
  NAND2X1 U1048 ( .A(n484), .B(n424), .Y(n480) );
  NAND2X1 U1049 ( .A(n1330), .B(n480), .Y(n439) );
  CLKINVX1 U1050 ( .A(n413), .Y(n1290) );
  NAND2X1 U1051 ( .A(n415), .B(n1211), .Y(n412) );
  NAND3X1 U1052 ( .A(n413), .B(n412), .C(n414), .Y(n394) );
  NAND2X1 U1053 ( .A(next_state[2]), .B(n1327), .Y(n387) );
  NAND2X1 U1054 ( .A(n510), .B(n386), .Y(n513) );
  NAND2X1 U1055 ( .A(n387), .B(n1211), .Y(n381) );
  CLKINVX1 U1056 ( .A(n510), .Y(n1326) );
  AND2X2 U1057 ( .A(n387), .B(n1211), .Y(n528) );
  NAND2X1 U1058 ( .A(n533), .B(n1330), .Y(next_state[2]) );
  CLKBUFX3 U1059 ( .A(n1282), .Y(n1264) );
  CLKBUFX3 U1060 ( .A(n1252), .Y(n1250) );
  NAND2X2 U1061 ( .A(next_state[1]), .B(n1327), .Y(n510) );
  NAND2X2 U1062 ( .A(n444), .B(n442), .Y(n443) );
  NAND2X2 U1063 ( .A(n441), .B(n442), .Y(n440) );
  NAND2X2 U1064 ( .A(n436), .B(n434), .Y(n435) );
  NAND2X2 U1065 ( .A(n438), .B(n436), .Y(n437) );
  NOR3X1 U1066 ( .A(next_state[1]), .B(next_state[2]), .C(n1327), .Y(n484) );
  AND2X2 U1067 ( .A(n479), .B(n439), .Y(n433) );
  CLKINVX1 U1068 ( .A(next_state[0]), .Y(n1327) );
  CLKBUFX3 U1069 ( .A(n501), .Y(n1214) );
  NAND2X1 U1070 ( .A(n498), .B(n495), .Y(n501) );
  CLKBUFX3 U1071 ( .A(n497), .Y(n1216) );
  NAND2X1 U1072 ( .A(n498), .B(n499), .Y(n497) );
  CLKBUFX3 U1073 ( .A(n481), .Y(n1220) );
  AOI31X1 U1074 ( .A0(n438), .A1(n479), .A2(n1292), .B0(n417), .Y(n481) );
  CLKBUFX3 U1075 ( .A(n472), .Y(n1227) );
  NAND2X1 U1076 ( .A(n465), .B(n438), .Y(n472) );
  CLKBUFX3 U1077 ( .A(n471), .Y(n1228) );
  NAND2X1 U1078 ( .A(n465), .B(n434), .Y(n471) );
  CLKBUFX3 U1079 ( .A(n470), .Y(n1229) );
  NAND2X1 U1080 ( .A(n465), .B(n452), .Y(n470) );
  CLKBUFX3 U1081 ( .A(n469), .Y(n1230) );
  NAND2X1 U1082 ( .A(n465), .B(n450), .Y(n469) );
  CLKBUFX3 U1083 ( .A(n468), .Y(n1231) );
  NAND2X1 U1084 ( .A(n465), .B(n448), .Y(n468) );
  CLKBUFX3 U1085 ( .A(n467), .Y(n1232) );
  NAND2X1 U1086 ( .A(n465), .B(n446), .Y(n467) );
  CLKBUFX3 U1087 ( .A(n466), .Y(n1233) );
  NAND2X1 U1088 ( .A(n465), .B(n444), .Y(n466) );
  CLKBUFX3 U1089 ( .A(n464), .Y(n1234) );
  NAND2X1 U1090 ( .A(n465), .B(n441), .Y(n464) );
  CLKBUFX3 U1091 ( .A(n463), .Y(n1235) );
  NAND2X1 U1092 ( .A(n456), .B(n438), .Y(n463) );
  CLKBUFX3 U1093 ( .A(n462), .Y(n1236) );
  NAND2X1 U1094 ( .A(n456), .B(n434), .Y(n462) );
  CLKBUFX3 U1095 ( .A(n461), .Y(n1237) );
  NAND2X1 U1096 ( .A(n456), .B(n452), .Y(n461) );
  CLKBUFX3 U1097 ( .A(n460), .Y(n1238) );
  NAND2X1 U1098 ( .A(n456), .B(n450), .Y(n460) );
  CLKBUFX3 U1099 ( .A(n459), .Y(n1239) );
  NAND2X1 U1100 ( .A(n456), .B(n448), .Y(n459) );
  CLKBUFX3 U1101 ( .A(n458), .Y(n1240) );
  NAND2X1 U1102 ( .A(n456), .B(n446), .Y(n458) );
  CLKBUFX3 U1103 ( .A(n457), .Y(n1241) );
  NAND2X1 U1104 ( .A(n456), .B(n444), .Y(n457) );
  CLKBUFX3 U1105 ( .A(n455), .Y(n1242) );
  NAND2X1 U1106 ( .A(n456), .B(n441), .Y(n455) );
  CLKBUFX3 U1107 ( .A(n454), .Y(n1243) );
  NAND2X1 U1108 ( .A(n442), .B(n438), .Y(n454) );
  CLKBUFX3 U1109 ( .A(n453), .Y(n1244) );
  NAND2X1 U1110 ( .A(n442), .B(n434), .Y(n453) );
  CLKBUFX3 U1111 ( .A(n451), .Y(n1245) );
  NAND2X1 U1112 ( .A(n452), .B(n442), .Y(n451) );
  CLKBUFX3 U1113 ( .A(n449), .Y(n1246) );
  NAND2X1 U1114 ( .A(n450), .B(n442), .Y(n449) );
  CLKBUFX3 U1115 ( .A(n447), .Y(n1247) );
  NAND2X1 U1116 ( .A(n448), .B(n442), .Y(n447) );
  CLKBUFX3 U1117 ( .A(n445), .Y(n1248) );
  NAND2X1 U1118 ( .A(n446), .B(n442), .Y(n445) );
  CLKBUFX3 U1119 ( .A(n478), .Y(n1221) );
  NAND2X1 U1120 ( .A(n452), .B(n433), .Y(n478) );
  CLKBUFX3 U1121 ( .A(n477), .Y(n1222) );
  NAND2X1 U1122 ( .A(n450), .B(n433), .Y(n477) );
  CLKBUFX3 U1123 ( .A(n476), .Y(n1223) );
  NAND2X1 U1124 ( .A(n448), .B(n433), .Y(n476) );
  CLKBUFX3 U1125 ( .A(n475), .Y(n1224) );
  NAND2X1 U1126 ( .A(n446), .B(n433), .Y(n475) );
  CLKBUFX3 U1127 ( .A(n474), .Y(n1225) );
  NAND2X1 U1128 ( .A(n444), .B(n433), .Y(n474) );
  CLKBUFX3 U1129 ( .A(n473), .Y(n1226) );
  NAND2X1 U1130 ( .A(n441), .B(n433), .Y(n473) );
  CLKBUFX3 U1131 ( .A(n423), .Y(n1249) );
  OAI2BB1X1 U1132 ( .A0N(n433), .A1N(n434), .B0(n424), .Y(n423) );
  NAND2X1 U1133 ( .A(next_state[1]), .B(next_state[2]), .Y(n386) );
  NAND4X1 U1134 ( .A(n528), .B(n385), .C(n386), .D(n375), .Y(n377) );
  NOR3X1 U1135 ( .A(n1327), .B(next_state[1]), .C(n418), .Y(n415) );
  AND2X2 U1136 ( .A(n1211), .B(n414), .Y(n416) );
  CLKBUFX3 U1137 ( .A(n485), .Y(n1212) );
  NAND2X1 U1138 ( .A(n493), .B(n499), .Y(n485) );
  CLKBUFX3 U1139 ( .A(n494), .Y(n1218) );
  NAND2X1 U1140 ( .A(n495), .B(n493), .Y(n494) );
  CLKBUFX3 U1141 ( .A(n503), .Y(n1213) );
  NAND2X1 U1142 ( .A(n508), .B(n1326), .Y(n503) );
  CLKBUFX3 U1143 ( .A(n432), .Y(n1266) );
  CLKBUFX3 U1144 ( .A(n425), .Y(n1280) );
  CLKBUFX3 U1145 ( .A(n426), .Y(n1278) );
  CLKBUFX3 U1146 ( .A(n428), .Y(n1274) );
  CLKBUFX3 U1147 ( .A(n429), .Y(n1272) );
  CLKBUFX3 U1148 ( .A(n430), .Y(n1270) );
  CLKBUFX3 U1149 ( .A(n431), .Y(n1268) );
  CLKBUFX3 U1150 ( .A(n432), .Y(n1265) );
  CLKBUFX3 U1151 ( .A(n425), .Y(n1279) );
  CLKBUFX3 U1152 ( .A(n426), .Y(n1277) );
  CLKBUFX3 U1153 ( .A(n428), .Y(n1273) );
  CLKBUFX3 U1154 ( .A(n429), .Y(n1271) );
  CLKBUFX3 U1155 ( .A(n430), .Y(n1269) );
  CLKBUFX3 U1156 ( .A(n431), .Y(n1267) );
  CLKBUFX3 U1157 ( .A(n427), .Y(n1275) );
  CLKBUFX3 U1158 ( .A(n427), .Y(n1276) );
  OR4XL U1159 ( .A(pat_cell[0]), .B(pat_cell[4]), .C(pat_cell[6]), .D(
        pat_cell[7]), .Y(n549) );
  NAND4XL U1160 ( .A(pat_cell[1]), .B(pat_cell[3]), .C(pat_cell[2]), .D(
        pat_cell[5]), .Y(n550) );
  NAND4X1 U1161 ( .A(n674), .B(n675), .C(n676), .D(n677), .Y(n551) );
  XNOR2XL U1162 ( .A(pat_cell[2]), .B(n557), .Y(n556) );
  NAND4X1 U1163 ( .A(n558), .B(n559), .C(n560), .D(n561), .Y(n557) );
  NOR4X1 U1164 ( .A(n575), .B(n576), .C(n577), .D(n578), .Y(n560) );
  NOR4X1 U1165 ( .A(n600), .B(n601), .C(n602), .D(n603), .Y(n558) );
  OAI32X1 U1166 ( .A0(n517), .A1(n422), .A2(n385), .B0(n518), .B1(n418), .Y(
        next_state[3]) );
  NAND4X1 U1167 ( .A(n553), .B(n554), .C(n555), .D(n556), .Y(n552) );
  XNOR2XL U1168 ( .A(pat_cell[0]), .B(n632), .Y(n554) );
  XNOR2XL U1169 ( .A(pat_cell[3]), .B(n611), .Y(n555) );
  XNOR2XL U1170 ( .A(pat_cell[1]), .B(n653), .Y(n553) );
  NAND4X1 U1171 ( .A(n679), .B(n680), .C(n681), .D(n682), .Y(n678) );
  NOR4X1 U1172 ( .A(n687), .B(n688), .C(n689), .D(n690), .Y(n681) );
  NOR4X1 U1173 ( .A(n695), .B(n696), .C(n697), .D(n698), .Y(n679) );
  NAND4X1 U1174 ( .A(n700), .B(n701), .C(n702), .D(n703), .Y(n699) );
  NOR4X1 U1175 ( .A(n708), .B(n709), .C(n710), .D(n711), .Y(n702) );
  NOR4X1 U1176 ( .A(n716), .B(n717), .C(n718), .D(n719), .Y(n700) );
  NAND4X1 U1177 ( .A(n721), .B(n722), .C(n723), .D(n724), .Y(n720) );
  NOR4X1 U1178 ( .A(n729), .B(n730), .C(n731), .D(n732), .Y(n723) );
  NOR4X1 U1179 ( .A(n737), .B(n738), .C(n739), .D(n740), .Y(n721) );
  NAND4X1 U1180 ( .A(n742), .B(n743), .C(n744), .D(n745), .Y(n741) );
  NOR4X1 U1181 ( .A(n757), .B(n758), .C(n759), .D(n760), .Y(n744) );
  NOR4X1 U1182 ( .A(n771), .B(n772), .C(n773), .D(n774), .Y(n742) );
  CLKBUFX3 U1183 ( .A(n1199), .Y(n1207) );
  NOR2X1 U1184 ( .A(n1203), .B(n1204), .Y(n1199) );
  NAND2X2 U1185 ( .A(n769), .B(n752), .Y(n591) );
  NAND2X2 U1186 ( .A(n769), .B(n750), .Y(n593) );
  NAND2X2 U1187 ( .A(n769), .B(n754), .Y(n595) );
  NAND2X2 U1188 ( .A(n752), .B(n753), .Y(n566) );
  NAND2X2 U1189 ( .A(n750), .B(n753), .Y(n568) );
  NAND2X2 U1190 ( .A(n754), .B(n753), .Y(n570) );
  NAND2X2 U1191 ( .A(n776), .B(n750), .Y(n605) );
  NAND2X2 U1192 ( .A(n776), .B(n754), .Y(n607) );
  NAND2X2 U1193 ( .A(n776), .B(n755), .Y(n609) );
  NAND2X2 U1194 ( .A(n762), .B(n752), .Y(n579) );
  NAND2X2 U1195 ( .A(n762), .B(n755), .Y(n585) );
  NAND2X2 U1196 ( .A(n762), .B(n750), .Y(n581) );
  NAND2X2 U1197 ( .A(n762), .B(n754), .Y(n583) );
  NAND2X2 U1198 ( .A(n768), .B(n752), .Y(n592) );
  NAND2X2 U1199 ( .A(n768), .B(n750), .Y(n594) );
  NAND2X2 U1200 ( .A(n768), .B(n754), .Y(n596) );
  NAND2X2 U1201 ( .A(n750), .B(n751), .Y(n567) );
  NAND2X2 U1202 ( .A(n754), .B(n751), .Y(n569) );
  NAND2X2 U1203 ( .A(n751), .B(n755), .Y(n571) );
  NAND2X2 U1204 ( .A(n775), .B(n750), .Y(n606) );
  NAND2X2 U1205 ( .A(n775), .B(n754), .Y(n608) );
  NAND2X2 U1206 ( .A(n775), .B(n755), .Y(n610) );
  NAND2X2 U1207 ( .A(n761), .B(n750), .Y(n580) );
  NAND2X2 U1208 ( .A(n752), .B(n751), .Y(n586) );
  NAND2X2 U1209 ( .A(n761), .B(n754), .Y(n582) );
  NAND2X2 U1210 ( .A(n761), .B(n755), .Y(n584) );
  NAND2X2 U1211 ( .A(n769), .B(n755), .Y(n599) );
  NAND2X2 U1212 ( .A(n755), .B(n753), .Y(n574) );
  NAND2X2 U1213 ( .A(n768), .B(n755), .Y(n597) );
  NAND2X2 U1214 ( .A(n761), .B(n752), .Y(n598) );
  NAND4X1 U1215 ( .A(n654), .B(n655), .C(n656), .D(n657), .Y(n653) );
  NOR4X1 U1216 ( .A(n662), .B(n663), .C(n664), .D(n665), .Y(n656) );
  NOR4X1 U1217 ( .A(n670), .B(n671), .C(n672), .D(n673), .Y(n654) );
  NOR4X1 U1218 ( .A(n658), .B(n659), .C(n660), .D(n661), .Y(n657) );
  NAND4X1 U1219 ( .A(n612), .B(n613), .C(n614), .D(n615), .Y(n611) );
  NOR4X1 U1220 ( .A(n620), .B(n621), .C(n622), .D(n623), .Y(n614) );
  NOR4X1 U1221 ( .A(n628), .B(n629), .C(n630), .D(n631), .Y(n612) );
  NOR4X1 U1222 ( .A(n616), .B(n617), .C(n618), .D(n619), .Y(n615) );
  NAND4X1 U1223 ( .A(n633), .B(n634), .C(n635), .D(n636), .Y(n632) );
  NOR4X1 U1224 ( .A(n641), .B(n642), .C(n643), .D(n644), .Y(n635) );
  NOR4X1 U1225 ( .A(n649), .B(n650), .C(n651), .D(n652), .Y(n633) );
  NOR4X1 U1226 ( .A(n637), .B(n638), .C(n639), .D(n640), .Y(n636) );
  NOR2BX1 U1227 ( .AN(n401), .B(n420), .Y(n419) );
  CLKBUFX3 U1228 ( .A(n388), .Y(n1211) );
  NAND2BX1 U1229 ( .AN(n531), .B(n532), .Y(n388) );
  NAND4BXL U1230 ( .AN(pat_cell[0]), .B(pat_cell[5]), .C(pat_cell[3]), .D(
        pat_cell[1]), .Y(n531) );
  NOR4XL U1231 ( .A(pat_cell[7]), .B(pat_cell[6]), .C(pat_cell[4]), .D(
        pat_cell[2]), .Y(n532) );
  AND2X2 U1232 ( .A(n399), .B(n401), .Y(n400) );
  NAND2X1 U1233 ( .A(n1211), .B(n393), .Y(n389) );
  CLKINVX1 U1234 ( .A(n417), .Y(n1330) );
  CLKINVX1 U1235 ( .A(n520), .Y(n1333) );
  AND2X2 U1236 ( .A(n418), .B(n422), .Y(n533) );
  CLKINVX1 U1237 ( .A(n393), .Y(n1332) );
  NOR2X1 U1238 ( .A(n1332), .B(n417), .Y(n414) );
  CLKINVX1 U1239 ( .A(n422), .Y(n1331) );
  CLKBUFX3 U1240 ( .A(n1166), .Y(n1252) );
  CLKBUFX3 U1241 ( .A(n1164), .Y(n1251) );
  CLKINVX1 U1242 ( .A(next_state[3]), .Y(n1329) );
  AOI2BB2X1 U1243 ( .B0(n520), .B1(n521), .A0N(isstring), .A1N(n393), .Y(n516)
         );
  OAI22XL U1244 ( .A0(state[1]), .A1(n70), .B0(state[0]), .B1(isstring), .Y(
        n521) );
  AOI221XL U1245 ( .A0(isstring), .A1(n535), .B0(n536), .B1(n1328), .C0(n417), 
        .Y(n534) );
  OAI21XL U1246 ( .A0(n70), .A1(n1333), .B0(n519), .Y(n536) );
  OAI31XL U1247 ( .A0(n1333), .A1(state[1]), .A2(state[0]), .B0(n393), .Y(n535) );
  OAI222XL U1248 ( .A0(n350), .A1(n1249), .B0(n424), .B1(n1289), .C0(n1299), 
        .C1(n1265), .Y(n810) );
  OAI222XL U1249 ( .A0(n349), .A1(n1249), .B0(n424), .B1(n1288), .C0(n1299), 
        .C1(n1267), .Y(n809) );
  OAI222XL U1250 ( .A0(n348), .A1(n1249), .B0(n424), .B1(n1287), .C0(n1299), 
        .C1(n1269), .Y(n808) );
  OAI222XL U1251 ( .A0(n347), .A1(n1249), .B0(n424), .B1(n1286), .C0(n1299), 
        .C1(n1271), .Y(n807) );
  OAI222XL U1252 ( .A0(n346), .A1(n1249), .B0(n424), .B1(n1285), .C0(n1299), 
        .C1(n1273), .Y(n806) );
  OAI222XL U1253 ( .A0(n344), .A1(n1249), .B0(n424), .B1(n1284), .C0(n1299), 
        .C1(n1277), .Y(n804) );
  OAI222XL U1254 ( .A0(n343), .A1(n1249), .B0(n424), .B1(n1283), .C0(n1299), 
        .C1(n1279), .Y(n803) );
  NOR2BX1 U1255 ( .AN(n502), .B(pat_len[3]), .Y(n498) );
  NOR2X1 U1256 ( .A(n510), .B(pat_len[2]), .Y(n502) );
  OAI22XL U1257 ( .A0(n1275), .A1(n443), .B0(n1322), .B1(n113), .Y(n839) );
  OAI22XL U1258 ( .A0(n1276), .A1(n440), .B0(n1323), .B1(n105), .Y(n831) );
  OAI22XL U1259 ( .A0(n1265), .A1(n443), .B0(n1322), .B1(n118), .Y(n842) );
  OAI22XL U1260 ( .A0(n1279), .A1(n443), .B0(n1322), .B1(n111), .Y(n841) );
  OAI22XL U1261 ( .A0(n1277), .A1(n443), .B0(n1322), .B1(n112), .Y(n840) );
  OAI22XL U1262 ( .A0(n1273), .A1(n443), .B0(n1322), .B1(n114), .Y(n838) );
  OAI22XL U1263 ( .A0(n1271), .A1(n443), .B0(n1322), .B1(n115), .Y(n837) );
  OAI22XL U1264 ( .A0(n1269), .A1(n443), .B0(n1322), .B1(n116), .Y(n836) );
  OAI22XL U1265 ( .A0(n1267), .A1(n443), .B0(n1322), .B1(n117), .Y(n835) );
  OAI22XL U1266 ( .A0(n1265), .A1(n440), .B0(n1323), .B1(n110), .Y(n834) );
  OAI22XL U1267 ( .A0(n1279), .A1(n440), .B0(n1323), .B1(n103), .Y(n833) );
  OAI22XL U1268 ( .A0(n1277), .A1(n440), .B0(n1323), .B1(n104), .Y(n832) );
  OAI22XL U1269 ( .A0(n1273), .A1(n440), .B0(n1323), .B1(n106), .Y(n830) );
  OAI22XL U1270 ( .A0(n1271), .A1(n440), .B0(n1323), .B1(n107), .Y(n829) );
  OAI22XL U1271 ( .A0(n1269), .A1(n440), .B0(n1323), .B1(n108), .Y(n828) );
  OAI22XL U1272 ( .A0(n1267), .A1(n440), .B0(n1323), .B1(n109), .Y(n827) );
  OAI22XL U1273 ( .A0(n427), .A1(n437), .B0(n1324), .B1(n97), .Y(n823) );
  OAI22XL U1274 ( .A0(n427), .A1(n435), .B0(n1325), .B1(n89), .Y(n815) );
  OAI22XL U1275 ( .A0(n1265), .A1(n437), .B0(n1324), .B1(n102), .Y(n826) );
  OAI22XL U1276 ( .A0(n1279), .A1(n437), .B0(n1324), .B1(n95), .Y(n825) );
  OAI22XL U1277 ( .A0(n1277), .A1(n437), .B0(n1324), .B1(n96), .Y(n824) );
  OAI22XL U1278 ( .A0(n1273), .A1(n437), .B0(n1324), .B1(n98), .Y(n822) );
  OAI22XL U1279 ( .A0(n1271), .A1(n437), .B0(n1324), .B1(n99), .Y(n821) );
  OAI22XL U1280 ( .A0(n1269), .A1(n437), .B0(n1324), .B1(n100), .Y(n820) );
  OAI22XL U1281 ( .A0(n1267), .A1(n437), .B0(n1324), .B1(n101), .Y(n819) );
  OAI22XL U1282 ( .A0(n1265), .A1(n435), .B0(n1325), .B1(n94), .Y(n818) );
  OAI22XL U1283 ( .A0(n1279), .A1(n435), .B0(n1325), .B1(n87), .Y(n817) );
  OAI22XL U1284 ( .A0(n1277), .A1(n435), .B0(n1325), .B1(n88), .Y(n816) );
  OAI22XL U1285 ( .A0(n1273), .A1(n435), .B0(n1325), .B1(n90), .Y(n814) );
  OAI22XL U1286 ( .A0(n1271), .A1(n435), .B0(n1325), .B1(n91), .Y(n813) );
  OAI22XL U1287 ( .A0(n1269), .A1(n435), .B0(n1325), .B1(n92), .Y(n812) );
  OAI22XL U1288 ( .A0(n1267), .A1(n435), .B0(n1325), .B1(n93), .Y(n811) );
  OAI22XL U1289 ( .A0(n1275), .A1(n1221), .B0(n1293), .B1(n337), .Y(n1063) );
  OAI22XL U1290 ( .A0(n1275), .A1(n1222), .B0(n1294), .B1(n329), .Y(n1055) );
  OAI22XL U1291 ( .A0(n1275), .A1(n1223), .B0(n1295), .B1(n321), .Y(n1047) );
  OAI22XL U1292 ( .A0(n1275), .A1(n1224), .B0(n1296), .B1(n313), .Y(n1039) );
  OAI22XL U1293 ( .A0(n1275), .A1(n1225), .B0(n1297), .B1(n305), .Y(n1031) );
  OAI22XL U1294 ( .A0(n1275), .A1(n1226), .B0(n1298), .B1(n297), .Y(n1023) );
  OAI22XL U1295 ( .A0(n1275), .A1(n1227), .B0(n1300), .B1(n289), .Y(n1015) );
  OAI22XL U1296 ( .A0(n1275), .A1(n1228), .B0(n1301), .B1(n281), .Y(n1007) );
  OAI22XL U1297 ( .A0(n1275), .A1(n1229), .B0(n1302), .B1(n273), .Y(n999) );
  OAI22XL U1298 ( .A0(n1275), .A1(n1230), .B0(n1303), .B1(n265), .Y(n991) );
  OAI22XL U1299 ( .A0(n1275), .A1(n1231), .B0(n1304), .B1(n257), .Y(n983) );
  OAI22XL U1300 ( .A0(n1275), .A1(n1232), .B0(n1305), .B1(n249), .Y(n975) );
  OAI22XL U1301 ( .A0(n1276), .A1(n1233), .B0(n1306), .B1(n241), .Y(n967) );
  OAI22XL U1302 ( .A0(n1276), .A1(n1234), .B0(n1307), .B1(n233), .Y(n959) );
  OAI22XL U1303 ( .A0(n1276), .A1(n1235), .B0(n1308), .B1(n225), .Y(n951) );
  OAI22XL U1304 ( .A0(n1276), .A1(n1236), .B0(n1309), .B1(n217), .Y(n943) );
  OAI22XL U1305 ( .A0(n1276), .A1(n1237), .B0(n1310), .B1(n209), .Y(n935) );
  OAI22XL U1306 ( .A0(n1276), .A1(n1238), .B0(n1311), .B1(n201), .Y(n927) );
  OAI22XL U1307 ( .A0(n1276), .A1(n1239), .B0(n1312), .B1(n193), .Y(n919) );
  OAI22XL U1308 ( .A0(n1276), .A1(n1240), .B0(n1313), .B1(n185), .Y(n911) );
  OAI22XL U1309 ( .A0(n1276), .A1(n1241), .B0(n1314), .B1(n177), .Y(n903) );
  OAI22XL U1310 ( .A0(n1276), .A1(n1242), .B0(n1315), .B1(n169), .Y(n895) );
  OAI22XL U1311 ( .A0(n1276), .A1(n1243), .B0(n1316), .B1(n161), .Y(n887) );
  OAI22XL U1312 ( .A0(n1276), .A1(n1244), .B0(n1317), .B1(n153), .Y(n879) );
  OAI22XL U1313 ( .A0(n1276), .A1(n1245), .B0(n1318), .B1(n145), .Y(n871) );
  OAI22XL U1314 ( .A0(n1275), .A1(n1246), .B0(n1319), .B1(n137), .Y(n863) );
  OAI22XL U1315 ( .A0(n1276), .A1(n1247), .B0(n1320), .B1(n129), .Y(n855) );
  OAI22XL U1316 ( .A0(n427), .A1(n1248), .B0(n1321), .B1(n121), .Y(n847) );
  OAI22XL U1317 ( .A0(n1266), .A1(n1221), .B0(n1293), .B1(n342), .Y(n1066) );
  OAI22XL U1318 ( .A0(n1280), .A1(n1221), .B0(n1293), .B1(n335), .Y(n1065) );
  OAI22XL U1319 ( .A0(n1278), .A1(n1221), .B0(n1293), .B1(n336), .Y(n1064) );
  OAI22XL U1320 ( .A0(n1274), .A1(n1221), .B0(n1293), .B1(n338), .Y(n1062) );
  OAI22XL U1321 ( .A0(n1272), .A1(n1221), .B0(n1293), .B1(n339), .Y(n1061) );
  OAI22XL U1322 ( .A0(n1270), .A1(n1221), .B0(n1293), .B1(n340), .Y(n1060) );
  OAI22XL U1323 ( .A0(n1268), .A1(n1221), .B0(n1293), .B1(n341), .Y(n1059) );
  OAI22XL U1324 ( .A0(n1265), .A1(n1222), .B0(n1294), .B1(n334), .Y(n1058) );
  OAI22XL U1325 ( .A0(n1279), .A1(n1222), .B0(n1294), .B1(n327), .Y(n1057) );
  OAI22XL U1326 ( .A0(n1277), .A1(n1222), .B0(n1294), .B1(n328), .Y(n1056) );
  OAI22XL U1327 ( .A0(n1273), .A1(n1222), .B0(n1294), .B1(n330), .Y(n1054) );
  OAI22XL U1328 ( .A0(n1271), .A1(n1222), .B0(n1294), .B1(n331), .Y(n1053) );
  OAI22XL U1329 ( .A0(n1269), .A1(n1222), .B0(n1294), .B1(n332), .Y(n1052) );
  OAI22XL U1330 ( .A0(n1267), .A1(n1222), .B0(n1294), .B1(n333), .Y(n1051) );
  OAI22XL U1331 ( .A0(n1266), .A1(n1223), .B0(n1295), .B1(n326), .Y(n1050) );
  OAI22XL U1332 ( .A0(n1280), .A1(n1223), .B0(n1295), .B1(n319), .Y(n1049) );
  OAI22XL U1333 ( .A0(n1278), .A1(n1223), .B0(n1295), .B1(n320), .Y(n1048) );
  OAI22XL U1334 ( .A0(n1274), .A1(n1223), .B0(n1295), .B1(n322), .Y(n1046) );
  OAI22XL U1335 ( .A0(n1272), .A1(n1223), .B0(n1295), .B1(n323), .Y(n1045) );
  OAI22XL U1336 ( .A0(n1270), .A1(n1223), .B0(n1295), .B1(n324), .Y(n1044) );
  OAI22XL U1337 ( .A0(n1268), .A1(n1223), .B0(n1295), .B1(n325), .Y(n1043) );
  OAI22XL U1338 ( .A0(n432), .A1(n1224), .B0(n1296), .B1(n318), .Y(n1042) );
  OAI22XL U1339 ( .A0(n425), .A1(n1224), .B0(n1296), .B1(n311), .Y(n1041) );
  OAI22XL U1340 ( .A0(n426), .A1(n1224), .B0(n1296), .B1(n312), .Y(n1040) );
  OAI22XL U1341 ( .A0(n428), .A1(n1224), .B0(n1296), .B1(n314), .Y(n1038) );
  OAI22XL U1342 ( .A0(n429), .A1(n1224), .B0(n1296), .B1(n315), .Y(n1037) );
  OAI22XL U1343 ( .A0(n430), .A1(n1224), .B0(n1296), .B1(n316), .Y(n1036) );
  OAI22XL U1344 ( .A0(n431), .A1(n1224), .B0(n1296), .B1(n317), .Y(n1035) );
  OAI22XL U1345 ( .A0(n432), .A1(n1225), .B0(n1297), .B1(n310), .Y(n1034) );
  OAI22XL U1346 ( .A0(n425), .A1(n1225), .B0(n1297), .B1(n303), .Y(n1033) );
  OAI22XL U1347 ( .A0(n426), .A1(n1225), .B0(n1297), .B1(n304), .Y(n1032) );
  OAI22XL U1348 ( .A0(n428), .A1(n1225), .B0(n1297), .B1(n306), .Y(n1030) );
  OAI22XL U1349 ( .A0(n429), .A1(n1225), .B0(n1297), .B1(n307), .Y(n1029) );
  OAI22XL U1350 ( .A0(n430), .A1(n1225), .B0(n1297), .B1(n308), .Y(n1028) );
  OAI22XL U1351 ( .A0(n431), .A1(n1225), .B0(n1297), .B1(n309), .Y(n1027) );
  OAI22XL U1352 ( .A0(n432), .A1(n1226), .B0(n1298), .B1(n302), .Y(n1026) );
  OAI22XL U1353 ( .A0(n425), .A1(n1226), .B0(n1298), .B1(n295), .Y(n1025) );
  OAI22XL U1354 ( .A0(n426), .A1(n1226), .B0(n1298), .B1(n296), .Y(n1024) );
  OAI22XL U1355 ( .A0(n428), .A1(n1226), .B0(n1298), .B1(n298), .Y(n1022) );
  OAI22XL U1356 ( .A0(n429), .A1(n1226), .B0(n1298), .B1(n299), .Y(n1021) );
  OAI22XL U1357 ( .A0(n430), .A1(n1226), .B0(n1298), .B1(n300), .Y(n1020) );
  OAI22XL U1358 ( .A0(n431), .A1(n1226), .B0(n1298), .B1(n301), .Y(n1019) );
  OAI22XL U1359 ( .A0(n1266), .A1(n1227), .B0(n1300), .B1(n294), .Y(n1018) );
  OAI22XL U1360 ( .A0(n1280), .A1(n1227), .B0(n1300), .B1(n287), .Y(n1017) );
  OAI22XL U1361 ( .A0(n1278), .A1(n1227), .B0(n1300), .B1(n288), .Y(n1016) );
  OAI22XL U1362 ( .A0(n1274), .A1(n1227), .B0(n1300), .B1(n290), .Y(n1014) );
  OAI22XL U1363 ( .A0(n1272), .A1(n1227), .B0(n1300), .B1(n291), .Y(n1013) );
  OAI22XL U1364 ( .A0(n1270), .A1(n1227), .B0(n1300), .B1(n292), .Y(n1012) );
  OAI22XL U1365 ( .A0(n1268), .A1(n1227), .B0(n1300), .B1(n293), .Y(n1011) );
  OAI22XL U1366 ( .A0(n1266), .A1(n1228), .B0(n1301), .B1(n286), .Y(n1010) );
  OAI22XL U1367 ( .A0(n1280), .A1(n1228), .B0(n1301), .B1(n279), .Y(n1009) );
  OAI22XL U1368 ( .A0(n1278), .A1(n1228), .B0(n1301), .B1(n280), .Y(n1008) );
  OAI22XL U1369 ( .A0(n1274), .A1(n1228), .B0(n1301), .B1(n282), .Y(n1006) );
  OAI22XL U1370 ( .A0(n1272), .A1(n1228), .B0(n1301), .B1(n283), .Y(n1005) );
  OAI22XL U1371 ( .A0(n1270), .A1(n1228), .B0(n1301), .B1(n284), .Y(n1004) );
  OAI22XL U1372 ( .A0(n1268), .A1(n1228), .B0(n1301), .B1(n285), .Y(n1003) );
  OAI22XL U1373 ( .A0(n1266), .A1(n1229), .B0(n1302), .B1(n278), .Y(n1002) );
  OAI22XL U1374 ( .A0(n1280), .A1(n1229), .B0(n1302), .B1(n271), .Y(n1001) );
  OAI22XL U1375 ( .A0(n1278), .A1(n1229), .B0(n1302), .B1(n272), .Y(n1000) );
  OAI22XL U1376 ( .A0(n1274), .A1(n1229), .B0(n1302), .B1(n274), .Y(n998) );
  OAI22XL U1377 ( .A0(n1272), .A1(n1229), .B0(n1302), .B1(n275), .Y(n997) );
  OAI22XL U1378 ( .A0(n1270), .A1(n1229), .B0(n1302), .B1(n276), .Y(n996) );
  OAI22XL U1379 ( .A0(n1268), .A1(n1229), .B0(n1302), .B1(n277), .Y(n995) );
  OAI22XL U1380 ( .A0(n1266), .A1(n1230), .B0(n1303), .B1(n270), .Y(n994) );
  OAI22XL U1381 ( .A0(n1280), .A1(n1230), .B0(n1303), .B1(n263), .Y(n993) );
  OAI22XL U1382 ( .A0(n1278), .A1(n1230), .B0(n1303), .B1(n264), .Y(n992) );
  OAI22XL U1383 ( .A0(n1274), .A1(n1230), .B0(n1303), .B1(n266), .Y(n990) );
  OAI22XL U1384 ( .A0(n1272), .A1(n1230), .B0(n1303), .B1(n267), .Y(n989) );
  OAI22XL U1385 ( .A0(n1270), .A1(n1230), .B0(n1303), .B1(n268), .Y(n988) );
  OAI22XL U1386 ( .A0(n1268), .A1(n1230), .B0(n1303), .B1(n269), .Y(n987) );
  OAI22XL U1387 ( .A0(n1266), .A1(n1231), .B0(n1304), .B1(n262), .Y(n986) );
  OAI22XL U1388 ( .A0(n1280), .A1(n1231), .B0(n1304), .B1(n255), .Y(n985) );
  OAI22XL U1389 ( .A0(n1278), .A1(n1231), .B0(n1304), .B1(n256), .Y(n984) );
  OAI22XL U1390 ( .A0(n1274), .A1(n1231), .B0(n1304), .B1(n258), .Y(n982) );
  OAI22XL U1391 ( .A0(n1272), .A1(n1231), .B0(n1304), .B1(n259), .Y(n981) );
  OAI22XL U1392 ( .A0(n1270), .A1(n1231), .B0(n1304), .B1(n260), .Y(n980) );
  OAI22XL U1393 ( .A0(n1268), .A1(n1231), .B0(n1304), .B1(n261), .Y(n979) );
  OAI22XL U1394 ( .A0(n1266), .A1(n1232), .B0(n1305), .B1(n254), .Y(n978) );
  OAI22XL U1395 ( .A0(n1280), .A1(n1232), .B0(n1305), .B1(n247), .Y(n977) );
  OAI22XL U1396 ( .A0(n1278), .A1(n1232), .B0(n1305), .B1(n248), .Y(n976) );
  OAI22XL U1397 ( .A0(n1274), .A1(n1232), .B0(n1305), .B1(n250), .Y(n974) );
  OAI22XL U1398 ( .A0(n1272), .A1(n1232), .B0(n1305), .B1(n251), .Y(n973) );
  OAI22XL U1399 ( .A0(n1270), .A1(n1232), .B0(n1305), .B1(n252), .Y(n972) );
  OAI22XL U1400 ( .A0(n1268), .A1(n1232), .B0(n1305), .B1(n253), .Y(n971) );
  OAI22XL U1401 ( .A0(n1266), .A1(n1233), .B0(n1306), .B1(n246), .Y(n970) );
  OAI22XL U1402 ( .A0(n1280), .A1(n1233), .B0(n1306), .B1(n239), .Y(n969) );
  OAI22XL U1403 ( .A0(n1278), .A1(n1233), .B0(n1306), .B1(n240), .Y(n968) );
  OAI22XL U1404 ( .A0(n1274), .A1(n1233), .B0(n1306), .B1(n242), .Y(n966) );
  OAI22XL U1405 ( .A0(n1272), .A1(n1233), .B0(n1306), .B1(n243), .Y(n965) );
  OAI22XL U1406 ( .A0(n1270), .A1(n1233), .B0(n1306), .B1(n244), .Y(n964) );
  OAI22XL U1407 ( .A0(n1268), .A1(n1233), .B0(n1306), .B1(n245), .Y(n963) );
  OAI22XL U1408 ( .A0(n1266), .A1(n1234), .B0(n1307), .B1(n238), .Y(n962) );
  OAI22XL U1409 ( .A0(n1280), .A1(n1234), .B0(n1307), .B1(n231), .Y(n961) );
  OAI22XL U1410 ( .A0(n1278), .A1(n1234), .B0(n1307), .B1(n232), .Y(n960) );
  OAI22XL U1411 ( .A0(n1274), .A1(n1234), .B0(n1307), .B1(n234), .Y(n958) );
  OAI22XL U1412 ( .A0(n1272), .A1(n1234), .B0(n1307), .B1(n235), .Y(n957) );
  OAI22XL U1413 ( .A0(n1270), .A1(n1234), .B0(n1307), .B1(n236), .Y(n956) );
  OAI22XL U1414 ( .A0(n1268), .A1(n1234), .B0(n1307), .B1(n237), .Y(n955) );
  OAI22XL U1415 ( .A0(n1266), .A1(n1235), .B0(n1308), .B1(n230), .Y(n954) );
  OAI22XL U1416 ( .A0(n1280), .A1(n1235), .B0(n1308), .B1(n223), .Y(n953) );
  OAI22XL U1417 ( .A0(n1278), .A1(n1235), .B0(n1308), .B1(n224), .Y(n952) );
  OAI22XL U1418 ( .A0(n1274), .A1(n1235), .B0(n1308), .B1(n226), .Y(n950) );
  OAI22XL U1419 ( .A0(n1272), .A1(n1235), .B0(n1308), .B1(n227), .Y(n949) );
  OAI22XL U1420 ( .A0(n1270), .A1(n1235), .B0(n1308), .B1(n228), .Y(n948) );
  OAI22XL U1421 ( .A0(n1268), .A1(n1235), .B0(n1308), .B1(n229), .Y(n947) );
  OAI22XL U1422 ( .A0(n1266), .A1(n1236), .B0(n1309), .B1(n222), .Y(n946) );
  OAI22XL U1423 ( .A0(n1280), .A1(n1236), .B0(n1309), .B1(n215), .Y(n945) );
  OAI22XL U1424 ( .A0(n1278), .A1(n1236), .B0(n1309), .B1(n216), .Y(n944) );
  OAI22XL U1425 ( .A0(n1274), .A1(n1236), .B0(n1309), .B1(n218), .Y(n942) );
  OAI22XL U1426 ( .A0(n1272), .A1(n1236), .B0(n1309), .B1(n219), .Y(n941) );
  OAI22XL U1427 ( .A0(n1270), .A1(n1236), .B0(n1309), .B1(n220), .Y(n940) );
  OAI22XL U1428 ( .A0(n1268), .A1(n1236), .B0(n1309), .B1(n221), .Y(n939) );
  OAI22XL U1429 ( .A0(n1266), .A1(n1237), .B0(n1310), .B1(n214), .Y(n938) );
  OAI22XL U1430 ( .A0(n1280), .A1(n1237), .B0(n1310), .B1(n207), .Y(n937) );
  OAI22XL U1431 ( .A0(n1278), .A1(n1237), .B0(n1310), .B1(n208), .Y(n936) );
  OAI22XL U1432 ( .A0(n1274), .A1(n1237), .B0(n1310), .B1(n210), .Y(n934) );
  OAI22XL U1433 ( .A0(n1272), .A1(n1237), .B0(n1310), .B1(n211), .Y(n933) );
  OAI22XL U1434 ( .A0(n1270), .A1(n1237), .B0(n1310), .B1(n212), .Y(n932) );
  OAI22XL U1435 ( .A0(n1268), .A1(n1237), .B0(n1310), .B1(n213), .Y(n931) );
  OAI22XL U1436 ( .A0(n1266), .A1(n1238), .B0(n1311), .B1(n206), .Y(n930) );
  OAI22XL U1437 ( .A0(n1280), .A1(n1238), .B0(n1311), .B1(n199), .Y(n929) );
  OAI22XL U1438 ( .A0(n1278), .A1(n1238), .B0(n1311), .B1(n200), .Y(n928) );
  OAI22XL U1439 ( .A0(n1274), .A1(n1238), .B0(n1311), .B1(n202), .Y(n926) );
  OAI22XL U1440 ( .A0(n1272), .A1(n1238), .B0(n1311), .B1(n203), .Y(n925) );
  OAI22XL U1441 ( .A0(n1270), .A1(n1238), .B0(n1311), .B1(n204), .Y(n924) );
  OAI22XL U1442 ( .A0(n1268), .A1(n1238), .B0(n1311), .B1(n205), .Y(n923) );
  OAI22XL U1443 ( .A0(n1265), .A1(n1239), .B0(n1312), .B1(n198), .Y(n922) );
  OAI22XL U1444 ( .A0(n1279), .A1(n1239), .B0(n1312), .B1(n191), .Y(n921) );
  OAI22XL U1445 ( .A0(n1277), .A1(n1239), .B0(n1312), .B1(n192), .Y(n920) );
  OAI22XL U1446 ( .A0(n1273), .A1(n1239), .B0(n1312), .B1(n194), .Y(n918) );
  OAI22XL U1447 ( .A0(n1271), .A1(n1239), .B0(n1312), .B1(n195), .Y(n917) );
  OAI22XL U1448 ( .A0(n1269), .A1(n1239), .B0(n1312), .B1(n196), .Y(n916) );
  OAI22XL U1449 ( .A0(n1267), .A1(n1239), .B0(n1312), .B1(n197), .Y(n915) );
  OAI22XL U1450 ( .A0(n1265), .A1(n1240), .B0(n1313), .B1(n190), .Y(n914) );
  OAI22XL U1451 ( .A0(n1279), .A1(n1240), .B0(n1313), .B1(n183), .Y(n913) );
  OAI22XL U1452 ( .A0(n1277), .A1(n1240), .B0(n1313), .B1(n184), .Y(n912) );
  OAI22XL U1453 ( .A0(n1273), .A1(n1240), .B0(n1313), .B1(n186), .Y(n910) );
  OAI22XL U1454 ( .A0(n1271), .A1(n1240), .B0(n1313), .B1(n187), .Y(n909) );
  OAI22XL U1455 ( .A0(n1269), .A1(n1240), .B0(n1313), .B1(n188), .Y(n908) );
  OAI22XL U1456 ( .A0(n1267), .A1(n1240), .B0(n1313), .B1(n189), .Y(n907) );
  OAI22XL U1457 ( .A0(n1265), .A1(n1241), .B0(n1314), .B1(n182), .Y(n906) );
  OAI22XL U1458 ( .A0(n1279), .A1(n1241), .B0(n1314), .B1(n175), .Y(n905) );
  OAI22XL U1459 ( .A0(n1277), .A1(n1241), .B0(n1314), .B1(n176), .Y(n904) );
  OAI22XL U1460 ( .A0(n1273), .A1(n1241), .B0(n1314), .B1(n178), .Y(n902) );
  OAI22XL U1461 ( .A0(n1271), .A1(n1241), .B0(n1314), .B1(n179), .Y(n901) );
  OAI22XL U1462 ( .A0(n1269), .A1(n1241), .B0(n1314), .B1(n180), .Y(n900) );
  OAI22XL U1463 ( .A0(n1267), .A1(n1241), .B0(n1314), .B1(n181), .Y(n899) );
  OAI22XL U1464 ( .A0(n1265), .A1(n1242), .B0(n1315), .B1(n174), .Y(n898) );
  OAI22XL U1465 ( .A0(n1279), .A1(n1242), .B0(n1315), .B1(n167), .Y(n897) );
  OAI22XL U1466 ( .A0(n1277), .A1(n1242), .B0(n1315), .B1(n168), .Y(n896) );
  OAI22XL U1467 ( .A0(n1273), .A1(n1242), .B0(n1315), .B1(n170), .Y(n894) );
  OAI22XL U1468 ( .A0(n1271), .A1(n1242), .B0(n1315), .B1(n171), .Y(n893) );
  OAI22XL U1469 ( .A0(n1269), .A1(n1242), .B0(n1315), .B1(n172), .Y(n892) );
  OAI22XL U1470 ( .A0(n1267), .A1(n1242), .B0(n1315), .B1(n173), .Y(n891) );
  OAI22XL U1471 ( .A0(n1265), .A1(n1243), .B0(n1316), .B1(n166), .Y(n890) );
  OAI22XL U1472 ( .A0(n1279), .A1(n1243), .B0(n1316), .B1(n159), .Y(n889) );
  OAI22XL U1473 ( .A0(n1277), .A1(n1243), .B0(n1316), .B1(n160), .Y(n888) );
  OAI22XL U1474 ( .A0(n1273), .A1(n1243), .B0(n1316), .B1(n162), .Y(n886) );
  OAI22XL U1475 ( .A0(n1271), .A1(n1243), .B0(n1316), .B1(n163), .Y(n885) );
  OAI22XL U1476 ( .A0(n1269), .A1(n1243), .B0(n1316), .B1(n164), .Y(n884) );
  OAI22XL U1477 ( .A0(n1267), .A1(n1243), .B0(n1316), .B1(n165), .Y(n883) );
  OAI22XL U1478 ( .A0(n1265), .A1(n1244), .B0(n1317), .B1(n158), .Y(n882) );
  OAI22XL U1479 ( .A0(n1279), .A1(n1244), .B0(n1317), .B1(n151), .Y(n881) );
  OAI22XL U1480 ( .A0(n1277), .A1(n1244), .B0(n1317), .B1(n152), .Y(n880) );
  OAI22XL U1481 ( .A0(n1273), .A1(n1244), .B0(n1317), .B1(n154), .Y(n878) );
  OAI22XL U1482 ( .A0(n1271), .A1(n1244), .B0(n1317), .B1(n155), .Y(n877) );
  OAI22XL U1483 ( .A0(n1269), .A1(n1244), .B0(n1317), .B1(n156), .Y(n876) );
  OAI22XL U1484 ( .A0(n1267), .A1(n1244), .B0(n1317), .B1(n157), .Y(n875) );
  OAI22XL U1485 ( .A0(n1266), .A1(n1245), .B0(n1318), .B1(n150), .Y(n874) );
  OAI22XL U1486 ( .A0(n1280), .A1(n1245), .B0(n1318), .B1(n143), .Y(n873) );
  OAI22XL U1487 ( .A0(n1278), .A1(n1245), .B0(n1318), .B1(n144), .Y(n872) );
  OAI22XL U1488 ( .A0(n1274), .A1(n1245), .B0(n1318), .B1(n146), .Y(n870) );
  OAI22XL U1489 ( .A0(n1272), .A1(n1245), .B0(n1318), .B1(n147), .Y(n869) );
  OAI22XL U1490 ( .A0(n1270), .A1(n1245), .B0(n1318), .B1(n148), .Y(n868) );
  OAI22XL U1491 ( .A0(n1268), .A1(n1245), .B0(n1318), .B1(n149), .Y(n867) );
  OAI22XL U1492 ( .A0(n1265), .A1(n1246), .B0(n1319), .B1(n142), .Y(n866) );
  OAI22XL U1493 ( .A0(n1279), .A1(n1246), .B0(n1319), .B1(n135), .Y(n865) );
  OAI22XL U1494 ( .A0(n1277), .A1(n1246), .B0(n1319), .B1(n136), .Y(n864) );
  OAI22XL U1495 ( .A0(n1273), .A1(n1246), .B0(n1319), .B1(n138), .Y(n862) );
  OAI22XL U1496 ( .A0(n1271), .A1(n1246), .B0(n1319), .B1(n139), .Y(n861) );
  OAI22XL U1497 ( .A0(n1269), .A1(n1246), .B0(n1319), .B1(n140), .Y(n860) );
  OAI22XL U1498 ( .A0(n1267), .A1(n1246), .B0(n1319), .B1(n141), .Y(n859) );
  OAI22XL U1499 ( .A0(n1265), .A1(n1247), .B0(n1320), .B1(n134), .Y(n858) );
  OAI22XL U1500 ( .A0(n1279), .A1(n1247), .B0(n1320), .B1(n127), .Y(n857) );
  OAI22XL U1501 ( .A0(n1277), .A1(n1247), .B0(n1320), .B1(n128), .Y(n856) );
  OAI22XL U1502 ( .A0(n1273), .A1(n1247), .B0(n1320), .B1(n130), .Y(n854) );
  OAI22XL U1503 ( .A0(n1271), .A1(n1247), .B0(n1320), .B1(n131), .Y(n853) );
  OAI22XL U1504 ( .A0(n1269), .A1(n1247), .B0(n1320), .B1(n132), .Y(n852) );
  OAI22XL U1505 ( .A0(n1267), .A1(n1247), .B0(n1320), .B1(n133), .Y(n851) );
  OAI22XL U1506 ( .A0(n1265), .A1(n1248), .B0(n1321), .B1(n126), .Y(n850) );
  OAI22XL U1507 ( .A0(n1279), .A1(n1248), .B0(n1321), .B1(n119), .Y(n849) );
  OAI22XL U1508 ( .A0(n1277), .A1(n1248), .B0(n1321), .B1(n120), .Y(n848) );
  OAI22XL U1509 ( .A0(n1273), .A1(n1248), .B0(n1321), .B1(n122), .Y(n846) );
  OAI22XL U1510 ( .A0(n1271), .A1(n1248), .B0(n1321), .B1(n123), .Y(n845) );
  OAI22XL U1511 ( .A0(n1269), .A1(n1248), .B0(n1321), .B1(n124), .Y(n844) );
  OAI22XL U1512 ( .A0(n1267), .A1(n1248), .B0(n1321), .B1(n125), .Y(n843) );
  OAI22XL U1513 ( .A0(n1275), .A1(n1220), .B0(n353), .B1(n1291), .Y(n1071) );
  OAI22XL U1514 ( .A0(n1220), .A1(n432), .B0(n358), .B1(n1291), .Y(n1074) );
  OAI22XL U1515 ( .A0(n1220), .A1(n425), .B0(n351), .B1(n1291), .Y(n1073) );
  OAI22XL U1516 ( .A0(n1220), .A1(n426), .B0(n352), .B1(n1291), .Y(n1072) );
  OAI22XL U1517 ( .A0(n1220), .A1(n428), .B0(n354), .B1(n1291), .Y(n1070) );
  OAI22XL U1518 ( .A0(n1220), .A1(n429), .B0(n355), .B1(n1291), .Y(n1069) );
  OAI22XL U1519 ( .A0(n1220), .A1(n430), .B0(n356), .B1(n1291), .Y(n1068) );
  OAI22XL U1520 ( .A0(n1220), .A1(n431), .B0(n357), .B1(n1291), .Y(n1067) );
  OAI22XL U1521 ( .A0(n1299), .A1(n427), .B0(n345), .B1(n1249), .Y(n805) );
  AND4X1 U1522 ( .A(str_len[5]), .B(n439), .C(n361), .D(n360), .Y(n436) );
  OAI2BB2XL U1523 ( .B0(n491), .B1(n1214), .A0N(\pat_temp[1][6] ), .A1N(n1214), 
        .Y(n1134) );
  OAI2BB2XL U1524 ( .B0(n489), .B1(n1214), .A0N(\pat_temp[1][4] ), .A1N(n1214), 
        .Y(n1132) );
  OAI2BB2XL U1525 ( .B0(n488), .B1(n1214), .A0N(\pat_temp[1][3] ), .A1N(n1214), 
        .Y(n1131) );
  OAI2BB2XL U1526 ( .B0(n487), .B1(n1214), .A0N(\pat_temp[1][2] ), .A1N(n1214), 
        .Y(n1130) );
  OAI2BB2XL U1527 ( .B0(n486), .B1(n1214), .A0N(\pat_temp[1][1] ), .A1N(n1214), 
        .Y(n1129) );
  OAI2BB2XL U1528 ( .B0(n491), .B1(n1219), .A0N(\pat_temp[6][6] ), .A1N(n1219), 
        .Y(n1094) );
  OAI2BB2XL U1529 ( .B0(n489), .B1(n1219), .A0N(\pat_temp[6][4] ), .A1N(n1219), 
        .Y(n1092) );
  OAI2BB2XL U1530 ( .B0(n488), .B1(n1219), .A0N(\pat_temp[6][3] ), .A1N(n1219), 
        .Y(n1091) );
  OAI2BB2XL U1531 ( .B0(n487), .B1(n1219), .A0N(\pat_temp[6][2] ), .A1N(n1219), 
        .Y(n1090) );
  OAI2BB2XL U1532 ( .B0(n486), .B1(n1219), .A0N(\pat_temp[6][1] ), .A1N(n1219), 
        .Y(n1089) );
  OAI2BB2XL U1533 ( .B0(n491), .B1(n1215), .A0N(\pat_temp[2][6] ), .A1N(n1215), 
        .Y(n1126) );
  OAI2BB2XL U1534 ( .B0(n489), .B1(n1215), .A0N(\pat_temp[2][4] ), .A1N(n1215), 
        .Y(n1124) );
  OAI2BB2XL U1535 ( .B0(n488), .B1(n1215), .A0N(\pat_temp[2][3] ), .A1N(n1215), 
        .Y(n1123) );
  OAI2BB2XL U1536 ( .B0(n487), .B1(n1215), .A0N(\pat_temp[2][2] ), .A1N(n1215), 
        .Y(n1122) );
  OAI2BB2XL U1537 ( .B0(n486), .B1(n1215), .A0N(\pat_temp[2][1] ), .A1N(n1215), 
        .Y(n1121) );
  OAI2BB2XL U1538 ( .B0(n491), .B1(n1216), .A0N(\pat_temp[3][6] ), .A1N(n1216), 
        .Y(n1118) );
  OAI2BB2XL U1539 ( .B0(n489), .B1(n1216), .A0N(\pat_temp[3][4] ), .A1N(n1216), 
        .Y(n1116) );
  OAI2BB2XL U1540 ( .B0(n488), .B1(n1216), .A0N(\pat_temp[3][3] ), .A1N(n1216), 
        .Y(n1115) );
  OAI2BB2XL U1541 ( .B0(n487), .B1(n1216), .A0N(\pat_temp[3][2] ), .A1N(n1216), 
        .Y(n1114) );
  OAI2BB2XL U1542 ( .B0(n486), .B1(n1216), .A0N(\pat_temp[3][1] ), .A1N(n1216), 
        .Y(n1113) );
  OAI2BB2XL U1543 ( .B0(n490), .B1(n1214), .A0N(\pat_temp[1][5] ), .A1N(n1214), 
        .Y(n1133) );
  OAI2BB2XL U1544 ( .B0(n490), .B1(n1219), .A0N(\pat_temp[6][5] ), .A1N(n1219), 
        .Y(n1093) );
  OAI2BB2XL U1545 ( .B0(n490), .B1(n1215), .A0N(\pat_temp[2][5] ), .A1N(n1215), 
        .Y(n1125) );
  OAI2BB2XL U1546 ( .B0(n490), .B1(n1216), .A0N(\pat_temp[3][5] ), .A1N(n1216), 
        .Y(n1117) );
  OAI2BB2XL U1547 ( .B0(n1289), .B1(n1219), .A0N(\pat_temp[6][0] ), .A1N(n1219), .Y(n1096) );
  OAI2BB2XL U1548 ( .B0(n1283), .B1(n1219), .A0N(\pat_temp[6][7] ), .A1N(n1219), .Y(n1095) );
  OAI2BB2XL U1549 ( .B0(n1289), .B1(n1215), .A0N(\pat_temp[2][0] ), .A1N(n1215), .Y(n1128) );
  OAI2BB2XL U1550 ( .B0(n1283), .B1(n1215), .A0N(\pat_temp[2][7] ), .A1N(n1215), .Y(n1127) );
  OAI2BB2XL U1551 ( .B0(n1289), .B1(n1214), .A0N(\pat_temp[1][0] ), .A1N(n1214), .Y(n1136) );
  OAI2BB2XL U1552 ( .B0(n1283), .B1(n1214), .A0N(\pat_temp[1][7] ), .A1N(n1214), .Y(n1135) );
  OAI2BB2XL U1553 ( .B0(n1289), .B1(n1216), .A0N(\pat_temp[3][0] ), .A1N(n1216), .Y(n1120) );
  OAI2BB2XL U1554 ( .B0(n1283), .B1(n1216), .A0N(\pat_temp[3][7] ), .A1N(n1216), .Y(n1119) );
  CLKINVX1 U1555 ( .A(ispattern), .Y(n1328) );
  NOR2X2 U1556 ( .A(n412), .B(star_mode), .Y(n397) );
  NOR2X2 U1557 ( .A(n412), .B(n75), .Y(n398) );
  OAI222XL U1558 ( .A0(n375), .A1(n74), .B0(N182), .B1(n528), .C0(n1205), .C1(
        n377), .Y(n781) );
  OAI222XL U1559 ( .A0(n375), .A1(n71), .B0(n528), .B1(n376), .C0(n82), .C1(
        n377), .Y(n779) );
  XOR2X1 U1560 ( .A(n82), .B(n378), .Y(n376) );
  NOR2BX1 U1561 ( .AN(n379), .B(n1203), .Y(n378) );
  NAND3X1 U1562 ( .A(n387), .B(n1211), .C(star_mode), .Y(n375) );
  OAI21XL U1563 ( .A0(pat_len[1]), .A1(n510), .B0(n512), .Y(n511) );
  OAI211X1 U1564 ( .A0(n363), .A1(n482), .B0(n483), .C0(n424), .Y(n1079) );
  NAND2X1 U1565 ( .A(N588), .B(n1292), .Y(n483) );
  OAI211X1 U1566 ( .A0(n81), .A1(n394), .B0(n410), .C0(n411), .Y(n797) );
  NAND2X1 U1567 ( .A(N364), .B(n398), .Y(n410) );
  AOI22XL U1568 ( .A0(n81), .A1(n1290), .B0(match_index[0]), .B1(n397), .Y(
        n411) );
  OAI211X1 U1569 ( .A0(n78), .A1(n394), .B0(n404), .C0(n405), .Y(n794) );
  NAND2X1 U1570 ( .A(N367), .B(n398), .Y(n404) );
  AOI22X1 U1571 ( .A0(N386), .A1(n1290), .B0(N373), .B1(n397), .Y(n405) );
  OAI211X1 U1572 ( .A0(n79), .A1(n394), .B0(n406), .C0(n407), .Y(n795) );
  NAND2X1 U1573 ( .A(N366), .B(n398), .Y(n406) );
  AOI22X1 U1574 ( .A0(N385), .A1(n1290), .B0(N372), .B1(n397), .Y(n407) );
  OAI211X1 U1575 ( .A0(n80), .A1(n394), .B0(n408), .C0(n409), .Y(n796) );
  NAND2X1 U1576 ( .A(n1156), .B(n398), .Y(n408) );
  AOI22X1 U1577 ( .A0(N384), .A1(n1290), .B0(N371), .B1(n397), .Y(n409) );
  OAI211X1 U1578 ( .A0(n77), .A1(n394), .B0(n402), .C0(n403), .Y(n793) );
  NAND2X1 U1579 ( .A(N368), .B(n398), .Y(n402) );
  AOI22X1 U1580 ( .A0(N387), .A1(n1290), .B0(N374), .B1(n397), .Y(n403) );
  OAI211X1 U1581 ( .A0(n76), .A1(n394), .B0(n395), .C0(n396), .Y(n787) );
  NAND2X1 U1582 ( .A(N369), .B(n398), .Y(n395) );
  AOI22X1 U1583 ( .A0(N388), .A1(n1290), .B0(N375), .B1(n397), .Y(n396) );
  OAI22XL U1584 ( .A0(n366), .A1(n513), .B0(pat_len[0]), .B1(n510), .Y(n1150)
         );
  OAI2BB2XL U1585 ( .B0(n491), .B1(n1213), .A0N(\pat_temp[0][6] ), .A1N(n1213), 
        .Y(n1142) );
  OAI2BB2XL U1586 ( .B0(n489), .B1(n1213), .A0N(\pat_temp[0][4] ), .A1N(n1213), 
        .Y(n1140) );
  OAI2BB2XL U1587 ( .B0(n488), .B1(n1213), .A0N(\pat_temp[0][3] ), .A1N(n1213), 
        .Y(n1139) );
  OAI2BB2XL U1588 ( .B0(n487), .B1(n1213), .A0N(\pat_temp[0][2] ), .A1N(n1213), 
        .Y(n1138) );
  OAI2BB2XL U1589 ( .B0(n486), .B1(n1213), .A0N(\pat_temp[0][1] ), .A1N(n1213), 
        .Y(n1137) );
  OAI2BB2XL U1590 ( .B0(n491), .B1(n1218), .A0N(\pat_temp[5][6] ), .A1N(n1218), 
        .Y(n1102) );
  OAI2BB2XL U1591 ( .B0(n489), .B1(n1218), .A0N(\pat_temp[5][4] ), .A1N(n1218), 
        .Y(n1100) );
  OAI2BB2XL U1592 ( .B0(n488), .B1(n1218), .A0N(\pat_temp[5][3] ), .A1N(n1218), 
        .Y(n1099) );
  OAI2BB2XL U1593 ( .B0(n487), .B1(n1218), .A0N(\pat_temp[5][2] ), .A1N(n1218), 
        .Y(n1098) );
  OAI2BB2XL U1594 ( .B0(n486), .B1(n1218), .A0N(\pat_temp[5][1] ), .A1N(n1218), 
        .Y(n1097) );
  OAI2BB2XL U1595 ( .B0(n491), .B1(n1217), .A0N(\pat_temp[4][6] ), .A1N(n1217), 
        .Y(n1110) );
  OAI2BB2XL U1596 ( .B0(n489), .B1(n1217), .A0N(\pat_temp[4][4] ), .A1N(n1217), 
        .Y(n1108) );
  OAI2BB2XL U1597 ( .B0(n488), .B1(n1217), .A0N(\pat_temp[4][3] ), .A1N(n1217), 
        .Y(n1107) );
  OAI2BB2XL U1598 ( .B0(n487), .B1(n1217), .A0N(\pat_temp[4][2] ), .A1N(n1217), 
        .Y(n1106) );
  OAI2BB2XL U1599 ( .B0(n486), .B1(n1217), .A0N(\pat_temp[4][1] ), .A1N(n1217), 
        .Y(n1105) );
  OAI2BB2XL U1600 ( .B0(n1212), .B1(n491), .A0N(\pat_temp[7][6] ), .A1N(n1212), 
        .Y(n1086) );
  OAI2BB2XL U1601 ( .B0(n1212), .B1(n489), .A0N(\pat_temp[7][4] ), .A1N(n1212), 
        .Y(n1084) );
  OAI2BB2XL U1602 ( .B0(n1212), .B1(n488), .A0N(\pat_temp[7][3] ), .A1N(n1212), 
        .Y(n1083) );
  OAI2BB2XL U1603 ( .B0(n1212), .B1(n487), .A0N(\pat_temp[7][2] ), .A1N(n1212), 
        .Y(n1082) );
  OAI2BB2XL U1604 ( .B0(n1212), .B1(n486), .A0N(\pat_temp[7][1] ), .A1N(n1212), 
        .Y(n1081) );
  OAI2BB2XL U1605 ( .B0(n490), .B1(n1213), .A0N(\pat_temp[0][5] ), .A1N(n1213), 
        .Y(n1141) );
  OAI2BB2XL U1606 ( .B0(n490), .B1(n1218), .A0N(\pat_temp[5][5] ), .A1N(n1218), 
        .Y(n1101) );
  OAI2BB2XL U1607 ( .B0(n490), .B1(n1212), .A0N(\pat_temp[7][5] ), .A1N(n1212), 
        .Y(n1085) );
  OAI2BB2XL U1608 ( .B0(n490), .B1(n1217), .A0N(\pat_temp[4][5] ), .A1N(n1217), 
        .Y(n1109) );
  OAI2BB2XL U1609 ( .B0(N225), .B1(n482), .A0N(N225), .A1N(n1292), .Y(n1080)
         );
  OAI2BB2XL U1610 ( .B0(n359), .B1(n482), .A0N(N592), .A1N(n1292), .Y(n1075)
         );
  OAI2BB2XL U1611 ( .B0(n360), .B1(n482), .A0N(N591), .A1N(n1292), .Y(n1076)
         );
  OAI2BB2XL U1612 ( .B0(n361), .B1(n482), .A0N(N590), .A1N(n1292), .Y(n1077)
         );
  OAI2BB2XL U1613 ( .B0(n362), .B1(n482), .A0N(N589), .A1N(n1292), .Y(n1078)
         );
  OAI21XL U1614 ( .A0(n375), .A1(n72), .B0(n380), .Y(n780) );
  AOI32X1 U1615 ( .A0(n381), .A1(n1203), .A2(n379), .B0(N184), .B1(n382), .Y(
        n380) );
  OAI21XL U1616 ( .A0(n379), .A1(n528), .B0(n377), .Y(n382) );
  OAI21XL U1617 ( .A0(n375), .A1(n73), .B0(n383), .Y(n782) );
  AOI32X1 U1618 ( .A0(n381), .A1(n1204), .A2(N182), .B0(N183), .B1(n384), .Y(
        n383) );
  OAI21XL U1619 ( .A0(N182), .A1(n528), .B0(n377), .Y(n384) );
  OA21XL U1620 ( .A0(pat_len[0]), .A1(n510), .B0(n513), .Y(n512) );
  OAI2BB2XL U1621 ( .B0(n512), .B1(n365), .A0N(n1326), .A1N(n495), .Y(n1147)
         );
  OAI2BB2XL U1622 ( .B0(n1289), .B1(n1212), .A0N(\pat_temp[7][0] ), .A1N(n1212), .Y(n1088) );
  OAI2BB2XL U1623 ( .B0(n1283), .B1(n1212), .A0N(\pat_temp[7][7] ), .A1N(n1212), .Y(n1087) );
  OAI2BB2XL U1624 ( .B0(n1289), .B1(n1213), .A0N(\pat_temp[0][0] ), .A1N(n1213), .Y(n1144) );
  OAI2BB2XL U1625 ( .B0(n1283), .B1(n1213), .A0N(\pat_temp[0][7] ), .A1N(n1213), .Y(n1143) );
  OAI2BB2XL U1626 ( .B0(n1289), .B1(n1218), .A0N(\pat_temp[5][0] ), .A1N(n1218), .Y(n1104) );
  OAI2BB2XL U1627 ( .B0(n1283), .B1(n1218), .A0N(\pat_temp[5][7] ), .A1N(n1218), .Y(n1103) );
  OAI2BB2XL U1628 ( .B0(n1289), .B1(n1217), .A0N(\pat_temp[4][0] ), .A1N(n1217), .Y(n1112) );
  OAI2BB2XL U1629 ( .B0(n1283), .B1(n1217), .A0N(\pat_temp[4][7] ), .A1N(n1217), .Y(n1111) );
  NAND2X1 U1630 ( .A(n509), .B(n1212), .Y(n1145) );
  OAI21XL U1631 ( .A0(n502), .A1(n511), .B0(pat_len[3]), .Y(n509) );
  AO22X1 U1632 ( .A0(n511), .A1(pat_len[2]), .B0(n499), .B1(n502), .Y(n1146)
         );
  NAND2X1 U1633 ( .A(n528), .B(star_mode), .Y(n527) );
  OAI22XL U1634 ( .A0(n74), .A1(n527), .B0(m_reg[0]), .B1(n528), .Y(N304) );
  OAI22XL U1635 ( .A0(n73), .A1(n527), .B0(n528), .B1(n392), .Y(N305) );
  OAI22XL U1636 ( .A0(n71), .A1(n527), .B0(n528), .B1(n390), .Y(N307) );
  OAI22XL U1637 ( .A0(n72), .A1(n527), .B0(n528), .B1(n391), .Y(N306) );
  AND2X2 U1638 ( .A(n505), .B(n506), .Y(n504) );
  NAND4X1 U1639 ( .A(n1289), .B(n1288), .C(chardata[5]), .D(n507), .Y(n506) );
  NOR4X1 U1640 ( .A(chardata[7]), .B(chardata[6]), .C(chardata[4]), .D(
        chardata[3]), .Y(n507) );
  CLKINVX1 U1641 ( .A(chardata[1]), .Y(n1288) );
  NAND2X1 U1642 ( .A(n514), .B(n515), .Y(n505) );
  NOR4X1 U1643 ( .A(chardata[7]), .B(chardata[5]), .C(chardata[0]), .D(n1284), 
        .Y(n515) );
  NOR4X1 U1644 ( .A(n1285), .B(n1286), .C(n1287), .D(n1288), .Y(n514) );
  CLKINVX1 U1645 ( .A(chardata[6]), .Y(n1284) );
  CLKINVX1 U1646 ( .A(chardata[2]), .Y(n1287) );
  CLKINVX1 U1647 ( .A(chardata[3]), .Y(n1286) );
  CLKINVX1 U1648 ( .A(chardata[4]), .Y(n1285) );
  INVX3 U1649 ( .A(chardata[0]), .Y(n1289) );
  OAI2BB1X1 U1650 ( .A0N(n386), .A1N(star_mode), .B0(n1211), .Y(n1148) );
  OAI21XL U1651 ( .A0(\sub_103_aco/B[0] ), .A1(n1332), .B0(n505), .Y(n1149) );
  INVX3 U1652 ( .A(chardata[7]), .Y(n1283) );
  CLKBUFX3 U1653 ( .A(n1197), .Y(n1208) );
  NOR2X1 U1654 ( .A(n1204), .B(N184), .Y(n1197) );
  CLKBUFX3 U1655 ( .A(n1200), .Y(n1206) );
  NOR2X1 U1656 ( .A(n1203), .B(N183), .Y(n1200) );
  CLKBUFX3 U1657 ( .A(n1196), .Y(n1209) );
  NOR2X1 U1658 ( .A(N183), .B(N184), .Y(n1196) );
  OAI222XL U1659 ( .A0(n597), .A1(n236), .B0(n598), .B1(n228), .C0(n599), .C1(
        n244), .Y(n587) );
  OAI222XL U1660 ( .A0(n597), .A1(n237), .B0(n598), .B1(n229), .C0(n599), .C1(
        n245), .Y(n666) );
  OAI222XL U1661 ( .A0(n597), .A1(n235), .B0(n598), .B1(n227), .C0(n599), .C1(
        n243), .Y(n624) );
  OAI222XL U1662 ( .A0(n597), .A1(n238), .B0(n598), .B1(n230), .C0(n599), .C1(
        n246), .Y(n645) );
  OAI222XL U1663 ( .A0(n597), .A1(n234), .B0(n598), .B1(n226), .C0(n599), .C1(
        n242), .Y(n733) );
  OAI222XL U1664 ( .A0(n597), .A1(n232), .B0(n598), .B1(n224), .C0(n599), .C1(
        n240), .Y(n691) );
  OAI222XL U1665 ( .A0(n597), .A1(n231), .B0(n598), .B1(n223), .C0(n599), .C1(
        n239), .Y(n712) );
  OAI222XL U1666 ( .A0(n597), .A1(n233), .B0(n598), .B1(n225), .C0(n599), .C1(
        n241), .Y(n764) );
  NAND3X2 U1667 ( .A(n752), .B(n76), .C(n775), .Y(n604) );
  OAI22XL U1668 ( .A0(n566), .A1(n156), .B0(n567), .B1(n148), .Y(n565) );
  OAI22XL U1669 ( .A0(n566), .A1(n154), .B0(n567), .B1(n146), .Y(n728) );
  OAI22XL U1670 ( .A0(n566), .A1(n152), .B0(n567), .B1(n144), .Y(n686) );
  OAI22XL U1671 ( .A0(n566), .A1(n151), .B0(n567), .B1(n143), .Y(n707) );
  OAI22XL U1672 ( .A0(n566), .A1(n153), .B0(n567), .B1(n145), .Y(n749) );
  NOR4X1 U1673 ( .A(n562), .B(n563), .C(n564), .D(n565), .Y(n561) );
  OAI222XL U1674 ( .A0(n572), .A1(n100), .B0(n573), .B1(n92), .C0(n574), .C1(
        n108), .Y(n562) );
  OAI22XL U1675 ( .A0(n570), .A1(n124), .B0(n571), .B1(n116), .Y(n563) );
  OAI22XL U1676 ( .A0(n568), .A1(n140), .B0(n569), .B1(n132), .Y(n564) );
  NOR4X1 U1677 ( .A(n725), .B(n726), .C(n727), .D(n728), .Y(n724) );
  OAI222XL U1678 ( .A0(n572), .A1(n98), .B0(n573), .B1(n90), .C0(n574), .C1(
        n106), .Y(n725) );
  OAI22XL U1679 ( .A0(n570), .A1(n122), .B0(n571), .B1(n114), .Y(n726) );
  OAI22XL U1680 ( .A0(n568), .A1(n138), .B0(n569), .B1(n130), .Y(n727) );
  NOR4X1 U1681 ( .A(n683), .B(n684), .C(n685), .D(n686), .Y(n682) );
  OAI222XL U1682 ( .A0(n572), .A1(n96), .B0(n573), .B1(n88), .C0(n574), .C1(
        n104), .Y(n683) );
  OAI22XL U1683 ( .A0(n570), .A1(n120), .B0(n571), .B1(n112), .Y(n684) );
  OAI22XL U1684 ( .A0(n568), .A1(n136), .B0(n569), .B1(n128), .Y(n685) );
  NOR4X1 U1685 ( .A(n704), .B(n705), .C(n706), .D(n707), .Y(n703) );
  OAI222XL U1686 ( .A0(n572), .A1(n95), .B0(n573), .B1(n87), .C0(n574), .C1(
        n103), .Y(n704) );
  OAI22XL U1687 ( .A0(n570), .A1(n119), .B0(n571), .B1(n111), .Y(n705) );
  OAI22XL U1688 ( .A0(n568), .A1(n135), .B0(n569), .B1(n127), .Y(n706) );
  NOR4X1 U1689 ( .A(n746), .B(n747), .C(n748), .D(n749), .Y(n745) );
  OAI222XL U1690 ( .A0(n572), .A1(n97), .B0(n573), .B1(n89), .C0(n574), .C1(
        n105), .Y(n746) );
  OAI22XL U1691 ( .A0(n570), .A1(n121), .B0(n571), .B1(n113), .Y(n747) );
  OAI22XL U1692 ( .A0(n568), .A1(n137), .B0(n569), .B1(n129), .Y(n748) );
  NOR4X1 U1693 ( .A(n587), .B(n588), .C(n589), .D(n590), .Y(n559) );
  OAI22XL U1694 ( .A0(n595), .A1(n260), .B0(n596), .B1(n252), .Y(n588) );
  OAI22XL U1695 ( .A0(n593), .A1(n276), .B0(n594), .B1(n268), .Y(n589) );
  OAI22XL U1696 ( .A0(n591), .A1(n292), .B0(n592), .B1(n284), .Y(n590) );
  NOR4X1 U1697 ( .A(n666), .B(n667), .C(n668), .D(n669), .Y(n655) );
  OAI22XL U1698 ( .A0(n595), .A1(n261), .B0(n596), .B1(n253), .Y(n667) );
  OAI22XL U1699 ( .A0(n593), .A1(n277), .B0(n594), .B1(n269), .Y(n668) );
  OAI22XL U1700 ( .A0(n591), .A1(n293), .B0(n592), .B1(n285), .Y(n669) );
  NOR4X1 U1701 ( .A(n624), .B(n625), .C(n626), .D(n627), .Y(n613) );
  OAI22XL U1702 ( .A0(n595), .A1(n259), .B0(n596), .B1(n251), .Y(n625) );
  OAI22XL U1703 ( .A0(n593), .A1(n275), .B0(n594), .B1(n267), .Y(n626) );
  OAI22XL U1704 ( .A0(n591), .A1(n291), .B0(n592), .B1(n283), .Y(n627) );
  NOR4X1 U1705 ( .A(n645), .B(n646), .C(n647), .D(n648), .Y(n634) );
  OAI22XL U1706 ( .A0(n595), .A1(n262), .B0(n596), .B1(n254), .Y(n646) );
  OAI22XL U1707 ( .A0(n593), .A1(n278), .B0(n594), .B1(n270), .Y(n647) );
  OAI22XL U1708 ( .A0(n591), .A1(n294), .B0(n592), .B1(n286), .Y(n648) );
  NOR4X1 U1709 ( .A(n733), .B(n734), .C(n735), .D(n736), .Y(n722) );
  OAI22XL U1710 ( .A0(n595), .A1(n258), .B0(n596), .B1(n250), .Y(n734) );
  OAI22XL U1711 ( .A0(n593), .A1(n274), .B0(n594), .B1(n266), .Y(n735) );
  OAI22XL U1712 ( .A0(n591), .A1(n290), .B0(n592), .B1(n282), .Y(n736) );
  NOR4X1 U1713 ( .A(n691), .B(n692), .C(n693), .D(n694), .Y(n680) );
  OAI22XL U1714 ( .A0(n595), .A1(n256), .B0(n596), .B1(n248), .Y(n692) );
  OAI22XL U1715 ( .A0(n593), .A1(n272), .B0(n594), .B1(n264), .Y(n693) );
  OAI22XL U1716 ( .A0(n591), .A1(n288), .B0(n592), .B1(n280), .Y(n694) );
  NOR4X1 U1717 ( .A(n712), .B(n713), .C(n714), .D(n715), .Y(n701) );
  OAI22XL U1718 ( .A0(n595), .A1(n255), .B0(n596), .B1(n247), .Y(n713) );
  OAI22XL U1719 ( .A0(n593), .A1(n271), .B0(n594), .B1(n263), .Y(n714) );
  OAI22XL U1720 ( .A0(n591), .A1(n287), .B0(n592), .B1(n279), .Y(n715) );
  NOR4X1 U1721 ( .A(n764), .B(n765), .C(n766), .D(n767), .Y(n743) );
  OAI22XL U1722 ( .A0(n595), .A1(n257), .B0(n596), .B1(n249), .Y(n765) );
  OAI22XL U1723 ( .A0(n593), .A1(n273), .B0(n594), .B1(n265), .Y(n766) );
  OAI22XL U1724 ( .A0(n591), .A1(n289), .B0(n592), .B1(n281), .Y(n767) );
  NOR2X1 U1725 ( .A(n78), .B(counter[4]), .Y(n770) );
  NOR2X1 U1726 ( .A(n78), .B(n77), .Y(n756) );
  NOR2X1 U1727 ( .A(counter[3]), .B(counter[4]), .Y(n777) );
  NOR2X1 U1728 ( .A(n77), .B(counter[3]), .Y(n763) );
  CLKBUFX3 U1729 ( .A(n421), .Y(n1210) );
  NAND3X1 U1730 ( .A(n752), .B(n76), .C(n776), .Y(n421) );
  NAND2X2 U1731 ( .A(counter[5]), .B(n81), .Y(n572) );
  NAND2X2 U1732 ( .A(counter[0]), .B(counter[5]), .Y(n573) );
  NAND3X1 U1733 ( .A(n1331), .B(n385), .C(star_mode), .Y(n399) );
  AND4X1 U1734 ( .A(n1331), .B(n385), .C(n1210), .D(n75), .Y(n420) );
  NAND4X1 U1735 ( .A(n542), .B(n543), .C(n544), .D(n545), .Y(n517) );
  XOR2X1 U1736 ( .A(n81), .B(N225), .Y(n543) );
  XOR2X1 U1737 ( .A(n79), .B(N227), .Y(n544) );
  XOR2X1 U1738 ( .A(n78), .B(N228), .Y(n542) );
  OAI2BB2XL U1739 ( .B0(n78), .B1(n399), .A0N(mat_idx2[3]), .A1N(n400), .Y(
        n789) );
  OAI2BB2XL U1740 ( .B0(n79), .B1(n399), .A0N(mat_idx2[2]), .A1N(n400), .Y(
        n790) );
  OAI2BB2XL U1741 ( .B0(n80), .B1(n399), .A0N(mat_idx2[1]), .A1N(n400), .Y(
        n791) );
  OAI2BB2XL U1742 ( .B0(n77), .B1(n399), .A0N(mat_idx2[4]), .A1N(n400), .Y(
        n788) );
  OAI2BB2XL U1743 ( .B0(n81), .B1(n399), .A0N(N364), .A1N(n400), .Y(n792) );
  NOR3X1 U1744 ( .A(n546), .B(n547), .C(n548), .Y(n545) );
  XOR2X1 U1745 ( .A(counter[1]), .B(N226), .Y(n546) );
  XOR2X1 U1746 ( .A(counter[4]), .B(N229), .Y(n548) );
  XOR2X1 U1747 ( .A(counter[5]), .B(N230), .Y(n547) );
  AO22XL U1748 ( .A0(match_index[1]), .A1(n419), .B0(N337), .B1(n420), .Y(n801) );
  AO22XL U1749 ( .A0(match_index[4]), .A1(n419), .B0(N340), .B1(n420), .Y(n798) );
  AO22XL U1750 ( .A0(match_index[3]), .A1(n419), .B0(N339), .B1(n420), .Y(n799) );
  AO22XL U1751 ( .A0(match_index[2]), .A1(n419), .B0(N338), .B1(n420), .Y(n800) );
  AO22XL U1752 ( .A0(match_index[0]), .A1(n419), .B0(N336), .B1(n420), .Y(n802) );
  ADDHXL U1753 ( .A(str_len[1]), .B(str_len[0]), .CO(\r427/carry [2]), .S(N226) );
  ADDHXL U1754 ( .A(str_len[2]), .B(\r427/carry [2]), .CO(\r427/carry [3]), 
        .S(N227) );
  ADDHXL U1755 ( .A(str_len[3]), .B(\r427/carry [3]), .CO(\r427/carry [4]), 
        .S(N228) );
  AND2X2 U1756 ( .A(n517), .B(n537), .Y(n518) );
  NAND4X1 U1757 ( .A(n538), .B(n539), .C(n540), .D(n541), .Y(n537) );
  XOR2X1 U1758 ( .A(n1205), .B(pat_len[0]), .Y(n538) );
  XOR2X1 U1759 ( .A(n1203), .B(pat_len[2]), .Y(n540) );
  ADDHXL U1760 ( .A(str_len[4]), .B(\r427/carry [4]), .CO(\r427/carry [5]), 
        .S(N229) );
  NOR3BXL U1761 ( .AN(state[2]), .B(state[1]), .C(state[3]), .Y(n778) );
  XOR2X1 U1762 ( .A(n1204), .B(pat_len[1]), .Y(n539) );
  NAND2X1 U1763 ( .A(n778), .B(n70), .Y(n418) );
  XOR2X1 U1764 ( .A(n82), .B(pat_len[3]), .Y(n541) );
  NOR2X1 U1765 ( .A(state[2]), .B(state[3]), .Y(n520) );
  NAND2X1 U1766 ( .A(n520), .B(state[1]), .Y(n519) );
  NAND2X1 U1767 ( .A(n778), .B(state[0]), .Y(n422) );
  OAI22XL U1768 ( .A0(n74), .A1(n389), .B0(m_reg[0]), .B1(n1211), .Y(n786) );
  OAI22XL U1769 ( .A0(n73), .A1(n389), .B0(n392), .B1(n1211), .Y(n785) );
  OAI22XL U1770 ( .A0(n71), .A1(n389), .B0(n390), .B1(n1211), .Y(n783) );
  OAI22XL U1771 ( .A0(n72), .A1(n389), .B0(n391), .B1(n1211), .Y(n784) );
  OR2X1 U1772 ( .A(n519), .B(state[0]), .Y(n401) );
  NOR3X1 U1773 ( .A(str_len[4]), .B(str_len[5]), .C(str_len[3]), .Y(n479) );
  ADDHXL U1774 ( .A(str_len[1]), .B(str_len[0]), .CO(\add_171_S2/carry [2]), 
        .S(N588) );
  ADDHXL U1775 ( .A(str_len[2]), .B(\add_171_S2/carry [2]), .CO(
        \add_171_S2/carry [3]), .S(N589) );
  ADDHXL U1776 ( .A(str_len[3]), .B(\add_171_S2/carry [3]), .CO(
        \add_171_S2/carry [4]), .S(N590) );
  ADDHXL U1777 ( .A(counter[1]), .B(counter[0]), .CO(\add_122_S2/carry [2]), 
        .S(N384) );
  ADDHXL U1778 ( .A(counter[2]), .B(\add_122_S2/carry [2]), .CO(
        \add_122_S2/carry [3]), .S(N385) );
  ADDHXL U1779 ( .A(counter[3]), .B(\add_122_S2/carry [3]), .CO(
        \add_122_S2/carry [4]), .S(N386) );
  ADDHXL U1780 ( .A(str_len[4]), .B(\add_171_S2/carry [4]), .CO(
        \add_171_S2/carry [5]), .S(N591) );
  ADDHXL U1781 ( .A(counter[4]), .B(\add_122_S2/carry [4]), .CO(
        \add_122_S2/carry [5]), .S(N387) );
  NOR4X1 U1782 ( .A(pat_len[0]), .B(pat_len[1]), .C(pat_len[2]), .D(pat_len[3]), .Y(n508) );
  XNOR2X1 U1783 ( .A(m_reg[1]), .B(m_reg[0]), .Y(n392) );
  XOR2X1 U1784 ( .A(n530), .B(m_reg[2]), .Y(n391) );
  XNOR2X1 U1785 ( .A(m_reg[3]), .B(n529), .Y(n390) );
  NOR2BX1 U1786 ( .AN(m_reg[2]), .B(n530), .Y(n529) );
  NOR2X1 U1787 ( .A(n366), .B(pat_len[1]), .Y(n495) );
  NOR2X1 U1788 ( .A(n366), .B(n365), .Y(n499) );
  XOR2X1 U1789 ( .A(m_reg[1]), .B(n365), .Y(n526) );
  NOR2X1 U1790 ( .A(n1205), .B(n1204), .Y(n379) );
  NOR4X1 U1791 ( .A(n522), .B(n523), .C(n508), .D(n524), .Y(N614) );
  XOR2X1 U1792 ( .A(pat_len[3]), .B(m_reg[3]), .Y(n523) );
  XOR2X1 U1793 ( .A(pat_len[2]), .B(m_reg[2]), .Y(n524) );
  NAND2X1 U1794 ( .A(n525), .B(n526), .Y(n522) );
  NAND2X1 U1795 ( .A(m_reg[1]), .B(m_reg[0]), .Y(n530) );
  CLKINVX1 U1796 ( .A(reset), .Y(n1282) );
  AO22X1 U1797 ( .A0(\pat_temp[3][0] ), .A1(n1208), .B0(\pat_temp[1][0] ), 
        .B1(n1209), .Y(n1167) );
  AOI221XL U1798 ( .A0(\pat_temp[5][0] ), .A1(n1206), .B0(\pat_temp[7][0] ), 
        .B1(n1207), .C0(n1167), .Y(n1170) );
  AO22X1 U1799 ( .A0(\pat_temp[2][0] ), .A1(n1208), .B0(\pat_temp[0][0] ), 
        .B1(n1209), .Y(n1168) );
  AOI221XL U1800 ( .A0(\pat_temp[4][0] ), .A1(n1206), .B0(\pat_temp[6][0] ), 
        .B1(n1207), .C0(n1168), .Y(n1169) );
  AO22X1 U1801 ( .A0(\pat_temp[3][1] ), .A1(n1208), .B0(\pat_temp[1][1] ), 
        .B1(n1209), .Y(n1171) );
  AOI221XL U1802 ( .A0(\pat_temp[5][1] ), .A1(n1206), .B0(\pat_temp[7][1] ), 
        .B1(n1207), .C0(n1171), .Y(n1174) );
  AO22X1 U1803 ( .A0(\pat_temp[2][1] ), .A1(n1208), .B0(\pat_temp[0][1] ), 
        .B1(n1209), .Y(n1172) );
  AOI221XL U1804 ( .A0(\pat_temp[4][1] ), .A1(n1206), .B0(\pat_temp[6][1] ), 
        .B1(n1207), .C0(n1172), .Y(n1173) );
  AO22X1 U1805 ( .A0(\pat_temp[3][2] ), .A1(n1208), .B0(\pat_temp[1][2] ), 
        .B1(n1209), .Y(n1175) );
  AOI221XL U1806 ( .A0(\pat_temp[5][2] ), .A1(n1206), .B0(\pat_temp[7][2] ), 
        .B1(n1207), .C0(n1175), .Y(n1178) );
  AO22X1 U1807 ( .A0(\pat_temp[2][2] ), .A1(n1208), .B0(\pat_temp[0][2] ), 
        .B1(n1209), .Y(n1176) );
  AOI221XL U1808 ( .A0(\pat_temp[4][2] ), .A1(n1206), .B0(\pat_temp[6][2] ), 
        .B1(n1207), .C0(n1176), .Y(n1177) );
  AO22X1 U1809 ( .A0(\pat_temp[3][3] ), .A1(n1208), .B0(\pat_temp[1][3] ), 
        .B1(n1209), .Y(n1179) );
  AOI221XL U1810 ( .A0(\pat_temp[5][3] ), .A1(n1206), .B0(\pat_temp[7][3] ), 
        .B1(n1207), .C0(n1179), .Y(n1182) );
  AO22X1 U1811 ( .A0(\pat_temp[2][3] ), .A1(n1208), .B0(\pat_temp[0][3] ), 
        .B1(n1209), .Y(n1180) );
  AOI221XL U1812 ( .A0(\pat_temp[4][3] ), .A1(n1206), .B0(\pat_temp[6][3] ), 
        .B1(n1207), .C0(n1180), .Y(n1181) );
  AO22X1 U1813 ( .A0(\pat_temp[3][4] ), .A1(n1208), .B0(\pat_temp[1][4] ), 
        .B1(n1209), .Y(n1183) );
  AOI221XL U1814 ( .A0(\pat_temp[5][4] ), .A1(n1206), .B0(\pat_temp[7][4] ), 
        .B1(n1207), .C0(n1183), .Y(n1186) );
  AO22X1 U1815 ( .A0(\pat_temp[2][4] ), .A1(n1208), .B0(\pat_temp[0][4] ), 
        .B1(n1209), .Y(n1184) );
  AOI221XL U1816 ( .A0(\pat_temp[4][4] ), .A1(n1206), .B0(\pat_temp[6][4] ), 
        .B1(n1207), .C0(n1184), .Y(n1185) );
  AO22X1 U1817 ( .A0(\pat_temp[3][5] ), .A1(n1208), .B0(\pat_temp[1][5] ), 
        .B1(n1209), .Y(n1187) );
  AOI221XL U1818 ( .A0(\pat_temp[5][5] ), .A1(n1206), .B0(\pat_temp[7][5] ), 
        .B1(n1207), .C0(n1187), .Y(n1190) );
  AO22X1 U1819 ( .A0(\pat_temp[2][5] ), .A1(n1208), .B0(\pat_temp[0][5] ), 
        .B1(n1209), .Y(n1188) );
  AOI221XL U1820 ( .A0(\pat_temp[4][5] ), .A1(n1206), .B0(\pat_temp[6][5] ), 
        .B1(n1207), .C0(n1188), .Y(n1189) );
  AO22X1 U1821 ( .A0(\pat_temp[3][6] ), .A1(n1208), .B0(\pat_temp[1][6] ), 
        .B1(n1209), .Y(n1191) );
  AOI221XL U1822 ( .A0(\pat_temp[5][6] ), .A1(n1206), .B0(\pat_temp[7][6] ), 
        .B1(n1207), .C0(n1191), .Y(n1194) );
  AO22X1 U1823 ( .A0(\pat_temp[2][6] ), .A1(n1208), .B0(\pat_temp[0][6] ), 
        .B1(n1209), .Y(n1192) );
  AOI221XL U1824 ( .A0(\pat_temp[4][6] ), .A1(n1206), .B0(\pat_temp[6][6] ), 
        .B1(n1207), .C0(n1192), .Y(n1193) );
  AO22X1 U1825 ( .A0(\pat_temp[3][7] ), .A1(n1208), .B0(\pat_temp[1][7] ), 
        .B1(n1209), .Y(n1195) );
  AOI221XL U1826 ( .A0(\pat_temp[5][7] ), .A1(n1206), .B0(\pat_temp[7][7] ), 
        .B1(n1207), .C0(n1195), .Y(n1202) );
  AO22X1 U1827 ( .A0(\pat_temp[2][7] ), .A1(n1208), .B0(\pat_temp[0][7] ), 
        .B1(n1209), .Y(n1198) );
  AOI221XL U1828 ( .A0(\pat_temp[4][7] ), .A1(n1206), .B0(\pat_temp[6][7] ), 
        .B1(n1207), .C0(n1198), .Y(n1201) );
  XNOR2X1 U1829 ( .A(counter[4]), .B(\sub_103_aco/carry [4]), .Y(N340) );
  OR2X1 U1830 ( .A(counter[3]), .B(\sub_103_aco/carry [3]), .Y(
        \sub_103_aco/carry [4]) );
  XNOR2X1 U1831 ( .A(\sub_103_aco/carry [3]), .B(counter[3]), .Y(N339) );
  OR2X1 U1832 ( .A(counter[2]), .B(\sub_103_aco/carry [2]), .Y(
        \sub_103_aco/carry [3]) );
  XNOR2X1 U1833 ( .A(\sub_103_aco/carry [2]), .B(counter[2]), .Y(N338) );
  OR2X1 U1834 ( .A(counter[1]), .B(\sub_103_aco/carry [1]), .Y(
        \sub_103_aco/carry [2]) );
  XNOR2X1 U1835 ( .A(\sub_103_aco/carry [1]), .B(counter[1]), .Y(N337) );
  AND2X1 U1836 ( .A(\add_119_S2/carry [4]), .B(mat_idx2[4]), .Y(N369) );
  XOR2X1 U1837 ( .A(mat_idx2[4]), .B(\add_119_S2/carry [4]), .Y(N368) );
  AND2X1 U1838 ( .A(\add_119_S2/carry [3]), .B(mat_idx2[3]), .Y(
        \add_119_S2/carry [4]) );
  XOR2X1 U1839 ( .A(mat_idx2[3]), .B(\add_119_S2/carry [3]), .Y(N367) );
  AND2X1 U1840 ( .A(mat_idx2[1]), .B(mat_idx2[2]), .Y(\add_119_S2/carry [3])
         );
  XOR2X1 U1841 ( .A(mat_idx2[2]), .B(mat_idx2[1]), .Y(N366) );
  OR2X1 U1842 ( .A(n1281), .B(counter[0]), .Y(\sub_103_aco/carry [1]) );
  XNOR2X1 U1843 ( .A(counter[0]), .B(n1281), .Y(N336) );
  XOR2X1 U1844 ( .A(\r427/carry [5]), .B(str_len[5]), .Y(N230) );
  XOR2X1 U1845 ( .A(\add_122_S2/carry [5]), .B(counter[5]), .Y(N388) );
  XOR2X1 U1846 ( .A(\add_171_S2/carry [5]), .B(str_len[5]), .Y(N592) );
endmodule

