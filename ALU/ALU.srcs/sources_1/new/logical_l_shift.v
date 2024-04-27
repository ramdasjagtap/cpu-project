`timescale 1ns / 1ps

// Design Name: logical left shifting operation 
// Module Name: logical_l_shift
// Project Name: 32-bit ALU 


module logical_l_shift(
input [31:0]a,      // operand 
input [31:0]b,   // b is the number of times we want a to shift 
output [31:0] result
    );
    
   
        assign result = a << b;        // a will be shifted b times 
   
    
endmodule
