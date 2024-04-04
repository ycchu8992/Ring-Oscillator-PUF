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
module Ring_Oscillator(clk, enable, rst, out);
input clk, enable, rst;
output out;
    reg [12:0] connect;
    reg [12:0] next_connect;

    always @(posedge clk) begin
        if(rst) begin
            next_connect <= 13'b1010_1010_1010_1;
        end else begin
            next_connect <= connect;
        end       
    end
    
    assign out =  connect[12];

    always @(*) begin
        connect[12:0] = { ~next_connect[11:0], ~(enable & out)};
    end

endmodule