// 64-bit ALU template
module alu64bit (
    input logic [63:0] a,    // Input bit a
    input logic [63:0] b,    // Input bit b
    input logic cin,         // Carry in
    input logic [1:0] op,    // Operation
    output logic [63:0] s,   // Output S
    output logic cout        // Carry out
);
logic [63:0] carry_in;
assign carry_in[0]=cin;
genvar i;
generate
	for(i=0;i<64;i++)
	begin
		if(i==63) begin
		alu1bit alu(.a(a[i]), .b(b[i]) ,
					.cin(carry_in[i]),.op(op),.s(s[i]),.cout(cout));
		end
		else begin
		alu1bit alu(.a(a[i]), .b(b[i]) ,
					.cin(carry_in[i]),.op(op),.s(s[i]),.cout(carry_in[i+1]));
		end
		
	end

endgenerate

endmodule
