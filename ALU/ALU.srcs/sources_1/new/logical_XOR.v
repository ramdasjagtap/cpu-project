`timescale 1ns / 1ps

// Design Name: logical XOR operation 
// Module Name: logical_XOR
// Project Name: 32-bit ALU 

// need to recheck this  module once with logical xor operation and also look into logical not operation . 

module logical_XOR(
input [31:0]a,b,
output  [31:0] c
    );
    
   
       assign c = a ^ b;
   
    
endmodule
