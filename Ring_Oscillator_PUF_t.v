`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 
// Design Name: 
// Module Name: Ring_Oscillator_PUF_t
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`define CYCLE_TIME 20.0

module Ring_Oscillator_PUF_t();

    parameter DELAY = 2;

    reg clk = 1'b1, rst = 1'b0, en = 1'b1;
    wire [7:0] response;
    wire ready;
    always #1 clk = ~clk;
    reg [7:0] in = 8'b1101_0100;


    //====================================
    // TODO: Connect your module here. Please connect it by port name but not order
    Ring_Oscillator_PUF  chip(.clk(clk), .en(en), .rst(rst), .chall_in(in), .response(response), .ready(ready));
    //====================================

    integer i;

    initial begin

        $display("===== Simulation ======");

        #DELAY;
        rst = 1'b1;
        #DELAY;
        rst = 1'b0;
        
        for(i = 0 ; i < 2**8 ; i = i) begin
            #DELAY;
            in = i[7:0];
            if(ready)begin
                $display("challenge = %b, response = %b", in, response);
                i=i+1;
            end
        end

        $finish;
    end
endmodule
