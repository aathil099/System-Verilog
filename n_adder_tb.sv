module n_adder_tb ;
    timeunit 1ns; timeprecision 1ps;

    localparam N = 8;
    
    logic signed [N-1:0] A, B, S;
    logic ci, co;
    
    n_adder #(.N(N)) dut(.*); // Instantiate the DUT
    
    initial begin
        $dumpfile("dump.vcd"); 
        $dumpvars(0,dut);
        
        A <= 8'd5; B <= 8'd10; ci <= 0; // A = 5, B = 10, ci = 0
        #1 assert (S == 8'd15) else $error("Incorrect");

        #10 A <= 8'd30; B <= -8'd10; ci <= 0;
        #10 A <= 8'd5; B <= 8'd10; ci <= 1;
        #10 A <= 8'd127; B <= 8'd1; ci <= 0;
        
        repeat (10) begin
            #9
            std::randomize(ci);
            std::randomize(A) with { A inside {[-128:127]};};
            std::randomize(B) with { B inside {[-128:127]};};
            #1 
            assert ({co,S} == A+B+ci) 
                else $error("Incorrect. A:%d + B:%d + ci:%d != {S:%d, co:%d}", A, B, ci, S, co);
        end
    end
endmodule 