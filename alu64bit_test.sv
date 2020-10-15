// 64-bit ALU test bench template
module alu64bit_test;

logic [63:0] a;
logic [63:0] b;
logic cin;
logic [1:0] op;
logic [63:0] s;
logic cout;

alu64bit alu(
			.a(a),
			.b(b),
			.cin(cin),
			.op(op),
			.s(s),
			.cout(cout)
			);
			
initial begin
	a={64{1'b0}};
	b={64{1'b0}};
	op={1'b1,1'b1};
	cin=0;
	
	#3000
	
	cin=1;
	


end
endmodule
