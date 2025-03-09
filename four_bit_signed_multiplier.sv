module four_bit_signed_multiplier (
    input  logic [3:0] A, B,
    output logic [7:0] product 
);
    logic [7:0] partial_products [3:0];
    logic [7:0] A_extended;
    logic [7:0] shifted_A3;
    logic [7:0] sum1, sum2, sum3;
    logic carry1, carry2, carry3;

    assign A_extended = {{4{A[3]}}, A};
    
    assign partial_products[0] = B[0] ? (A_extended << 0) : 8'b0;
    assign partial_products[1] = B[1] ? (A_extended << 1) : 8'b0;
    assign partial_products[2] = B[2] ? (A_extended << 2) : 8'b0;
    
    assign shifted_A3 = A_extended << 3;
    assign partial_products[3] = B[3] ? (~shifted_A3 + 8'b1) : 8'b0;

    eight_bit_full_adder adder1 (
        .A   (partial_products[0]),
        .B   (partial_products[1]),
        .Cin (1'b0),
        .Sum (sum1),
        .Cout(carry1)
    );

    eight_bit_full_adder adder2 (
        .A   (sum1),
        .B   (partial_products[2]),
        .Cin (1'b0),  
        .Sum (sum2),
        .Cout(carry2)
    );

    eight_bit_full_adder adder3 (
        .A   (sum2),
        .B   (partial_products[3]),
        .Cin (1'b0),  
        .Sum (sum3),
        .Cout(carry3)
    );

    assign product = sum3;
endmodule