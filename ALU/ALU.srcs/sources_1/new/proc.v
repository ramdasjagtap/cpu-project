`timescale 1ns / 1ps

// numbers from 1 to10
module proc(
 input clk,
 input reset,
 output reg [3:0] num
    );
    
    always @(posedge  clk or posedge reset)
     begin
      if(reset)
        begin
            num <= 'd0;
        end
      else begin
          num <= num + 'd1;
      end
     end
endmodule
