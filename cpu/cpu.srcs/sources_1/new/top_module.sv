`timescale 1ns / 1ps

module top_module(
  input logic clk,reset,
  output logic [31:0] write_data,data_addr,
  output logic mem_write
    );
    
    logic [31:0] pc,instr,read_data;
    
    //MIPS processor
    mips MIPS(
     .clk(clk),
     .reset(reset),
     .pc(pc),
     .instr(instr),
     .mem_write(mem_write),
     .alu_out(data_addr),
     .write_data(write_data),
     .read_data(read_data)
    );
    
   // instruction memory
    imem IMEM(
     .a(pc[7:2]),
     .rd(instr)
    );
    
    // data memory
    dmem DMEM(
      .clk(clk),
      .we(mem_write),
      .a(data_addr),
      .wd(write_data),
      .rd(read_data)
    );
    
endmodule
