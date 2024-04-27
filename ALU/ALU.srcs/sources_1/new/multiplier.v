`timescale 1ns / 1ps

// Design Name: wallace tree multiplier that takes 32 bit input 
// Module Name: multiplier
// Project Name: 32-bit ALU 


// Half adder 
module halfadder(input a,b, 
                output sum,cout);
assign sum = a^b;
assign cout = a&b;                
                
endmodule 


// full adder 
module full_add(
input a,b,cin,
output sum,cout);
assign sum = a^b^cin;
assign cout = a&b | a&cin | b&cin;
endmodule 


// 8- bit wallace tree multiplier 

module wallace_8(
input [7:0] a1, b1, 
output [15:0] result
    
);

	 wire [7:0] p0,p1,p2,p3,p4,p5,p6,p7;
	 wire [7:0] r1, r2, r3, r4, r5, r6, r7, r8;
	 wire [64:0] cr;
	 wire [53:0] s;
	
	 assign r1[7:0] =  {8{b1[0]}};
	 assign r2[7:0] =  {8{b1[1]}};
	 assign r3[7:0] =  {8{b1[2]}};
	 assign r4[7:0] =  {8{b1[3]}};
	 assign r5[7:0] =  {8{b1[4]}};
	 assign r6[7:0] =  {8{b1[5]}};
	 assign r7[7:0] =  {8{b1[6]}};
	 assign r8[7:0] =  {8{b1[7]}};
	 
	 assign p0=a1&r1;
	 assign p1=a1&r2;
	 assign p2=a1&r3;
	 assign p3=a1&r4;
	 assign p4=a1&r5;
	 assign p5=a1&r6;
	 assign p6=a1&r7;
	 assign p7=a1&r8;
	
	assign result[0] = p0[0];
	halfadder a1241(p0[1], p1[0], s[1], cr[1]);
	full_add a2(p0[2], p1[1], p2[0], s[2], cr[2]);
	full_add a3(p0[3], p1[2], p2[1], s[3], cr[3]);
	full_add a4(p0[4], p1[3], p2[2], s[4], cr[4]);	
	halfadder a5(p3[1], p4[0], s[10], cr[10]);
	full_add a6(p0[5], p1[4], p2[3], s[5], cr[5]);
	full_add a7(p3[2], p4[1], p5[0], s[11], cr[11]);
	full_add a8(p0[6], p1[5], p2[4], s[6], cr[6]);
	full_add a9(p3[3], p4[2], p5[1], s[12], cr[12]);
	full_add a10(p0[7], p1[6], p2[5], s[7], cr[7]);
	full_add a11(p3[4], p4[3], p5[2], s[13], cr[13]);
	halfadder a12(p1[7], p2[6], s[8], cr[8]);
	full_add a13(p3[5], p4[4], p5[3], s[14], cr[14]);
	full_add a14(p2[7], p3[6], p4[5], s[9], cr[9]);
	full_add a15(p3[7], p4[6], p5[5], s[15], cr[15]);
	halfadder a16(p4[7], p5[6], s[16], cr[16]);	

	assign result[1] = s[1];
	halfadder a17(s[2], cr[1], s[17], cr[17]);
	full_add a18(s[3], cr[2], p3[0], s[18], cr[18]);
	full_add a19(s[4], cr[3], s[10], s[19], cr[19]);		
	full_add a20(s[5], cr[4], s[11], s[20], cr[20]);
	full_add a21(s[6], cr[5], s[12], s[21], cr[21]);  	
	full_add a22(s[7], cr[6], s[13], s[22], cr[22]);
	full_add a23(s[8], cr[7], s[14], s[23], cr[23]);
	full_add a24(s[9], cr[8], cr[14], s[24], cr[24]);
	full_add a25(cr[9], p6[4], p7[3], s[29], cr[29]);		
	full_add a26(cr[15], p6[5], p7[4], s[30], cr[30]);
	full_add a27(p5[7], p6[6], p7[5], s[31], cr[31]);
	halfadder a28(p6[7], p7[6], s[32], cr[32]);
	halfadder a29(p6[0], cr[11], s[25], cr[25]);
	full_add a30(cr[12], p6[1], p7[0], s[26], cr[26]);
	full_add a31(cr[13], p6[2], p7[1], s[27], cr[27]);
	full_add a32(p5[4], p6[3], p7[2], s[28], cr[28]);

	assign result[2] = s[17];
	halfadder a33(s[18], cr[17], s[33], cr[33]);
	halfadder a34(s[19], cr[18], s[34], cr[34]);
	full_add a35(s[20], cr[19], cr[10], s[35], cr[35]);
	full_add a36(s[21], cr[20], s[25], s[36], cr[36]);
	full_add a37(s[22], cr[21], s[26], s[37], cr[37]);
	full_add a38(s[23], cr[22], s[27], s[38], cr[38]);
	full_add a39(s[24], cr[23], s[28], s[39], cr[39]);
	full_add a40(s[15], cr[24], s[29], s[40], cr[40]);
	halfadder a41(s[16], s[30], s[41], cr[41]);
	halfadder a42(cr[16], s[31], s[42], cr[42]);
	
	assign result[3] = s[33];
	halfadder a43(s[34], cr[33], s[43], cr[43]);
	halfadder a44(s[35], cr[34], s[44], cr[44]);
	halfadder a45(s[36], cr[35], s[45], cr[45]);
	full_add a46(s[37], cr[36], cr[25], s[46], cr[46]);
	full_add a47(s[38], cr[37], cr[26], s[47], cr[47]);	
	full_add a48(s[39], cr[38], cr[27], s[48], cr[48]);
	full_add a49(s[40], cr[39], cr[28], s[49], cr[49]);	
	full_add a50(s[41], cr[40], cr[29], s[50], cr[50]);	
	full_add a51(s[42], cr[30], cr[41], s[51], cr[51]);	
	full_add a52(cr[42], s[32], cr[31], s[52], cr[52]);	
	halfadder a53(p7[7], cr[32], s[53], cr[53]);
	
	assign result[4] = s[43];
	halfadder a54(s[44], cr[43], result[5], cr[54]);
	full_add a55(s[45], cr[44], cr[54], result[6], cr[55]);	
	full_add a56(s[46], cr[45], cr[55], result[7], cr[56]);
	full_add a57(s[47], cr[46], cr[56], result[8], cr[57]);
	full_add a58(s[48], cr[47], cr[57], result[9], cr[58]);
	full_add a59(s[49], cr[48], cr[58], result[10], cr[59]);
	full_add a60(s[50], cr[49], cr[59], result[11], cr[60]);
	full_add a61(s[51], cr[50], cr[60], result[12], cr[61]);
	full_add a62(s[52], cr[51], cr[61], result[13], cr[62]);
	full_add a63(s[53], cr[52], cr[62], result[14], cr[63]);
	assign result[15] = cr[53];
      
	 
endmodule



module adder_64( a, b, sum, cout);
input [63:0]a; 
input [63:0]b;
output [63:0]sum;
output cout;

wire t1,t2, t3,t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23, t24, t25, t26, t27, t28, t29, t30, t31, t32, t33, t34, t35, t36, t37, t38, t39, t40, t41, t42, t43, t44, t45, t46, t47, t48, t49, t50, t51, t52, t53, t54, t55, t56, t57, t58, t59, t60, t61, t62, t63, t64; 
halfadder f1(a[0], b[0], sum[0], t1);
full_add  f2(a[1], b[1], t1, sum[1], t2);
full_add  f3(a[2], b[2], t2, sum[2], t3);
full_add  f4(a[3], b[3], t3, sum[3], t4);
full_add  f5(a[4], b[4], t4, sum[4], t5);
full_add  f6(a[5], b[5], t5, sum[5], t6);
full_add  f7(a[6], b[6], t6, sum[6], t7);
full_add  f8(a[7], b[7], t7, sum[7], t8);
full_add  f9(a[8], b[8], t8, sum[8], t9);
full_add  f10(a[9], b[9], t9, sum[9], t10);
full_add  f11(a[10], b[10], t10, sum[10], t11);
full_add  f12(a[11], b[11], t11, sum[11], t12);
full_add  f13(a[12], b[12], t12, sum[12], t13);
full_add  f14(a[13], b[13], t13, sum[13], t14);
full_add  f15(a[14], b[14], t14, sum[14], t15);
full_add  f16(a[15], b[15], t15, sum[15], t16);
full_add  f21(a[16], b[16], t16, sum[16], t17);
full_add  f22(a[17], b[17], t17, sum[17], t18);
full_add  f23(a[18], b[18], t18, sum[18], t19);
full_add  f24(a[19], b[19], t19, sum[19], t20);
full_add  f25(a[20], b[20], t20, sum[20], t21);
full_add  f26(a[21], b[21], t21, sum[21], t22);
full_add  f27(a[22], b[22], t22, sum[22], t23);
full_add  f28(a[23], b[23], t23, sum[23], t24);
full_add  f119(a[24], b[24], t24, sum[24], t25);
full_add  f29(a[25], b[25], t25, sum[25], t26);
full_add  f30(a[26], b[26], t26, sum[26], t27);
full_add  f31(a[27], b[27], t27, sum[27], t28);
full_add  f32(a[28], b[28], t28, sum[28], t29);
full_add  f33(a[29], b[29], t29, sum[29], t30);
full_add  f34(a[30], b[30], t30, sum[30], t31);
full_add  f35(a[31], b[31], t31, sum[31], t32);
full_add  f36(a[32], b[32], t32, sum[32], t33);
full_add  f37(a[33], b[33], t33, sum[33], t34);
full_add  f38(a[34], b[34], t34, sum[34], t35);
full_add  f55(a[35], b[35], t35, sum[35], t36);
full_add  f56(a[36], b[36], t36, sum[36], t37);
full_add  f455(a[37], b[37], t37, sum[37], t38);
full_add  f56434(a[38], b[38], t38, sum[38], t39);
full_add  f45641(a[39], b[39], t39, sum[39], t40);
full_add  f145(a[40], b[40], t40, sum[40], t41);
full_add  f472(a[41], b[41], t41, sum[41], t42);
full_add  f42(a[42], b[42], t42, sum[42], t43);
full_add  f45(a[43], b[43], t43, sum[43], t44);
full_add  f542(a[44], b[44], t44, sum[44], t45);
full_add  f53(a[45], b[45], t45, sum[45], t46);
full_add  f94(a[46], b[46], t46, sum[46], t47);
full_add  f244(a[47], b[47], t47, sum[47], t48);
full_add  f412(a[48], b[48], t48, sum[48], t49);
full_add  f152(a[49], b[49], t49, sum[49], t50);
full_add  f2114(a[50], b[50], t50, sum[50], t51);
full_add  f174(a[51], b[51], t51, sum[51], t52);
full_add  f172(a[52], b[52], t52, sum[52], t53);
full_add  f54(a[53], b[53], t53, sum[53], t54);
full_add  f564(a[54], b[54], t54, sum[54], t55);
full_add  f456(a[55], b[55], t55, sum[55], t56);
full_add  f345(a[56], b[56], t56, sum[56], t57);
full_add  f435(a[57], b[57], t57, sum[57], t58);
full_add  f451(a[58], b[58], t58, sum[58], t59);
full_add  fd4(a[59], b[59], t59, sum[59], t60);
full_add  fdsf(a[60], b[60], t60, sum[60], t61);
full_add  fd412(a[61], b[61], t61, sum[61], t62);
full_add  fds(a[62], b[62], t62, sum[62], t63);
full_add  fdf(a[63], b[63], t63, sum[63], cout);

endmodule


// top module for multiplier 
module multiplier(
 input signed [31:0]a,
input  signed [31:0]b,
output signed [63:0]c 
);

//assign a = 32'b101010111010101010;
//assign b = 32'b1010101110101010; 
wire [7:0] am1, am2, am3, am4, am5, am6, am7, am8;
wire [63:0] ma1, ma2, ma3, ma4, ma5, ma6,  ma7, ma8;
wire [63:0] l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, l11, l12, l13, l14, l15, l16;
wire [15:0] li1, li2, li3, li4, li5, li6, li7, li8, li9, li10, li11, li12, li13, li14, li15, li16;
wire [63:0] w1, w2, w3, w4, w5, w6;
wire w10;


/*

 clk_wiz_0 clk_inst
   (
    // Clock out ports
    .clk_out1(clk),     // output clk_out1
    // Status and control signals
  // input reset
        // output locked
   // Clock in ports
    .clk_in1_p(clk_in1_p),    // input clk_in1_p
    .clk_in1_n(clk_in1_n)    // input clk_in1_n
);

ila_0 ila_inst (
	.clk(clk), // input wire clk


	.probe0(a), // input wire [31:0]  probe0  
	.probe1(b), // input wire [31:0]  probe1 
	.probe2(c) // input wire [63:0]  probe2
);

vio_0 vio_inst (
  .clk(clk),                // input wire clk
  .probe_out0(a),  // output wire [31 : 0] probe_out0
  .probe_out1(b)  // output wire [31 : 0] probe_out1
);


*/



assign am1[7:0] = a[7:0];
assign am2[7:0] = a[15:8];
assign am3[7:0] = a[23:16];
assign am4[7:0] = a[31:24];

assign am5[7:0] = b[7:0];
assign am6[7:0] = b[15:8];
assign am7[7:0] = b[23:16];
assign am8[7:0] = b[31:24];

wallace_8 bc1(am1[7:0], am5[7:0], li1);
wallace_8 bc2(am1, am6, li2);
wallace_8 bc3(am1, am7, li3);
wallace_8 bc4(am1, am8, li4);
wallace_8 bc5(am2, am5, li5);
wallace_8 bc6(am2, am6, li6);
wallace_8 bc7(am2, am7, li7);
wallace_8 bc8(am2, am8, li8);
wallace_8 bc9(am3, am5, li9);
wallace_8 bc10(am3, am6, li10);
wallace_8 bc11(am3, am7, li11);
wallace_8 bc12(am3, am8, li12);
wallace_8 bc13(am4, am5, li13);
wallace_8 bc14(am4, am6, li14);
wallace_8 bc15(am4, am7, li15);
wallace_8 bc16(am4, am8, li16);

assign l1 = {48'b0, li1[15:0]};
assign l2 = {40'b0, li2[15:0], 8'b0};
assign l5 = {40'b0, li5[15:0], 8'b0};
assign l6 = {40'b0, li6[15:0], 16'b0};
assign l9 = {40'b0, li9[15:0], 16'b0};
assign l3 = {40'b0, li3[15:0], 16'b0};
assign l4 = {32'b0, li4[15:0], 24'b0};
assign l7 = {32'b0, li7[15:0], 24'b0};
assign l10 = {24'b0, li10[15:0], 24'b0};
assign l13 = {24'b0, li13[15:0], 24'b0};
assign l11 = {16'b0, li11[15:0], 32'b0};
assign l14 = {16'b0, li14[15:0], 32'b0};
assign l8 =  {16'b0, li8[15:0], 32'b0};
assign l12 = {8'b0, li12[15:0], 40'b0};
assign l15 = {8'b0, li15[15:0], 40'b0};
assign l16 = {8'b0, li16[15:0], 48'b0};

adder_64 mc1(.a(l1), .b(l2), .sum(ma1), .cout(w10));
adder_64 mc2(l3, l4, ma2, w10);
adder_64 mc3(l5, l6, ma3, w10);
adder_64 mc4(l7, l8, ma4, w10);
adder_64 mc5(l9, l10, ma5, w10);
adder_64 mc6(l11, l12, ma6, w10);
adder_64 mc7(l13, l14, ma7, w10);
adder_64 mc8(l15, l16, ma8, w10);
adder_64 mc9(ma1, ma2, w1, w10);
adder_64 mc10(ma3, ma4, w2, w10);
adder_64 mc11(ma5, ma6, w3, w10);
adder_64 mc12(ma7, ma8, w4, w10);
adder_64 mc13(w1, w2, w5, w10);
adder_64 mc14(w3, w4, w6, w10);
adder_64 mc15(w5, w6, c, w10);

endmodule
