// Full Adder/Subtractor template
module fas (
    input logic a,           // Input bit a
    input logic b,           // Input bit b
    input logic cin,         // Carry in
    input logic a_ns,        // A_nS (add/not subtract) control
    output logic s,          // Output S
    output logic cout        // Carry out
);

logic g0_res,g1_res,g2_res,g3_res,g5_res;
logic g6_res,g7_res,g8_res,g9_res,g11_res;

XOR2 #(
	.Tpdlh(10),
	.Tpdhl(1)
) g0(
	.A(a),
	.B(b),
	.Z(g0_res)
	);
	

XOR2 #(
	.Tpdlh(10),
	.Tpdhl(1)
) g3(
	.A(a_ns),
	.B(a),
	.Z(g3_res)
	);
	
	
XOR2 #(
	.Tpdlh(10),
	.Tpdhl(1)
) g4(
	.A(g0_res),
	.B(cin),
	.Z(s)
	);
	
OR2 #(
	.Tpdlh(9),
	.Tpdhl(5)
) g1(
	.A(b),
	.B(cin),
	.Z(g1_res)
	);
	
OR2 #(
	.Tpdlh(9),
	.Tpdhl(5)
) g5(
	.A(g2_res),
	.B(g3_res),
	.Z(g5_res)
	);
	
OR2 #(
	.Tpdlh(9),
	.Tpdhl(5)
) g9(
	.A(g6_res),
	.B(g7_res),
	.Z(g9_res)
	);
	
OR2 #(
	.Tpdlh(9),
	.Tpdhl(5)
) g10(
	.A(g8_res),
	.B(g11_res),
	.Z(cout)
	);
	
NOT #(
	.Tpdlh(10),
	.Tpdhl(6)
) g2(
	.A(g1_res),
	.Z(g2_res)
	);
	
	
NOT #(
	.Tpdlh(10),
	.Tpdhl(6)
) g6(
	.A(cin),
	.Z(g6_res)
	);
	
	
NOT #(
	.Tpdlh(10),
	.Tpdhl(6)
) g7(
	.A(b),
	.Z(g7_res)
	);
	
	
NOT #(
	.Tpdlh(10),
	.Tpdhl(6)
) g8(
	.A(g5_res),
	.Z(g8_res)
	);
	
	
NOT #(
	.Tpdlh(10),
	.Tpdhl(6)
) g11(
	.A(g9_res),
	.Z(g11_res)
	);



endmodule
