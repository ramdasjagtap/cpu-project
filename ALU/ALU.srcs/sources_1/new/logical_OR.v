`timescale 1ns / 1ps

// Design Name: logical OR  operation 
// Module Name: logical_OR
// Project Name: 32-bit ALU 



module logical_OR(
input [31:0]a,b,
output [31:0]c
    );
    
   
   assign  c = a || b;

endmodule
