`timescale 1ns / 1ps

// Design Name: bitwise AND operation 
// Module Name: bitwise_AND
// Project Name: 


module bitwise_AND(
input [31:0]a,b,
output  [31:0]c
    );
    assign c = a & b;
endmodule
