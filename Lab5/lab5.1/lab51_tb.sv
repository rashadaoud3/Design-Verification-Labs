module testbench;
  
  ShiftRightRegister sr;
  ShiftLeftRegister sl;

  initial begin
    
    sr = new(8'hA5);
    sl = new(8'h3C);

    $display("SR initial data: %h", sr.get_data());
    sr.shift_right();
    $display("SR after shift right: %h", sr.get_data());

    $display("SL initial data: %h", sl.get_data());
    sl.shift_left();
    $display("SL after shift left: %h", sl.get_data());

    $finish;
  end
endmodule

