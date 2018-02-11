`timescale 1ns / 1ps

module ClockDivider(
    input Clock,
    input Reset,
    output reg ClockDiv
    );
	 
	 reg [10:0] Counter = 11'b0;
	 localparam Limit = 1133;
	 
	 always @ (posedge Clock, posedge Reset)
	 begin
		if(Reset == 1'b1)
			Counter <= 11'b0;
		else if (Counter == Limit-1)
			Counter <= 11'b0;
		else
			Counter <= Counter + 1'b1;
	 end
	 
	 always @ (posedge Clock, posedge Reset)
	 begin
		if(Reset == 1'b1)
			ClockDiv <= 1'b0;
		else if (Counter == Limit - 1)
			ClockDiv <= ~ClockDiv;
		else
			ClockDiv <= ClockDiv;
	 end


endmodule
