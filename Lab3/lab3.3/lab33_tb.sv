module test_d_flipflop;

reg clear, preset, clk, d;
wire q;

d_flipflop dut(.clear(clear), .preset(preset), .clk(clk), .d(d), .q(q));

initial begin
	clk = 0;
	forever begin
	#5 clk = ~clk;
	end
end

integer errors = 0;
reg expected;

task check_result(input logic expected);
    

begin
      #1; 
      if (q !== expected) begin
        errors = errors + 1;
        $display("Error at time %0t: Expected = %b, Got = %b", $time, expected, q);
      end else begin
        $display("Correct at time %0t: Q = %b", $time, q);
      end
    end


endtask



initial begin 
	preset = 0;
	clear = 1;
	@(posedge clk);
	expected = 1;
	check_result(expected);

	#20;
	preset = 1;
	clear = 0;
	@(posedge clk);
	expected = 0;
        check_result(expected);


	#20;
	clear = 1;
	d = 1;
	@(posedge clk);
	expected = 1;
        check_result(expected);


	#20;
	d = 0;
	@(posedge clk);
	expected = 0;
        check_result(expected);


	#20;
	preset = 0;
	clear = 0;
	// expected = undefined x;
        
	$display("Test finished with %0d error(s).", errors);
        $finish;


end







endmodule
