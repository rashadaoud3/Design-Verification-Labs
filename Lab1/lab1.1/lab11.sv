module slsr(sl, sr, din, clk, reset, Q);

input sl, sr, din, clk, reset;
output [7:0] Q;

logic [7:0] temp_reg;
// logic din;

assign Q = temp_reg;


always @(posedge clk or posedge reset) begin

if(reset)
	temp_reg <= 8'b0;
else if (sr == 1)
	temp_reg <= {din,temp_reg[7:1]};
else if (sl == 1)
	temp_reg <= {temp_reg[6:0],din};
else
	temp_reg <= temp_reg;

end



endmodule


