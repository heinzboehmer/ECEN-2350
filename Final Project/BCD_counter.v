module BCD_counter(clk, start, stop, reset, countBCD);

	input clk, start, stop, reset;
	parameter n=4; //number of counters
	integer i;
	reg nClrW, enableW;
	output [n*4-1:0]countBCD;
	
	counter BCD0(clk, ~(~countBCD[0]&countBCD[1]&~countBCD[2]&countBCD[3])&nClrW, enableW, countBCD[3:0]);
	counter BCD1(clk, ~(~countBCD[4]&countBCD[5]&~countBCD[6]&countBCD[7])&nClrW, (countBCD[0]&~countBCD[1]&~countBCD[2]&countBCD[3]&enableW), countBCD[7:4]);
	counter BCD2(clk, ~(~countBCD[8]&countBCD[9]&~countBCD[10]&countBCD[11])&nClrW, (countBCD[4]&~countBCD[5]&~countBCD[6]&countBCD[7]&countBCD[0]&~countBCD[1]&~countBCD[2]&countBCD[3]&enableW), countBCD[11:8]);
	counter BCD3(clk, ~(~countBCD[12]&countBCD[13]&~countBCD[14]&countBCD[15])&nClrW, (countBCD[8]&~countBCD[9]&~countBCD[10]&countBCD[11]&countBCD[4]&~countBCD[5]&~countBCD[6]&countBCD[7]&countBCD[0]&~countBCD[1]&~countBCD[2]&countBCD[3]&enableW), countBCD[15:12]);

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
