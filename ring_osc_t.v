`timescale 1ns / 1ps

`define CYCLE_TIME 20.0

module ring_osc_t ();

    parameter DELAY = 2;

    wire out;
    reg clk = 1'b1;
    reg rst = 1'b0;
    reg enable = 1'b1;

    always #1 clk = ~clk;

    //====================================
    // TODO: Connect your module here. Please connect it by port name but not order
    ring_osc_i ring_osc(.clk(clk), .enable(enable), .rst(rst), .out(out));
    //====================================

    integer i, error_count;
    initial begin

        $display("===== Simulation ======");

        error_count = 0;
        #DELAY;

        rst = 1'b1;

        #DELAY;

        rst = 1'b0;

        for(i = 0 ; i < 50 ; i = i + 1) begin
            #DELAY;
             $display("out = %b", out);
        end

        $finish;
    end

endmodule
