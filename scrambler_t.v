`timescale 1ns / 1ps

`define CYCLE_TIME 20.0

module scrambler_t ();

    parameter DELAY = 2;

    reg clk = 1'b1, rst = 1'b0;

    wire [7:0] chall;

    always #1 clk = ~clk;

    reg [7:0] in = 8'b1101_0100;

    //====================================
    // TODO: Connect your module here. Please connect it by port name but not order
    scrambler scrambler(.input_challenge(8'b1101_0100), .clk(clk), .rst(rst), .output_challenge(chall));
    //====================================

    integer i, j,  error_count;
    initial begin

        $display("===== Simulation ======");

        error_count = 0;

        #DELAY;
        rst = 1'b1;

        #DELAY;
        rst = 1'b0;

        for(i = 0 ; i < 8 ; i = i + 1) begin
            
            #DELAY;

            /*
            if(chall !== test_scrambler(8'b1101_0100,i)) begin

                $display("[ERROR] challengle = %b,  correct test_scrambler should be %b",
                chall, test_scrambler);
                error_count = error_count + 1;
            end
            else begin
                $display("[CORRECT] challengle = %b,  test_scrambler = %b",chall, test_scrambler);
            end
            */
            
        end
        rst = 1'b1;

        #DELAY;
        rst = 1'b0;
        for(i = 0 ; i < 8 ; i = i + 1) begin
            
            #DELAY;

            /*
            if(chall !== test_scrambler(8'b1101_0100,i)) begin

                $display("[ERROR] challengle = %b,  correct test_scrambler should be %b",
                chall, test_scrambler);
                error_count = error_count + 1;
            end
            else begin
                $display("[CORRECT] challengle = %b,  test_scrambler = %b",chall, test_scrambler);
            end
            */
            
        end

        $finish;
    end
    /*
    function test_scrambler;
        input [7:0] input_challenge;
        integer count;
        integer i;
        reg next_bit;
        reg t_chall;   
        begin
            next_bit = input_challenge[0]^input_challenge[1]^input_challenge[2]^input_challenge[3]^input_challenge[7];
            t_chall = input_challenge ^ {next_bit, input_challenge[7:1]};
            for(i=1;i<count;i= i+1)begin
                next_bit = t_chall[0]^t_chall[1]^t_chall[2]^t_chall[3]^t_chall[7];
                t_chall = t_chall ^ {next_bit, t_chall[7:1]};
            end
            test_scrambler = t_chall;
        end
    endfunction
   */
endmodule
