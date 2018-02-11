`timescale 1ns / 1ps

module Adder(
    input [15:0] OldTotalBus,
    input [15:0] Switch,
    output reg [15:0] NewTotalBus
    );
	 
	 
	 always @ (Switch, OldTotalBus)
		NewTotalBus = (Switch == 16'b0) ? 16'b0: Switch + OldTotalBus;

endmodule
