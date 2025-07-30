`timescale 1ns/1ps

module testbench;
  logic [7:0] wdata1 = 8'hA5;
  logic [7:0] wdata2 = 8'h3C;
  int addr = 1;

  // Instantiate DUT
  memory_module dut();

  initial begin
    $display("Starting simulation without semaphore (shared memory issue possible)");
    
    fork
      begin
        dut.write_mem(addr, wdata1);
      end
      begin
        dut.read_mem(addr);
      end
    join

    #10;
    // Second conflicting access
    fork
      begin
        dut.write_mem(addr, wdata2);
      end
      begin
        dut.read_mem(addr);
      end
    join

    $finish;
  end
endmodule

