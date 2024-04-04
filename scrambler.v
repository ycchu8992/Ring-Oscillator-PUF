`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:
// Design Name: 
// Module Name: scrambler
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: scrambler_lfsr builds on top of the existing LFSR module and adds
//             an element on nonlinearity to it making it harder to predict.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module scrambler(input_challenge, clk, rst, output_challenge);
input [7:0] input_challenge;
input clk, rst;
output reg [7:0] output_challenge;

    reg next_bit;
    reg [7:0] challenge;

    always @(posedge clk, posedge rst) begin
        if(rst)begin
            challenge <= input_challenge;
        end else begin
            challenge <= challenge ^ {next_bit, challenge[7:1]};
        end
    end

    always @(*)begin
        next_bit = challenge[0]^challenge[1]^challenge[2]^challenge[3]^challenge[7];
        output_challenge = challenge;
    end
        
endmodule
