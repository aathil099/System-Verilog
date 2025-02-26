`timescale 1ns / 1ps

module seven_segment_decoder_tb;
    logic [3:0] num;  // Test input
    logic [6:0] seg;  // Output

    // Instantiate the decoder module
    seven_segment_decoder dut (
        .num(num),
        .seg(seg)
    );

    initial begin
        // Apply test cases
        $monitor("Time = %0t | num = %b | seg = %b", $time, num, seg);

        #10 num = 4'd0;
        #10 num = 4'd1; 
        #10 num = 4'd2; 
        #10 num = 4'd3; 
        #10 num = 4'd4; 
        #10 num = 4'd5; 
        #10 num = 4'd6; 
        #10 num = 4'd7; 
        #10 num = 4'd8; 
        #10 num = 4'd9; 
        #10 num = 4'd10;  // Invalid input

        $finish; 
    end
endmodule
