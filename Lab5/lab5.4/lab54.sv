
class Register #(parameter int DATA_WIDTH = 8);
  logic [DATA_WIDTH-1:0] data;
  static int instance_count = 0;


  function new(logic [DATA_WIDTH-1:0] value = 0);
    data = value;
    instance_count++;
  endfunction

  function void load(logic [DATA_WIDTH-1:0] value);
    data = value;
  endfunction

  function logic [DATA_WIDTH-1:0] get_data();
    return data;
  endfunction

  static function int get_instance_count();
    return instance_count;
  endfunction
endclass


class ShiftLeftRegister #(parameter int DATA_WIDTH = 8) extends Register #(DATA_WIDTH);

  function new(logic [DATA_WIDTH-1:0] value = 0);
    super.new(value);
  endfunction

  function void shiftLeft();
    data = {data[DATA_WIDTH-2:0], 1'b0};
  endfunction
endclass


class ShiftRightRegister #(parameter int DATA_WIDTH = 8) extends Register #(DATA_WIDTH);

  function new(logic [DATA_WIDTH-1:0] value = 0);
    super.new(value);
  endfunction

  function void shiftRight();
    data = {1'b0, data[DATA_WIDTH-1:1]};
  endfunction
endclass

