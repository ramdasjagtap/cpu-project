`timescale 1ns / 1ps

module alu(
  input logic [31:0]a,b,
  input logic [2:0] alu_control,
  output logic  [31:0] result,
  output logic zero,notzero
    );
    
    logic [31:0] sum;
    logic [31:0] condinvb;
    
    // complement
    assign condinvb = alu_control[2] ? ~b : b;
    assign sum = a + condinvb + alu_control[2];
    
    
    always_comb 
       begin
          case(alu_control[1:0])
          2'b00: result = a & b;
          2'b01: result = a | b;
          2'b10: result = sum;
          2'b11: result = sum[31];
          endcase
       end
       
       assign zero = (result == 32'h0);
       assign notzero = (result != 32'h0);

endmodule
