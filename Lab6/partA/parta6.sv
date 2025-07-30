class Calculator;

 
  function new();
    $display("Calculator object created");
  endfunction

  
  task add(input real a, input real b, output real result);
    result = a + b;
  endtask

  
  task sub(input real a, input real b, output real result);
    result = a - b;
  endtask

  
  task multi(input real a, input real b, output real result);
    result = a * b;
  endtask

  
  task div(input real a, input real b, output real result);
    if (b != 0.0)
      result = a / b;
    else begin
      $display("Division by zero error!");
      result = 0.0;
    end
  endtask

  
  static function real power(input int base, input int exponent);
    int i;
    real result = 1.0;
    for (i = 0; i < exponent; i++) begin
      result *= base;
    end
    return result;
  endfunction

endclass

