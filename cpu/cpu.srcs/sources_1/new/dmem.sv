`timescale 1ns / 1ps


module dmem(
  input logic clk,
  input logic we,
  input logic [31:0] a,wd,
  output logic [31:0] rd
      );
      
      logic [31:0] RAM [15:0];
      
      assign rd = RAM[a[31:2]];
      
      always_ff @(posedge clk)
       begin
         if(we)
           begin
             RAM[a[31:2]] <= wd;
              $display("address = %h | data = %h",a[31:0],wd);
           end
       end
endmodule
