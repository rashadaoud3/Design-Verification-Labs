module testbench;

  ShiftLeftRegister  sl1, sl2;
  ShiftRightRegister sr1;

  initial begin
    
    sl1 = new(8'h1A);
    sl2 = new(8'h2B);
    sr1 = new(8'h3C);

    
    sl1.shiftLeft();
    sr1.shiftRight();

    
    $display("SL1 after shiftLeft: %h", sl1.get_data());
    $display("SR1 after shiftRight: %h", sr1.get_data());

    
    $display("Total Register instances: %0d", Register::get_instance_count());

   
    $display("SLR instance count (via ShiftLeftRegister): %0d", ShiftLeftRegister::get_instance_count());
    $display("SRR instance count (via ShiftRightRegister): %0d", ShiftRightRegister::get_instance_count());

    $finish;
  end
endmodule

