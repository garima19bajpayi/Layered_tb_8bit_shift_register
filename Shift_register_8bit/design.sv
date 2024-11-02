module shift_register_8bit (
    input  logic        clk,
    input  logic        rst_n,
    input  logic        shift_enable,
    input  logic        data_in,
    output logic [7:0]  data_out
);
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            data_out <= 8'b0;
        else if (shift_enable)
            data_out <= {data_out[6:0], data_in};
    end
endmodule
