`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 
// Design Name: 
// Module Name: counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: The counter module counts to a predetermined goal and
//              once reached, drives the finished signal to 1. The finished signal is 0 all
//              other times (even after the cycle after reaching the goal).
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module Counter(clk, rst, signal, finished);
input signal;		
input clk, rst;
output reg finished;    

    integer counter = 0;

    integer num = 89; //a predetermined goal.

    always @(posedge clk) begin
        if(signal) counter <= counter + 1;
        else if(rst) counter <= 0;
        else counter <= counter;
    end
    
    always @(posedge clk) begin
        finished <= (num==counter)?1'b1:1'b0;
    end

endmodule

