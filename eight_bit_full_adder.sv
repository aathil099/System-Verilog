
module eight_bit_full_adder (
    input logic [7:0] A, B,
    input logic Cin,
    output logic [7:0] Sum,
    output logic Cout
);
    logic Carry[8:0];
	 assign Carry[0] = Cin;

    //one_bit_full_adder fa0 (A[0], B[0], Cin, Sum[0], Carry[0]);
    
	 genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : adder_loop
            one_bit_full_adder fa (
				.A (A[i]), 
				.B (B[i]), 
				.Cin (Carry[i]), 
				.Sum (Sum[i]), 
				.Cout (Carry[i+1])
			);
        end
    endgenerate
    assign Cout = Carry[8];
endmodule