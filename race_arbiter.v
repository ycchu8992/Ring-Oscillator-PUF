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
module Race_Arbiter(finished1, finished2, rst, winner, done);
input rst, finished1, finished2;
output winner;
output done;
    reg next_done, next_winner;

    assign winner = next_winner;
    assign done = next_done;

    always @(*) begin
        next_winner = 0;
        next_done = 0;
        if(rst) begin
            next_done = 0;
        end else begin
            if(finished1) begin
                next_winner = 1;
                next_done = 1;
            end
            else if(finished2) begin
                next_winner = 0;
                next_done = 1;
            end
        end
    end

endmodule