`timescale 1ns/1ps
module P2S_tb;

    logic clk = 0, rstn = 0;
    localparam CLK_PERIOD = 10;

    initial forever
        #(CLK_PERIOD/2) clk = ~clk;  // Clock generation (50 MHz)

    parameter N = 4;
    logic [N-1:0] par_data;
    logic par_valid = 0, par_ready, ser_data, ser_valid, ser_ready = 1;

    // Instantiate the design
    parallel_to_serial_converter #(.N(N)) dut(.*);

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, dut);

        // Reset sequence
        @(posedge clk); #1 rstn <= 0;
        @(posedge clk); #1 rstn <= 1;
        
        // Test Case 1: Load 1011 (Binary 11)
        @(posedge clk) #1 par_data <= 4'b1011; par_valid <= 1;
        @(posedge clk) #1 par_valid <= 0;
        #(CLK_PERIOD*5);

        // Test Case 2: Load 1101 (Binary 13)
        @(posedge clk) #1 par_data <= 4'b1101; par_valid <= 1;
        @(posedge clk) #1 par_valid <= 0;
        #(CLK_PERIOD*5);

        // Test Case 3: Load 0110 (Binary 6)
        @(posedge clk) #1 par_data <= 4'b0110; par_valid <= 1;
        @(posedge clk) #1 par_valid <= 0;
        #(CLK_PERIOD*5);

        // End simulation
        $finish;
    end
endmodule
