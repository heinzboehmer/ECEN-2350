module hex_counter(clk, start, stop, reset, countHex);

	input clk, start, stop, reset;
	parameter n=3; //number of counters
	integer i;
	reg nClrW, enableW;
	output [n*4-1:0]countHex;
	
	counter hex0(clk, nClrW&~start, enableW, countHex[3:0]);
	counter hex1(clk, nClrW&~start, (countHex[0]&countHex[1]&countHex[2]&countHex[3]&enableW), countHex[7:4]);
	counter hex2(clk, nClrW&~start, (countHex[0]&countHex[1]&countHex[2]&countHex[3]&countHex[4]&countHex[5]&countHex[6]&countHex[7]&enableW), countHex[11:8]);

	always@(posedge start, negedge stop, posedge reset)
		begin
		
			if(reset)
				begin
					nClrW=0;
					enableW=0;
				end
			
			else if(start)
				begin
					nClrW=1;
					enableW=1;
				end
				
			else
				begin
					nClrW=1;
					enableW=0;
				end
				
		end

endmodule
