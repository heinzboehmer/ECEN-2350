module highscore(run, currentScore, highscore);

	input run;
	input [15:0]currentScore;
	output reg [15:0]highscore=16'b1001100110011001;
	
	always@(negedge run)
		begin
			if(currentScore<highscore && currentScore>0)
				highscore=currentScore;
		end
		
endmodule
