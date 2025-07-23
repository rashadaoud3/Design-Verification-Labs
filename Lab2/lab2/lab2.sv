module register_design(
input logic [15:0]wdata,
input logic sel,
input logic wr,
input logic clk,
input logic reset,
input logic [1:0] addr,
output logic [15:0] rdata
);

reg [15:0] mem [3:0]; // packed + unpacker --> 4 registers, each with 16 bit width

always_ff @ (posedge clk) begin
	if(reset)
		rdata <= 16'b0; 
	else if(sel && wr)
		mem[addr] <= wdata;
	else if(sel)
		rdata <= mem[addr];
	

end


endmodule
