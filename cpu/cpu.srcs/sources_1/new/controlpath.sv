`timescale 1ns / 1ps


module controlpath(
  input logic [5:0] op,funct,
  input logic zeroNzero,
  input logic mem_to_reg,mem_write,pc_src,alu_src,reg_dst,reg_write,jump,
  output logic [2:0] alu_control
    );
    
    logic [1:0]aluop;
    logic branch;
    
    maindec md(.op(op),.mem_to_reg(mam_to_reg),.mem_write(mem_write),.branch(branch),.alu_src(alu_src),.reg_dst(reg_dst),.reg_write(reg_write),.jump(jump),.aluop(aluop));
   aludec ad(.funct(funct),.aluop(aluop),.alu_control(alu_control)); 
   
   assign pc_src = zeroNzero & branch;
   
   always_ff @(pc_src)
     begin
     if(branch == 1'b1)
        $display("pc_src = %b | branch = %b | zeroNzero = %b",pc_src,branch,zeroNzero);
     end
     
endmodule
