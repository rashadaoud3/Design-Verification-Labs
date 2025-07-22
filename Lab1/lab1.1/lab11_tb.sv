module testslsr;

reg clk, reset, sl, sr, din;
wire [7:0]Q;

slsr dut(.clk(clk), .reset(reset), .sl(sl), .sr(sr), .din(din), .Q(Q) );

reg [7:0] expected_value;
    integer errors;


 initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

initial begin
    expected_value = 8'b0;
    errors = 0;
end    

task check_resullt();
    if (Q !== expected_value) begin
        errors = errors + 1;
        $display("Error at time %0t: expected = %b, got = %b", $time, expected_value, Q);
    end else begin
        $display("Correct: Q = %b", Q);
    end
endtask



initial begin
    reset = 1;
    sl = 0; sr = 0; din = 0;
    #10;
    reset = 0;

    // Shift Left with din = 1
    sl = 1; sr = 0; din = 1;
    @(posedge clk);
    #1;
    expected_value = {expected_value[6:0], din};
    check_resullt();

    // Shift Left with din = 0
    din = 0;
    @(posedge clk);
    #1;
    expected_value = {expected_value[6:0], din};
    check_resullt();

    // Shift Right with din = 1
    sl = 0; sr = 1; din = 1;
    @(posedge clk);
    #1;
    expected_value = {din, expected_value[7:1]};
    check_resullt();

    // Hold (no shift)
    sl = 0; sr = 0;
    @(posedge clk);
    check_resullt();

    $display("Test completed with %0d error(s).", errors);

    
    $finish;
end





endmodule
