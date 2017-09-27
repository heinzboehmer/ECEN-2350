module D_flip_flop(clk, nClr, D, Q, nQ);

	input clk, nClr, D;
	output reg Q;
	output nQ;
	
	always@(posedge ~nClr, posedge clk)
		begin
		
			if(~nClr)
				begin
					Q=0;
				end
				
			else
				begin
					Q=D;
				end
		
		end

	assign nQ=~Q;
	
endmodule
