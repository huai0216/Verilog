module demultiplexer_tb;
	reg a, b, enable;
	wire[3:0]structural_z,dataflow_z,behavorial_z;
	
	demultiplexer1 structural(a, b, enable, structural_z);
	demultiplexer2 dataflow(a, b, enable, dataflow_z);
	demultiplexer3 behavorial(a, b, enable, behavorial_z);
	
	initial begin
		$dumpfile("demultiplexer.vcd"); $dumpvars(1, demultiplexer_tb);
		
		enable = 0; a = 0; b = 0;
		#10 enable = 1;
		#10 a = 1;
		#10 a = 0; b = 1;
		#10 a = 1;
		#10 enable = 0;
		$finish;
		end
		
endmodule
	