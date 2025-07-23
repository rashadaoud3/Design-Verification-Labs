module test_adder4bit;

reg [3:0] ina, inb;
reg carry_in;

wire carry_out;
wire [3:0] sum_out;


adder4bit dut(.ina(ina), .inb(inb), .carry_in(carry_in), .carry_out(carry_out), .sum_out(sum_out));



initial begin
    ina = 4'b1010;
    inb = 4'b0001;
    carry_in = 1;
    #10;
    check_result(ina, inb, carry_in);

    
    ina = 4'b1111;
    inb = 4'b1111;
    carry_in = 1;
    #10;
    check_result(ina, inb, carry_in);

    
    ina = 4'b0000;
    inb = 4'b0000;
    carry_in = 0;
    #10;
    check_result(ina, inb, carry_in);

    
    ina = 4'b0101;
    inb = 4'b1010;
    carry_in = 0;
    #10;
    check_result(ina, inb, carry_in);

    
    ina = 4'b0011;
    inb = 4'b0101;
    carry_in = 1;
    #10;
    check_result(ina, inb, carry_in);

    
    $finish;

end


 function bit check_result(input [3:0] a, input [3:0] b, input bit cin);
    logic [4:0] expected, actual;
    
      begin
      expected = a + b + cin;
      actual = {carry_out, sum_out};

      if (expected === actual)
        $display("Pass: %b + %b + %b = %05b", a, b, cin, actual);
      else
        $display("Fail: %b + %b + %b → Expected %05b, Got %05b", a, b, cin, expected, actual);
      return (expected === actual);
    end
  endfunction



endmodule
