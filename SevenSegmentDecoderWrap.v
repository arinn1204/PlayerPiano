`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2014 02:15:54 AM
// Design Name: 
// Module Name: SevenSegmentDecoderWrap
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SevenSegmentDecoderWrap(
    input Clock, //this is the Anode Clock Divider clock
	 input Reset,
	 input [7:0] KeyCode,
    output [7:0] Anode,
    output [6:0] Segment
    );
    
    wire [3:0] Dig0, Dig1, Display;
    wire DividedClock;
	 wire [1:0] Count;
	 
	 AnodeClockDivider ClockDiv (
    .Clock(Clock), 
    .Reset(Reset), 
    .DividedClock(DividedClock)
    );
	 
	 
	 AnodeChangingCounter ChangingAnodes (
    .Clock(DividedClock), 
    .Selector(Count)
    );


    AnodeShifter DisplayAnode (
    .Count(Count),
    .Anode(Anode)
    );
    
	 KeyboardCodeDecoder KeyDecoder (
	 .Clock(Clock),
    .KeyboardCode(KeyCode), 
    .HexDigOne(Dig0), 
    .HexDigTwo(Dig1)
    );

	 
    DecisionMux MuxToDisplay (
    .Select(Count),
    .I0(Dig0),
    .I1(Dig1),
	 .I2(4'b0),
	 .I3(4'b0),
    .Decision(Display)
    );
    
    SevenSegmentDecoder GetTheSegments (
    .Counter(Display),
    .Digit(Segment)
    );
    
endmodule
