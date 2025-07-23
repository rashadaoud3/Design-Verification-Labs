module test_register_design;
reg clk, reset, sel, wr;
reg [1:0] addr;
reg [15:0] wdata;

wire [15:0] rdata;

register_design dut(.clk(clk), .reset(reset), .sel(sel), .wr(wr), .addr(addr), .wdata(wdata), .rdata(rdata));

initial begin
	clk=0;
	forever begin
	#5;
	clk = ~clk;
end 
end

initial begin
	
	$monitor("Time: %0t | addr = %b | sel = %b | wr = %b | wdata = %h | rdata = %h", 
              $time, addr, sel, wr, wdata, rdata);
	
        reset = 1;
	sel = 0;
	wr = 0;
	addr = 0;
	//wdata = 0;

	#10;
	reset = 0;

	#20;
	sel = 1;
	wr = 1;
	addr = 2'b00;
	wdata= 16'h234A;
	#20;
	wr = 0;
	addr = 2'b00;
	#20;
        sel = 1;
        wr = 1;
        addr = 2'b10;
        wdata= 16'h2A2A;
	#20;
	wr = 0;
	addr = 2'b10;
	#100;
	$finish;

end




endmodule

