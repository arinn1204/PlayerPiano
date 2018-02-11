`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2014 01:32:08 AM
// Design Name: 
// Module Name: AnodeShifter
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


module AnodeShifter(
    input [1:0] Count,
    output reg [7:0] Anode
    );
    
    always @ (Count)
    begin
        case (Count)
            2'b0: Anode = 8'b11111110;
            2'b01: Anode = 8'b11111101;
				2'b10: Anode = 8'b11111011;
				2'b11: Anode = 8'b11110111;
            default: Anode = 8'b11111111;
        endcase
    end
endmodule
