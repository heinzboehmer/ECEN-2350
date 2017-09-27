module comparison(sw,result);

	input [9:0]sw;
	output [7:0]result;

	wire equalW;
	wire greaterW;
	wire lessW;
	reg [3:0]maxW;
	wire [3:0]temp;
	
	multiplexer logic(sw[9:8],equalW,greaterW,lessW,maxW,result);
	
	assign equalW=~(sw[7]^sw[3])&~(sw[6]^sw[2])&~(sw[5]^sw[1])&~(sw[4]^sw[0]);
	rippleBorrowSubtractor subGreater(0,sw[3:0],sw[7:4],temp[3:0],greaterW);
	rippleBorrowSubtractor subLess(0,sw[7:4],sw[3:0],temp[3:0],lessW);
	always@(sw[7:0])
		begin
			
			if(greaterW)
				maxW=sw[7:4];
				
			else
				maxW=sw[3:0];
		end



endmodule
