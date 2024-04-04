`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 
// Design Name: 
// Module Name: top_PUF
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Serialized PUF scheme. It takes in an 8-bit input, scrambles it giving
//              two random ring oscillators to compare outputting a bit. The bit is
//              stored into a buffer. When this is repeated 7 more times. An 8-bit
//              bus is ready to be read.
// 
// Dependencies: scrambler_lfsr, ring_osc, mux_8to1, counter, race_arbiter, buffer
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
multiplexer_8to1
module top_PUF(clk, en, rst, chall_in, response, ready);
input clk, en, rst;
input[7:0] chall_in;
output[7:0] response;
output ready;
    Multiplexer name_of_chip( 
        .pin_1 (in[0]),
        .pin_2 (in[1]),
        .pin_3 (in[2]),.d (in[3]),.e (in[4]),.f (in[5]),.g (in[6]),.h (in[7]),.sel (sel),.mux_out (mux_out));
***************
**Your Coding**
***************

endmodule
