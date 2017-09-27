module modeSelector(sw,clk,select);

	input [1:0]sw;
	input clk;
	wire [1:0]swW;
	output reg [1:0]select;

	debounce d(clk,sw,swW);
		
	always@(posedge swW[0],posedge swW[1])
		begin

			if(swW[0])
				begin

					select=select-1;
				
					if(select<1)
						select=4;
				
				end
				
				
			else
				begin

					select=select+1;
			
					if(select>4)
						select=1;
				
				end
							
		end
		
endmodule
