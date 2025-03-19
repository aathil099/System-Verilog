module parallel_to_serial_converter #(N=8)(
    input logic clk,rstn, ser_ready, par_valid,
    input logic [N-1:0] par_data,
    output logic par_ready, ser_data, ser_valid
);
    localparam N_BITS = $clog2(N);
    enum logic {RX=0, TX=1} state, next_state;
    logic [N_BITS-1:0] count;
    logic [N-1:0] shift_reg;

    always_comb unique case (state)
        RX: next_state = par_valid ? TX : RX;
        TX: next_state = ser_ready && count == N-1 ? RX : TX;
    endcase
    always_ff @(posedge clk or negedge rstn)
        state <= !rstn ? RX : next_state;
    
    assign ser_data = shift_reg[0];
    assign ser_valid = (state == TX);
    assign par_ready = (state == RX);

    always_ff @(posedge clk or negedge rstn)
      if (!rstn) count <= 0;
      else unique case (state)
      RX: begin 
        shift_reg <= par_data;
        count <= '0;
      end
      TX: if (ser_ready) begin
        shift_reg <= shift_reg >> 1;
        count <= count + 1'd1;
      end
      endcase
endmodule