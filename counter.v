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
module Counter(clk, rst, counter_in, counter_out);
input [1:0] counter_in;		
input clk, rst;
output reg [1:0] counter_out;    

    integer counter0 = 0;
    integer counter1 = 0;

    integer n = 89; //a predetermined goal.

    always @(posedge clk) begin
        if(counter_in[0]) begin
            counter0 <= counter0 + 1;
        end else counter0 <= counter0;
        
        if(  rst || counter_out[0] || counter_out[1] ) counter0 <=0;
    end

    always @(*) begin
        counter_out[0] = (counter0==n)?1'b1:1'b0;
        counter_out[1] = (counter1==n)?1'b1:1'b0;
    end

    always @(posedge clk) begin
        if(counter_in[1]) begin
            counter1 <= counter1 + 1;
        end else counter1 <= counter1;
        if(  rst || counter_out[0] || counter_out[1] ) counter1 <=0;
    end

    
endmodule

