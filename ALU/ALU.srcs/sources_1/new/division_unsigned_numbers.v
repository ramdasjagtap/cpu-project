`timescale 1ns / 1ps
// Design Name: Restoring Division for 32-bit unsigned numbers 
// Module Name: division_unsigned_numbers
// Project Name: 32 bit ALU 



module unsigned_division #( 
parameter WIDTH = 32
)(
input [WIDTH-1 : 0] divisor, q ,
input [WIDTH : 0] a,       //acc 
output reg [WIDTH : 0] a_out,
output reg [WIDTH-1 : 0] q_out 

    );
 reg [WIDTH : 0] shift_a, shifted_a,a_sub;    
 reg [WIDTH-1 : 0] shift_q , shifted_q;        

always @(*)
if (divisor != 0)
begin	

//left shift operation 
    shift_a = (a << 1) | q[WIDTH - 1];
    shifted_a = shift_a;   //extra register to store shifted value of a 
    shift_q  = q << 1; // q[0] <--0
    shifted_q = shift_q ;         //register to store content of shifted q 
    
    // a= a-m
    a_sub = shift_a - divisor; 
    
    
    //conditions to check msb of a 
    if( a_sub[WIDTH] ) 
    begin
    	a_out = shifted_a; //restoring value
    	q_out  = shift_q | 0; //a[0] <- 0
    end
    else
    begin
        a_out = a_sub; //subtracted value 
    	q_out = shifted_q | 1'b1; // q[0] <- 1
    end
end 
else
begin                   
    a_out = 'h0; 
	q_out = 'h0;
end                      
endmodule




// Design Name: Restoring Division for 32-bit unsigned numbers 
// Module Name: top_division
// Project Name: 


module division_unsigned_numbers #( 
parameter WIDTH = 32
)( 
input [WIDTH-1 : 0] dividend, 
input [WIDTH-1 : 0] divisor, 
output reg [WIDTH-1 : 0] quotient, 
output reg [WIDTH-1 : 0] remainder 
    ); 
  
wire [WIDTH : 0] a_next [WIDTH -1 : 0];   
wire [WIDTH-1 : 0] q_next [WIDTH -1 : 0] ; 

genvar i;
//initial loop block
unsigned_division #(.WIDTH(WIDTH)) DUT (.divisor (divisor),.q(dividend),.a(0),  .a_out (a_next[0]),.q_out  (q_next[0]));
//other loop block
generate for(i = 1; i <(WIDTH); i = i +1)
begin:restoring
    	unsigned_division #(.WIDTH(WIDTH)) inst_loop_logic (
			.divisor (divisor),.q (q_next[i-1]),.a(a_next[i-1]),.a_out  (a_next[i]),.q_out  (q_next[i]));
end
endgenerate

//output logic
always @(*)
	begin
		
			quotient = q_next[WIDTH -1];
			remainder = a_next[WIDTH -1];
		
	end

endmodule 

