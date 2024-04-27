`timescale 1ns / 1ps

module fulladder(
 input a,b,cin,
output sum,cout);

assign sum = a^b^cin;
assign cout = a&b | a&cin | b&cin;

endmodule
