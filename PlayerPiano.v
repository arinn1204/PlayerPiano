`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:54:12 10/13/2014 
// Design Name: 
// Module Name:    PlayerPiano 
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
module PlayerPianoRamp(
	input Clock,
	input btnCpuReset,
	input PS2Clk,
	input PS2Data,
	output JA,
	output RsTx,
	output ampPWM,
	output ampSD,
	output [1:0] JB,
	output [7:0] Anode,
	output [6:0] Segment
    );
	 
	 wire ValidFlag, PWM_Splitter;
	 wire [7:0] KeyboardCode;
	 
	 
	 KeyboardWrapper KeyboardControl (
    .Clock(Clock), 
    .btnCpuReset(btnCpuReset), 
    .PS2Clk(PS2Clk), 
    .PS2Data(PS2Data), 
	 .ScanData(KeyboardCode),
	 .Valid(ValidFlag)
    );
	 
	 DecoderAndSynth SoundMaker (
    .Clock(Clock), 
    .btnCpuReset(btnCpuReset), 
    .KeyCode(KeyboardCode), 
    .Enable(ValidFlag),
	 .ampPWM(PWM_Splitter),
	 .ampSD(ampSD)
    );
	 
	 assign JA = PWM_Splitter;
	 assign ampPWM = PWM_Splitter;
	 
	 SevenSegmentDecoderWrap DisplayKey (
    .Clock(Clock), 
	 .Reset(~btnCpuReset),
    .KeyCode(KeyboardCode), 
    .Anode(Anode), 
    .Segment(Segment)
    );


	UART_TX_CTRL Debug (
    .SEND(ValidFlag), 
    .DATA(KeyboardCode), 
    .CLK(Clock), 
    .READY(), 
    .UART_TX(RsTx)
    );



	 

endmodule
