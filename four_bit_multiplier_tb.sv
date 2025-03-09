`timescale 1ns / 1ps
module four_bit_multiplier_tb;
    
    logic [3:0] A, B;  // 4-bit input operands
    logic [7:0] product; // 8-bit product output

    // Instantiate the DUT 
    four_bit_unsigned_multiplier dut (
        .A(A),
        .B(B),
        .product(product)
    );

    // Test Procedure
    initial begin
        // Display Header
        $display("Time |  A  |  B  | Product ");

        // test cases
        #10 A = 4'b0001; B = 4'b0011;  // 1 * 3 = 3
        
		  #1  assert(product == 8'd3) else $error("Test failed: %d * %d != %d", A, B, product);

        #10 A = 4'b0101; B = 4'b0011;   // 5 * 3 = 15
        
        #10 A = 4'b0110; B = 4'b0010;   // 6 * 2 = 12
        
        #10 A = 4'b1001; B = 4'b0101;   // 9 * 5 = 45
        
        #10 A = 4'b1010; B = 4'b0110;   // 10 * 6 = 60
        
        #10 A = 4'b1100; B = 4'b0011;   // 12 * 3 = 36
        
        #10 A = 4'b1111; B = 4'b1111;   // 15 * 15 = 225

        #10 A = 4'b0111; B = 4'b0111;   // 7 * 7 = 49
        
        #10 A = 4'b1000; B = 4'b0001;   // 8 * 1 = 8
        
        #10 A = 4'b0000; B = 4'b1101;   // 0 * 13 = 0
        
        $finish; 
    end
endmodule
