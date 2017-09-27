module Project1_top(switch,button,clock,display0,display1,display2,display3,display4,display5,LED);

	input [9:0]switch;
	input [1:0]button;
	input clock;
	
	output reg [6:0]display0;
	output reg [6:0]display1;
	output reg [6:0]display2;
	output reg [6:0]display3;
	output reg [6:0]display4;
	output reg [6:0]display5;
	output reg [9:0]LED;
	
	wire [6:0]displayW0;
	wire [6:0]displayW1;
	wire [6:0]displayW2;
	wire [6:0]displayW3;
	wire [6:0]displayW4;
	wire [6:0]displayW5;
	wire [1:0]modeW;
	wire [9:0]muxOut;
	wire [9:0]arithmeticW;
	wire [9:0]logicW;
	wire [9:0]comparisonW;
	wire [9:0]magicW;
	
	modeSelector mode(~button,clock,modeW);
	multiplexer mux0(modeW,arithmeticW,logicW,comparisonW,magicW,muxOut);
	
	arithmetic a(switch,arithmeticW);
	logic l(switch,logicW);
	comparison s(switch, comparisonW);
	magic m(clock,magicW);
	
	decoder decoder0(muxOut[3:0],displayW0);
	decoder decoder1(muxOut[7:4],displayW1);
	decoder decoder2(switch[3:0],displayW2);
	decoder decoder3(switch[7:4],displayW3);
	decoder decoder4(switch[9:8],displayW4);
	decoder decoder5(modeW,displayW5);
	
	always@(modeW)
		begin
		
			case(modeW)
			
				2'b11:
					begin
						display0=7'b1000000;
						display1=7'b1000000;
						display2=7'b1000000;
						display3=7'b1000000;
						display4=7'b1000000;
						display5=displayW5;
						LED=muxOut;
					end
						
				default:
					begin
						display0=displayW0;
						display1=displayW1;
						display2=displayW2;
						display3=displayW3;
						display4=displayW4;
						display5=displayW5;
						LED[8:0]=9'b000000000;
						LED[9]=muxOut[8];
					end
					
				endcase
				
		end
	
endmodule
