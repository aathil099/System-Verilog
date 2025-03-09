`timescale 1ns/1ps

module four_bit_signed_multiplier_tb;
    
    logic [3:0] A, B;  // 4-bit input operands
    logic [7:0] product; // 8-bit product output

    // Instantiate the DUT 
    four_bit_signed_multiplier dut (
        .A(A),
        .B(B),
        .product(product)
    );

    
    initial begin

        // test cases
		  #10 A = 4'b0011; B = 4'b0010;   //  3 *  2 =  6
        
		  #1  $display("A=%d, B=%d, Expected=%d, Got=%d", A, B, 6, product);
				assert(product == 8'sd6) else $error("Test failed!");
		  
		  #10 A = 4'b1010; B = 4'b0011;   // -6 *  3 = -18
        #10 A = 4'b0111; B = 4'b1110;   //  7 * -2 = -14
        #10 A = 4'b1100; B = 4'b1100;   // -4 * -4 = 16
        #10 A = 4'b0001; B = 4'b1111;   //  1 * -1 = -1
        #10 A = 4'b1111; B = 4'b0001;   // -1 *  1 = -1
        #10 A = 4'b1000; B = 4'b1000;   // -8 * -8 = 64
        #10 A = 4'b0110; B = 4'b0101;   //  6 *  5 = 30
        #10 A = 4'b1110; B = 4'b1110;   // -2 * -2 = 4
        #10 A = 4'b1101; B = 4'b0011;   // -3 * 3 = -9
        #10 A = 4'b0001; B = 4'b0011;  // 1 * 3 = 3
        
        $finish; 
    end
endmodule
