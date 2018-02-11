`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:26:43 10/17/2014 
// Design Name: 
// Module Name:    KeyToFrequency 
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
module KeyToFrequency(
    input [7:0] KeyboardData,
	 input Enable,
    output reg [15:0] M
    );
	 
	 reg [7:0] En = 8'b0;
	 
	 always @(Enable)
		if(Enable)
			En = 8'hFF;
		else
			En = 8'b0;
	 

	
	always @ (Enable,KeyboardData)
		begin
			case(KeyboardData & En)
				8'h0D:
					M=16'd389;
				8'h16:
					M=16'd412;
				8'h15:
					M=16'd436;
				8'h1E:
					M=16'd462;
				8'h1D:
					M=16'd490;
				8'h24:
					M=16'd519;
				8'h25:
					M=16'd550;
				8'h2D:
					M=16'd583;
				8'h2E:
					M=16'd617;
				8'h2C:	
					M=16'd654;
				8'h36:
					M=16'd693;
				8'h35:	
					M=16'd734;
				8'h3C:
					M=16'd778;
				8'h3E:
					M=16'd824;
				8'h43:	
					M=16'd873;
				8'h46:
					M=16'd925;
				8'h44:
					M=16'd980;
				8'h4D:
					M=16'd1038;
				8'h4E:
					M=16'd1100;
				8'h54:
					M=16'd1165;
				8'h55:
					M=16'd1234;
				8'h5B:
					M=16'd1308;
				default:
					M = 16'b0;
			endcase
		end

endmodule
