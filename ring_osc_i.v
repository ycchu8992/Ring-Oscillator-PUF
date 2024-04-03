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

module inverter_with_delay(in, out);
input wire in;
output wire out;

    reg temp;

    assign out = temp;

   always @(*) begin
        temp = ~in;
    end
    
endmodule
module ring_osc_i(clk, enable, rst, out);
input clk, enable, rst;
output out;

    wire i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13;
    reg next_i1, next_i2, next_i3, next_i4, next_i5, next_i6, next_i7;
    reg next_i8, next_i9, next_i10, next_i11, next_i12, next_i13;
    reg next_out;

    always @(posedge clk) begin
        if(rst) begin
            next_out <= 1'b0;
            next_i1 <= 1'b0;
            next_i2 <= 1'b0;
            next_i3 <= 1'b0;
            next_i4 <= 1'b0;
            next_i5 <= 1'b0;
            next_i6 <= 1'b0;
            next_i7 <= 1'b0;
            next_i8 <= 1'b0;
            next_i9 <= 1'b0;
            next_i10 <= 1'b0;
            next_i11 <= 1'b0;
            next_i12 <= 1'b0;
            next_i13 <= 1'b0;
        end else begin
            next_out <= ~(enable & out);
            next_i1 <= i1;
            next_i2 <= i2;
            next_i3 <= i3;
            next_i4 <= i4;
            next_i5 <= i5;
            next_i6 <= i6;
            next_i7 <= i7;
            next_i8 <= i8;
            next_i9 <= i9;
            next_i10 <= i10;
            next_i11 <= i11;
            next_i12 <= i12;
            next_i13 <= i13;
        end       
    end    
    
    inverter_with_delay inverter_un(.in(next_out), .out(i1));
    
    inverter_with_delay inverter_deux(.in(next_i1), .out(i2));
    
    inverter_with_delay inverter_trois(.in(next_i2), .out(i3));
    
    inverter_with_delay inverter_quatre(.in(next_i3), .out(i4));
    
    inverter_with_delay inverter_cinq(.in(next_i4), .out(i5));
    
    inverter_with_delay inverter_six(.in(next_i5), .out(i6));
    
    inverter_with_delay inverter_sept(.in(next_i6), .out(i7));
    
    inverter_with_delay inverter_huit(.in(next_i7), .out(i8));
    
    inverter_with_delay inverter_neuf(.in(next_i8), .out(i9));
    
    inverter_with_delay inverter_dix(.in(next_i9), .out(i10));
    
    inverter_with_delay inverter_onze(.in(next_i10), .out(i11));
    
    inverter_with_delay inverter_douze(.in(next_i11), .out(i12));
    
    inverter_with_delay inverter_treize(.in(next_i12), .out(i13));
    
    inverter_with_delay inverter_quatorze(.in(next_i13), .out(out));
    
endmodule


