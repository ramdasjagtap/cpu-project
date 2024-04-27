`timescale 1ns / 1ps

module tb_test();

logic tb_clk,tb_reset;
logic [31:0] tb_write_data,tb_data_addr;
logic tb_mem_write;

top_module DUT(
 .clk(tb_clk),
 .reset(tb_reset),
 .write_data(tb_write_data),
 .data_addr(tb_data_addr),
 .mem_write(tb_mem_write)
);

always #10 tb_clk = ~tb_clk;

initial 
    begin
        tb_clk = 1'b0;
        tb_reset = 1'b1;
        #50;
        tb_reset = 1'b0;
        #1000;
        $finish();
    end

endmodule
