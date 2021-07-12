
module ALU8bit_tb;
	reg[2:0] opcode;
	reg[7:0] operand1;
	reg[7:0] operand2;
	wire[15:0] result;
	wire flagC;
	wire flagZ;
	reg[2:0] count = 4'b0000;
	
	ALU8bit uut(
		.opcode(opcode),
		.operand1(operand1),
		.operand2(operand2),
		.result(result),
		.flagC(flagC),
		.flagZ(flagZ)
	);
	
	initial
	begin
		opcode = 4'b0000;
		operand1  = 8'h00;
		operand2  = 8'h00;
		
		#100
		operand1 = 8'hAA;  // 170
		operand2 = 8'h55;  // 85
		for (count = 0; count < 16; count = count + 1'b1)
		begin
			opcode = count;
			#20;
		end
	end

endmodule