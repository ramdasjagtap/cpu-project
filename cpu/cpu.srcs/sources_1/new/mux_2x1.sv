`timescale 1ns / 1ps

module mux_2x1 #(parameter WIDTH = 32)(
  input logic [WIDTH-1:0]in0,in1,
  input logic s,
  output logic [WIDTH-1:0]y
    );
    
    assign y = s ? in1: in0;
    
endmodule
