`timescale 1ns / 1ps

// Design Name: Comparision Module 
// Module Name: comparision
// Project Name: 32-bit ALU 


module comparision(
input [31:0] a,
input [31:0] b,
output  [2:0]c

); 
  
  wire [2:0]result;
  

    
         assign  result[0] = (a > b)  ? 1'b1 : 1'b0;
         assign  result[1] = (a < b)  ? 1'b1 : 1'b0;
         assign  result[2] = (a == b) ? 1'b1 : 1'b0;
        


assign c = result;

    
endmodule
