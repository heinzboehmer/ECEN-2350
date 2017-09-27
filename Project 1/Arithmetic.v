module arithmetic(sw,result);

	input [9:0]sw;
	output [8:0]result;

	wire [8:0]addW;
	wire [8:0]subW;
	wire [8:0]mulW;
	wire [8:0]divW;
	
	multiplexer muxArithmetic(sw[9:8],addW,subW,mulW,divW,result);
	
	rippleCarryAdder add(0,sw[7:4],sw[3:0],addW[3:0],addW[8]);
	rippleBorrowSubtractor sub(0,sw[7:4],sw[3:0],subW[3:0],subW[8]);
	multiplier mul(sw[7:0],mulW[7:0],mulW[8]);
	divider div(sw[7:0],divW[7:0],divW[8]);

endmodule
