`include "one_bit_full_adder.sv" 

module one_bit_full_adder_tb;
  
  logic A=0, Cin=0, B, Sum, Cout;
  
  one_bit_full_adder dut(.*);
  
  initial begin
    
    #30 A <= 0; B <= 0; Cin <= 0;
    #10 A <= 0; B <= 0; Cin <= 1;
    #10 A <= 0; B <= 1; Cin <= 0;
    #10 A <= 0; B <= 1; Cin <= 1;
	#10 A <= 1; B <= 0; Cin <= 0;
    #10 A <= 1; B <= 0; Cin <= 1;
    #10 A <= 1; B <= 1; Cin <= 0;
    #10 A <= 1; B <= 1; Cin <= 1;
    
  end
endmodule  