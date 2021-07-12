module ALU8bit(opcode, operand1, operand2, result, flagC, flagZ);
	input [2:0] opcode;
	input [7:0] operand1, operand2;
	output reg [15:0] result = 16'h0000;
	output reg flagC = 1'b0, flagZ = 1'b0;
	
	parameter [3:0] 	add  = 4'b0000,
							addc = 4'b0001,
							sub  = 4'b0010,
							subb = 4'b0011,
							inc  = 4'b0100,
							dec  = 4'b0101,
							_and = 4'b0110,
							_or  = 4'b0111,
							_xor   = 4'b1000,
							_not  = 4'b1001,
							shiftl  = 4'b1010,
							shiftr  = 4'b1011;
							
	always @ (opcode or operand1 or operand2)
	begin 
		case (opcode)
		add: begin
			result = operand1 + operand2;
			flagC = 1'b0;
			flagZ = (result == 16'h0000);
		end
		addc: begin
			result = operand1 + operand2;
			flagC = result[8];
			flagZ = (result == 16'h0000);
		end
		sub: begin
			result = operand1 - operand2;
			flagC = 1'b0;
			flagZ = (result == 16'h0000);
		end
		subb: begin
			result = operand1 - operand2;
			flagC = result[8];
			flagZ = (result == 16'h0000);
		end
		inc: begin
			result = operand1 + 1'b1;
			flagC = result[8];
			flagZ = (result == 16'h0000);
		end
		dec: begin
			result = operand1 - 1'b1;
			flagC = result[8];
			flagZ = (result == 16'h0000);
		end
		_and: begin
			result = operand1 & operand2;
			flagZ = (result == 16'h0000);
		end
		_or: begin
			result = operand1 | operand2;
			flagZ = (result == 16'h0000);
		end
		_xor: begin
			result = operand1 ^ operand2;
			flagZ = (result == 16'h0000);
		end
		_not: begin
			result = ~operand1;
			flagZ = (result == 16'h0000);
		end
		shiftl: begin
			result = operand1 << 1;
			flagZ = (result == 16'h0000);
		end
		shiftr: begin
			result = operand1 >> 1;
			flagZ = (result == 16'h0000);
		end
		default: begin
			result = 16'h0000;
			flagC = 1'b0;
			flagZ = 1'b0;
		end
		endcase
					
	end


endmodule
