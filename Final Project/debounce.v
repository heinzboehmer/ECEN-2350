module debounce(clk,bounced,debounced);

	input [1:0]bounced;
	input clk;
	reg [19:0]i;
	reg [1:0]debouncedW;
	output [1:0]debounced;

	always@(posedge clk)
		begin
			
			i=i+1;
			
			if(i==20'hfffff)
				debouncedW=bounced;
			
		end
		
	assign debounced=debouncedW;

endmodule
