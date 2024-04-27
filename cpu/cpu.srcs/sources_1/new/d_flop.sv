`timescale 1ns / 1ps

module d_flop #(parameter WIDTH = 32) (
    input logic clk, reset,
    input logic [WIDTH-1:0] d,
    output logic  [WIDTH-1:0] q
    );
    
    always_ff @(posedge clk or posedge reset)
     begin
       if(reset)
         q <= 'h0;
      else
         q <= d;
     end
     
endmodule
