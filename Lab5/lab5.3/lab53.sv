
class Register;
  logic [7:0] data;

  
  static int instance_count = 0;

  
  function new(logic [7:0] value = 8'h00);
    data = value;
    instance_count++;
  endfunction

  
  function void load(logic [7:0] value);
    data = value;
  endfunction

  
  function logic [7:0] get_data();
    return data;
  endfunction

  
  static function int get_instance_count();
    return instance_count;
  endfunction
endclass


class ShiftLeftRegister extends Register;

  function new(logic [7:0] value = 8'h00);
    super.new(value);
  endfunction

  function void shiftLeft();
    data = {data[6:0], 1'b0};
  endfunction
endclass


class ShiftRightRegister extends Register;

  function new(logic [7:0] value = 8'h00);
    super.new(value);
  endfunction

  function void shiftRight();
    data = {1'b0, data[7:1]};
  endfunction
endclass

