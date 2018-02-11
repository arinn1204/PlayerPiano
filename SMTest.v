`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:50:20 10/22/2014
// Design Name:   SoundSM
// Module Name:   C:/Users/Aaron/Dropbox/EE324/PlayerPiano/SMTest.v
// Project Name:  PlayerPiano
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SoundSM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SMTest;

	// Inputs
	reg [7:0] KeyboardCode;
	reg Enable;
	reg Clock;
	reg Reset;

	// Outputs
	wire [15:0] M;

	// Instantiate the Unit Under Test (UUT)
	SoundSM uut (
		.Keycode(KeyboardCode), 
		.Enable(Enable),
		.Clock(Clock), 
		.Reset(Reset), 
		.M(M)
	);
	
	always
		#5 Clock = ~Clock;

	initial begin
		// Initialize Inputs
		KeyboardCode = 0;
		Clock = 0;
		Reset = 0;

		// Wait 100 ns for global reset to finish
		#101;
		
		#250 KeyboardCode = 8'h15;
		Enable = 1;
		#10 Enable = 0;
		
		#250 KeyboardCode = 8'hF0;
		Enable = 1;
		#10 Enable = 0;
		
		#250 KeyboardCode = 8'h15;
		Enable = 1;
		#10 Enable = 0;
		
		#250 KeyboardCode = 8'h00;
		Enable = 1;
		#10 Enable = 0;
		
		#250 KeyboardCode = 8'h15;
		Enable = 1;
		#10 Enable = 0;
		
		#250 KeyboardCode = 8'hF0;
		Enable = 1;
		#10 Enable = 0;
		
		#250 KeyboardCode = 8'h15;
		Enable = 1;
		#10 Enable = 0;
        
		// Add stimulus here

	end
      
endmodule

