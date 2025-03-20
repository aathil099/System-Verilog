module parallel_to_serial_converter #(parameter N = 4)(
    input logic clk, rstn, ser_ready, par_valid,
    input logic [N-1:0] par_data,
    output logic par_ready, ser_data, ser_valid
);

    localparam N_BITS = $clog2(N);
    enum logic {RX=0, TX=1} state, next_state;
    logic [N_BITS-1:0] count;
    logic [N-1:0] shift_reg;

    
    always_comb unique case (state) // Next state logic..
        RX: next_state = par_valid ? TX : RX;
        TX: next_state = ser_ready && count == N-1 ? RX : TX;
    endcase

    
    always_ff @(posedge clk or negedge rstn) // State transition from here
        state <= !rstn ? RX : next_state;
    
    // Assign outputs
    assign ser_data = shift_reg[0];      // Sending,, LSB first
    assign ser_valid = (state == TX);    // Active only during trans
    assign par_ready = (state == RX);    // Ready when receiving

    // Shift register operation
    always_ff @(posedge clk or negedge rstn) begin
        if (!rstn) count <= 0;
        else unique case (state)
            RX: begin 
                shift_reg <= par_data;  // Loading parallel data
                count <= '0;
            end
            TX: if (ser_ready) begin
                shift_reg <= shift_reg >> 1;  // Shift right...>>1
            end
        endcase
    end
endmodule
