module testprbs; 
reg clk, reset;
wire raand;

prbs dut(.clk(clk), .reset(reset), .raand(raand) );

initial begin
	clk = 0;
	forever
	#10 clk = ~clk;

end

initial begin
        
        reset = 1;
	#15;
	reset = 0;

	#300;
	$finish;
end

always @(posedge clk) begin
  $display("Time = %0t | rand = %b", $time, raand);
end




endmodule
