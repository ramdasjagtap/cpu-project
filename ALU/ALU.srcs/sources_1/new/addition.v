`timescale 1ns / 1ps

// Design Name: Carry look ahead adder for 32 bit inputs 
// Module Name: addition
// Project Name: 32-bit ALU


module addition(
input [31:0]a,b,
input cin,
output [31:0]sum,
output cout
);

wire G[31:0] ;  //carry generation 
wire [31:0]P,C;  // carry propagation P 

//G = A & B

assign G[0]  = a[0]  & b[0]  ;
assign G[1]  = a[1]  & b[1]  ;
assign G[2]  = a[2]  & b[2]  ;
assign G[3]  = a[3]  & b[3]  ;
assign G[4]  = a[4]  & b[4]  ;
assign G[5]  = a[5]  & b[5]  ;
assign G[6]  = a[6]  & b[6]  ;
assign G[7]  = a[7]  & b[7]  ;
assign G[8]  = a[8]  & b[8]  ;
assign G[9]  = a[9]  & b[9]  ;
assign G[10] = a[10] & b[10] ;
assign G[11] = a[11] & b[11] ;
assign G[12] = a[12] & b[12] ;
assign G[13] = a[13] & b[13] ;
assign G[14] = a[14] & b[14] ;
assign G[15] = a[15] & b[15] ;
assign G[16] = a[16] & b[16] ;
assign G[17] = a[17] & b[17] ;
assign G[18] = a[18] & b[18] ;
assign G[19] = a[19] & b[19] ;
assign G[20] = a[20] & b[20] ;
assign G[21] = a[21] & b[21] ;
assign G[22] = a[22] & b[22] ;
assign G[23] = a[23] & b[23] ;
assign G[24] = a[24] & b[24] ;
assign G[25] = a[25] & b[25] ;
assign G[26] = a[26] & b[26] ;
assign G[27] = a[27] & b[27] ;
assign G[28] = a[28] & b[28] ;
assign G[29] = a[29] & b[29] ;
assign G[30] = a[30] & b[30] ;
assign G[31] = a[31] & b[31] ;

//Propagate signal P = A^B


assign P[0]  = a[0]  ^ b[0]  ;
assign P[1]  = a[1]  ^ b[1]  ;
assign P[2]  = a[2]  ^ b[2]  ;
assign P[3]  = a[3]  ^ b[3]  ;
assign P[4]  = a[4]  ^ b[4]  ;
assign P[5]  = a[5]  ^ b[5]  ;
assign P[6]  = a[6]  ^ b[6]  ;
assign P[7]  = a[7]  ^ b[7]  ;
assign P[8]  = a[8]  ^ b[8]  ;
assign P[9]  = a[9]  ^ b[9]  ;
assign P[10] = a[10] ^ b[10] ;
assign P[11] = a[11] ^ b[11] ;
assign P[12] = a[12] ^ b[12] ;
assign P[13] = a[13] ^ b[13] ;
assign P[14] = a[14] ^ b[14] ;
assign P[15] = a[15] ^ b[15] ;
assign P[16] = a[16] ^ b[16] ;
assign P[17] = a[17] ^ b[17] ;
assign P[18] = a[18] ^ b[18] ;
assign P[19] = a[19] ^ b[19] ;
assign P[20] = a[20] ^ b[20] ;
assign P[21] = a[21] ^ b[21] ;
assign P[22] = a[22] ^ b[22] ;
assign P[23] = a[23] ^ b[23] ;
assign P[24] = a[24] ^ b[24] ;
assign P[25] = a[25] ^ b[25] ;
assign P[26] = a[26] ^ b[26] ;
assign P[27] = a[27] ^ b[27] ;
assign P[28] = a[28] ^ b[28] ;
assign P[29] = a[29] ^ b[29] ;
assign P[30] = a[30] ^ b[30] ;
assign P[31] = a[31] ^ b[31] ;

// Carry Signals C = Gn + PnC(n-1)
                        
assign C[0]  = G[0]  |(P[0]  & cin   )  ;
assign C[1]  = G[1]  |(P[1]  & C[0]  )  ;
assign C[2]  = G[2]  |(P[2]  & C[1]  )  ;
assign C[3]  = G[3]  |(P[3]  & C[2]  )  ;
assign C[4]  = G[4]  |(P[4]  & C[3]  )  ;
assign C[5]  = G[5]  |(P[5]  & C[4]  )  ;
assign C[6]  = G[6]  |(P[6]  & C[5]  )  ;
assign C[7]  = G[7]  |(P[7]  & C[6]  )  ;
assign C[8]  = G[8]  |(P[8]  & C[7]  )  ;
assign C[9]  = G[9]  |(P[9]  & C[8]  )  ;
assign C[10] = G[10] |(P[10] & C[9]  )  ;
assign C[11] = G[11] |(P[11] & C[10] )  ;
assign C[12] = G[12] |(P[12] & C[11] )  ;
assign C[13] = G[13] |(P[13] & C[12] )  ;
assign C[14] = G[14] |(P[14] & C[13] )  ;
assign C[15] = G[15] |(P[15] & C[14] )  ;
assign C[16] = G[16] |(P[16] & C[15] )  ;
assign C[17] = G[17] |(P[17] & C[16] )  ;
assign C[18] = G[18] |(P[18] & C[17] )  ;
assign C[19] = G[19] |(P[19] & C[18] )  ;
assign C[20] = G[20] |(P[20] & C[19] )  ;
assign C[21] = G[21] |(P[21] & C[20] )  ;
assign C[22] = G[22] |(P[22] & C[21] )  ;
assign C[23] = G[23] |(P[23] & C[22] )  ;
assign C[24] = G[24] |(P[24] & C[23] )  ;
assign C[25] = G[25] |(P[25] & C[24] )  ;
assign C[26] = G[26] |(P[26] & C[25] )  ;
assign C[27] = G[27] |(P[27] & C[26] )  ;
assign C[28] = G[28] |(P[28] & C[27] )  ;
assign C[29] = G[29] |(P[29] & C[28] )  ;
assign C[30] = G[30] |(P[30] & C[29] )  ;
assign C[31] = G[31] |(P[31] & C[30] )  ;

//carry out 
assign cout = C[31] ;

//sum  Calculation 

assign sum[0] = a[0] ^ b[0] ^ cin;
assign sum[1]  = a[1]  ^ b[1]  ^ C[0] ;
assign sum[2]  = a[2]  ^ b[2]  ^ C[1] ;
assign sum[3]  = a[3]  ^ b[3]  ^ C[2] ;
assign sum[4]  = a[4]  ^ b[4]  ^ C[3] ;
assign sum[5]  = a[5]  ^ b[5]  ^ C[4] ;
assign sum[6]  = a[6]  ^ b[6]  ^ C[5] ;
assign sum[7]  = a[7]  ^ b[7]  ^ C[6] ;
assign sum[8]  = a[8]  ^ b[8]  ^ C[7] ;
assign sum[9]  = a[9]  ^ b[9]  ^ C[8] ;
assign sum[10] = a[10] ^ b[10] ^ C[9] ;
assign sum[11] = a[11] ^ b[11] ^ C[10];
assign sum[12] = a[12] ^ b[12] ^ C[11];
assign sum[13] = a[13] ^ b[13] ^ C[12];
assign sum[14] = a[14] ^ b[14] ^ C[13];
assign sum[15] = a[15] ^ b[15] ^ C[14];
assign sum[16] = a[16] ^ b[16] ^ C[15];
assign sum[17] = a[17] ^ b[17] ^ C[16];
assign sum[18] = a[18] ^ b[18] ^ C[17];
assign sum[19] = a[19] ^ b[19] ^ C[18];
assign sum[20] = a[20] ^ b[20] ^ C[19];
assign sum[21] = a[21] ^ b[21] ^ C[20];
assign sum[22] = a[22] ^ b[22] ^ C[21];
assign sum[23] = a[23] ^ b[23] ^ C[22];
assign sum[24] = a[24] ^ b[24] ^ C[23];
assign sum[25] = a[25] ^ b[25] ^ C[24];
assign sum[26] = a[26] ^ b[26] ^ C[25];
assign sum[27] = a[27] ^ b[27] ^ C[26];
assign sum[28] = a[28] ^ b[28] ^ C[27];
assign sum[29] = a[29] ^ b[29] ^ C[28];
assign sum[30] = a[30] ^ b[30] ^ C[29];
assign sum[31] = a[31] ^ b[31] ^ C[30];
                                 
endmodule
