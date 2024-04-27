`timescale 1ns / 1ps

module maindec(
  input logic [5:0] op,
  output logic mem_to_reg,mem_write, branch,alu_src,reg_dst,reg_write,jump,
  output logic [1:0] aluop
    );
    
    logic [8:0] controls;
    
    assign {reg_write,reg_dst,alu_src,branch,mem_write,mem_to_reg,jump,aluop} = controls;
   
    always_comb
      begin
         case(op)
          6'b000000: controls = 9'b110000010;           // R-Type
          6'b100011: controls = 9'b101001000;           // LW
          6'b101011: controls = 9'b001010000;           // SW
          6'b000100:  begin
                                controls = 9'b000100001;
                                $display("BEQ");
          end
          6'b000101: begin
                                controls = 9'b000100001;
                                  $display("BNE");
          end
          6'b001000: controls = 9'b101000000;          // ADDI
          6'b000010: controls = 9'b000000100;           // JUMP
          default: controls = 9'bxxxxxxxxx;
         endcase
      end
endmodule
