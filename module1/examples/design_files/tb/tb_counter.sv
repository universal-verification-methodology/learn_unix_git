// Minimal SystemVerilog testbench for Module 1 practice.
// Open with: cat tb_counter.sv   or   less tb_counter.sv

module tb_counter;
  logic       clk;
  logic       rst;
  logic [7:0] count;

  counter u_dut (
    .clk   ( clk   ),
    .rst   ( rst   ),
    .count ( count )
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    rst = 1;
    #20 rst = 0;
    #500 $finish;
  end

endmodule
