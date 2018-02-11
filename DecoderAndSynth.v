`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:58:58 10/20/2014 
// Design Name: 
// Module Name:    DecoderAndSynth 
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
module DecoderAndSynth(
    input Clock,
    input btnCpuReset,
    input [7:0] KeyCode,
    input Enable,
	 output ampPWM,
	 output ampSD
    );
	 
	 wire [15:0] Switch;
	 wire JATemp;
	 
	 SoundSM SoundMaker (
    .Keycode(KeyCode),
	 .Enable(Enable),
    .Clock(Clock), 
    .Reset(~btnCpuReset), 
    .M(Switch)
    );


	Synthesizer WaveSynthesizer (
    .Clock(Clock), 
    .btnCpuReset(btnCpuReset), 
    .Switch(Switch), 
    .JA(JATemp)
    );




	//assign JA = JATemp;
	assign ampPWM = JATemp;
	assign ampSD = 1'b1;



endmodule
