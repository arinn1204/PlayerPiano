`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2014 01:32:08 AM
// Design Name: 
// Module Name: SevenSegmentDecoder
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


module SevenSegmentDecoder(
    input [3:0] Counter,
    output reg [6:0] Digit
    );
    
       always @(Counter)
       begin
           case (Counter)
               4'b0000 : Digit = 7'b1000000;   // 0
               4'b0001 : Digit = 7'b1111001;   // 1
               4'b0010 : Digit = 7'b0100100;   // 2
               4'b0011 : Digit = 7'b0110000;   // 3
               4'b0100 : Digit = 7'b0011001;   // 4
               4'b0101 : Digit = 7'b0010010;   // 5
               4'b0110 : Digit = 7'b0000010;   // 6
               4'b0111 : Digit = 7'b1111000;   // 7
               4'b1000 : Digit = 7'b0000000;   // 8
               4'b1001 : Digit = 7'b0010000;   // 9
					4'b1010 : Digit = 7'b0001000;   // A
					4'b1011 : Digit = 7'b0000011;   // b
					4'b1100 : Digit = 7'b1000110;   // C
					4'b1101 : Digit = 7'b0100001;   // d
					4'b1110 : Digit = 7'b0000110;   // E
					4'b1111 : Digit = 7'b0001110;   // F
               default : Digit = 7'b1111111;
           endcase
       end          
    
    
endmodule
