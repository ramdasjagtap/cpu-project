`timescale 1ns / 1ps

// Design Name: 
// Module Name: modulo_op
// Project Name: 


module modulo_op(
input [31:0]a,b,
output [31:0] result 
    );

 division_unsigned_numbers uut ( .dividend(a), .divisor(b),.remainder(result));
 
endmodule
