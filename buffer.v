`timescale 1ns / 1ps

/*

* Create Date: 
* Design Name:
* Module Name: buffer
* Project Name: Delay-based Physical Unclonable Function Implementation
* Target Devices: Digilent S7-25, S7-50 (Xilinx Spartan 7)
* Tool Versions:
* Description: This buffer stores each bit from each race. It is also in
*              charge of reset logic.
*
* Dependencies:
*
* Revision:
* 
* Additional Comments:
*
*/

module buffer(clk, rst, winner, done, response, ready_to_read);
input clk, rst;
input winner;	 //output of race_arbiter
input done;	 //output of race_arbiter
output reg[7:0] response;
output ready_to_read;	//ready to read response

//reset signal:pay attention to the order of resetting of these three
output counter_rst;	//reset counter while generating response
output scrambler_rst;	//reset scrambler while generating response 
output arbiter_rst;	//reset arbiter while generating response 

***************
**Your Coding**
***************

endmodule
