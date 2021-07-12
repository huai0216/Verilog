module Hw_4bitFullAdder(sum, c_out, a, b, cin);

	output[3:0] sum;
	output c_out;
	input cin;
	input[3:0] a, b;
	wire c0, c1, c2;
	
	FullAdder full_adder0(sum[0], c0, a[0], b[0], cin);
	FullAdder full_adder1(sum[1], c1, a[1], b[1], c0);
	FullAdder full_adder2(sum[2], c2, a[2], b[2], c1);
	FullAdder full_adder3(sum[3], c_out, a[3], b[3], c2);

	
endmodule

	module FullAdder(sum, carry, a, b, cin);
		input a, b, cin;
		output sum, carry;
		reg sum, carry;
		always @(a or b or cin)
			begin
			{carry, sum} = a + b + cin;
			end
		
endmodule
	
	