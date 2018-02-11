`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:05:46 10/22/2014 
// Design Name: 
// Module Name:    SoundSM 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module SoundSM(
	input [7:0] Keycode,
	input Enable,
	input Clock,
	input Reset,
	output reg [15:0] M
    );
	 
	 localparam I0 = 3'b000;
	 localparam I1 = 3'b001;
	 localparam I2 = 3'b010;
	 localparam I3 = 3'b011;
	 localparam I4 = 3'b100;
	 localparam I5 = 3'b101;
	 localparam I6 = 3'b110;
	 localparam I7 = 3'b111;

	 
	 localparam KEYUP = 8'hF0;
	 localparam START = 8'h5A;
	 localparam STOP = 8'h76;
	 
	 localparam DOWN = 8'h72;
	 localparam UP = 8'h75;
	 
	 parameter ROM_WIDTH = 12;
	 parameter ROM_ADDR_BITS = 8;
	


	 (* ROM_STYLE="block" *)
	 reg [ROM_WIDTH-1:0] MValues [(2**ROM_ADDR_BITS)-1:0];
   
	 
	 reg [2:0] nState, pState;
	 reg [15:0] MR;
	 reg [11:0] MS;
	 wire [7:0] OldCode;
	 wire StaticFlag, RampFlag, UpFlag, DownFlag;
	 
	 initial begin
		$readmemb("C:/Users/Aaron/Dropbox/PythonScript/Piano.dat", MValues);
		M = 16'b0;
		MR = 16'b0;
		MS = 12'b0;
		nState = I0;
		pState = I0;
	end;
	 
	 always @ (Keycode, pState)
		begin
			case(pState)
				I0:	
					begin
						if(Keycode != KEYUP)
							nState = I1;
						else if (Keycode == START)
							nState = I2;
						else
							nState = I0;
					end
				I1:
					begin
						if(Keycode == KEYUP)
							nState = I4;
						else
							nState = I1;
					end
				I2:
					begin
						if(Keycode == KEYUP)
							nState = I3;
						else
							nState = I2;
					end
				I3:
					begin
						if(Keycode == UP)
							nState = I5;
						else if (Keycode == DOWN)
							nState = I6;
						else if (Keycode == STOP)
							nState = I0;
						else
							nState = I3;
					end
				I4:
					nState = I0;
				I5:
					begin
						if(Keycode == UP)
							nState = I5;
						else if (Keycode == STOP)
							nState = I0;
						else
							nState = I7;
					end
				I6:
					begin
						if(Keycode == DOWN)
							nState = I6;
						else if(Keycode == STOP)
							nState = I0;
						else
							nState = I7;
					end
				I7:
					nState = I3;
				default:
					nState = I0;
			endcase
		end


	always @ (posedge Clock, posedge Reset)
		begin
			if (Reset)
				pState <= I0;
			else if (Enable)
				pState <= nState;
			else
				pState <= pState;
		end

	
	assign StaticFlag = (pState == I1) ? 1'b1 : 1'b0;
	assign RampFlag = (UpFlag || DownFlag) ? 1'b1 : 1'b0;
	assign UpFlag = (pState == I5) ? 1'b1 : 1'b0;
	assign DownFlag = (pState == I6) ? 1'b1 : 1'b0;
	
	
	always @ (StaticFlag, Keycode, MValues[Keycode])
		begin
			if (StaticFlag && Keycode != UP && Keycode != DOWN)
				MS = MValues[Keycode];
			else
				MS = 12'b0;
		end
		
		reg ClockDiv = 1'b0;
		reg [18:0] Counter = 19'b0;
		localparam CountLimit = 500000;
		
		always @(posedge Clock, posedge Reset)
		begin
			if(Reset)
				Counter <= 19'b0;
			else if (Counter == CountLimit - 1)
				Counter <= 19'b0;
			else
				Counter <= Counter + 1'b1;
		end
		
		always @(posedge Clock, posedge Reset)
			begin
				if(Reset)
					ClockDiv <= 1'b0;
				else if (Counter == CountLimit - 1)
					ClockDiv <= ~ClockDiv;
				else
					ClockDiv <= ClockDiv;
			end
			
		always @(posedge ClockDiv, posedge Reset)
			begin
				if(Reset)
					MR <= 16'b0;
				else if (RampFlag)
					begin
						if (M == 16'b0 || MR == 16'b0)
							MR <= MValues[START];
						else if (UpFlag)
							MR <= M + MValues[UP];
						else if (DownFlag)
							MR <= M - MValues[DOWN];
						else
							MR <= M;
					end
				else
					MR <= M;
			end


		always @ (posedge Clock, posedge Reset)
			begin
				if(Reset)
					M <= 16'b0;
				else if (StaticFlag)
					M <= MS;
				else if (RampFlag)
					M <= MR;
				else
					M <= M;
			end

endmodule
