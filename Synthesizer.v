`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:22:01 10/08/2014 
// Design Name: 
// Module Name:    Synthesizer 
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
module Synthesizer(
    input Clock,
    input btnCpuReset,
    input [15:0] Switch,
    output JA
    ); 

	wire [15:0] newData, OldData;
	wire [7:0] DataOut;
	wire ClockDiv, Reset;
	assign Reset = ~btnCpuReset;
	
	//assign ClockDiv = Clock;


ClockDivider ClockDivider (
    .Clock(Clock), 
    .Reset(Reset), 
    .ClockDiv(ClockDiv)
    );


Adder Adder (
    .OldTotalBus(OldData), 
    .Switch(Switch), 
    .NewTotalBus(newData)
    );

PhaseRegister PhaseRegister (
    .Clock(ClockDiv), 
    .DataIn(newData), 
    .Data(OldData)
    );

	ROM ROM (
    .Address(OldData[15:6]), 
	 .Clock(ClockDiv),
    .Data(DataOut)
    );

PWMWrapper PWM (
    .Clock(Clock), 
    .btnCpuReset(btnCpuReset), 
    .Switch(DataOut), 
    .JA(JA)
    );



endmodule
