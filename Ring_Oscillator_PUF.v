`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 
// Design Name: 
// Module Name: Ring_Oscillator_PUF
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
module Ring_Oscillator_PUF #(
    parameter n0 = 9,
    parameter n1 = 2,
    parameter n2 = 3,
    parameter n3 = 4,
    parameter n4 = 5,
    parameter n5 = 6,
    parameter n6 = 7,
    parameter n7 = 2,
    parameter n8 = 6,
    parameter n9 = 2,
    parameter n10 = 5,
    parameter n11 = 4,
    parameter n12 = 3,
    parameter n13 = 6,
    parameter n14 = 2,
    parameter n15 = 8
) (
    clk, en, rst, chall_in, response, ready
);
input clk, en, rst;
input[7:0] chall_in;
output[7:0] response;
output ready;

    wire [15:0] out;
    wire [7:0] scr_out;
    wire [1:0] counter_in;
    wire [1:0] counter_out;
    wire winner;
    wire done;

    wire counter_rst;	//reset counter while generating response
    wire scrambler_rst;	//reset scrambler while generating response 
    wire arbiter_rst;	//reset arbiter while generating response

    reg reset_counter;	//reset counter while generating response
    reg reset_scrambler;	//reset scrambler while generating response 
    reg reset_arbiter;	//reset arbiter while generating response 

    assign ready = ready_to_read;

    assign counter_rst = ready_to_read || rst;
    assign scrambler_rst = reset_scrambler;
    assign arbiter_rst = reset_arbiter;
    assign oscillator_rst = ready_to_read || rst;

    always @(posedge clk) begin
        reset_scrambler <= ready_to_read || rst;
        reset_arbiter <= ready_to_read || rst;
    end

    Ring_Oscillator #(.n(n0)) ro_0 (.clk(clk), .enable(en), .rst(oscillator_rst), .out(out[0]));
    Ring_Oscillator #(.n(n1)) ro_1 (.clk(clk), .enable(en), .rst(oscillator_rst), .out(out[1]));
    Ring_Oscillator #(.n(n2)) ro_2 (.clk(clk), .enable(en), .rst(oscillator_rst), .out(out[2]));
    Ring_Oscillator #(.n(n3)) ro_3 (.clk(clk), .enable(en), .rst(oscillator_rst), .out(out[3]));
    Ring_Oscillator #(.n(n4)) ro_4 (.clk(clk), .enable(en), .rst(oscillator_rst), .out(out[4]));
    Ring_Oscillator #(.n(n5)) ro_5 (.clk(clk), .enable(en), .rst(oscillator_rst), .out(out[5]));
    Ring_Oscillator #(.n(n6)) ro_6 (.clk(clk), .enable(en), .rst(oscillator_rst), .out(out[6]));
    Ring_Oscillator #(.n(n7)) ro_7 (.clk(clk), .enable(en), .rst(oscillator_rst), .out(out[7]));

    Ring_Oscillator #(.n(n8)) ro_8 (.clk(clk), .enable(en), .rst(oscillator_rst), .out(out[8]));
    Ring_Oscillator #(.n(n9)) ro_9 (.clk(clk), .enable(en), .rst(oscillator_rst), .out(out[9]));
    Ring_Oscillator #(.n(n10)) ro_10 (.clk(clk), .enable(en), .rst(oscillator_rst), .out(out[10]));
    Ring_Oscillator #(.n(n11)) ro_11 (.clk(clk), .enable(en), .rst(oscillator_rst), .out(out[11]));
    Ring_Oscillator #(.n(n12)) ro_12 (.clk(clk), .enable(en), .rst(oscillator_rst), .out(out[12]));
    Ring_Oscillator #(.n(n13)) ro_13 (.clk(clk), .enable(en), .rst(oscillator_rst), .out(out[13]));
    Ring_Oscillator #(.n(n14)) ro_14 (.clk(clk), .enable(en), .rst(oscillator_rst), .out(out[14]));
    Ring_Oscillator #(.n(n15)) ro_15 (.clk(clk), .enable(en), .rst(oscillator_rst), .out(out[15]));


    Scrambler scrambler_lfsr(.input_challenge(chall_in), .clk(clk), .rst(scrambler_rst), .output_challenge(scr_out));

    Multiplexer lsb_scr_o( 
        .pin_0 (out[0]), .pin_1 (out[1]), .pin_2 (out[2]), .pin_3 (out[3]),
        .pin_4 (out[4]), .pin_5 (out[5]), .pin_6 (out[6]), .pin_7 (out[7]),
        .scr_out (scr_out[2:0]), .mux_out (counter_in[0])
    );

    Multiplexer msb_scr_o( 
        .pin_0 (out[8]), .pin_1 (out[9]), .pin_2 (out[10]), .pin_3 (out[11]),
        .pin_4 (out[12]), .pin_5 (out[13]), .pin_6 (out[14]), .pin_7 (out[15]),
        .scr_out (scr_out[7:5]), .mux_out (counter_in[1])
    );

    Counter counter (.clk(clk), .rst(counter_rst), .counter_in(counter_in), .counter_out(counter_out));

    Race_Arbiter race_arbiter(.finished1(counter_out[1]), .finished2(counter_out[0]), .rst(arbiter_rst), .winner(winner), .done(done));

    Buffer buffer (.clk(clk), .rst(rst), .winner(winner), .done(done), .response(response), .ready_to_read(ready_to_read));

endmodule
