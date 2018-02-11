`timescale 10ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:58:41 10/24/2014
// Design Name:   KeyboardWrapper
// Module Name:   C:/Users/Aaron/Dropbox/EE324/PlayerPiano/KeyboardTest.v
// Project Name:  PlayerPiano
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: KeyboardWrapper
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module KeyboardTest;

	// Inputs
	reg Clock=0;
	reg btnCpuReset=1;
	reg PS2Clk=1;
	reg PS2Data=1;

	// Outputs
	wire [7:0] ScanData;
	wire [1:0] JB;
	wire Valid;

	// Instantiate the Unit Under Test (UUT)
	KeyboardWrapper uut (
		.Clock(Clock), 
		.btnCpuReset(btnCpuReset), 
		.PS2Clk(PS2Clk), 
		.PS2Data(PS2Data), 
		.ScanData(ScanData), 
		.JB(JB), 
		.Valid(Valid)
	);
	integer Counter = 0;
	reg [10:0] symbol1 =    11'b10000101100; //16
	reg [10:0] key_up =     11'b10111100000; //F0
	reg [10:0] symbol3 =    11'b10010110100; //15
	reg [10:0] enter =      11'b10010101000;

	always
		#1 Clock = ~Clock;


	initial begin
		// Initialize Inputs
		#100 btnCpuReset = 0;
		#100 btnCpuReset = 1;
		// Wait 100 ns for global reset to finish
		
		for(Counter = 0; Counter < 11; Counter = Counter + 1)
			begin
				#100 PS2Data = key_up[Counter];
				#500 PS2Clk = ~PS2Clk;
				#500 PS2Clk = ~PS2Clk;
			end

      for(Counter = 0; Counter < 11; Counter = Counter + 1) 
			begin
				#100 PS2Data = enter[Counter];
				#500 PS2Clk = ~PS2Clk;
				#500 PS2Clk = ~PS2Clk;
			end
		#1000
		
		for(Counter = 0; Counter < 11; Counter = Counter + 1)
			begin
				#100 PS2Data = key_up[Counter];
				#500 PS2Clk = ~PS2Clk;
				#500 PS2Clk = ~PS2Clk;
			end
		#1000
		for(Counter = 0; Counter < 11; Counter = Counter + 1)
			begin
				#100 PS2Data = enter[Counter];
				#500 PS2Clk = ~PS2Clk;
				#500 PS2Clk = ~PS2Clk;
			end
		for(Counter = 0; Counter < 11; Counter = Counter + 1)
			begin
				#100 PS2Data = key_up[Counter];
				#500 PS2Clk = ~PS2Clk;
				#500 PS2Clk = ~PS2Clk;
			end
			#1000
		for(Counter = 0; Counter < 11; Counter = Counter + 1)
			begin
				#100 PS2Data = symbol3[Counter];
				#500 PS2Clk = ~PS2Clk;
				#500 PS2Clk = ~PS2Clk;
			end

	end

       
      
endmodule

