`timescale 1ns / 1ps

module left_shift(
  input logic [31:0] a,
  output logic [31:0] y
    );
    
    // left shift by 2
    // multiply by 4
    assign y = {a[29:0], 2'b00};
    
endmodule
