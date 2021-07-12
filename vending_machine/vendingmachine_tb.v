module vendingmachine_tb;
	
	reg clk;
	reg[1:0]  select, money;
	wire[1:0] change, item;
	
	vendingmachine 
		vendor(
			.clk(clk),
			.money(money),
			.select(select),
			.item(item),
			.change(change)
		);
	
	initial
	begin
		clk = 1'b0;
		money = 2'b00;
		select = 2'b00;
	end
	
	always
		#1
		clk = ~clk;
		
	always
	begin

		#5
		money = 2'b01;
		#5
		money = 2'b00;
		#5
		money = 2'b01;
		#5
		money = 2'b00;
		#5		
		money = 2'b10;
		#5
		money = 2'b00;
		#5
		select = 2'b01;
		#5
		select = 2'b00;
		#5
		money = 2'b10;
		#5
		money = 2'b00;
		#5
		select = 2'b10;
		#5
		select = 2'b00;
		#5
		money = 2'b01;
		#5
		money = 2'b00;
		#5
		money = 2'b10;
		#5
		money = 2'b00;
		#5
		select = 2'b01;
		#5
		select = 2'b00;
		#5
		money = 2'b01;
		#5
		money = 2'b00;
		#5
		money = 2'b10;
		#5
		money = 2'b00;
		#5
		select = 2'b10;
		#5
		select = 2'b00;
		#5
		$finish;
	
	end
	
	
endmodule
