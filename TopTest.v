`timescale 10ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:51:34 10/22/2014
// Design Name:   PlayerPianoRamp
// Module Name:   C:/Users/Aaron/Dropbox/EE324/PlayerPiano/TopTest.v
// Project Name:  PlayerPiano
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PlayerPianoRamp
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TopTest;

	// Inputs
	reg Clock=0;
	reg btnCpuReset=1;
	reg PS2Clk=1;
	reg PS2Data=1;

	// Outputs
	wire JA;
	wire ampPWM;
	wire ampSD;
	wire [1:0] JB;
	wire [7:0] Anode;
	wire [6:0] Segment;

	// Instantiate the Unit Under Test (UUT)
	PlayerPianoRamp uut (
		.Clock(Clock), 
		.btnCpuReset(btnCpuReset), 
		.PS2Clk(PS2Clk), 
		.PS2Data(PS2Data), 
		.JA(JA), 
		.ampPWM(ampPWM), 
		.ampSD(ampSD),
		.JB(JB),
		.Anode(Anode),
		.Segment(Segment)
	);
	
	always
		#1 Clock = ~Clock;
		
	integer Counter = 0;
	integer i = 0;
	
	reg [10:0] symbol1 =    11'b10000101100; //16
	reg [10:0] key_up =     11'b10111100000; //F0
	reg [10:0] symbol3 =    11'b10000101010; //15
	reg [10:0] ENTER = 		11'b10010110100; //5A
	reg [10:0] UP = 			11'b10011101010; //UP
	reg [10:0] STOP = 		11'b10011101100; //ESC

	initial begin
		// Initialize Inputs
		#100 btnCpuReset = 0;
		#100 btnCpuReset = 1;
		// Wait 100 ns for global reset to finish
	for(i = 0; i < 2; i = i + 1) begin
		#10000
		for(Counter = 0; Counter < 11; Counter = Counter + 1)
				begin
					#100 PS2Data = key_up[Counter];
					#500 PS2Clk = ~PS2Clk;
					#500 PS2Clk = ~PS2Clk;
				end

				#10000
			for(Counter = 0; Counter < 11; Counter = Counter + 1)
				begin
					#100 PS2Data = symbol3[Counter];
					#500 PS2Clk = ~PS2Clk;
					#500 PS2Clk = ~PS2Clk;
				end
				
				#10000
				
			for(Counter = 0; Counter < 11; Counter = Counter + 1)
				begin
					#100 PS2Data = key_up[Counter];
					#500 PS2Clk = ~PS2Clk;
					#500 PS2Clk = ~PS2Clk;
				end

				#10000
			for(Counter = 0; Counter < 11; Counter = Counter + 1)
				begin
					#100 PS2Data = symbol1[Counter];
					#500 PS2Clk = ~PS2Clk;
					#500 PS2Clk = ~PS2Clk;
				end
				
			end
		end
	
      
endmodule

