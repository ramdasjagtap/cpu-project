`timescale 1ns / 1ps

module imem(
  input logic [5:0] a,
  output logic [31:0] rd
    );
    
    logic [31:0] RAM [15:0];
    
    initial 
        $readmemh("/home/ramdas/Project/cpu/cpu.srcs/sources_1/new/data.txt",RAM);
        
   assign rd = RAM[a];
   
endmodule
