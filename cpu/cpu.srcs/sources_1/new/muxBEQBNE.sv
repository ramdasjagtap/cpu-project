`timescale 1ns / 1ps

module muxBEQBNE(
  input logic BeqBne,
  input logic zero,
  input logic notzero,
  output logic zeroNzero
    );
    
    assign zeroNzero = BeqBne ? notzero : zero;
    
endmodule
