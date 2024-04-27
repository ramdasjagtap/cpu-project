`timescale 1ns / 1ps

// register file 
module regfile(
 input logic clk,
 input logic we3,
 input logic  [4:0] ra1,ra2,wa3,
 input logic [31:0] wd3,
 output logic [31:0] rd1,rd2
    );
    
    logic [31:0] rf[31:0];
    
    always_ff @(posedge clk)
      begin
       if(we3)
         begin
             rf[wa3] <= wd3;
             case(wa3)
                5'b10000: $display("content of $s0 = %h", wd3);
                5'b10001: $display("content of $s1 = %h", wd3);
                5'b10010: $display("content of $s2 = %h", wd3);
                5'b10011: $display("content of $s3 = %h", wd3);
                5'b10100: $display("content of $s4 = %h", wd3);
                5'b01000: $display("content of $t0 = %h", wd3);
                5'b01001: $display("content of $t1 = %h", wd3);
             endcase
         end
      end
      
      assign rd1 = (ra1 != 0) ? rf[ra1] : 32'h0;
      assign rd2 = (ra2 != 0) ? rf[ra2] : 32'h0;
 
endmodule
