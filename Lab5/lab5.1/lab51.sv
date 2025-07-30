
class Register;
  logic [7:0] data;

  
  function new(logic [7:0] init = 8'h00);
    data = init;
  endfunction

  
  function void load(logic [7:0] value);
    data = value;
  endfunction

  
  function logic [7:0] get_data();
    return data;
  endfunction
endclass


class ShiftRightRegister extends Register;

  
  function new(logic [7:0] init = 8'h00);
    super.new(init);
  endfunction

  
  function void shift_right();
    data = {1'b0, data[7:1]};
  endfunction
endclass


class ShiftLeftRegister extends Register;

  
  function new(logic [7:0] init = 8'h00);
    super.new(init);
  endfunction 

  function void shift_left();
    data = {data[6:0], 1'b0};
  endfunction
endclass
