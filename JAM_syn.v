/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : R-2020.09-SP5
// Date      : Wed Mar 30 13:06:11 2022
/////////////////////////////////////////////////////////////


module JAM_DW01_add_0 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3;
  wire   [9:1] carry;

  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  AND2X2 U2 ( .A(A[8]), .B(n3), .Y(n2) );
  XOR2XL U3 ( .A(A[8]), .B(n3), .Y(SUM[8]) );
  XOR2XL U4 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
  XOR2X1 U5 ( .A(A[9]), .B(n2), .Y(SUM[9]) );
  AND2X2 U6 ( .A(A[7]), .B(carry[7]), .Y(n3) );
  XOR2X1 U7 ( .A(A[7]), .B(carry[7]), .Y(SUM[7]) );
endmodule


module JAM ( CLK, RST, W, J, Cost, MatchCount, MinCost, Valid );
  output [2:0] W;
  output [2:0] J;
  input [6:0] Cost;
  output [3:0] MatchCount;
  output [9:0] MinCost;
  input CLK, RST;
  output Valid;
  wire   N32, N33, N34, n832, n833, n834, n835, n836, n837, n838, n839, n840,
         n841, n842, n843, n844, n845, n846, n847, n848, n849, sort_finish,
         N44, N45, \combination[0][2] , \combination[0][1] ,
         \combination[0][0] , \combination[1][2] , \combination[1][1] ,
         \combination[1][0] , \combination[2][2] , \combination[2][1] ,
         \combination[2][0] , \combination[3][2] , \combination[3][1] ,
         \combination[3][0] , \combination[4][2] , \combination[4][1] ,
         \combination[4][0] , \combination[5][2] , \combination[5][1] ,
         \combination[5][0] , \combination[6][2] , \combination[6][1] ,
         \combination[6][0] , \combination[7][2] , \combination[7][1] ,
         \combination[7][0] , N337, N338, N339, N355, N356, N357, N358, N359,
         N360, N361, N362, N363, N364, N385, N386, N433, N434, N435, N451,
         N462, N463, N465, N468, N469, N470, N473, n161, n181, n182, n191,
         n193, n199, n207, n208, n213, n218, n226, n227, n229, n230, n233,
         n234, n236, n238, n239, n240, n241, n242, n243, n244, n245, n246,
         n247, n248, n249, n250, n251, n252, n253, n254, n255, n256, n257,
         n258, n259, n260, n261, n262, n263, n264, n265, n266, n267, n268,
         n269, n270, n271, n272, n273, n274, n275, n276, n277, n278, n279,
         n280, n281, n282, n283, n284, n285, n286, n287, n288, n289, n290,
         n291, n292, n293, n294, n295, n296, n298, n299, n300, n301, n302,
         n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, n313,
         n314, n315, n316, n317, n318, n319, n320, n321, n322, n323, n324,
         n325, n326, n327, n328, n329, n330, n331, n332, n333, n334, n336,
         n337, n338, n339, n341, n342, n343, n344, n345, n346, n347, n348,
         n349, n350, n351, n352, n353, n354, n355, n356, n357, n358, n359,
         n360, n361, n362, n363, n365, n366, n367, n368, n369, n370, n371,
         n372, n373, n374, n375, n376, n377, n378, n379, n380, n381, n382,
         n383, n384, n385, n386, n387, n388, n389, n390, n391, n392, n393,
         n394, n395, n396, n397, n398, n399, n401, n402, n403, n404, n405,
         n406, n407, n408, n409, n410, n411, n412, n413, n414, n415, n416,
         n417, n418, n419, n420, n421, n422, n423, n424, n425, n426, n427,
         n428, n429, n430, n431, n432, n433, n434, n435, n436, n437, n438,
         n439, n440, n441, n442, n443, n444, n445, n446, n447, n448, n449,
         n450, n451, n452, n453, n454, n455, n456, n457, n458, n459, n460,
         n461, n462, n463, n464, n465, n466, n467, n468, n469, n470, n471,
         n472, n473, n474, n475, n476, n477, n478, n479, n480, n481, n482,
         n483, n484, n485, n486, n487, n488, n489, n490, n491, n492, n493,
         n494, n495, n496, n497, n498, n499, n500, n501, n502, n503, n504,
         n505, n506, n507, n508, n509, n510, n511, n512, n513, n514, n515,
         n516, n517, n518, n519, n520, n521, n522, n523, n524, n525, n526,
         n527, n528, n529, n530, n531, n532, n533, n534, n535, n536, n537,
         n538, n539, n540, n541, n542, n543, n544, n545, n546, n547, n548,
         n549, n550, n551, n552, n553, n554, n555, n556, n557, n558, n559,
         n560, n561, n562, n563, n564, n565, n566, n567, n568, n569, n570,
         n571, n572, n573, n574, n575, n576, n577, n578, n579, n580, n581,
         n582, n583, n584, n585, n586, n587, n588, n589, n590, n591, n592,
         n593, n594, n595, n596, n597, n598, n599, n600, n601, n602, n603,
         n604, n605, n606, n607, n608, n609, n610, n611, n612, n613, n614,
         n615, n616, n617, n618, n619, n620, n621, n622, n623, n624, n625,
         n626, n627, n628, n629, n630, n631, n632, n633, n634, n635, n636,
         n637, n638, n639, n640, n641, n642, n643, n644, n647, n649, n651,
         n652, n653, n654, n662, n673, n674, n675, n676, n677, n678, n679,
         n680, n681, n682, n683, n684, n685, n686, n687, n688, n689, n690,
         n691, n692, n693, n694, n695, n696, n697, n698, n699, n700, n701,
         n702, n703, n704, n705, n706, n707, n708, n709, n710, n711, n712,
         n713, n714, n715, n716, n717, n718, n719, n720, n721, n722, n723,
         n724, n725, n726, n727, n728, n729, n730, n731, n732, n733, n734,
         n735, n736, n737, n738, n739, n740, n741, n742, n743, n744, n745,
         n746, n747, n748, n749, n750, n751, n752, n753, n754, n755, n756,
         n757, n758, n759, n760, n761, n762, n763, n764, n765, n766, n767,
         n768, n769, n770, n771, n772, n773, n774, n775, n776, n777, n778,
         n779, n780, n781, n782, n783, n784, n785, n786, n787, n788, n789,
         n790, n791, n792, n793, n794, n795, n796, n797, n798, n799, n800,
         n801, n802, n803, n804, n805, n806, n807, n808, n809, n810, n811,
         n812, n813, n814, n815, n816, n817, n818, n819, n820, n821, n822,
         n823, n824, n825, n826, n827, n828, n829, n830, n831;
  wire   [1:0] top_state;
  wire   [1:0] sort_state;
  wire   [2:0] cost_cnt;
  wire   [9:0] now_cost;

  OAI31X2 U245 ( .A0(n482), .A1(\combination[1][0] ), .A2(n483), .B0(n799), 
        .Y(n258) );
  OAI31X2 U389 ( .A0(n570), .A1(n685), .A2(n571), .B0(n812), .Y(n408) );
  JAM_DW01_add_0 add_753 ( .A(now_cost), .B({1'b0, 1'b0, 1'b0, Cost}), .CI(
        1'b0), .SUM({N364, N363, N362, N361, N360, N359, N358, N357, N356, 
        N355}) );
  DFFQX1 sort_finish_reg ( .D(N451), .CK(CLK), .Q(sort_finish) );
  DFFX1 comb_finish_reg ( .D(n637), .CK(CLK), .QN(n226) );
  DFFQX1 \cost_cnt_reg[2]  ( .D(n748), .CK(CLK), .Q(cost_cnt[2]) );
  DFFQX1 \cost_cnt_reg[1]  ( .D(N463), .CK(CLK), .Q(cost_cnt[1]) );
  DFFQX1 \sort_state_reg[0]  ( .D(n636), .CK(CLK), .Q(sort_state[0]) );
  DFFQX1 \top_state_reg[1]  ( .D(N45), .CK(CLK), .Q(top_state[1]) );
  DFFQX1 \top_state_reg[0]  ( .D(N44), .CK(CLK), .Q(top_state[0]) );
  DFFQX1 \combination_reg[6][2]  ( .D(n607), .CK(CLK), .Q(\combination[6][2] )
         );
  DFFQX1 \cost_cnt_reg[0]  ( .D(N462), .CK(CLK), .Q(cost_cnt[0]) );
  EDFFTRX1 \combination_reg[6][0]  ( .RN(n688), .D(n640), .E(n751), .CK(CLK), 
        .Q(\combination[6][0] ), .QN(n218) );
  DFFQX1 \sort_state_reg[1]  ( .D(n638), .CK(CLK), .Q(sort_state[1]) );
  DFFQX1 \MatchCount_reg[0]  ( .D(n615), .CK(CLK), .Q(n839) );
  DFFQX1 \MatchCount_reg[2]  ( .D(n613), .CK(CLK), .Q(n837) );
  DFFQX1 \MinCost_reg[4]  ( .D(n621), .CK(CLK), .Q(n845) );
  DFFQX1 \MinCost_reg[8]  ( .D(n617), .CK(CLK), .Q(n841) );
  DFFQX1 \MinCost_reg[3]  ( .D(n622), .CK(CLK), .Q(n846) );
  DFFQX1 \MinCost_reg[1]  ( .D(n624), .CK(CLK), .Q(n848) );
  DFFQX1 \MinCost_reg[0]  ( .D(n625), .CK(CLK), .Q(n849) );
  DFFQX1 \MinCost_reg[6]  ( .D(n619), .CK(CLK), .Q(n843) );
  DFFQX1 \MinCost_reg[7]  ( .D(n618), .CK(CLK), .Q(n842) );
  DFFQX1 \MinCost_reg[9]  ( .D(n616), .CK(CLK), .Q(n840) );
  DFFQX1 \J_reg[0]  ( .D(N468), .CK(CLK), .Q(n835) );
  DFFQX1 \J_reg[1]  ( .D(N469), .CK(CLK), .Q(n834) );
  DFFQX1 \J_reg[2]  ( .D(N470), .CK(CLK), .Q(n833) );
  DFFQX1 \MinCost_reg[2]  ( .D(n623), .CK(CLK), .Q(n847) );
  DFFQX1 \MinCost_reg[5]  ( .D(n620), .CK(CLK), .Q(n844) );
  DFFQX1 \MatchCount_reg[1]  ( .D(n614), .CK(CLK), .Q(n838) );
  DFFQX1 \MatchCount_reg[3]  ( .D(n612), .CK(CLK), .Q(n836) );
  NOR2BX1 \combination_reg[0][2]/U2  ( .AN(n688), .B(n653), .Y(n654) );
  DFFQXL \combination_reg[0][2]  ( .D(n654), .CK(CLK), .Q(\combination[0][2] )
         );
  AND2X1 \W_reg[2]/U2  ( .A(N34), .B(n526), .Y(n652) );
  AND2X1 \Valid_reg/U2  ( .A(top_state[0]), .B(n744), .Y(n651) );
  EDFFTRX1 \combination_reg[4][0]  ( .RN(n745), .D(n643), .E(n751), .CK(CLK), 
        .Q(\combination[4][0] ), .QN(n208) );
  EDFFTRX1 \combination_reg[2][0]  ( .RN(n745), .D(n760), .E(n751), .CK(CLK), 
        .Q(\combination[2][0] ), .QN(n193) );
  DFFX1 \now_cost_reg[4]  ( .D(n631), .CK(CLK), .Q(now_cost[4]), .QN(n741) );
  DFFX1 \now_cost_reg[3]  ( .D(n632), .CK(CLK), .Q(now_cost[3]), .QN(n233) );
  DFFX1 \now_cost_reg[2]  ( .D(n633), .CK(CLK), .Q(now_cost[2]), .QN(n234) );
  DFFX1 \now_cost_reg[1]  ( .D(n634), .CK(CLK), .Q(now_cost[1]), .QN(n740) );
  DFFX1 \now_cost_reg[0]  ( .D(n635), .CK(CLK), .Q(now_cost[0]), .QN(n236) );
  DFFX1 \now_cost_reg[5]  ( .D(n630), .CK(CLK), .Q(now_cost[5]), .QN(n739) );
  DFFX1 \now_cost_reg[6]  ( .D(n629), .CK(CLK), .Q(now_cost[6]), .QN(n230) );
  DFFX1 \now_cost_reg[7]  ( .D(n628), .CK(CLK), .Q(now_cost[7]), .QN(n229) );
  DFFX1 \now_cost_reg[8]  ( .D(n627), .CK(CLK), .Q(now_cost[8]), .QN(n737) );
  DFFX1 \now_cost_reg[9]  ( .D(n626), .CK(CLK), .Q(now_cost[9]), .QN(n227) );
  DFFQX1 \W_reg[2]  ( .D(n652), .CK(CLK), .Q(n832) );
  DFFTRX1 \W_reg[1]  ( .D(N33), .RN(n526), .CK(CLK), .QN(n673) );
  EDFFTRX4 \combination_reg[2][2]  ( .RN(n745), .D(n761), .E(n751), .CK(CLK), 
        .Q(\combination[2][2] ), .QN(n191) );
  DFFX4 \combination_reg[3][1]  ( .D(n602), .CK(CLK), .Q(\combination[3][1] ), 
        .QN(n826) );
  DFFX4 \combination_reg[2][1]  ( .D(n601), .CK(CLK), .Q(\combination[2][1] ), 
        .QN(n831) );
  DFFX2 \combination_reg[7][2]  ( .D(n609), .CK(CLK), .Q(\combination[7][2] ), 
        .QN(n814) );
  EDFFTRX2 \combination_reg[4][1]  ( .RN(n745), .D(n639), .E(n751), .CK(CLK), 
        .Q(\combination[4][1] ), .QN(n207) );
  DFFX2 \combination_reg[5][2]  ( .D(n605), .CK(CLK), .Q(\combination[5][2] ), 
        .QN(n824) );
  DFFX2 \combination_reg[6][1]  ( .D(n608), .CK(CLK), .Q(\combination[6][1] ), 
        .QN(n823) );
  DFFQX1 Valid_reg ( .D(n651), .CK(CLK), .Q(n662) );
  EDFFTRX2 \combination_reg[5][1]  ( .RN(n745), .D(n642), .E(n751), .CK(CLK), 
        .Q(\combination[5][1] ), .QN(n213) );
  DFFX2 \combination_reg[1][0]  ( .D(n600), .CK(CLK), .Q(\combination[1][0] ), 
        .QN(n806) );
  DFFX2 \combination_reg[5][0]  ( .D(n606), .CK(CLK), .Q(\combination[5][0] ), 
        .QN(n803) );
  DFFX2 \combination_reg[0][0]  ( .D(N433), .CK(CLK), .Q(\combination[0][0] )
         );
  DFFX2 \combination_reg[0][1]  ( .D(N434), .CK(CLK), .Q(\combination[0][1] ), 
        .QN(n774) );
  DFFX2 \combination_reg[7][0]  ( .D(n611), .CK(CLK), .Q(\combination[7][0] ), 
        .QN(n807) );
  DFFX2 \combination_reg[3][0]  ( .D(n603), .CK(CLK), .Q(\combination[3][0] ), 
        .QN(n800) );
  EDFFTRX2 \combination_reg[1][2]  ( .RN(n745), .D(n762), .E(n751), .CK(CLK), 
        .Q(\combination[1][2] ), .QN(n181) );
  EDFFTRX2 \combination_reg[1][1]  ( .RN(n688), .D(n757), .E(n751), .CK(CLK), 
        .Q(\combination[1][1] ), .QN(n182) );
  EDFFTRX2 \combination_reg[3][2]  ( .RN(n745), .D(n641), .E(n751), .CK(CLK), 
        .Q(\combination[3][2] ), .QN(n199) );
  DFFQX1 \W_reg[0]  ( .D(N465), .CK(CLK), .Q(n707) );
  DFFX2 \combination_reg[7][1]  ( .D(n610), .CK(CLK), .Q(\combination[7][1] ), 
        .QN(n813) );
  DFFX2 \combination_reg[4][2]  ( .D(n604), .CK(CLK), .Q(\combination[4][2] ), 
        .QN(n830) );
  OAI31XL U518 ( .A0(n458), .A1(n682), .A2(n459), .B0(n821), .Y(n450) );
  OAI31XL U519 ( .A0(n451), .A1(n682), .A2(n452), .B0(n809), .Y(n445) );
  OAI31XL U520 ( .A0(n447), .A1(n682), .A2(n448), .B0(n829), .Y(n378) );
  OAI31XL U521 ( .A0(n438), .A1(\combination[3][0] ), .A2(n439), .B0(n808), 
        .Y(n432) );
  CLKINVX1 U522 ( .A(n848), .Y(n730) );
  CLKINVX1 U523 ( .A(n847), .Y(n731) );
  CLKINVX1 U524 ( .A(n846), .Y(n732) );
  CLKINVX1 U525 ( .A(n843), .Y(n733) );
  CLKINVX1 U526 ( .A(n842), .Y(n734) );
  CLKINVX1 U527 ( .A(n840), .Y(n735) );
  CLKINVX1 U528 ( .A(n838), .Y(n755) );
  XNOR2X1 U529 ( .A(n599), .B(W[2]), .Y(N34) );
  CLKINVX1 U530 ( .A(n837), .Y(n756) );
  CLKINVX1 U531 ( .A(n839), .Y(n754) );
  NAND3BX2 U532 ( .AN(sort_state[1]), .B(n752), .C(n245), .Y(n240) );
  INVX16 U533 ( .A(n649), .Y(W[0]) );
  CLKINVX1 U534 ( .A(n707), .Y(n649) );
  OR4X1 U535 ( .A(n336), .B(n337), .C(n338), .D(n339), .Y(n639) );
  OR4X1 U536 ( .A(n401), .B(n402), .C(n403), .D(n404), .Y(n640) );
  OR4X1 U537 ( .A(n298), .B(n299), .C(n300), .D(n301), .Y(n641) );
  OR4X1 U538 ( .A(n365), .B(n366), .C(n367), .D(n368), .Y(n642) );
  OR4X1 U539 ( .A(n341), .B(n342), .C(n343), .D(n344), .Y(n643) );
  NOR2XL U540 ( .A(n161), .B(\combination[1][2] ), .Y(n556) );
  NOR2XL U541 ( .A(n161), .B(\combination[5][2] ), .Y(n591) );
  NOR2XL U542 ( .A(n161), .B(n683), .Y(n594) );
  NOR2XL U543 ( .A(n161), .B(\combination[2][2] ), .Y(n587) );
  NOR2XL U544 ( .A(n161), .B(\combination[3][2] ), .Y(n584) );
  OAI31XL U545 ( .A0(n564), .A1(\combination[3][0] ), .A2(n565), .B0(n827), 
        .Y(n550) );
  OAI31XL U546 ( .A0(n583), .A1(\combination[0][0] ), .A2(n584), .B0(n779), 
        .Y(n577) );
  OAI31XL U547 ( .A0(n497), .A1(\combination[1][0] ), .A2(n498), .B0(n793), 
        .Y(n442) );
  INVXL U548 ( .A(n662), .Y(n644) );
  INVX12 U549 ( .A(n644), .Y(Valid) );
  OAI32XL U550 ( .A0(n594), .A1(\combination[0][1] ), .A2(n823), .B0(n828), 
        .B1(n686), .Y(n595) );
  OAI32XL U551 ( .A0(n562), .A1(\combination[4][1] ), .A2(n213), .B0(n824), 
        .B1(\combination[4][2] ), .Y(n563) );
  OAI32XL U552 ( .A0(n591), .A1(\combination[0][1] ), .A2(n213), .B0(n824), 
        .B1(n686), .Y(n592) );
  OAI32XL U553 ( .A0(n491), .A1(\combination[1][1] ), .A2(n213), .B0(n824), 
        .B1(\combination[1][2] ), .Y(n492) );
  OAI32XL U554 ( .A0(n462), .A1(\combination[2][1] ), .A2(n213), .B0(n824), 
        .B1(\combination[2][2] ), .Y(n463) );
  OAI32XL U555 ( .A0(n456), .A1(\combination[3][1] ), .A2(n213), .B0(n824), 
        .B1(\combination[3][2] ), .Y(n457) );
  NOR2XL U556 ( .A(n199), .B(\combination[5][2] ), .Y(n456) );
  NOR2XL U557 ( .A(n830), .B(\combination[5][2] ), .Y(n562) );
  OAI32XL U558 ( .A0(n581), .A1(\combination[0][1] ), .A2(n207), .B0(n830), 
        .B1(n686), .Y(n582) );
  OAI32XL U559 ( .A0(n565), .A1(\combination[3][1] ), .A2(n207), .B0(n830), 
        .B1(\combination[3][2] ), .Y(n566) );
  OAI32XL U560 ( .A0(n448), .A1(\combination[2][1] ), .A2(n207), .B0(n830), 
        .B1(\combination[2][2] ), .Y(n449) );
  NOR2XL U561 ( .A(n830), .B(\combination[7][2] ), .Y(n472) );
  OAI32XL U562 ( .A0(n486), .A1(\combination[1][1] ), .A2(n207), .B0(n830), 
        .B1(\combination[1][2] ), .Y(n487) );
  OAI32XL U563 ( .A0(n571), .A1(\combination[6][1] ), .A2(n813), .B0(n814), 
        .B1(n683), .Y(n572) );
  OAI32XL U564 ( .A0(n597), .A1(\combination[0][1] ), .A2(n813), .B0(n814), 
        .B1(n686), .Y(n598) );
  OAI32XL U565 ( .A0(n498), .A1(\combination[1][1] ), .A2(n813), .B0(n814), 
        .B1(\combination[1][2] ), .Y(n499) );
  OAI32XL U566 ( .A0(n452), .A1(\combination[2][1] ), .A2(n813), .B0(n814), 
        .B1(\combination[2][2] ), .Y(n453) );
  OAI32XL U567 ( .A0(n472), .A1(\combination[4][1] ), .A2(n813), .B0(n814), 
        .B1(\combination[4][2] ), .Y(n473) );
  OAI32XL U568 ( .A0(n439), .A1(\combination[3][1] ), .A2(n813), .B0(n814), 
        .B1(\combination[3][2] ), .Y(n440) );
  OAI32XL U569 ( .A0(n587), .A1(\combination[0][1] ), .A2(n831), .B0(n191), 
        .B1(n686), .Y(n588) );
  OAI32XL U570 ( .A0(n584), .A1(\combination[0][1] ), .A2(n826), .B0(n199), 
        .B1(n686), .Y(n585) );
  OAI32XL U571 ( .A0(n559), .A1(\combination[2][1] ), .A2(n826), .B0(n199), 
        .B1(\combination[2][2] ), .Y(n560) );
  OAI32XL U572 ( .A0(n483), .A1(\combination[1][1] ), .A2(n826), .B0(n199), 
        .B1(\combination[1][2] ), .Y(n484) );
  INVX3 U573 ( .A(RST), .Y(n745) );
  INVX12 U574 ( .A(n673), .Y(W[1]) );
  CLKINVX1 U575 ( .A(n832), .Y(n647) );
  INVX16 U576 ( .A(n647), .Y(W[2]) );
  INVX1 U577 ( .A(W[0]), .Y(N32) );
  CLKINVX1 U578 ( .A(\combination[0][2] ), .Y(n161) );
  NOR2X1 U579 ( .A(n531), .B(\combination[0][2] ), .Y(n653) );
  BUFX16 U580 ( .A(n836), .Y(MatchCount[3]) );
  INVX12 U581 ( .A(n755), .Y(MatchCount[1]) );
  BUFX12 U582 ( .A(n844), .Y(MinCost[5]) );
  INVX12 U583 ( .A(n731), .Y(MinCost[2]) );
  BUFX12 U584 ( .A(n833), .Y(J[2]) );
  BUFX12 U585 ( .A(n834), .Y(J[1]) );
  BUFX12 U586 ( .A(n835), .Y(J[0]) );
  INVX12 U587 ( .A(n735), .Y(MinCost[9]) );
  INVX12 U588 ( .A(n734), .Y(MinCost[7]) );
  INVX12 U589 ( .A(n733), .Y(MinCost[6]) );
  BUFX12 U590 ( .A(n849), .Y(MinCost[0]) );
  INVX12 U591 ( .A(n730), .Y(MinCost[1]) );
  INVX12 U592 ( .A(n732), .Y(MinCost[3]) );
  BUFX12 U593 ( .A(n841), .Y(MinCost[8]) );
  BUFX12 U594 ( .A(n845), .Y(MinCost[4]) );
  INVX12 U595 ( .A(n756), .Y(MatchCount[2]) );
  INVX12 U596 ( .A(n754), .Y(MatchCount[0]) );
  CLKINVX1 U597 ( .A(n507), .Y(n750) );
  NAND2BX1 U598 ( .AN(N385), .B(N386), .Y(n509) );
  NOR2BXL U599 ( .AN(n849), .B(now_cost[0]), .Y(n713) );
  NOR2XL U600 ( .A(n741), .B(n845), .Y(n726) );
  NOR2BXL U601 ( .AN(now_cost[3]), .B(n846), .Y(n727) );
  NOR2XL U602 ( .A(n739), .B(n844), .Y(n718) );
  NOR2XL U603 ( .A(n737), .B(n841), .Y(n711) );
  NOR2BXL U604 ( .AN(now_cost[0]), .B(n849), .Y(n708) );
  CLKINVX1 U605 ( .A(n677), .Y(n785) );
  NOR3BXL U606 ( .AN(n549), .B(n550), .C(n548), .Y(n546) );
  OAI22XL U607 ( .A0(n360), .A1(n823), .B0(n758), .B1(n826), .Y(n368) );
  NAND2X1 U608 ( .A(n770), .B(n577), .Y(n362) );
  CLKINVX1 U609 ( .A(n541), .Y(n764) );
  NAND2X1 U610 ( .A(n771), .B(n686), .Y(n270) );
  NAND2X1 U611 ( .A(n801), .B(n445), .Y(n288) );
  NAND2X1 U612 ( .A(n785), .B(\combination[1][1] ), .Y(n280) );
  CLKINVX1 U613 ( .A(n442), .Y(n792) );
  NOR2X1 U614 ( .A(n577), .B(n768), .Y(n443) );
  CLKINVX1 U615 ( .A(n426), .Y(n768) );
  NAND2BX1 U616 ( .AN(n434), .B(n802), .Y(n304) );
  NAND2X1 U617 ( .A(n802), .B(n432), .Y(n316) );
  NAND2BX1 U618 ( .AN(n589), .B(n578), .Y(n305) );
  CLKINVX1 U619 ( .A(n378), .Y(n815) );
  NOR2BX1 U620 ( .AN(n446), .B(n450), .Y(n275) );
  AO21XL U621 ( .A0(n740), .A1(n713), .B0(n848), .Y(n712) );
  OAI22XL U622 ( .A0(n783), .A1(n218), .B0(n759), .B1(n803), .Y(n314) );
  OAI22XL U623 ( .A0(n783), .A1(n823), .B0(n759), .B1(n213), .Y(n309) );
  OAI31XL U624 ( .A0(n567), .A1(\combination[5][0] ), .A2(n568), .B0(n819), 
        .Y(n551) );
  OAI22XL U625 ( .A0(n390), .A1(n213), .B0(n391), .B1(n831), .Y(n399) );
  OAI22XL U626 ( .A0(n390), .A1(n824), .B0(n391), .B1(n191), .Y(n389) );
  OAI22XL U627 ( .A0(n360), .A1(n828), .B0(n758), .B1(n199), .Y(n359) );
  OAI22XL U628 ( .A0(n360), .A1(n218), .B0(n758), .B1(n800), .Y(n373) );
  OAI22XL U629 ( .A0(n416), .A1(n182), .B0(n417), .B1(n831), .Y(n424) );
  OAI22XL U630 ( .A0(n416), .A1(n181), .B0(n417), .B1(n191), .Y(n413) );
  OAI22XL U631 ( .A0(n416), .A1(n806), .B0(n417), .B1(n193), .Y(n430) );
  OAI22XL U632 ( .A0(n332), .A1(n208), .B0(n333), .B1(n807), .Y(n344) );
  OAI22XL U633 ( .A0(n332), .A1(n207), .B0(n333), .B1(n813), .Y(n339) );
  OAI22XL U634 ( .A0(n786), .A1(n207), .B0(n773), .B1(n213), .Y(n367) );
  OAI22XL U635 ( .A0(n782), .A1(n213), .B0(n334), .B1(n823), .Y(n338) );
  NAND2X1 U636 ( .A(n771), .B(\combination[0][1] ), .Y(n254) );
  NAND2X1 U637 ( .A(\combination[0][0] ), .B(n771), .Y(n262) );
  OAI221XL U638 ( .A0(n191), .A1(n294), .B0(n794), .B1(n272), .C0(n687), .Y(
        n328) );
  OAI221XL U639 ( .A0(n191), .A1(n363), .B0(n259), .B1(n272), .C0(n687), .Y(
        n356) );
  NAND2X1 U640 ( .A(n785), .B(\combination[1][0] ), .Y(n290) );
  OAI22XL U641 ( .A0(n393), .A1(n208), .B0(n394), .B1(n807), .Y(n402) );
  OAI221XL U642 ( .A0(n262), .A1(n426), .B0(n420), .B1(n218), .C0(n687), .Y(
        n428) );
  OAI221XL U643 ( .A0(n287), .A1(n290), .B0(n193), .B1(n288), .C0(n687), .Y(
        n312) );
  OAI221XL U644 ( .A0(n193), .A1(n363), .B0(n259), .B1(n290), .C0(n687), .Y(
        n370) );
  OAI31XL U645 ( .A0(n593), .A1(\combination[0][0] ), .A2(n594), .B0(n776), 
        .Y(n589) );
  OAI31XL U646 ( .A0(n493), .A1(\combination[1][0] ), .A2(n494), .B0(n795), 
        .Y(n488) );
  XNOR2X1 U647 ( .A(n673), .B(W[0]), .Y(N33) );
  OAI31XL U648 ( .A0(n467), .A1(n684), .A2(n468), .B0(n822), .Y(n441) );
  OAI31XL U649 ( .A0(n435), .A1(\combination[3][0] ), .A2(n436), .B0(n820), 
        .Y(n433) );
  OAI31XL U650 ( .A0(n471), .A1(n684), .A2(n472), .B0(n810), .Y(n466) );
  OAI31XL U651 ( .A0(n455), .A1(\combination[3][0] ), .A2(n456), .B0(n818), 
        .Y(n434) );
  OAI31XL U652 ( .A0(n474), .A1(\combination[5][0] ), .A2(n475), .B0(n811), 
        .Y(n464) );
  NOR2X1 U653 ( .A(now_cost[9]), .B(n735), .Y(n674) );
  NOR2X1 U654 ( .A(n736), .B(n723), .Y(n675) );
  OR2X1 U655 ( .A(n674), .B(n675), .Y(N385) );
  AOI32XL U656 ( .A0(n722), .A1(n738), .A2(n721), .B0(n841), .B1(n737), .Y(
        n723) );
  NAND3BXL U657 ( .AN(N385), .B(n725), .C(n724), .Y(n728) );
  OAI21XL U658 ( .A0(n763), .A1(n295), .B0(n771), .Y(n444) );
  NOR2BX1 U659 ( .AN(n294), .B(n349), .Y(n393) );
  OAI21XL U660 ( .A0(n763), .A1(n296), .B0(n771), .Y(n323) );
  OR2X1 U661 ( .A(n250), .B(n785), .Y(n537) );
  CLKBUFX3 U662 ( .A(n514), .Y(n680) );
  NAND3X1 U663 ( .A(n511), .B(n509), .C(n505), .Y(n514) );
  INVX3 U664 ( .A(n681), .Y(n742) );
  OAI211X1 U665 ( .A0(n420), .A1(n828), .B0(n270), .C0(n687), .Y(n411) );
  OAI221XL U666 ( .A0(n257), .A1(n272), .B0(n270), .B1(n767), .C0(n687), .Y(
        n386) );
  AOI221X1 U667 ( .A0(n771), .A1(n768), .B0(n276), .B1(n801), .C0(n405), .Y(
        n391) );
  INVX3 U668 ( .A(n676), .Y(n771) );
  OAI21XL U669 ( .A0(n764), .A1(n676), .B0(n444), .Y(n405) );
  OAI211X1 U670 ( .A0(n319), .A1(n274), .B0(n288), .C0(n383), .Y(n349) );
  AOI21X1 U671 ( .A0(n276), .A1(n801), .B0(n349), .Y(n334) );
  INVX3 U672 ( .A(n274), .Y(n801) );
  AOI211X1 U673 ( .A0(n771), .A1(n443), .B0(n354), .C0(n405), .Y(n416) );
  OA21XL U674 ( .A0(n318), .A1(n274), .B0(n288), .Y(n379) );
  CLKINVX1 U675 ( .A(n374), .Y(n758) );
  OAI211X1 U676 ( .A0(n676), .A1(n766), .B0(n325), .C0(n346), .Y(n374) );
  OA21XL U677 ( .A0(n676), .A1(n305), .B0(n323), .Y(n346) );
  AOI21X1 U678 ( .A0(n353), .A1(n785), .B0(n354), .Y(n326) );
  CLKINVX1 U679 ( .A(n286), .Y(n784) );
  OAI211X1 U680 ( .A0(n287), .A1(n677), .B0(n288), .C0(n289), .Y(n286) );
  OA21XL U681 ( .A0(n794), .A1(n677), .B0(n326), .Y(n289) );
  AND4X1 U682 ( .A(n346), .B(n347), .C(n348), .D(n805), .Y(n332) );
  NAND2X1 U683 ( .A(n769), .B(n771), .Y(n348) );
  CLKINVX1 U684 ( .A(n324), .Y(n783) );
  OAI211X1 U685 ( .A0(n792), .A1(n677), .B0(n325), .C0(n289), .Y(n324) );
  NAND2X1 U686 ( .A(n269), .B(n274), .Y(n250) );
  AND3X2 U687 ( .A(n347), .B(n470), .C(n805), .Y(n302) );
  AND2X2 U688 ( .A(n302), .B(n454), .Y(n269) );
  CLKINVX1 U689 ( .A(n320), .Y(n759) );
  OAI211X1 U690 ( .A0(n321), .A1(n676), .B0(n322), .C0(n323), .Y(n320) );
  OAI221X1 U691 ( .A0(n375), .A1(n676), .B0(n792), .B1(n677), .C0(n444), .Y(
        n249) );
  CLKINVX1 U692 ( .A(n350), .Y(n782) );
  OAI211X1 U693 ( .A0(n351), .A1(n677), .B0(n352), .C0(n326), .Y(n350) );
  NAND2X1 U694 ( .A(n409), .B(n801), .Y(n294) );
  NAND2X1 U695 ( .A(n321), .B(n305), .Y(n295) );
  CLKINVX1 U696 ( .A(n362), .Y(n769) );
  NOR2X1 U697 ( .A(n496), .B(n769), .Y(n321) );
  CLKINVX1 U698 ( .A(n271), .Y(n763) );
  AOI221X1 U699 ( .A0(n353), .A1(n785), .B0(n815), .B1(n801), .C0(n382), .Y(
        n417) );
  CLKINVX1 U700 ( .A(n380), .Y(n786) );
  OAI211X1 U701 ( .A0(n257), .A1(n677), .B0(n788), .C0(n381), .Y(n380) );
  AND2X2 U702 ( .A(n345), .B(n789), .Y(n381) );
  CLKINVX1 U703 ( .A(n382), .Y(n789) );
  AOI21X1 U704 ( .A0(n794), .A1(n351), .B0(n677), .Y(n382) );
  AND3X2 U705 ( .A(n363), .B(n304), .C(n379), .Y(n419) );
  OAI21X1 U706 ( .A0(n292), .A1(n676), .B0(n294), .Y(n266) );
  NOR2X1 U707 ( .A(n295), .B(n296), .Y(n292) );
  CLKINVX1 U708 ( .A(n406), .Y(n787) );
  OAI211X1 U709 ( .A0(n259), .A1(n677), .B0(n788), .C0(n407), .Y(n406) );
  NOR2BX1 U710 ( .AN(n322), .B(n382), .Y(n407) );
  CLKINVX1 U711 ( .A(n354), .Y(n788) );
  AND2X2 U712 ( .A(n316), .B(n317), .Y(n303) );
  OAI2BB1X1 U713 ( .A0N(n318), .A1N(n319), .B0(n801), .Y(n317) );
  CLKINVX1 U714 ( .A(n287), .Y(n791) );
  CLKINVX1 U715 ( .A(n470), .Y(n804) );
  CLKINVX1 U716 ( .A(n454), .Y(n802) );
  CLKINVX1 U717 ( .A(n244), .Y(n772) );
  AND3X2 U718 ( .A(n352), .B(n772), .C(n345), .Y(n392) );
  NAND2X1 U719 ( .A(n801), .B(n275), .Y(n363) );
  AND4X1 U720 ( .A(n345), .B(n304), .C(n322), .D(n325), .Y(n333) );
  AND4X1 U721 ( .A(n384), .B(n304), .C(n316), .D(n325), .Y(n390) );
  AND4X1 U722 ( .A(n376), .B(n304), .C(n316), .D(n322), .Y(n360) );
  NAND2X1 U723 ( .A(n259), .B(n257), .Y(n353) );
  NAND2X1 U724 ( .A(n375), .B(n764), .Y(n296) );
  NOR2X1 U725 ( .A(n443), .B(n768), .Y(n375) );
  NOR2X1 U726 ( .A(n409), .B(n276), .Y(n318) );
  CLKINVX1 U727 ( .A(n465), .Y(n805) );
  NOR2X1 U728 ( .A(n815), .B(n275), .Y(n319) );
  CLKINVX1 U729 ( .A(n443), .Y(n767) );
  AND4X1 U730 ( .A(n352), .B(n316), .C(n322), .D(n325), .Y(n415) );
  AND3X2 U731 ( .A(n383), .B(n352), .C(n384), .Y(n361) );
  CLKINVX1 U732 ( .A(n255), .Y(n794) );
  AND3X2 U733 ( .A(n383), .B(n345), .C(n376), .Y(n418) );
  CLKINVX1 U734 ( .A(n305), .Y(n765) );
  CLKINVX1 U735 ( .A(n496), .Y(n766) );
  OR2XL U736 ( .A(N385), .B(N386), .Y(n511) );
  CLKBUFX3 U737 ( .A(n512), .Y(n679) );
  NAND2XL U738 ( .A(N385), .B(n505), .Y(n512) );
  OAI21X2 U739 ( .A0(n753), .A1(n524), .B0(n687), .Y(n505) );
  CLKBUFX3 U740 ( .A(n745), .Y(n687) );
  AND3X2 U741 ( .A(n678), .B(n687), .C(n525), .Y(n239) );
  CLKBUFX3 U742 ( .A(n745), .Y(n688) );
  CLKBUFX3 U743 ( .A(n247), .Y(n681) );
  NAND2X1 U744 ( .A(n687), .B(n240), .Y(n247) );
  OAI22XL U745 ( .A0(n742), .A1(n355), .B0(n824), .B1(n681), .Y(n605) );
  NOR4X1 U746 ( .A(n356), .B(n357), .C(n358), .D(n359), .Y(n355) );
  OAI22XL U747 ( .A0(n361), .A1(n814), .B0(n270), .B1(n362), .Y(n357) );
  OAI22XL U748 ( .A0(n786), .A1(n830), .B0(n773), .B1(n824), .Y(n358) );
  NAND2X1 U749 ( .A(n526), .B(n246), .Y(n241) );
  CLKINVX1 U750 ( .A(n530), .Y(n744) );
  OAI221XL U751 ( .A0(n254), .A1(n426), .B0(n420), .B1(n823), .C0(n687), .Y(
        n422) );
  OAI221XL U752 ( .A0(n257), .A1(n280), .B0(n254), .B1(n767), .C0(n687), .Y(
        n396) );
  OAI221XL U753 ( .A0(n287), .A1(n280), .B0(n831), .B1(n288), .C0(n687), .Y(
        n307) );
  CLKINVX1 U754 ( .A(n526), .Y(n747) );
  OAI21XL U755 ( .A0(n747), .A1(n246), .B0(n746), .Y(n638) );
  CLKINVX1 U756 ( .A(N451), .Y(n746) );
  CLKINVX1 U757 ( .A(N33), .Y(n706) );
  NOR2BX1 U758 ( .AN(n546), .B(n547), .Y(n544) );
  NOR2X1 U759 ( .A(n408), .B(n551), .Y(n549) );
  CLKBUFX3 U760 ( .A(n293), .Y(n676) );
  NAND3BX1 U761 ( .AN(n545), .B(n544), .C(n552), .Y(n293) );
  INVX3 U762 ( .A(n683), .Y(n828) );
  NAND2X2 U763 ( .A(n546), .B(n547), .Y(n274) );
  OAI22XL U764 ( .A0(n794), .A1(n280), .B0(n831), .B1(n294), .Y(n336) );
  OAI22XL U765 ( .A0(n826), .A1(n316), .B0(n254), .B1(n766), .Y(n337) );
  CLKINVX1 U766 ( .A(n377), .Y(n773) );
  OAI211X1 U767 ( .A0(n378), .A1(n274), .B0(n347), .C0(n379), .Y(n377) );
  OAI22XL U768 ( .A0(n259), .A1(n280), .B0(n831), .B1(n363), .Y(n365) );
  OAI22XL U769 ( .A0(n361), .A1(n813), .B0(n254), .B1(n362), .Y(n366) );
  CLKBUFX3 U770 ( .A(n253), .Y(n677) );
  NAND2X1 U771 ( .A(n544), .B(n545), .Y(n253) );
  OAI22XL U772 ( .A0(n783), .A1(n828), .B0(n759), .B1(n824), .Y(n300) );
  NOR2X1 U773 ( .A(n824), .B(n683), .Y(n568) );
  NOR2X1 U774 ( .A(n258), .B(n677), .Y(n354) );
  NOR3BX1 U775 ( .AN(n544), .B(n552), .C(n545), .Y(n244) );
  NOR2X1 U776 ( .A(n408), .B(n244), .Y(n347) );
  OAI22XL U777 ( .A0(n782), .A1(n824), .B0(n334), .B1(n828), .Y(n330) );
  NAND2X1 U778 ( .A(n764), .B(n589), .Y(n271) );
  OAI22XL U779 ( .A0(n830), .A1(n304), .B0(n270), .B1(n305), .Y(n299) );
  NAND2X1 U780 ( .A(n785), .B(\combination[1][2] ), .Y(n272) );
  CLKINVX1 U781 ( .A(N34), .Y(n705) );
  NAND2X1 U782 ( .A(n792), .B(n488), .Y(n287) );
  NOR2X1 U783 ( .A(n442), .B(n791), .Y(n351) );
  NAND3BX1 U784 ( .AN(n466), .B(n804), .C(n441), .Y(n383) );
  NAND2X1 U785 ( .A(n549), .B(n548), .Y(n470) );
  NAND3BX1 U786 ( .AN(n433), .B(n434), .C(n802), .Y(n322) );
  NAND3BX1 U787 ( .AN(n548), .B(n549), .C(n550), .Y(n454) );
  NAND2BX2 U788 ( .AN(n481), .B(n258), .Y(n257) );
  NOR2X1 U789 ( .A(n578), .B(n770), .Y(n496) );
  NAND3BX1 U790 ( .AN(n432), .B(n802), .C(n433), .Y(n325) );
  NOR2X2 U791 ( .A(n446), .B(n815), .Y(n276) );
  NAND2X1 U792 ( .A(n804), .B(n466), .Y(n345) );
  NOR2BX1 U793 ( .AN(n551), .B(n408), .Y(n465) );
  NAND2X2 U794 ( .A(n796), .B(n481), .Y(n259) );
  NAND2BX1 U795 ( .AN(n441), .B(n804), .Y(n352) );
  NOR2BX1 U796 ( .AN(n450), .B(n445), .Y(n409) );
  NOR2X1 U797 ( .A(n488), .B(n796), .Y(n255) );
  NAND2BX1 U798 ( .AN(n464), .B(n465), .Y(n376) );
  NOR2BX1 U799 ( .AN(n376), .B(n408), .Y(n394) );
  NAND2X1 U800 ( .A(n465), .B(n464), .Y(n384) );
  NOR2BX1 U801 ( .AN(n384), .B(n408), .Y(n420) );
  NOR2X1 U802 ( .A(n830), .B(n683), .Y(n468) );
  CLKINVX1 U803 ( .A(n245), .Y(n753) );
  NAND2X1 U804 ( .A(n525), .B(n245), .Y(n527) );
  INVX3 U805 ( .A(n240), .Y(n751) );
  CLKINVX1 U806 ( .A(n725), .Y(n736) );
  CLKINVX1 U807 ( .A(n711), .Y(n738) );
  NOR2X1 U808 ( .A(n509), .B(RST), .Y(n507) );
  OA21XL U809 ( .A0(n839), .A1(n750), .B0(n508), .Y(n504) );
  OA21XL U810 ( .A0(n838), .A1(n750), .B0(n504), .Y(n503) );
  OAI2BB1XL U811 ( .A0N(MatchCount[3]), .A1N(n500), .B0(n501), .Y(n612) );
  OR4XL U812 ( .A(MatchCount[3]), .B(n756), .C(n750), .D(n502), .Y(n501) );
  OAI21XL U813 ( .A0(n837), .A1(n750), .B0(n503), .Y(n500) );
  OAI32XL U814 ( .A0(n750), .A1(n837), .A2(n502), .B0(n503), .B1(n756), .Y(
        n613) );
  OA21XL U815 ( .A0(RST), .A1(n511), .B0(n505), .Y(n508) );
  OAI21XL U816 ( .A0(n504), .A1(n755), .B0(n506), .Y(n614) );
  NAND4XL U817 ( .A(n507), .B(n839), .C(n505), .D(n755), .Y(n506) );
  OAI211X1 U818 ( .A0(n233), .A1(n679), .B0(n688), .C0(n520), .Y(n622) );
  NAND2XL U819 ( .A(MinCost[3]), .B(n680), .Y(n520) );
  OAI211X1 U820 ( .A0(n740), .A1(n679), .B0(n688), .C0(n522), .Y(n624) );
  NAND2XL U821 ( .A(MinCost[1]), .B(n680), .Y(n522) );
  OAI211X1 U822 ( .A0(n679), .A1(n737), .B0(n688), .C0(n515), .Y(n617) );
  NAND2XL U823 ( .A(MinCost[8]), .B(n680), .Y(n515) );
  OAI211X1 U824 ( .A0(n679), .A1(n741), .B0(n688), .C0(n519), .Y(n621) );
  NAND2XL U825 ( .A(MinCost[4]), .B(n680), .Y(n519) );
  OAI211X1 U826 ( .A0(n679), .A1(n739), .B0(n688), .C0(n518), .Y(n620) );
  NAND2XL U827 ( .A(MinCost[5]), .B(n680), .Y(n518) );
  OAI211X1 U828 ( .A0(n236), .A1(n679), .B0(n688), .C0(n523), .Y(n625) );
  NAND2XL U829 ( .A(MinCost[0]), .B(n680), .Y(n523) );
  OAI211X1 U830 ( .A0(n234), .A1(n679), .B0(n688), .C0(n521), .Y(n623) );
  NAND2XL U831 ( .A(n847), .B(n680), .Y(n521) );
  OAI211X1 U832 ( .A0(n679), .A1(n230), .B0(n688), .C0(n517), .Y(n619) );
  NAND2XL U833 ( .A(n843), .B(n680), .Y(n517) );
  OAI211X1 U834 ( .A0(n679), .A1(n229), .B0(n688), .C0(n516), .Y(n618) );
  NAND2XL U835 ( .A(n842), .B(n680), .Y(n516) );
  OAI211X1 U836 ( .A0(n679), .A1(n227), .B0(n688), .C0(n513), .Y(n616) );
  NAND2XL U837 ( .A(n840), .B(n680), .Y(n513) );
  OAI32X1 U838 ( .A0(n510), .A1(RST), .A2(n743), .B0(n508), .B1(n754), .Y(n615) );
  CLKINVX1 U839 ( .A(n505), .Y(n743) );
  AOI2BB1XL U840 ( .A0N(n509), .A1N(n839), .B0(N385), .Y(n510) );
  OAI2BB2XL U841 ( .B0(n678), .B1(n227), .A0N(N364), .A1N(n239), .Y(n626) );
  OAI2BB2XL U842 ( .B0(n678), .B1(n737), .A0N(N363), .A1N(n239), .Y(n627) );
  OAI2BB2XL U843 ( .B0(n678), .B1(n229), .A0N(N362), .A1N(n239), .Y(n628) );
  OAI2BB2XL U844 ( .B0(n678), .B1(n230), .A0N(N361), .A1N(n239), .Y(n629) );
  OAI2BB2XL U845 ( .B0(n678), .B1(n739), .A0N(N360), .A1N(n239), .Y(n630) );
  NAND3XL U846 ( .A(n839), .B(n505), .C(n838), .Y(n502) );
  OAI2BB2XL U847 ( .B0(n678), .B1(n741), .A0N(N359), .A1N(n239), .Y(n631) );
  OAI2BB2XL U848 ( .B0(n678), .B1(n233), .A0N(N358), .A1N(n239), .Y(n632) );
  OAI2BB2XL U849 ( .B0(n678), .B1(n234), .A0N(N357), .A1N(n239), .Y(n633) );
  OAI2BB2XL U850 ( .B0(n678), .B1(n740), .A0N(N356), .A1N(n239), .Y(n634) );
  OAI2BB2XL U851 ( .B0(n678), .B1(n236), .A0N(N355), .A1N(n239), .Y(n635) );
  CLKBUFX3 U852 ( .A(n238), .Y(n678) );
  OAI21XL U853 ( .A0(sort_state[1]), .A1(n753), .B0(n687), .Y(n238) );
  OAI21XL U854 ( .A0(n242), .A1(n226), .B0(n243), .Y(n637) );
  NAND4X1 U855 ( .A(n244), .B(n245), .C(n242), .D(n687), .Y(n243) );
  OAI211X1 U856 ( .A0(sort_state[1]), .A1(sort_state[0]), .B0(n688), .C0(n245), 
        .Y(n242) );
  OAI22XL U857 ( .A0(n742), .A1(n260), .B0(n806), .B1(n681), .Y(n600) );
  AOI221XL U858 ( .A0(\combination[7][0] ), .A1(n249), .B0(\combination[1][0] ), .B1(n250), .C0(n261), .Y(n260) );
  OAI221XL U859 ( .A0(n764), .A1(n262), .B0(n263), .B1(n677), .C0(n687), .Y(
        n261) );
  AOI221XL U860 ( .A0(n255), .A1(\combination[5][0] ), .B0(n791), .B1(n685), 
        .C0(n264), .Y(n263) );
  OAI22XL U861 ( .A0(n742), .A1(n311), .B0(n800), .B1(n681), .Y(n603) );
  NOR4X1 U862 ( .A(n312), .B(n313), .C(n314), .D(n315), .Y(n311) );
  OAI22XL U863 ( .A0(n302), .A1(n800), .B0(n303), .B1(n807), .Y(n315) );
  OAI22XL U864 ( .A0(n208), .A1(n304), .B0(n262), .B1(n305), .Y(n313) );
  OAI22XL U865 ( .A0(n742), .A1(n427), .B0(n807), .B1(n681), .Y(n611) );
  NOR4X1 U866 ( .A(n428), .B(n429), .C(n430), .D(n431), .Y(n427) );
  OAI22XL U867 ( .A0(n807), .A1(n772), .B0(n415), .B1(n208), .Y(n431) );
  OAI22XL U868 ( .A0(n418), .A1(n803), .B0(n419), .B1(n800), .Y(n429) );
  OAI22XL U869 ( .A0(n742), .A1(n369), .B0(n803), .B1(n681), .Y(n606) );
  NOR4X1 U870 ( .A(n370), .B(n371), .C(n372), .D(n373), .Y(n369) );
  OAI22XL U871 ( .A0(n361), .A1(n807), .B0(n262), .B1(n362), .Y(n371) );
  OAI22XL U872 ( .A0(n786), .A1(n208), .B0(n773), .B1(n803), .Y(n372) );
  OAI22XL U873 ( .A0(n742), .A1(n410), .B0(n814), .B1(n681), .Y(n609) );
  NOR4X1 U874 ( .A(n411), .B(n412), .C(n413), .D(n414), .Y(n410) );
  OAI22XL U875 ( .A0(n814), .A1(n772), .B0(n415), .B1(n830), .Y(n414) );
  OAI22XL U876 ( .A0(n418), .A1(n824), .B0(n419), .B1(n199), .Y(n412) );
  OAI22XL U877 ( .A0(n742), .A1(n277), .B0(n831), .B1(n681), .Y(n601) );
  AOI211X1 U878 ( .A0(\combination[6][1] ), .A1(n266), .B0(n278), .C0(n279), 
        .Y(n277) );
  OAI22XL U879 ( .A0(n784), .A1(n813), .B0(n269), .B1(n831), .Y(n279) );
  OAI211X1 U880 ( .A0(n792), .A1(n280), .B0(n688), .C0(n281), .Y(n278) );
  OAI22XL U881 ( .A0(n742), .A1(n327), .B0(n830), .B1(n681), .Y(n604) );
  NOR4X1 U882 ( .A(n328), .B(n329), .C(n330), .D(n331), .Y(n327) );
  OAI22XL U883 ( .A0(n199), .A1(n316), .B0(n270), .B1(n766), .Y(n329) );
  OAI22XL U884 ( .A0(n332), .A1(n830), .B0(n333), .B1(n814), .Y(n331) );
  OAI22XL U885 ( .A0(n742), .A1(n306), .B0(n826), .B1(n681), .Y(n602) );
  NOR4X1 U886 ( .A(n307), .B(n308), .C(n309), .D(n310), .Y(n306) );
  OAI22XL U887 ( .A0(n302), .A1(n826), .B0(n303), .B1(n813), .Y(n310) );
  OAI22XL U888 ( .A0(n207), .A1(n304), .B0(n254), .B1(n305), .Y(n308) );
  OAI22XL U889 ( .A0(n742), .A1(n395), .B0(n823), .B1(n681), .Y(n608) );
  NOR4X1 U890 ( .A(n396), .B(n397), .C(n398), .D(n399), .Y(n395) );
  OAI22XL U891 ( .A0(n787), .A1(n826), .B0(n392), .B1(n823), .Y(n398) );
  OAI22XL U892 ( .A0(n393), .A1(n207), .B0(n394), .B1(n813), .Y(n397) );
  OAI22XL U893 ( .A0(n742), .A1(n421), .B0(n813), .B1(n681), .Y(n610) );
  NOR4X1 U894 ( .A(n422), .B(n423), .C(n424), .D(n425), .Y(n421) );
  OAI22XL U895 ( .A0(n813), .A1(n772), .B0(n415), .B1(n207), .Y(n425) );
  OAI22XL U896 ( .A0(n418), .A1(n213), .B0(n419), .B1(n826), .Y(n423) );
  OAI22XL U897 ( .A0(n742), .A1(n385), .B0(n828), .B1(n681), .Y(n607) );
  NOR4X1 U898 ( .A(n386), .B(n387), .C(n388), .D(n389), .Y(n385) );
  OAI22XL U899 ( .A0(n787), .A1(n199), .B0(n392), .B1(n828), .Y(n388) );
  OAI22XL U900 ( .A0(n393), .A1(n830), .B0(n394), .B1(n814), .Y(n387) );
  NOR2X2 U901 ( .A(n527), .B(RST), .Y(n526) );
  CLKINVX1 U902 ( .A(n528), .Y(n748) );
  AOI32X1 U903 ( .A0(n749), .A1(cost_cnt[0]), .A2(cost_cnt[1]), .B0(
        cost_cnt[2]), .B1(n749), .Y(n528) );
  CLKINVX1 U904 ( .A(n241), .Y(n749) );
  NAND2X1 U905 ( .A(top_state[1]), .B(n687), .Y(n530) );
  AO21X1 U906 ( .A0(sort_finish), .A1(n744), .B0(N473), .Y(N44) );
  NOR2BX1 U907 ( .AN(top_state[0]), .B(n530), .Y(N473) );
  OA21XL U908 ( .A0(n535), .A1(n536), .B0(n688), .Y(N434) );
  AOI211X1 U909 ( .A0(n538), .A1(n539), .B0(n676), .C0(n240), .Y(n535) );
  OA21XL U910 ( .A0(n537), .A1(n240), .B0(\combination[0][1] ), .Y(n536) );
  AOI221XL U911 ( .A0(n768), .A1(\combination[1][1] ), .B0(n443), .B1(
        \combination[2][1] ), .C0(n540), .Y(n539) );
  OA21XL U912 ( .A0(n542), .A1(n543), .B0(n688), .Y(N433) );
  AOI211X1 U913 ( .A0(n553), .A1(n554), .B0(n676), .C0(n240), .Y(n542) );
  OA21XL U914 ( .A0(n537), .A1(n240), .B0(\combination[0][0] ), .Y(n543) );
  AOI221XL U915 ( .A0(n768), .A1(\combination[1][0] ), .B0(n443), .B1(n682), 
        .C0(n576), .Y(n554) );
  AO22X1 U916 ( .A0(N339), .A1(n526), .B0(N433), .B1(n527), .Y(N468) );
  AO22X1 U917 ( .A0(N338), .A1(n526), .B0(N434), .B1(n527), .Y(N469) );
  AO22X1 U918 ( .A0(N337), .A1(n526), .B0(N435), .B1(n527), .Y(N470) );
  OA21XL U919 ( .A0(n686), .A1(n531), .B0(n688), .Y(N435) );
  OAI21XL U920 ( .A0(top_state[0]), .A1(RST), .B0(n530), .Y(N45) );
  OAI21XL U921 ( .A0(RST), .A1(n240), .B0(n241), .Y(n636) );
  NOR2X1 U922 ( .A(n529), .B(n241), .Y(N463) );
  XNOR2X1 U923 ( .A(cost_cnt[1]), .B(cost_cnt[0]), .Y(n529) );
  NOR2X1 U924 ( .A(cost_cnt[0]), .B(n241), .Y(N462) );
  NOR2XL U925 ( .A(W[0]), .B(n747), .Y(N465) );
  NOR4X1 U926 ( .A(n524), .B(n226), .C(n753), .D(RST), .Y(N451) );
  OAI21XL U927 ( .A0(\combination[7][1] ), .A1(n823), .B0(\combination[7][0] ), 
        .Y(n570) );
  CLKINVX1 U928 ( .A(n572), .Y(n812) );
  OAI22XL U929 ( .A0(n390), .A1(n803), .B0(n391), .B1(n193), .Y(n404) );
  OAI22XL U930 ( .A0(n787), .A1(n800), .B0(n392), .B1(n218), .Y(n403) );
  OAI22XL U931 ( .A0(n262), .A1(n767), .B0(n257), .B1(n290), .Y(n401) );
  NOR2X1 U932 ( .A(n828), .B(\combination[7][2] ), .Y(n571) );
  CLKBUFX3 U933 ( .A(\combination[6][2] ), .Y(n683) );
  OAI22XL U934 ( .A0(n782), .A1(n803), .B0(n334), .B1(n218), .Y(n343) );
  OAI22XL U935 ( .A0(n794), .A1(n290), .B0(n193), .B1(n294), .Y(n341) );
  OAI22XL U936 ( .A0(n800), .A1(n316), .B0(n262), .B1(n766), .Y(n342) );
  OAI21XL U937 ( .A0(\combination[4][1] ), .A1(n826), .B0(n684), .Y(n564) );
  CLKINVX1 U938 ( .A(n566), .Y(n827) );
  NOR2X1 U939 ( .A(n199), .B(\combination[4][2] ), .Y(n565) );
  CLKINVX1 U940 ( .A(n265), .Y(n761) );
  AOI211X1 U941 ( .A0(n683), .A1(n266), .B0(n267), .C0(n268), .Y(n265) );
  OAI222XL U942 ( .A0(n270), .A1(n271), .B0(n792), .B1(n272), .C0(n273), .C1(
        n274), .Y(n267) );
  OAI22XL U943 ( .A0(n784), .A1(n814), .B0(n269), .B1(n191), .Y(n268) );
  CLKINVX1 U944 ( .A(n283), .Y(n760) );
  AOI211X1 U945 ( .A0(n685), .A1(n266), .B0(n284), .C0(n285), .Y(n283) );
  OAI222XL U946 ( .A0(n262), .A1(n271), .B0(n792), .B1(n290), .C0(n291), .C1(
        n274), .Y(n284) );
  OAI22XL U947 ( .A0(n784), .A1(n807), .B0(n269), .B1(n193), .Y(n285) );
  OAI22XL U948 ( .A0(n302), .A1(n199), .B0(n303), .B1(n814), .Y(n301) );
  OAI22XL U949 ( .A0(n191), .A1(n288), .B0(n287), .B1(n272), .Y(n298) );
  OAI21XL U950 ( .A0(\combination[6][1] ), .A1(n213), .B0(n685), .Y(n567) );
  CLKINVX1 U951 ( .A(n569), .Y(n819) );
  OAI32X1 U952 ( .A0(n568), .A1(\combination[5][1] ), .A2(n823), .B0(n828), 
        .B1(\combination[5][2] ), .Y(n569) );
  CLKBUFX3 U953 ( .A(\combination[6][0] ), .Y(n685) );
  OAI31X1 U954 ( .A0(n561), .A1(n684), .A2(n562), .B0(n816), .Y(n548) );
  CLKINVX1 U955 ( .A(n563), .Y(n816) );
  OAI21XL U956 ( .A0(\combination[5][1] ), .A1(n207), .B0(\combination[5][0] ), 
        .Y(n561) );
  NOR2X1 U957 ( .A(n191), .B(\combination[3][2] ), .Y(n559) );
  OAI31X1 U958 ( .A0(n558), .A1(n682), .A2(n559), .B0(n825), .Y(n547) );
  OAI21XL U959 ( .A0(\combination[3][1] ), .A1(n831), .B0(\combination[3][0] ), 
        .Y(n558) );
  CLKINVX1 U960 ( .A(n560), .Y(n825) );
  CLKINVX1 U961 ( .A(n248), .Y(n757) );
  AOI221XL U962 ( .A0(\combination[7][1] ), .A1(n249), .B0(\combination[1][1] ), .B1(n250), .C0(n251), .Y(n248) );
  OAI22XL U963 ( .A0(n252), .A1(n677), .B0(n764), .B1(n254), .Y(n251) );
  AOI221XL U964 ( .A0(n255), .A1(\combination[5][1] ), .B0(n791), .B1(
        \combination[6][1] ), .C0(n256), .Y(n252) );
  CLKINVX1 U965 ( .A(n477), .Y(n762) );
  AOI221XL U966 ( .A0(\combination[7][2] ), .A1(n249), .B0(\combination[1][2] ), .B1(n250), .C0(n478), .Y(n477) );
  OAI22XL U967 ( .A0(n479), .A1(n677), .B0(n764), .B1(n270), .Y(n478) );
  AOI221XL U968 ( .A0(n255), .A1(\combination[5][2] ), .B0(n791), .B1(n683), 
        .C0(n480), .Y(n479) );
  CLKINVX1 U969 ( .A(n579), .Y(n770) );
  OAI31XL U970 ( .A0(n580), .A1(\combination[0][0] ), .A2(n581), .B0(n780), 
        .Y(n579) );
  OAI21XL U971 ( .A0(\combination[4][1] ), .A1(n774), .B0(n684), .Y(n580) );
  CLKINVX1 U972 ( .A(n582), .Y(n780) );
  OA22X1 U973 ( .A0(n274), .A1(n282), .B0(n271), .B1(n254), .Y(n281) );
  AOI222XL U974 ( .A0(\combination[4][1] ), .A1(n276), .B0(\combination[3][1] ), .B1(n815), .C0(\combination[5][1] ), .C1(n275), .Y(n282) );
  NOR2X1 U975 ( .A(n161), .B(\combination[4][2] ), .Y(n581) );
  OAI31X1 U976 ( .A0(n596), .A1(\combination[0][0] ), .A2(n597), .B0(n775), 
        .Y(n541) );
  OAI21XL U977 ( .A0(\combination[7][1] ), .A1(n774), .B0(\combination[7][0] ), 
        .Y(n596) );
  CLKINVX1 U978 ( .A(n598), .Y(n775) );
  NOR2X1 U979 ( .A(n161), .B(\combination[7][2] ), .Y(n597) );
  OAI21XL U980 ( .A0(\combination[3][1] ), .A1(n774), .B0(\combination[3][0] ), 
        .Y(n583) );
  CLKINVX1 U981 ( .A(n585), .Y(n779) );
  NAND2XL U982 ( .A(W[1]), .B(W[0]), .Y(n599) );
  OAI31X1 U983 ( .A0(n573), .A1(\combination[1][0] ), .A2(n574), .B0(n790), 
        .Y(n545) );
  OAI21XL U984 ( .A0(\combination[2][1] ), .A1(n182), .B0(n682), .Y(n573) );
  CLKINVX1 U985 ( .A(n575), .Y(n790) );
  OAI32X1 U986 ( .A0(n574), .A1(\combination[1][1] ), .A2(n831), .B0(n191), 
        .B1(\combination[1][2] ), .Y(n575) );
  NOR2X1 U987 ( .A(n181), .B(\combination[2][2] ), .Y(n574) );
  OAI21XL U988 ( .A0(\combination[7][1] ), .A1(n182), .B0(\combination[7][0] ), 
        .Y(n497) );
  CLKINVX1 U989 ( .A(n499), .Y(n793) );
  NOR2X1 U990 ( .A(n181), .B(\combination[7][2] ), .Y(n498) );
  CLKBUFX3 U991 ( .A(\combination[4][0] ), .Y(n684) );
  OAI21XL U992 ( .A0(\combination[6][1] ), .A1(n774), .B0(n685), .Y(n593) );
  CLKINVX1 U993 ( .A(n595), .Y(n776) );
  OAI21XL U994 ( .A0(\combination[3][1] ), .A1(n182), .B0(\combination[3][0] ), 
        .Y(n482) );
  CLKINVX1 U995 ( .A(n484), .Y(n799) );
  OAI31X1 U996 ( .A0(n586), .A1(\combination[0][0] ), .A2(n587), .B0(n778), 
        .Y(n426) );
  OAI21XL U997 ( .A0(\combination[2][1] ), .A1(n774), .B0(n682), .Y(n586) );
  CLKINVX1 U998 ( .A(n588), .Y(n778) );
  CLKBUFX3 U999 ( .A(\combination[0][2] ), .Y(n686) );
  OAI31X1 U1000 ( .A0(n590), .A1(\combination[0][0] ), .A2(n591), .B0(n777), 
        .Y(n578) );
  OAI21XL U1001 ( .A0(\combination[5][1] ), .A1(n774), .B0(\combination[5][0] ), .Y(n590) );
  CLKINVX1 U1002 ( .A(n592), .Y(n777) );
  OAI31X1 U1003 ( .A0(n555), .A1(\combination[0][0] ), .A2(n556), .B0(n781), 
        .Y(n552) );
  OAI21XL U1004 ( .A0(\combination[1][1] ), .A1(n774), .B0(\combination[1][0] ), .Y(n555) );
  CLKINVX1 U1005 ( .A(n557), .Y(n781) );
  OAI32X1 U1006 ( .A0(n556), .A1(\combination[0][1] ), .A2(n182), .B0(n181), 
        .B1(n686), .Y(n557) );
  NOR2X1 U1007 ( .A(n191), .B(\combination[4][2] ), .Y(n448) );
  OAI21XL U1008 ( .A0(\combination[4][1] ), .A1(n831), .B0(n684), .Y(n447) );
  CLKINVX1 U1009 ( .A(n449), .Y(n829) );
  OAI31X1 U1010 ( .A0(n485), .A1(\combination[1][0] ), .A2(n486), .B0(n798), 
        .Y(n481) );
  OAI21XL U1011 ( .A0(\combination[4][1] ), .A1(n182), .B0(n684), .Y(n485) );
  CLKINVX1 U1012 ( .A(n487), .Y(n798) );
  NOR2X1 U1013 ( .A(n181), .B(\combination[5][2] ), .Y(n491) );
  CLKINVX1 U1014 ( .A(n489), .Y(n796) );
  OAI31XL U1015 ( .A0(n490), .A1(\combination[1][0] ), .A2(n491), .B0(n797), 
        .Y(n489) );
  OAI21XL U1016 ( .A0(\combination[5][1] ), .A1(n182), .B0(\combination[5][0] ), .Y(n490) );
  CLKINVX1 U1017 ( .A(n492), .Y(n797) );
  NOR2X1 U1018 ( .A(n181), .B(\combination[3][2] ), .Y(n483) );
  NOR2X1 U1019 ( .A(n181), .B(\combination[4][2] ), .Y(n486) );
  CLKBUFX3 U1020 ( .A(\combination[2][0] ), .Y(n682) );
  AOI211X1 U1021 ( .A0(n532), .A1(n533), .B0(n676), .C0(n240), .Y(n531) );
  AOI222XL U1022 ( .A0(n763), .A1(n683), .B0(n496), .B1(\combination[4][2] ), 
        .C0(n765), .C1(\combination[5][2] ), .Y(n532) );
  AOI211X1 U1023 ( .A0(n768), .A1(\combination[1][2] ), .B0(n534), .C0(
        \combination[7][2] ), .Y(n533) );
  OAI22XL U1024 ( .A0(n199), .A1(n362), .B0(n191), .B1(n767), .Y(n534) );
  OAI21XL U1025 ( .A0(\combination[6][1] ), .A1(n831), .B0(n685), .Y(n458) );
  CLKINVX1 U1026 ( .A(n460), .Y(n821) );
  OAI32X1 U1027 ( .A0(n459), .A1(\combination[2][1] ), .A2(n823), .B0(n828), 
        .B1(\combination[2][2] ), .Y(n460) );
  NOR2X1 U1028 ( .A(n191), .B(n683), .Y(n459) );
  OAI31X1 U1029 ( .A0(n461), .A1(n682), .A2(n462), .B0(n817), .Y(n446) );
  OAI21XL U1030 ( .A0(\combination[5][1] ), .A1(n831), .B0(\combination[5][0] ), .Y(n461) );
  CLKINVX1 U1031 ( .A(n463), .Y(n817) );
  NOR2X1 U1032 ( .A(n191), .B(\combination[5][2] ), .Y(n462) );
  OAI222XL U1033 ( .A0(n199), .A1(n257), .B0(n191), .B1(n258), .C0(n830), .C1(
        n259), .Y(n480) );
  OAI222XL U1034 ( .A0(n826), .A1(n257), .B0(n831), .B1(n258), .C0(n207), .C1(
        n259), .Y(n256) );
  OAI21XL U1035 ( .A0(\combination[6][1] ), .A1(n182), .B0(n685), .Y(n493) );
  CLKINVX1 U1036 ( .A(n495), .Y(n795) );
  OAI32X1 U1037 ( .A0(n494), .A1(\combination[1][1] ), .A2(n823), .B0(n828), 
        .B1(\combination[1][2] ), .Y(n495) );
  NOR2X1 U1038 ( .A(n181), .B(n683), .Y(n494) );
  AOI222XL U1039 ( .A0(\combination[7][0] ), .A1(n541), .B0(n765), .B1(
        \combination[5][0] ), .C0(n763), .C1(n685), .Y(n553) );
  AOI222XL U1040 ( .A0(\combination[7][1] ), .A1(n541), .B0(n765), .B1(
        \combination[5][1] ), .C0(n763), .C1(\combination[6][1] ), .Y(n538) );
  OAI21XL U1041 ( .A0(\combination[7][1] ), .A1(n831), .B0(\combination[7][0] ), .Y(n451) );
  CLKINVX1 U1042 ( .A(n453), .Y(n809) );
  NOR2X1 U1043 ( .A(n191), .B(\combination[7][2] ), .Y(n452) );
  OAI21XL U1044 ( .A0(\combination[6][1] ), .A1(n826), .B0(n685), .Y(n435) );
  CLKINVX1 U1045 ( .A(n437), .Y(n820) );
  OAI32X1 U1046 ( .A0(n436), .A1(\combination[3][1] ), .A2(n823), .B0(n828), 
        .B1(\combination[3][2] ), .Y(n437) );
  NOR2X1 U1047 ( .A(n199), .B(n683), .Y(n436) );
  AOI222XL U1048 ( .A0(n275), .A1(\combination[5][2] ), .B0(n815), .B1(
        \combination[3][2] ), .C0(n276), .C1(\combination[4][2] ), .Y(n273) );
  AOI222XL U1049 ( .A0(n275), .A1(\combination[5][0] ), .B0(n815), .B1(
        \combination[3][0] ), .C0(n276), .C1(n684), .Y(n291) );
  OAI21XL U1050 ( .A0(\combination[5][1] ), .A1(n826), .B0(\combination[5][0] ), .Y(n455) );
  CLKINVX1 U1051 ( .A(n457), .Y(n818) );
  OAI222XL U1052 ( .A0(n800), .A1(n257), .B0(n193), .B1(n258), .C0(n208), .C1(
        n259), .Y(n264) );
  NOR2X1 U1053 ( .A(n199), .B(\combination[7][2] ), .Y(n439) );
  OAI21XL U1054 ( .A0(\combination[7][1] ), .A1(n826), .B0(\combination[7][0] ), .Y(n438) );
  CLKINVX1 U1055 ( .A(n440), .Y(n808) );
  OAI21XL U1056 ( .A0(\combination[7][1] ), .A1(n207), .B0(\combination[7][0] ), .Y(n471) );
  CLKINVX1 U1057 ( .A(n473), .Y(n810) );
  OAI22XL U1058 ( .A0(n207), .A1(n766), .B0(n826), .B1(n362), .Y(n540) );
  OAI22XL U1059 ( .A0(n208), .A1(n766), .B0(n800), .B1(n362), .Y(n576) );
  OAI21XL U1060 ( .A0(\combination[6][1] ), .A1(n207), .B0(n685), .Y(n467) );
  CLKINVX1 U1061 ( .A(n469), .Y(n822) );
  OAI32X1 U1062 ( .A0(n468), .A1(\combination[4][1] ), .A2(n823), .B0(n828), 
        .B1(\combination[4][2] ), .Y(n469) );
  OAI21XL U1063 ( .A0(\combination[7][1] ), .A1(n213), .B0(\combination[7][0] ), .Y(n474) );
  CLKINVX1 U1064 ( .A(n476), .Y(n811) );
  OAI32X1 U1065 ( .A0(n475), .A1(\combination[5][1] ), .A2(n813), .B0(n814), 
        .B1(\combination[5][2] ), .Y(n476) );
  NOR2X1 U1066 ( .A(n824), .B(\combination[7][2] ), .Y(n475) );
  NOR2BX2 U1067 ( .AN(top_state[1]), .B(top_state[0]), .Y(n245) );
  NAND2X1 U1068 ( .A(sort_state[1]), .B(n752), .Y(n524) );
  CLKINVX1 U1069 ( .A(sort_state[0]), .Y(n752) );
  NOR2X1 U1070 ( .A(n752), .B(sort_state[1]), .Y(n525) );
  NAND3X1 U1071 ( .A(cost_cnt[1]), .B(cost_cnt[0]), .C(cost_cnt[2]), .Y(n246)
         );
  NOR2X1 U1072 ( .A(n706), .B(N32), .Y(n702) );
  NOR2X1 U1073 ( .A(n706), .B(W[0]), .Y(n701) );
  NOR2X1 U1074 ( .A(W[0]), .B(N33), .Y(n699) );
  NOR2X1 U1075 ( .A(N32), .B(N33), .Y(n698) );
  AO22X1 U1076 ( .A0(\combination[5][0] ), .A1(n699), .B0(n684), .B1(n698), 
        .Y(n689) );
  AOI221XL U1077 ( .A0(n685), .A1(n702), .B0(\combination[7][0] ), .B1(n701), 
        .C0(n689), .Y(n692) );
  AO22X1 U1078 ( .A0(\combination[1][0] ), .A1(n699), .B0(\combination[0][0] ), 
        .B1(n698), .Y(n690) );
  AOI221XL U1079 ( .A0(n682), .A1(n702), .B0(\combination[3][0] ), .B1(n701), 
        .C0(n690), .Y(n691) );
  OAI22XL U1080 ( .A0(n705), .A1(n692), .B0(N34), .B1(n691), .Y(N339) );
  AO22X1 U1081 ( .A0(\combination[5][1] ), .A1(n699), .B0(\combination[4][1] ), 
        .B1(n698), .Y(n693) );
  AOI221XL U1082 ( .A0(\combination[6][1] ), .A1(n702), .B0(
        \combination[7][1] ), .B1(n701), .C0(n693), .Y(n696) );
  AO22X1 U1083 ( .A0(\combination[1][1] ), .A1(n699), .B0(\combination[0][1] ), 
        .B1(n698), .Y(n694) );
  AOI221XL U1084 ( .A0(\combination[2][1] ), .A1(n702), .B0(
        \combination[3][1] ), .B1(n701), .C0(n694), .Y(n695) );
  OAI22XL U1085 ( .A0(n705), .A1(n696), .B0(N34), .B1(n695), .Y(N338) );
  AO22X1 U1086 ( .A0(\combination[5][2] ), .A1(n699), .B0(\combination[4][2] ), 
        .B1(n698), .Y(n697) );
  AOI221XL U1087 ( .A0(n683), .A1(n702), .B0(\combination[7][2] ), .B1(n701), 
        .C0(n697), .Y(n704) );
  AO22X1 U1088 ( .A0(\combination[1][2] ), .A1(n699), .B0(n686), .B1(n698), 
        .Y(n700) );
  AOI221XL U1089 ( .A0(\combination[2][2] ), .A1(n702), .B0(
        \combination[3][2] ), .B1(n701), .C0(n700), .Y(n703) );
  OAI22XL U1090 ( .A0(n704), .A1(n705), .B0(N34), .B1(n703), .Y(N337) );
  OAI22XL U1091 ( .A0(now_cost[1]), .A1(n708), .B0(n708), .B1(n730), .Y(n710)
         );
  NAND2X1 U1092 ( .A(now_cost[7]), .B(n734), .Y(n722) );
  NAND2X1 U1093 ( .A(now_cost[6]), .B(n733), .Y(n717) );
  NOR3BXL U1094 ( .AN(n717), .B(n711), .C(n718), .Y(n709) );
  NAND3X1 U1095 ( .A(n710), .B(n722), .C(n709), .Y(n729) );
  NAND2X1 U1096 ( .A(now_cost[9]), .B(n735), .Y(n725) );
  NOR2X1 U1097 ( .A(n727), .B(n726), .Y(n716) );
  NAND2X1 U1098 ( .A(now_cost[2]), .B(n731), .Y(n724) );
  OAI211X1 U1099 ( .A0(n713), .A1(n740), .B0(n712), .C0(n724), .Y(n714) );
  OAI221XL U1100 ( .A0(now_cost[2]), .A1(n731), .B0(now_cost[3]), .B1(n732), 
        .C0(n714), .Y(n715) );
  AOI222XL U1101 ( .A0(n844), .A1(n739), .B0(n845), .B1(n741), .C0(n716), .C1(
        n715), .Y(n720) );
  NAND2BX1 U1102 ( .AN(n718), .B(n717), .Y(n719) );
  OAI222XL U1103 ( .A0(n720), .A1(n719), .B0(now_cost[6]), .B1(n733), .C0(
        now_cost[7]), .C1(n734), .Y(n721) );
  NOR4X1 U1104 ( .A(n729), .B(n728), .C(n727), .D(n726), .Y(N386) );
endmodule

