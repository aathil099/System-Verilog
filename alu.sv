module alu #( parameter WIDTH = 8,
            W_ALU_SEL = 3
            )(
                input logic signed [WIDTH -1:0] bus_a,
                input logic signed [WIDTH-1:0] bus_b,
                output logic signed [WIDTH-1:0] alu_out,
                input logic [W_ALU_SEL-1:0] alu_sel,
                output logic zero, negative
            );

    always_comb
    unique case (alu_sel)
        3'b001: alu_out = bus_a + bus_b;
        3'b010: alu_out = bus_a - bus_b;
        3'b011: alu_out = bus_a * bus_b;
        3'b100: alu_out = bus_a / 2;
        3'b101: alu_out = bus_a ^ bus_b;
        3'b110: alu_out = bus_a << bus_b;
        3'b111: alu_out = bus_a >> bus_b;
        default: alu_out = bus_a;
    endcase
    /* //same as above
    if (alu_sel == 'b001) alu_out = bus_a + bus_b;
    else if (alu_sel == 'b010) alu_out = bus_a - bus_b;
    else if (alu_sel == 'b011) alu_out = bus_a * bus_b;
    else if (alu_sel == 'b100) alu_out = bus_a / 2;
    else if (alu_sel == 'b101) alu_out = bus_a ^ bus_b;
    else if (alu_sel == 'b110) alu_out = bus_a << bus_b;
    else if (alu_sel == 'b111) alu_out = bus_a >> bus_b;
    else alu_out = bus_a;
    */
    assign zero = (alu_out == 0);
    assign negative = (alu_out < 0);
    
endmodule