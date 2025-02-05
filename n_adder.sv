module n_adder #(parameter N = 8) (
    input logic signed [N-1:0] A,B,
    input logic ci,
    output logic signed [N-1:0] S,
    output logic co
);
    logic C [N-1:0]; // Carry bits
    assign C[0] = ci; // First carry bit is the carry-in bit
    
    genvar i;
        for (i = 0; i < N; i = i + 1) begin: adder
            full_adder fa (
                .a   (A[i]),
                .b   (B[i]),
                .ci  (C[i]),
                .co  (C[i+1]),
                .sum (S[i])
            );
        end
endmodule