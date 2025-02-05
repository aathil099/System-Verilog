module full_adder (
    input  logic a,     // First input bit
    input  logic b,     // Second input bit
    input  logic ci,   // Carry input bit
    output logic sum,     // Sum output
    output logic co   // Carry output
);
    logic wire_1, wire_2;
    assign wire_1 = a ^ b; // Sum calculation: XOR of A and B
    assign wire_2 = wire_1 & ci; // Carry-out calculation: Majority function (at least two 1's)
    
    wire wire_3 = a & b;

    always_comb begin
        
        co = wire_2 | wire_3;
        sum = wire_1 ^ ci;    
    end 
endmodule