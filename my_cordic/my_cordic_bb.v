
module my_cordic (
	clk,
	areset,
	a,
	c,
	s);	

	input		clk;
	input		areset;
	input	[26:0]	a;
	output	[9:0]	c;
	output	[9:0]	s;
endmodule
