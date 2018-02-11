`timescale 1ns / 1ps
module ROM(
    input [9:0] Address,
	 input Clock,
    output reg [7:0] Data
    );
	 
	parameter ROM_WIDTH = 8;
   parameter ROM_ADDR_BITS = 10;

   (* ROM_STYLE="block" *)
   reg [ROM_WIDTH-1:0] Wavetable [(2**ROM_ADDR_BITS)-1:0];
   
   initial
      $readmemb("C:/Users/Aaron/Dropbox/sine_wave.list", Wavetable);

   always @(posedge Clock)
         Data <= Wavetable[Address];
				

endmodule
