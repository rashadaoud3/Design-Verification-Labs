module d_flipflop(
input logic clear,
input logic preset,
input logic clk,
input logic d,
output logic q
);

always_ff @ (posedge clk or negedge clear or negedge preset) begin
	if(!preset)
		q <= 1;
	else if(!clear)
		q <= 0;
	else 
		q <= d;

end



endmodule
