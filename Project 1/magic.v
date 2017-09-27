module magic(clk,LEDs);

	input clk;
	reg [19:0]i;
	reg [4:0]count;
	reg backwards;
	output reg [9:0]LEDs;
	
	always@(posedge clk)
		begin
			
			i=i+1;
			
			if(i==20'hfffff && backwards==0)
					count=count+1;
				
			if(i==20'hfffff && backwards==1)
					count=count-1;
				
			if(count==9)
				backwards=1;
				
			if(count==0)
				backwards=0;
				
			case(count)
				
					0: LEDs=10'b0000000001;
					1: LEDs=10'b0000000010;
					2: LEDs=10'b0000000100;
					3: LEDs=10'b0000001000;
					4: LEDs=10'b0000010000;
					5: LEDs=10'b0000100000;
					6: LEDs=10'b0001000000;
					7: LEDs=10'b0010000000;
					8: LEDs=10'b0100000000;
					9: LEDs=10'b1000000000;
				
			endcase
					
			
		end

endmodule
