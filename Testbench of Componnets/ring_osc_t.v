`timescale 1ns / 1ps

`define CYCLE_TIME 20.0

module ring_osc_t ();

    parameter DELAY = 2;

    reg [2:0] sel;
    wire mux_out, out_0, out_1, out_2, out_3, out_4, out_5, out_6, out_7;
    reg clk = 1'b1;
    
    reg [7:0] rst = 8'b0;
    reg enable = 1'b1;

    always #1 clk = ~clk;

    //====================================
    // TODO: Connect your module here. Please connect it by port name but not order
    Ring_Oscillator #(.n(9)) ro_0 (.clk(clk), .enable(enable), .rst(rst[0]), .out(out_0));
    Ring_Oscillator #(.n(2)) ro_1 (.clk(clk), .enable(enable), .rst(rst[1]), .out(out_1));
    Ring_Oscillator #(.n(3)) ro_2 (.clk(clk), .enable(enable), .rst(rst[2]), .out(out_2));
    Ring_Oscillator #(.n(4)) ro_3 (.clk(clk), .enable(enable), .rst(rst[3]), .out(out_3));
    Ring_Oscillator #(.n(5)) ro_4 (.clk(clk), .enable(enable), .rst(rst[4]), .out(out_4));
    Ring_Oscillator #(.n(6)) ro_5 (.clk(clk), .enable(enable), .rst(rst[5]), .out(out_5));
    Ring_Oscillator #(.n(7)) ro_6 (.clk(clk), .enable(enable), .rst(rst[6]), .out(out_6));
    Ring_Oscillator #(.n(8)) ro_7 (.clk(clk), .enable(enable), .rst(rst[7]), .out(out_7));
    //====================================


    integer i, j,  error_count;
    initial begin

        $display("===== Simulation ======");

        error_count = 0;

        #DELAY;
        rst = 8'b1111_1111;

        #DELAY;
        rst = 8'b0;

        #DELAY;

        for(j = 0 ; j < 8 ; j = j + 1) begin
            #DELAY;
            for(i = 0 ; i < 8 ; i = i + 1) begin
            
                sel = i[2:0];

                #DELAY;

                if(mux_out !== 1'b1) begin

                    $display("[ERROR] sel = %b,  mux_out = %b, correct mux_out should be %b",
                    sel, mux_out, 1'b1);
                    error_count = error_count + 1;
                end
                else begin
                    $display("[CORRECT] sel = %b,  mux_out = %b", sel, mux_out);
                end
            end
        end

        if(error_count === 0)
            $display("All Correct!!");
        else    
            $display("There are %d errors QQ", error_count);

        $finish;
    end
   
endmodule
