`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:30:10 10/29/2014 
// Design Name: 
// Module Name:    ClockEdgeDetect 
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
module ClockEdgeDetect(
    input PS2Clock,
	 input Clock,
    output reg FallingEdge,
	 output reg RisingEdge
    );
	 
	 reg CurrentPulse, OldPulse, ThirdLastPulse;
	 
	 initial begin
	 CurrentPulse = 1'b0;
	 OldPulse = 1'b0;
	 FallingEdge = 1'b0;
	 RisingEdge = 1'b0;
	 ThirdLastPulse = 1'b0;
	 end
	 
	 always @ (negedge Clock)
		CurrentPulse <= PS2Clock;
	 
	 always @ (negedge Clock)
		OldPulse <= CurrentPulse;
	
	 always @ (negedge Clock)
		ThirdLastPulse <= OldPulse;
		
	 always @ (negedge Clock)
		FallingEdge <= (ThirdLastPulse && OldPulse && ~CurrentPulse) ? 1'b1 : 1'b0;
		
	 always @ (negedge Clock)
		RisingEdge <= (~ThirdLastPulse && ~OldPulse && CurrentPulse) ? 1'b1 : 1'b0;
	 
	 


endmodule
