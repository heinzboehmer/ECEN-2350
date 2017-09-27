module fullSubtractor(binF,xF,yF,dF,boutF);

		input binF,xF,yF;
		output reg dF;
		output reg boutF;
		
		always@(binF,xF,yF)
			begin
				boutF=(~xF&binF)|(~xF&yF)|(yF&binF);
				dF=(xF)^(yF)^(binF);
			end

endmodule


module rippleBorrowSubtractor(bin,x,y,d,bout);

	parameter n=4;
	input bin;
	input [n-1:0]x;
	input [n-1:0]y;
	output [n-1:0]d;
	output bout;
	wire [n:0]bW;
	wire [n-1:0]dW;
	
	genvar i;
	
	generate
		for (i=0; i<n; i=i+1)
			begin:
				subtractorLoop
				fullSubtractor stage(bW[i],x[i],y[i],dW[i],bW[i+1]);
			end
	endgenerate
	
	assign bW[0]=bin;
	assign bout=bW[n];
	assign d=dW;

endmodule
