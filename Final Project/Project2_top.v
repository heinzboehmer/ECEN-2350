module Project2_top(switch, button, display, LED, clk);

	input clk;
	input [9:0]switch;
	input [1:0]button;
	
	output [28:0]display;
	output [9:0]LED;
	
	wire clkDW;
	wire [1:0]buttonDW;
	wire [27:0]displayW;
	
	wire dummyW;
	wire [15:0]randW;
	wire compareStopW;
	wire [15:0]BCDCounterW;
	wire [15:0]compareCounterW;
	wire [9:0]LEDW;
	wire [15:0]highscoreW;
	wire [15:0]multiplexerW;
	
	Clock_divider cD(clk, clkDW);
	debounce d(clk, ~button, buttonDW);
		
	hex_counter compareCounter(clkDW, buttonDW[0], ~compareStopW, buttonDW[1], compareCounterW); //starts and resets with button0, stops when comparison is true
	LFSR LFSR(clkDW, buttonDW[0]||buttonDW[1], randW);
	comparison compare(compareCounterW, randW, clk, ~(buttonDW[1]||buttonDW[0]), LEDW, compareStopW); //compares value of compareCounter to LFSR
	
	BCD_counter reactionCounter(clkDW, LEDW[0], buttonDW[1], switch[9]||buttonDW[0], BCDCounterW);

	highscore hs(buttonDW[1], BCDCounterW, highscoreW);
	
	multiplexer2to1 m(switch[0], BCDCounterW, randW, multiplexerW);
	
	decoder decoder0(multiplexerW[3:0], displayW[6:0]);
	decoder decoder1(multiplexerW[7:4], displayW[13:7]);
	decoder decoder2(multiplexerW[11:8], displayW[20:14]);
	decoder decoder3(multiplexerW[15:12], displayW[27:21]);
		
	assign display=displayW;
	assign display[28]=0;
	assign LED=LEDW;

endmodule
