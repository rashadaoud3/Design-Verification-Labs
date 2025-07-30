`timescale 1ns/1ps

module memory_module;

  logic [7:0] mem [0:3];
  semaphore sema;

  initial begin
    sema = new(1); 
  end

endmodule

