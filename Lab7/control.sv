module control (
input logic clk,
input logic rst_,
input logic zero,
input logic [2:0] opcode,
output logic mem_rd,
output logic load_ir,
output logic halt,
output logic inc_pc,
output logic load_ac,
output logic load_pc,
output logic mem_wr

);

timeunit 1ns;
timeprecision 1ns;

typedef enum logic [2:0] {
    ADD = 3'b000,
    AND = 3'b001,
    XOR = 3'b010,
    LDA = 3'b011,
    STO = 3'b100,
    JMP = 3'b101,
    SKZ = 3'b110,
    HLT = 3'b111
} opcodee;

typedef enum logic [2:0] {
    INST_ADDR, INST_FETCH, INST_LOAD,
    IDLE, OP_ADDR, OP_FETCH,
    ALU_OP, STORE
} statee;



statee current_state, next_state;
opcodee op;


assign op = opcode;


always_ff @ (posedge clk or negedge rst_) begin
	if (!rst_)
		current_state <= INST_ADDR;
	else
		current_state <= next_state;
end



always_comb begin
    unique case (current_state)
      INST_ADDR:  next_state = INST_FETCH;
      INST_FETCH: next_state = INST_LOAD;
      INST_LOAD:  next_state = IDLE;
      IDLE:       next_state = OP_ADDR;
      OP_ADDR:    next_state = OP_FETCH;
      OP_FETCH:   next_state = ALU_OP;
      ALU_OP:     next_state = STORE;
      STORE:      next_state = INST_ADDR;
      default:    next_state = INST_ADDR;
    endcase
  end



function logic is_aluop(opcodee op);
    return (op == ADD || op == AND || op == XOR || op == LDA);
endfunction


always_comb begin
  
  mem_rd = 0;
  load_ir = 0;
  halt = 0;
  inc_pc = 0;
  load_ac = 0;
  load_pc = 0;
  mem_wr = 0;

  unique case (current_state)
      INST_ADDR: begin
        mem_rd = 0;
      end

      INST_FETCH: begin
        mem_rd = 1;
      end

      INST_LOAD: begin
        mem_rd = 1;
        load_ir = 1;
        //inc_pc = 1;
      end

    IDLE: begin
      if (op == HLT)
        halt = 1;
    end
    OP_ADDR: begin
      if (op == HLT) halt = 1;
      inc_pc = 1;

    end

    OP_FETCH: begin
      if (is_aluop(op)) mem_rd = 1;
    end

    ALU_OP: begin
      if (is_aluop(op)) begin
        mem_rd = 1;
        load_ac = 1;
      end
      if (op == JMP) load_pc = 1;
      if (op == SKZ && zero == 1) inc_pc = 1;
    end

    STORE: begin
      if (is_aluop(op)) begin
        mem_rd = 1;
        load_ac = 1;
      end
      if (op == JMP) begin
        inc_pc = 1;
        load_pc = 1;
      end
      if (op == STO) mem_wr = 1;
    end
    
  endcase
end


endmodule

