module counter_tb;

    `timescale 1ns/1ps;
    localparam N = 8;
    logic clk, reset, increment;
    logic [N-1:0] count;
    
    counter #(.N(N)) dut(.*);

    localparam CLK_PERIOD = 10;
    initial forever
        #(CLK_PERIOD/2) clk = ~clk;
    
    initial begin
        $dumpfile("dump.vcd"); 
        $dumpvars(0,dut);
        
        #(CLK_PERIOD*2)
        @(posedge clk);
        #1
        reset <= 0;
        increment = 1;
        repeat(10) @(posedge clk);
        #1
        reset <= 1;
        $finish();
    end   
endmodule

