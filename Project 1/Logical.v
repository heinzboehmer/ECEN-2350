module logic(sw,result);

	input [9:0]sw;
	output [7:0]result;

	wire [8:0]andW;
	wire [8:0]orW;
	wire [8:0]xorW;
	wire [8:0]notW;

	multiplexer logic(sw[9:8],andW,orW,xorW,notW,result);
	
	assign andW=(sw[7:4])&(sw[3:0]);
	assign orW=(sw[7:4])|(sw[3:0]);
	assign xorW=(sw[7:4])^(sw[3:0]);
	assign notW=~sw[7:0];

endmodule
