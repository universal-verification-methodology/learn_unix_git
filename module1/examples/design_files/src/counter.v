// Minimal Verilog-style file for Module 1 practice.
// Open with: cat counter.v   or   less counter.v

module counter (
  input  wire       clk,
  input  wire       rst,
  output reg [7:0]  count
);

  always @(posedge clk or posedge rst) begin
    if (rst)
      count <= 8'd0;
    else
      count <= count + 1'b1;
  end

endmodule
