`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:30:40 09/10/2014 
// Design Name: 
// Module Name:    SegChangingCounter 
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
module AnodeChangingCounter(
    input Clock,
    output reg [1:0] Selector
    );
	 
	 initial
		Selector = 2'b0;

	always @ (posedge Clock)
		if (Selector == 2'h3)
			Selector <= 2'b0;
		else
			Selector <= Selector + 1'b1;

endmodule
