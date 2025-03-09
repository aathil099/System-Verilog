module four_bit_unsigned_multiplier (
    input  logic [3:0] A, B,  
    output logic [7:0] product 
);
    logic [7:0] partial_products [3:0]; // 8 bit Partial products 
    logic [7:0] sum1, sum2, sum3;  // Intermediate sum results
    logic carry1, carry2, carry3;  // Carry outputs

    // partial products using AND operation and zero padding
    assign partial_products[0] = {4'b0000, (A & {4{B[0]}})			};
    
	 assign partial_products[1] = {3'b000,  (A & {4{B[1]}}), 1'b0	};
    
	 assign partial_products[2] = {2'b00,   (A & {4{B[2]}}), 2'b00	};
    
	 assign partial_products[3] = {1'b0,    (A & {4{B[3]}}), 3'b000};

    // Add partial products using 8-bit full adders
    eight_bit_full_adder adder1 (
        .A		(partial_products[0]),
        .B		(partial_products[1]),
        .Cin	(1'b0),
        .Sum	(sum1),
        .Cout	(carry1)
    );

    eight_bit_full_adder adder2 (
        .A		(sum1),
        .B		(partial_products[2]),
        .Cin	(carry1),
        .Sum	(sum2),
        .Cout	(carry2)
    );

    eight_bit_full_adder adder3 (
        .A		(sum2),
        .B		(partial_products[3]),
        .Cin	(carry2),
        .Sum	(sum3),
        .Cout	(carry3)
    );

    // final product of sum
    assign product = sum3;

endmodule
