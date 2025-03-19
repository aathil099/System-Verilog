module counter #(parameter N=8) (
    input logic clk,
    input logic reset,increment,
    output logic [N-1:0] count
);

    always_ff @(posedge clk) begin
        if (reset)
            count <= 0;
        else if (increment)
            count <= count + 1'b1;
    end 


endmodule