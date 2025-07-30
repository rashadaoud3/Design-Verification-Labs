module testbench;

  Calculator calc;
  real res;

  initial begin
    
    calc = new();

   
    calc.add(5.5, 2.5, res);
    $display("5.5 + 2.5 = %0.2f", res);

    
    calc.sub(10.0, 3.5, res);
    $display("10.0 - 3.5 = %0.2f", res);

    
    calc.multi(4.0, 2.0, res);
    $display("4.0 * 2.0 = %0.2f", res);

 
    calc.div(8.0, 2.0, res);
    $display("8.0 / 2.0 = %0.2f", res);

    
    calc.div(5.0, 0.0, res);

    
    $display("2^3 = %0.2f", Calculator::power(2, 3));

    $finish;
  end

endmodule

