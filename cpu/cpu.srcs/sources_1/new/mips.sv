`timescale 1ns / 1ps

module mips(
   input logic clk,reset,
   output logic [31:0] pc,
   input logic [31:0] instr,
   output logic mem_write,
   output logic [31:0] alu_out,write_data,
   input logic [31:0] read_data
    );
    
    logic mem_to_reg,alu_src,reg_dst,reg_write,jump,pc_src,zeroNzero;
    logic [2:0] alu_control;
    
    controlpath CP(
      .op(instr[31:26]),
      .funct(instr[5:0]),
      .zeroNzero(zeroNzero),
      .mem_to_reg(mem_to_reg),
      .mem_write(mem_write),
      .pc_src(pc_src),
      .alu_src(alu_src),
      .reg_dst(reg_dst),
      .reg_write(reg_write),
      .jump(jump),
      .alu_control(alu_control)
    );
    
    datapath DP(
     .clk(clk),
     .reset(reset),
     .mem_to_reg(mem_to_reg),
     .pc_src(pc_src),
     .alu_src(alu_src),
     .reg_dst(reg_dst),
     .reg_write(reg_write),
     .jump(jump),
     .alu_control(alu_control),
     .zeroNzero(zeroNzero),
     .pc(pc),
     .instr(instr),
     .alu_out(alu_out),
     .write_data(write_data),
     .read_data(read_data)
    );
    
endmodule
