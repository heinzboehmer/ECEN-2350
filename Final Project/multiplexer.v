module multiplexer2to1(s,a,b,f);

	input s;
	input [15:0]a;
	input [15:0]b;

	output reg [15:0]f;

	always@(s)
		begin
			case (s)
				2'b0 : f=a;	//0
				2'b1 : f=b;	//1
			endcase
		end

endmodule