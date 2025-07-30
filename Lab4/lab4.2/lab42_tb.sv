`timescale 1ns/1ps

module testbench;

  import "DPI-C" function void srand(input int seed);

  logic [7:0] data_write1 = 8'hA5;
  logic [7:0] data_write2 = 8'h3C;
  memory_module mem_inst();

  // Task to write to memory with semaphore protection
  task write_mem(input int index, input logic [7:0] data);
    mem_inst.sema.get();  // Acquire semaphore
    #5;
    mem_inst.mem[index] = data;
    $display("Time %0t: WRITE -> mem[%0d] = %h", $time, index, data);
    mem_inst.sema.put();  // Release semaphore
  endtask

  // Task to read from memory with semaphore protection
  task read_mem(input int index);
    mem_inst.sema.get();  // Acquire semaphore
    #5;
    $display("Time %0t: READ  <- mem[%0d] = %h", $time, index, mem_inst.mem[index]);
    mem_inst.sema.put();  // Release semaphore
  endtask

  initial begin
    $display("Starting simulation with semaphore (avoids shared memory issue)");

    fork
      begin
        write_mem(1, data_write1);
        #10;
        write_mem(1, data_write2);
      end

      begin
        #1;
        read_mem(1);
        #10;
        read_mem(1);
      end
    join

    $finish;
  end

endmodule

