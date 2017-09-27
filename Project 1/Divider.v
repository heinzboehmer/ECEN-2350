module divider(x,d,bout);

	input [7:0]x;
	output [7:0]d, bout;

	assign d[0]=x[1];
	assign d[1]=x[2];
	assign d[2]=x[3];
	assign d[3]=x[4];
	assign d[4]=x[5];
	assign d[5]=x[6];
	assign d[6]=x[7];
	assign d[7]=0;
	assign bout=x[0];
	

endmodule