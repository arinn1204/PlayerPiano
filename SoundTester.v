`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:00:40 10/22/2014
// Design Name:   DecoderAndSynth
// Module Name:   C:/Users/Aaron/Dropbox/EE324/PlayerPiano/SoundTester.v
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

module SoundTester;

	// Inputs
	reg Clock;
	reg KClock;
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
		.KClock(KClock), 
		.btnCpuReset(btnCpuReset), 
		.KeyCode(KeyCode), 
		.Flag(Flag), 
		.JA(JA), 
		.ampPWM(ampPWM), 
		.ampSD(ampSD)
	);
		always begin
		#5	Clock = ~Clock;
			KClock = ~KClock;
		end
		
	initial begin
		// Initialize Inputs
		Clock = 0;
		KClock = 0;
		btnCpuReset = 0;
		KeyCode = 0;
		Flag = 0;

		// Wait 100 ns for global reset to finish
		#101;
		btnCpuReset = 1;
		
		#250 KeyCode = 8'h24;
		#250 KeyCode = 8'h0D;
        
		// Add stimulus here

	end
      
endmodule

