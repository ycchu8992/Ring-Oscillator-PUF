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
module counter(clk, rst, signal, finished);
input signal;		//signal is the output from ring_osc_i
input clk, rst;
output reg finished;    //counts to a predetermined goal you set

***************
**Your Coding**
***************

endmodule

