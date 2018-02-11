`timescale 1ns / 1ps


module KeyboardWrapper(
    input Clock,
    input btnCpuReset,
    input PS2Clk,
    input PS2Data,
	 output [7:0] ScanData,
	 output Valid
    );
	 
	 wire KeyClockOut;
	 wire Reset = ~btnCpuReset;
	 
	 

	 DeBouncer CleanTheSignal (
    .Clock(Clock), 
    .Reset(Reset), 
    .DataIn(PS2Clk), 
    .DataOut(KeyClockOut)
    );

	 Ps2Controller FindDataBus (
	 .Clock (Clock),
    .KClock(KeyClockOut), 
    .KData(PS2Data), 
	 .btnCpuReset(btnCpuReset),
    .KCode(ScanData),
	 .isValid(Valid)
    );
	 
endmodule
