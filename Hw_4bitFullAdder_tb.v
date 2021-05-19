//'timescale 1ns/100ps
module Hw_4bitFullAdder_tb;
	reg cin;
	reg[3:0] a, b;
	wire[3:0] sum;
	wire c_out;

	Hw_4bitFullAdder INST (sum, c_out, a, b, cin);
	
	initial
	begin
		cin= 1'b0;
		a=4'b0000;
		b=4'b0000;
	end
	
	
	always
		begin
		#50 a= a+1;
		end
	always
		begin
		#100 b= b+1;
		end
		

initial
	$monitor("sum=%b, c_out=%b, a=%b, b=%b, cin=%cin", sum, c_out, a, b, cin);
initial
	begin
	$dumpfile("Hw_4bitFullAdder_tb");
	$dumpvar(0, Hw_4bitFullAdder_tb);
	end
endmodule
