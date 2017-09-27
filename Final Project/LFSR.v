module LFSR(clk, run, rand);

	input clk, run;
	parameter n=12; //number of bits for random number
	output [n-1:0]rand;
	
	wire dummyW;
	wire clkW;
	wire [n:0]loopW;
	
	reg enable=1;
	
	assign clkW=clk&enable;
	
	always@(clk)
		begin
			if(run)
				enable=1;
			else
				enable=0;
		end
	
	genvar i;
	
	generate
		 for (i=0; i<n; i=i+1)
			begin : flipFlopLoop
				D_flip_flop d(clkW, 1, loopW[i], loopW[i+1], dummyW);
			end 
	endgenerate
	
	assign loopW[0]=~(loopW[n-1]^loopW[n-2]);
	assign rand[n-1:0]=loopW[n:1];
	
endmodule
