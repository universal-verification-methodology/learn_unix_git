// Sample for Module 5 find_grep example.
// Contains CLOCK_SIGNAL for grep -R practice.
module tb_top;
  reg CLOCK_SIGNAL;
  reg rst;
  wire [7:0] out;
  top u_dut (.CLOCK_SIGNAL(CLOCK_SIGNAL), .rst(rst), .out(out));
  initial begin
    CLOCK_SIGNAL = 0;
    forever #5 CLOCK_SIGNAL = ~CLOCK_SIGNAL;
  end
  initial begin
    rst = 1; #20 rst = 0; #500 $finish;
  end
endmodule
