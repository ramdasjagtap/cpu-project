`timescale 1ns / 1ps


// Design Name: Arithmetic Right shift 
// Module Name: arithmetic_right_shift
// Project Name: 32-bit ALU 



module arithmetic_right_shift(
    input signed [31:0] operand,
    input [31:0] shift_amount,
    output  signed [31:0] result
);

   
  assign  result = operand >>> shift_amount ; 
      
    

endmodule


