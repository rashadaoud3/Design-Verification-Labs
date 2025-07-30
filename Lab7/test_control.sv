`timescale 1ns/1ns

module testbench;

  logic clk;
  logic rst_;
  logic zero;
  logic [2:0] opcode;

  logic mem_rd, load_ir, halt, inc_pc, load_ac, load_pc, mem_wr;

  
  control dut (
    .clk(clk),
    .rst_(rst_),
    .zero(zero),
    .opcode(opcode),
    .mem_rd(mem_rd),
    .load_ir(load_ir),
    .halt(halt),
    .inc_pc(inc_pc),
    .load_ac(load_ac),
    .load_pc(load_pc),
    .mem_wr(mem_wr)
  );

  
  always #5 clk = ~clk;

  initial begin
    $display("~~~ Starting FSM test...");
    clk = 0;
    rst_ = 0;
    zero = 0;
    opcode = 3'b000; //ADD

    
    #10;
    rst_ = 1;

    //wait for FSM to go through 8 states
    repeat (8) begin
      @(posedge clk);
    end

    
    opcode = 3'b101; // JMP
    #1 $display("Testing JMP at time %t", $time);
    repeat (8) @(posedge clk);

    // Test SKZ with zero=1
    opcode = 3'b110;
    zero = 1;
    #1 $display("Testing SKZ with zero=1 at time %t", $time);
    repeat (8) @(posedge clk);
    zero = 0;

    // Test HLT
    opcode = 3'b111;
    #1 $display("Testing HLT at time %t", $time);
    repeat (8) @(posedge clk);

    // Test STO
    opcode = 3'b100;
    #1 $display("Testing STO at time %t", $time);
    repeat (8) @(posedge clk);

    $display("FSM test complete.");
    $finish;
  end

  // Monitor signals for debug
  always @(posedge clk) begin
    $display("Time %0t | opcode = %b | State: mem_rd=%b load_ir=%b halt=%b inc_pc=%b load_ac=%b load_pc=%b mem_wr=%b", 
             $time, opcode, mem_rd, load_ir, halt, inc_pc, load_ac, load_pc, mem_wr);
  end

endmodule

