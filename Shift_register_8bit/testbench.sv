module shift_reg_tb;
    logic clk;
    logic rst_n;
    logic shift_enable;
    logic data_in;
    logic [7:0] data_out;

    shift_register_8bit dut (
        .clk(clk),
        .rst_n(rst_n),
        .shift_enable(shift_enable),
        .data_in(data_in),
        .data_out(data_out)
    );

    initial begin
        $dumpfile("dump.vcd");
      $dumpvars(0,shift_reg_tb);
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst_n = 0;
        shift_enable = 0;
        data_in = 0;
        #15 rst_n = 1;
    end

    initial begin
        @(posedge rst_n);
        shift_enable = 1;
        data_in = 1'b1;
        #10;
        data_in = 1'b0;
        #10;
        data_in = 1'b1;
        #10;
        data_in = 1'b1;
        #10;
        data_in = 1'b0;
        #10;
        data_in = 1'b1;
        #10;
        data_in = 1'b0;
        #10;
        data_in = 1'b1;
        #10;
        shift_enable = 0;
        #10;
        $finish;
    end
endmodule
