module demultiplexer1(in1, in2, enable, out);
	input in1, in2, enable;
	output[3:0]out;
	wire bar1, bar2;
	
	not v0(bar1, in1), v1(bar2, in2);
	nand n0(out[0], enable, bar1, bar2);
	nand n1(out[1], enable, in1, bar2);
	nand n2(out[2], enable, bar1, in2);
	nand n3(out[3], enable, in1, in2);

endmodule
