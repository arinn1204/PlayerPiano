`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:13:30 10/20/2014
// Design Name:   DecoderAndSynth
// Module Name:   C:/Users/Aaron/Dropbox/EE324/PlayerPiano/SoundTest.v
// Project Name:  PlayerPiano
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DecoderAndSynth
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SoundTest;

	// Inputs
	reg Clock;
	reg btnCpuReset;
	reg [7:0] KeyCode;
	reg Flag;

	// Outputs
	wire JA;
	wire ampPWM;
	wire ampSD;

	// Instantiate the Unit Under Test (UUT)
	DecoderAndSynth uut (
		.Clock(Clock), 
		.btnCpuReset(btnCpuReset), 
		.KeyCode(KeyCode), 
		.Flag(Flag), 
		.JA(JA), 
		.ampPWM(ampPWM), 
		.ampSD(ampSD)
	);

	always
		#5 Clock = ~Clock;

	initial begin
		// Initialize Inputs
		Clock = 0;
		btnCpuReset = 0;
		KeyCode = 0;
		Flag = 0;

		// Wait 100 ns for global reset to finish
		#100;
       #4 btnCpuReset = 1;
		 Flag = 1;
		 
		 
		#250 KeyCode = 8'h0D;
		#250 KeyCode = 8'h00;
		
		#500 KeyCode = 8'h1D;
		#500 KeyCode = 8'h00;
		// Add stimulus here

	end
      
endmodule

