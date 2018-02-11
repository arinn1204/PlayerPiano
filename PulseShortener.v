`timescale 1ns / 1ps


module PulseShortener(
	 input Clock,
	 input Reset,
    input isValid,
    output reg Valid
    );
	 
	 reg [1:0] nState, pState;
	 localparam I0 = 2'b00;
	 localparam I1 = 2'b01;
	 localparam I2 = 2'b11;
	 
	 initial begin
		nState <= I0;
		pState <= I0;
		Valid <= 1'b0;
	 end
	
	always @ (pState, isValid)
	begin
		case (pState)
			I0:
				begin
					if (isValid)
						nState = I1;
					else
						nState = I0;
				end
			I1:
				begin
					if (isValid)
						nState = I2;
					else
						nState = I0;
				end
			I2:
				begin
					if(!isValid)
						nState = I0;
					else
						nState = I2;
				end
			default:
				nState = I0;
		endcase
	
	end
	
	always @ (posedge Clock)
		pState = (Reset == 1'b1) ? I0 : nState;
		
	always @ (posedge Clock)
		Valid = (pState == I1) ? 1'b1 : 1'b0;


endmodule
