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

    parameter DELAY = 2;

    reg clk = 1'b1, rst = 1'b0, en = 1'b1;
    wire [7:0] response;
    wire ready;
    always #1 clk = ~clk;
    reg [7:0] in = 8'b1101_0100;
    reg [7:0] response1;
    reg [7:0] response2;


    Ring_Oscillator_PUF  chip(.clk(clk), .en(en), .rst(rst), .chall_in(in), .response(response), .ready(ready));

    integer i, error_count=0, cnt = 0;

    initial begin

        $display("===== Simulation ======");

        #DELAY;
        rst = 1'b1;
        #DELAY;
        rst = 1'b0;
        
        for(i = 0 ; i < 2**8 ; i = i) begin
            in = i[7:0];
            #DELAY;
            if(ready && cnt == 0 )begin
                response1 = response;
                cnt=1;
            end else if(ready && cnt == 1 )begin
                response2 = response;
                if(response1 == response2 ) begin
                    $display("[CORRECT] challenge = %b, response1 = %b, response2 = %b", in, response1, response2);
                end else begin
                    $display("[ERROR] challenge = %b, response1 = %b, response2 = %b", in, response1, response2);
                    error_count = error_count + 1;
                end
                cnt=0;
                i = i + 1;
            end
        end

        if(error_count === 0)
            $display("All Correct!!");
        else    
            $display("There are %d errors QQ", error_count);

        $finish;
    end
endmodule
