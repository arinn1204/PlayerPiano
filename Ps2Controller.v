`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:16:14 09/10/2014 
// Design Name: 
// Module Name:    Ps2Controller 
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
module Ps2Controller(
	 input Clock,
    input KClock,
    input KData,
	 input btnCpuReset,
	 output reg [7:0] KCode,
	 output isValid
    );

	reg [10:0] DataString;
	wire Falling, Rising, SingleValid;
	reg StartBit, StopBit, ParityBit, DataValid;
	
	initial begin
		DataValid = 	1'b0;
		DataString = 	11'h7FF;
		KCode = 			8'b0;
		StartBit = 		1'b0;
		StopBit =		1'b0;
		ParityBit =		1'b0;
	end
	
	ClockEdgeDetect PS2ClockEdgeDetect (
    .PS2Clock(KClock), 
    .Clock(Clock), 
    .FallingEdge(Falling),
	 .RisingEdge(Rising)
    );
	 
	 //this will happen first
	
	always @(negedge Clock)
	begin
		if (Falling)
			DataString <= (DataString[0]) ? {KData,DataString[10:1]} : {KData,10'h3FF};
		else
			DataString <= DataString;
	end
	
	//after the data has been read, the next posedge the bits are assigned
	always @ (posedge Clock) begin
		if (Rising) begin
			StartBit <= DataString[0];
			StopBit <= DataString[10];
			ParityBit <= DataString[9];
		end
		else begin
			StartBit <= StartBit;
			StopBit <= StopBit;
			ParityBit <= ParityBit;
		end
	end
	
	//after the flag bits are assigned, the valid flag goes high until a new key is pressed
	always @ (negedge Clock)
		DataValid <= (~StartBit && StopBit) ? 1'b1 : 1'b0;
	
	 PulseShortener ValidShortener (
    .Clock(Clock), 
    .Reset(~btnCpuReset), 
    .isValid(DataValid), 
    .Valid(SingleValid)
    );

	//this will then assign the output code and the single pulsed valid flag on the next rising edge
	always @ (negedge Clock)
		KCode <= (SingleValid) ? DataString[8:1] : KCode;
	
	assign isValid = SingleValid;

endmodule
