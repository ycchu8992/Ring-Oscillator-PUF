`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 
// Design Name: 
// Module Name: ring_osc_0, ring_osc_1, ring_osc_2 ...... ring_osc_i (i=15)
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: The ring_osc module is a ring oscillator with 14 inverters that loop
//              back into the Nand Gate effectively making 15 inverters in total.
//              Design 16 ring oscillators with different timing delay.
// 
// Dependencies: You can depend on varying inverters or NAND gates which you design
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module ClockDivider #(
    parameter n = 100
) (
    input clk,
    input rst,
    output wire delay
);
    reg clk_out;
    integer counter = 0;
    always @(posedge clk ) begin
        counter <= counter + 1;
        if(counter >= n-1 || rst) counter <=0;
    end
    
    always @(*) begin
        clk_out = (((n-1)>>1)>=counter)?1'b0:1'b1;
    end

    assign delay = clk_out;

endmodule

module Ring_Oscillator #(parameter n=10)(clk, enable, rst, out);
input clk, enable, rst;
output out;
    reg [12:0] connect;
    reg [12:0] next_connect;

    ClockDivider #(.n(n)) Delay(.clk(clk), .rst(rst), .delay(CLK));

    always @(posedge CLK, posedge rst) begin
        if(rst) begin
            next_connect <= 13'b0101_0101_0100_1;
        end else begin
            next_connect <= connect;
        end       
    end
    
    assign out =  connect[12];

    always @(*) begin
        connect[12:0] = { ~next_connect[11:0], ~(enable & out)};
    end

endmodule