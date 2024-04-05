`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 
// Design Name: 
// Module Name: Ring_Oscillator_PUF_t
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`define CYCLE_TIME 20.0

module Ring_Oscillator_PUF_t();

    reg [7:0] challenge;
    reg [7:0] challenge2;
    reg clk = 1'b1;
    reg rst = 1'b0;
    reg en = 1'b1; 
    
    wire [7:0] response;
    wire [7:0] response2;
    wire ready;
    wire ready2;
    reg [7:0] HD_response;

    parameter DELAY = 1;
    integer i = 0;
    integer uniformity = 0;
    integer j = 0;
    integer uniformity2 = 0;
    integer uniqueness = 0;
    always #1 clk = ~clk;
    

    Ring_Oscillator_PUF #(
        .n0(3),.n1(3),.n2(2),.n3(3),.n4(8),.n5(3), .n6(3), .n7(5),
        .n8(8),.n9(2),.n10(4),.n11(3),.n12(6),.n13(7),.n14(5), .n15(5)
    ) chip_1 (
        .clk(clk),
        .en(en), 
        .rst(rst), 
        .chall_in(challenge), 
        .response(response), 
        .ready(ready)
    );


    Ring_Oscillator_PUF #(
        .n0(9),.n1(2),.n2(3),.n3(4),.n4(5),.n5(6), .n6(7), .n7(2),
        .n8(6),.n9(2),.n10(5),.n11(4),.n12(3),.n13(6),.n14(2), .n15(8)
    ) chip_2 (
        .clk(clk),
        .en(en), 
        .rst(rst), 
        .chall_in(challenge2), 
        .response(response2), 
        .ready(ready2)
    );

    initial begin

        $display("===== Simulation ======");

        #DELAY;
        rst = 1'b1;
        #DELAY;
        rst = 1'b0;
        #DELAY;

        while (i<5) begin
             
            if(i === 3'b000)begin
                challenge = 8'b1101_0100;
            end else if(i === 3'b001) begin
                challenge = 8'b0101_0010;
            end else if(i === 3'b010) begin
                challenge = 8'b0001_0110;
            end else if(i === 3'b011) begin
                challenge = 8'b1110_0111;
            end else if(i === 3'b100) begin
                challenge = 8'b1100_0001;
            end

            while (!ready) #DELAY;

            uniformity = response[0] + response[1] + response[2] + response[3] + response[4]+ response[5] + response[6] + response[7];
            
            $display("[Testcase %1d] Challenge = %b, Response = %b, Uniformity = %1d/8," , i, challenge, response, uniformity);
            while (ready) #DELAY;
            i=i+1;
        end

        while (j<5) begin
             
            if(j === 3'b000)begin
                challenge2 = 8'b1101_0100;
            end else if(j === 3'b001) begin
                challenge2 = 8'b0101_0010;
            end else if(j === 3'b010) begin
                challenge2 = 8'b0001_0110;
            end else if(j === 3'b011) begin
                challenge2 = 8'b1110_0111;
            end else if(j === 3'b100) begin
                challenge2 = 8'b1100_0001;
            end

            while (!ready2) #DELAY;

            uniformity2 = response2[0] + response2[1] + response2[2] + response2[3] + response2[4]+ response2[5] + response2[6] + response2[7];

            $display("[v2 Testcase %1d] Challenge = %b, Response = %b, Uniformity = %1d/8" , i, challenge2, response2, uniformity2);
            while (ready2) #DELAY;
            j=j+1;
        end

        $display("===== Simulation End ======"); 
        $finish;
    end
    

endmodule
