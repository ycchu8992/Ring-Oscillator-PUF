`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 
// Design Name: 
// Module Name: race_arbiter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: The race_arbiter determines which signal finished first. If
//              finished1 is asserted first, then the output is 1. If finished2 is asserted
//              first, then output is 0. 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module race_arbiter(finished1, finished2, rst, winner, done);
input rst, finished1, finished2;
output winner;
output done;

***************
**Your Coding**
***************

endmodule