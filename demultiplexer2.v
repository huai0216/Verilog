module demultiplexer2(a, b, enable, z);
	input a, b, enable;
	output[3:0] z;
	
	assign z[0] = |{~enable, a, b};
	assign z[1] = ~(enable & a & ~b);
	assign z[2] = ~(enable & ~a & b);
	assign z[3] = enable ?~(a & b):1'b1;
	
endmodule
