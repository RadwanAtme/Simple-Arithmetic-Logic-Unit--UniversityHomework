// 1-bit ALU template
module alu1bit (
    input logic a,           // Input bit a
    input logic b,           // Input bit b
    input logic cin,         // Carry in
    input logic [1:0] op,    // Operation
    output logic s,          // Output S
    output logic cout        // Carry out
);

logic or_result,d0,d1,d2,d3,op_not;
logic FA_result;

NOT #(
	.Tpdlh(10),
	.Tpdhl(6)
	) not2(
	.A(op[0]),
	.Z(op_not)
	);
	
fas FA(
	.a(a),
	.b(b),
	.cin(cin),
	.a_ns(op_not),
	.s(FA_result),
	.cout(cout)
	);

OR2 #(
	.Tpdlh(9),
	.Tpdhl(5)
) or1(
	.A(a),
	.B(b),
	.Z(or_result)
	);
	
NOT #(
	.Tpdlh(10),
	.Tpdhl(6)
	) not1(
	.A(or_result),
	.Z(d0)
	);

XOR2 #(
	.Tpdlh(10),
	.Tpdhl(1)
)  xor1(
	.A(a),
	.B(b),
	.Z(d1)
	);
	
mux4 mux(
	.d0(d0),
	.d1(d1),
	.d2(FA_result),
	.d3(FA_result),
	.sel(op),
	.z(s)
	);

endmodule
