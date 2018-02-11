`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2014 02:25:33 AM
// Design Name: 
// Module Name: DecisionMux
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


module DecisionMux(
    input [1:0] Select,
    input [3:0] I0,
    input [3:0] I1,
	 input [3:0] I2,
	 input [3:0] I3,
    output reg [3:0] Decision
    );
    
        always @(Select, I0, I1, I2, I3)
          case (Select)
             2'b0: Decision = I0;
             2'b01: Decision = I1;
				 2'b10: Decision = I2;
				 2'b11: Decision = I3;
				 default: Decision = 2'b0;
          endcase
    
    
endmodule
