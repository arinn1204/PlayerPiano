`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:49:24 09/10/2014 
// Design Name: 
// Module Name:    KeyboardCodeDecoder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module KeyboardCodeDecoder(
	 input Clock,
    input [7:0] KeyboardCode,
    output reg [3:0] HexDigOne,
    output reg [3:0] HexDigTwo
    );
	 
	 localparam KEYUP = 8'hF0;
	 
	always @ (posedge Clock)
		begin
			if (KeyboardCode != KEYUP)
				begin
					HexDigOne = KeyboardCode[3:0];
					HexDigTwo = KeyboardCode[7:4];
				end
		end


endmodule
