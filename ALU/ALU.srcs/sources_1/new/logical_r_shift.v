`timescale 1ns / 1ps

// Design Name: Logical Right shift 
// Module Name: logical_r_shift
// Project Name: 32-bit ALU 


module logical_r_shift(
input [31:0]a ,
input [31:0]b,
output [31:0] result
    );
    
    
       assign result = a >> b;   
    
    
endmodule
