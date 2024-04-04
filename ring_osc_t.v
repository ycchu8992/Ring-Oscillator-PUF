`timescale 1ns / 1ps

`define CYCLE_TIME 20.0

module ring_osc_t ();

    parameter DELAY = 2;

    wire out_0, out_1, out_2, out_3, out_4, out_5, out_6, out_7;
    reg clk = 1'b1;
    reg [7:0] rst = 8'b0;
    reg enable = 1'b1;

    always #1 clk = ~clk;

    //====================================
    // TODO: Connect your module here. Please connect it by port name but not order
    Ring_Oscillator ro_0(.clk(clk), .enable(enable), .rst(rst[0]), .out(out_0));
    Ring_Oscillator ro_1(.clk(clk), .enable(enable), .rst(rst[1]), .out(out_1));
    Ring_Oscillator ro_2(.clk(clk), .enable(enable), .rst(rst[2]), .out(out_2));
    Ring_Oscillator ro_3(.clk(clk), .enable(enable), .rst(rst[3]), .out(out_3));
    Ring_Oscillator ro_4(.clk(clk), .enable(enable), .rst(rst[4]), .out(out_4));
    Ring_Oscillator ro_5(.clk(clk), .enable(enable), .rst(rst[5]), .out(out_5));
    Ring_Oscillator ro_6(.clk(clk), .enable(enable), .rst(rst[6]), .out(out_6));
    Ring_Oscillator ro_7(.clk(clk), .enable(enable), .rst(rst[7]), .out(out_7));
    //====================================

    integer i;
    initial begin

        $display("===== Simulation ======");

        #DELAY;
        rst = 8'b1000_0000;

        #DELAY;
        rst = rst >> 1;

        for(i = 0 ; i < 50 ; i = i + 1) begin
            #DELAY;
            rst = rst >> 1;
        end

        $finish;
    end

endmodule
