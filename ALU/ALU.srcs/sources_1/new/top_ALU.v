`timescale 1ns / 1ps

// Project Name : 32- bit ALU 
module top_ALU(
input [31:0]input1 ,
input [31:0]input2,
input cin,
input [3:0]opcode,
output reg [31:0]result,
output reg overflow,
output reg zero,
output reg sign ,
output reg carry,
output reg[31:0]remainder
    );
    
    // declaring some extra wired registers to store result of the particular operation 
    wire [31:0]adder_op; // register to store result of addition operation 
    wire [31:0]subtraction_op ;  // register to store result of subtraction 
    wire [31:0]division_q,division_r;  // register to store quotient and remainder of division operation 
    wire [31:0]bit_AND;
    wire [31:0]bit_OR;
    wire [31:0]bit_XOR;    
    wire [31:0]l_AND;
    wire [31:0]l_OR;
    wire [31:0]l_XOR;
    wire [31:0]a_r_shift;
    wire [31:0]l_r_shift;
    wire [31:0]l_l_shift;
    wire [2:0] comp;
    wire [31:0]modulo_o;
    wire [31:0]multiplication_op ;
    
    // module instantiation 
    addition ADD1(.a(input1), .b(input2), .cin(cin), .sum(adder_op));   //module for addition 
    subtraction SUB1 (.a(input1), .b(input2), .d(subtraction_op));
    division_unsigned_numbers DIV1 (.dividend(input1), .divisor(input2), .quotient(division_q), .remainder(division_r));
    multiplier MUT(.a(input1), .b(input2), .c(multiplication_op));
    modulo_op mo(.a(input1),.b(input2),.result(modulo_o));
    bitwise_AND BAND(.a(input1), .b(input2), .c(bit_AND));
    bitwise_OR BOR (.a(input1), .b(input2), .c(bit_OR));
    bitwise_xor BXOR (.a(input1), .b(input2), .c(bit_XOR));
    logical_AND l_and(.a(input1), .b(input2), .c(l_AND));
    logical_OR l_or(.a(input1), .b(input2), .c(l_OR));
    logical_XOR l_xor(.a(input1), .b(input2), .c(l_XOR));
    arithmetic_right_shift   a_shift (.operand(input1), .shift_amount(input2), .result(a_r_shift)); 
    logical_r_shift  l_rshift (.a(input1), .b(input2), .result(l_r_shift));
    logical_l_shift l_lshift (.a(input1), .b(input2), .result(l_l_shift)) ;
    comparision cmp(.a(input1), .b(input2), .c(comp));
    
    always @(*)begin 
        begin 
            case(opcode)
            4'd0: result = adder_op;   // addition 
            4'd1: result = subtraction_op;       // subtraction 
            4'd2: result = multiplication_op ;      // multiplication that will show 32 bit result only if it exceeds it'll show overflow 
            4'd3: {result ,remainder} = {division_q ,division_r};       // division 
            4'd4: result = modulo_o ;     //modular division
            4'd5: result = bit_AND;       // performing bitwise AND operation 
            4'd6: result = bit_OR ;       // Performing bitwise OR operation 
            4'd7: result = bit_XOR ;      //performing  bitwise XOR operation 
            4'd8: result = l_AND ;        // performing logical AND operation
            4'd9: result = l_OR ;         // Performing logical  OR operation 
            4'd10: result = l_XOR ;       //performing  logical  XOR operation 
            4'd11: result = a_r_shift;    // performing arithmetic right shift (singed numbers) 
            4'd12: result = l_r_shift ;   // performing logical right shift 
            4'd13: result = l_l_shift ;   // performing logical left shift
            4'd14: result = comp ;        // comparision operators 
            default : result = 'hz;
            endcase
        end 
    end 
    
    always @(*)begin 
        // for overflow flag 
        overflow = ((input1[31]&input2[31]&(~result[31]))||(~input1[31]&(~input2[31])&(result[31]))) ? 1'b1:1'b0;
        // for zero flag 
       zero = (result == 32'h0);
        // for sign flag 
        sign = result[31];
        // for  carry flag 
        carry = (result[31] & ~cin) | (~result[31] & cin);
    end 
    
   endmodule