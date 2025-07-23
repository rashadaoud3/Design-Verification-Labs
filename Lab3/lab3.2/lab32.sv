module adder4bit (
input logic [3:0] ina, inb,
input logic carry_in,
output logic carry_out,
output logic [3:0] sum_out
);

logic [4:0] temp;

always_comb begin

	temp = ina + inb + carry_in;
	{carry_out, sum_out} = temp;

end




endmodule 
