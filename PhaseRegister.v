`timescale 1ns / 1ps

module PhaseRegister(
    input Clock,
    input [15:0] DataIn,
    output reg [15:0] Data
    );
	 
	 initial
		Data = 16'b0;
	  
	 always @ (posedge Clock)
		Data <= DataIn;


endmodule
