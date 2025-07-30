`timescale 1ns/1ps

module memory_module;
  logic [7:0] mem [0:3];  // 4 memory locations, each 8-bit wide

  // Task to write to memory
  task automatic write_mem(input int addr, input logic [7:0] data);
    begin
      #5;
      mem[addr] = data;
      $display("Time %0t: WRITE -> mem[%0d] = %0h", $time, addr, data);
    end
  endtask

  // Task to read from memory
  task automatic read_mem(input int addr);
    begin
      #4;
      $display("Time %0t: READ  <- mem[%0d] = %0h", $time, addr, mem[addr]);
    end
  endtask
endmodule

