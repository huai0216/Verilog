module vendingmachine(clk, money, select, item, change);
	input wire clk;
	input wire[1:0] money, select;
	output reg[1:0] item, change;
	

	parameter[1:0]
		ten = 2'b01, 
		fifty = 2'b10,
		selectnothing = 2'b00,
		choosetwenty = 2'b01,
		choosefifty = 2'b10,
		noitem = 2'b00,
		twentyitem = 2'b01, 
		fiftyitem = 2'b10,
		nochange = 2'b00,
		changeten = 2'b01,
		changethirty = 2'b10,
		changeforty = 2'b11, 
		start = 2'b00, 
		notenough = 2'b01, 
		buytwenty = 2'b10, 
		buyall = 2'b11;
		
	reg[1:0]
		mode = start, 
		nextmode = start,
		again;

	always @(clk)
	begin
		if (mode == start)
			again = 1'b1;
		else
			again = 1'b0;
		mode = nextmode;
	end
		
	always @(select, money, mode)
	begin
		change = nochange;
		nextmode = mode;
		item = noitem;
		case (mode)
			start:
				if (money == ten)
					nextmode = notenough;
				else if (money == fifty)
					nextmode = buyall;
			buyall:
			begin
				nextmode = start;
				if (select == choosetwenty)
				begin
					item = twentyitem;
					if (again)
						change = changethirty;
					else
						change = changeforty;
				end
				else
				begin
					item = fiftyitem;
					if (~again)
						change = changeten;
				end
			end
			buytwenty:
			begin
				item = twentyitem;
				nextmode = start;
			end
			notenough:
				if (money == ten)
					nextmode = buytwenty;
				else if (money == fifty)
					nextmode = buyall;
		endcase
	
	end
	

endmodule
