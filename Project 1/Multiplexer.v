module multiplexer(s,a,b,c,d,f);

	input [1:0]s;
	input [9:0]a;
	input [9:0]b;
	input [9:0]c;
	input [9:0]d;
	output reg [9:0]f;

	always@(s)
		begin
			case (s)
				2'b00 : f=a;	//0
				2'b01 : f=b;	//1
				2'b10 : f=c;	//2
				2'b11 : f=d;	//3
			endcase
		end

endmodule