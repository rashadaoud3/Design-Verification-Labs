module testbench;

  ShiftLeftRegister  sl;
  ShiftRightRegister sr;

  initial begin
    
    sl = new(8'h3C);
    sr = new(8'hA5); 

    
    $display("SL initial data: %h", sl.get_data());
    sl.shiftLeft();
    $display("SL after shiftLeft: %h", sl.get_data()); 

    
    $display("SR initial data: %h", sr.get_data());
    sr.shiftRight();
    $display("SR after shiftRight: %h", sr.get_data());

    $finish;
  end

endmodule

