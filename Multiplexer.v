`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 
// Design Name: 
// Module Name: MUX_8to1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: The MUX_8to1 is a multiplexer that selects between 8 inputs
//               and passes through only one. It follows that the select line
//               is a 4-bit bus.
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module Multiplexer( pin_0, pin_1, pin_2, pin_3, pin_4, pin_5, pin_6, pin_7, scr_out, mux_out );
input pin_0, pin_1, pin_2, pin_3, pin_4, pin_5, pin_6, pin_7;
input [2:0] scr_out;	//from the output of scrambler
output reg mux_out;
    always @(*) begin
        case (scr_out)
            3'b000: mux_out = pin_0; 
            3'b001: mux_out = pin_1; 
            3'b010: mux_out = pin_2; 
            3'b011: mux_out = pin_3; 
            3'b100: mux_out = pin_4; 
            3'b101: mux_out = pin_5; 
            3'b110: mux_out = pin_6; 
            3'b111: mux_out = pin_7; 
            default: mux_out = pin_0; 
        endcase
    end

endmodule
