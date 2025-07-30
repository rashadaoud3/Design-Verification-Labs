`timescale 1ns/1ps

module testbench;

  // Declare mailbox and message struct
  mailbox my_mailbox;

  typedef struct {
    int val;
    string name;
  } message_t;

  // Task1: puts value in mailbox
  task task1;
    message_t msg;
    begin
      msg.val = 42;
      msg.name = "Task1_Message";
      $display("Time %0t: task1 putting (%0d, \"%s\") into mailbox", $time, msg.val, msg.name);
      #5;
      my_mailbox.put(msg);
    end
  endtask

  // Task2: gets value from mailbox
  task task2;
    message_t received_msg;
    begin
      #10;
      my_mailbox.get(received_msg);
      $display("Time %0t: task2 received (%0d, \"%s\") from mailbox", $time, received_msg.val, received_msg.name);
    end
  endtask

  // Simulation logic
  initial begin
    $display("Simulation with mailbox communication starting...");
    my_mailbox = new();

    fork
      task1();
      task2();
    join

    $display("Simulation finished.");
    $finish;
  end

endmodule

