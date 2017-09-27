module comparison(a, b, clk, nReset, LED, stopSig);

	input [11:0]a, b;
	input clk, nReset;
	output reg [9:0]LED=0;
	output reg stopSig=0;
	
	always@(posedge clk, negedge nReset)
		begin
			if(~nReset)
				begin
					LED=0;
					stopSig=0;
				end
				
			else
				begin
					if(a==b)
						begin
							LED=10'b1111111111;
							stopSig=1;
						end
					
					else LED=0;
				end
			
		end

endmodule

