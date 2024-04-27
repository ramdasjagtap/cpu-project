`timescale 1ns / 1ps

// file read
module tb_testing();

reg [7:0] RAM [0:6];
reg [19:0] data [0:3];

initial
            $readmemh("/home/ramdas/Project/ALU/ALU.srcs/sim_1/new/vectors.txt", data);
            
  initial
            $readmemh("/home/ramdas/Project/ALU/ALU.srcs/sim_1/new/hex_data.txt",RAM);
            
 integer i;
  
    initial 
         begin
                     $display("data - 0 : ");
                     for (i=0; i < 4; i=i+1)
                            $display("data[%d] : %h",i,data[i]);          
      end  
      
integer j;
initial 
   begin
                    $display("data - 1 : ");
                    for (j=0; j < 7; j=j+1)
                           $display("RAM[%d] : %h",j,RAM[j]);          
     end  
     
endmodule