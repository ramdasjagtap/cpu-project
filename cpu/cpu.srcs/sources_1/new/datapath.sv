`timescale 1ns / 1ps

// single cycle cpu
module datapath(
  input logic clk, reset,
  input logic mem_to_reg, pc_src, alu_src, reg_dst, reg_write, jump,
  input logic [2:0] alu_control,
  input logic [31:0] instr,
  input logic [31:0] read_data,
  output logic zeroNzero,
  output logic [31:0] pc,
  output logic [31:0] alu_out, write_data
    );
    
    logic [4:0]write_reg;
    logic [31:0] pcnext,pcplus4,pcbranch,pcnextbr;
    logic [31:0] signimm,signimmsh;
    logic [31:0] srca,srcb;
    logic [31:0]result;
    
   // next pc logic
   d_flop #(32) pcreg(.clk(clk),.reset(reset),.d(pcnext),.q(pc));
   adder pcadd1(.a(pc),.b(32'h4),.y(pcplus4));
   left_shift  lS2(.a(signimm),.y(signimmsh)); 
   adder pcadd2(.a(pcplus4),.b(signimmsh),.y(pcbranch));
  mux_2x1 #(32) pcbrmux(.in0(pcplus4),.in1(pcbranch),.s(pc_src),.y(pcnextbr));
  mux_2x1 #(32) pcsmux(.in0(pcnextbr),.in1({pcplus4[31:28],instr[25:0],2'b00}),.s(jump),.y(pcnext));
     
     // register file logic
     regfile rf(.clk(clk),.we3(reg_write),.ra1(instr[25:21]),.ra2(instr[20:16]),.wa3(write_reg),.wd3(result),.rd1(srca),.rd2(write_data));
     mux_2x1 #(5) wrmux(.in0(instr[20:16]),.in1(instr[15:11]),.s(reg_dst),.y(write_reg));
     mux_2x1 #(32) resmux(.in0(alu_out),.in1(read_data),.s(mem_to_reg),.y(result));
     signext se(.a(instr[15:0]),. y(signimm));
     
    // ALU logic
    mux_2x1 #(32) srcbmux(.in0(write_data),.in1(signimm),.s(alu_src),.y(srcb));
    alu ALU(.a(srca),.b(srcb),.alu_control(alu_control),.result(alu_out),.zero(zero),.notzero(notzero));
    
    // BEQ selection
    muxBEQBNE BEQBNE(.BeqBne(instr[27:26]),.zero(zero),.notzero(notzero),.zeroNzero(zeroNzero));
   
endmodule
