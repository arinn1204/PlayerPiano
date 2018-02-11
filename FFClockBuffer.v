`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:57:43 09/22/2014 
// Design Name: 
// Module Name:    FFClockBuffer 
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
module FFClockBuffer(
    input Clock,
    input Reset,
	 input KeyClock,
    output reg KeyClockOut
	 );
	 
	 always @ (negedge Clock, posedge Reset)
	 begin
		if (Reset == 1'b1)
			KeyClockOut <= 1'b0;
		else
			KeyClockOut <= KeyClock;
	 end

endmodule
