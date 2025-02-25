module one_bit_full_adder (
    input  logic A,     // First input bit
    input  logic B,     // Second input bit
    input  logic Cin,   // Carry input bit
    output logic Sum,     // Sum output
    output logic Cout );  // Carry output

    logic wire_1, wire_2, wire_3;
    
	     assign wire_1 = A ^ B; // Sum calculation XOR of A and B
        assign wire_2 = wire_1 & Cin; // Carry-out calculation
        assign wire_3 = A & B; // Carry-in calculation AND of A and B

    always_comb begin
        Cout = wire_2 | wire_3;
        Sum = wire_1 ^ Cin;    
    end
endmodule
	 