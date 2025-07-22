module prbs (raand, clk, reset);
input clk, reset;
output reg raand;

reg [3:0] current_state;
//reg [3:0] temp_reg;

//
wire feedback;
assign feedback = current_state[3] ^ current_state[0];


always @(posedge clk or posedge reset) begin
	if(reset)begin
		current_state = 4'b1;
	end
	else begin
		
		current_state <= {feedback, current_state[3:1]};


	end





end

assign raand = current_state[0]; // leaast LSB

endmodule
