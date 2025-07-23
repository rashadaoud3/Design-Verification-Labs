module adder4bit (// continuous
input logic [3:0] ina, inb,
input logic carry_in,
output logic carry_out,
output logic [3:0] sum_out
);

wire [4:0] temp;

        assign temp = ina + inb + carry_in;
        assign carry_out = temp[4];
        assign sum_out = temp [3:0];



endmodule



