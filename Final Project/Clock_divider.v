module Clock_divider(clk, clkDivided);

	input clk;
	
	integer i=0;
	parameter frequency=1000; //desired frequency of divided clock output in hertz
	
	output reg clkDivided=0;
	
	always@(posedge clk)
		begin
			
			i=i+1;
			
			if(i==50000000/(2*frequency))
				begin
				
					clkDivided=clkDivided^1;
					i=0;
				
				end
			
		end

endmodule
