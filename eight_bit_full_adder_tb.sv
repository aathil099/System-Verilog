`timescale 1ns / 1ps

module eight_bit_full_adder_tb;
    timeunit 1ns;timeprecision 1ps;

    logic [7:0] A, B;    // 8-bit inputs
    logic Cin;           // Carry input
    logic [7:0] Sum;     // 8-bit sum output
    logic Cout;          // Carry output

    // Instantiate the 8-bit adder
    eight_bit_full_adder dut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
       $display(" A       B       Cin |  Sum      Cout");
       $monitor("%b  %b  %b  |  %b  %b", A, B, Cin, Sum, Cout);

        // Test cases
       #10 A = 8'b00000001; B = 8'b00000000; Cin = 0; 
       #10 A = 8'b00000001; B = 8'b00000001; Cin = 0;
       #10 A = 8'b11111111; B = 8'b00000001; Cin = 0;
       #10 A = 8'b10101010; B = 8'b01010101; Cin = 1; 
       #10 A = 8'b11110000; B = 8'b00001111; Cin = 0; 
       #10 A = 8'b11001100; B = 8'b00110011; Cin = 1; 
       #10 A = 8'b00000000; B = 8'b11111111; Cin = 1; 
       #10 A = 8'b10000000; B = 8'b10000000; Cin = 0; 
       #10 A = 8'b00001111; B = 8'b00001111; Cin = 1; 
       #10 A = 8'b11111111; B = 8'b11111111; Cin = 1; 
		 
		 $finish; 
		 
    end
endmodule
