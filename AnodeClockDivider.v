`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2014 01:13:44 AM
// Design Name: 
// Module Name: AnodeClockDivider
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

module AnodeClockDivider(
    input Clock,
    input Reset,
    output reg DividedClock
    );

localparam Number = 50000;

reg [15:0] counter = 16'b0;

always @ (posedge Clock or posedge Reset)
begin
	if(Reset == 1'b1)
		begin
			counter <= 16'b0;
		end
	else if (counter == Number - 1)
		begin
			counter <= 16'b0;
		end
	else
		begin
			counter <= counter + 1'b1;
		end
end

always @ (posedge Clock or posedge Reset)
begin
	if (Reset == 1'b1)
		begin
			DividedClock <= 1'b0;
		end
	else if (counter == Number - 1)
		begin
			DividedClock <= ~DividedClock;
		end
	else
		begin
			DividedClock <= DividedClock;
		end
		
end

endmodule

