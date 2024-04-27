`timescale 1ns / 1ps

// Design Name: Subtractor that takes signed 32-bit input 
// Module Name: subtraction
// Project Name:  32-bit ALU 



module subtraction
(
input  signed[31:0]a,
input  signed[31:0]b, 
output signed[31:0]d
    );

// Two's complement of B
wire [31:0] neg_B;

// Generate the two's complement of B
assign neg_B = ~b + 1;

// Perform subtraction
  assign  d = a + neg_B;

endmodule
