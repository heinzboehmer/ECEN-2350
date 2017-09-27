module counter(clk, nClr, enable, count);

	input clk, nClr, enable;
	parameter n=4; //n-bit counter
	output reg [n-1:0]count;

	always@(posedge clk, negedge nClr)
		begin

			if (~nClr)
				count=0;	
				
			else if (enable) 
				count=count+1;

		end
				
endmodule
