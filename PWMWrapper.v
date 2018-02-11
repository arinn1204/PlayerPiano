`timescale 1ns / 1ps
module PWMWrapper(
    input Clock,
    input btnCpuReset,
    input [7:0] Switch,
	 output reg JA
    );
	 wire Reset = ~btnCpuReset;
	 reg  [7:0] Counter = 8'b0;
	 
	 
	 always @ (posedge Clock)
	 begin
		if (Reset)
			Counter <= 8'b0;
		else if(Counter == 8'hFF)
			Counter <= 8'b0;
		else
			Counter <= Counter + 1'b1;
	 end
	 
	 always @ (Switch, Counter)
	 begin
		if(Switch > Counter)
			JA = 1'b1;
		else
			JA = 1'b0;
	 end
	 
		 
endmodule
