// 2->1 multiplexer template
module mux2 (
    input logic d0,          // Data input 0
    input logic d1,          // Data input 1
    input logic sel,         // Select input
    output logic z           // Output
);
logic or_result_1,or_result_2;
logic or_result_1_not,or_result_2_not;
logic d0_not,d1_not,sel_not;

NOT #(
	.Tpdlh(10),
	.Tpdhl(6)
	) not_gate1 (
	.A(d0),
	.Z(d0_not)
	);
	
NOT #(
	.Tpdlh(10),
	.Tpdhl(6)
	) not_gate2 (
	.A(d1),
	.Z(d1_not)
	);
	
NOT #(
	.Tpdlh(10),
	.Tpdhl(6)
	) not_gate3 (
	.A(sel),
	.Z(sel_not)
	);
	
NOT #(
	.Tpdlh(10),
	.Tpdhl(6)
	) not_gate4 (
	.A(or_result_1),
	.Z(or_result_1_not)
	);

NOT #(
	.Tpdlh(10),
	.Tpdhl(6)
	) not_gate5 (
	.A(or_result_2),
	.Z(or_result_2_not)
	);
	
OR2 #(
	.Tpdlh(9),
	.Tpdhl(5)
	) or_gate1 (
	.A(d0_not),
	.B(sel),
	.Z(or_result_1)
	);
	
	
OR2 #(
	.Tpdlh(9),
	.Tpdhl(5)
	) or_gate2 (
	.A(d1_not),
	.B(sel_not),
	.Z(or_result_2)
	);
	
OR2 #(
	.Tpdlh(9),
	.Tpdhl(5)
	) or_gate3 (
	.A(or_result_1_not),
	.B(or_result_2_not),
	.Z(z)
	);




endmodule
