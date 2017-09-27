module multiplier(x,p,cout);

	input [7:0]x;
	output [7:0]p, cout;

	assign p[0]=0;
	assign p[1]=x[0];
	assign p[2]=x[1];
	assign p[3]=x[2];
	assign p[4]=x[3];
	assign p[5]=x[4];
	assign p[6]=x[5];
	assign p[7]=x[6];
	assign cout=x[7];
	

endmodule
