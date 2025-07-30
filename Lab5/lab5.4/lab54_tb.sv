module testbench;

  
  ShiftLeftRegister #(8) sl8;
  ShiftRightRegister #(8) sr8;

  
  ShiftLeftRegister #(4) sl4;
  ShiftRightRegister #(4) sr4;

  initial begin
    
    sl8 = new(8'hA5);  
    sr8 = new(8'h3C);  

    sl8.shiftLeft();   
    sr8.shiftRight();  

    $display("8-bit SL after shift: %h", sl8.get_data());
    $display("8-bit SR after shift: %h", sr8.get_data());

    
    sl4 = new(4'b1010);
    sr4 = new(4'b1100);

    sl4.shiftLeft(); 
    sr4.shiftRight();  

    $display("4-bit SL after shift: %b", sl4.get_data());
    $display("4-bit SR after shift: %b", sr4.get_data());

    $finish;
  end
endmodule

