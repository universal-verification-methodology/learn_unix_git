// Sample for Module 5 find_grep example.
// Contains CLOCK_SIGNAL for grep -R practice.
module top (
  input  wire CLOCK_SIGNAL,
  input  wire rst,
  output reg  [7:0] out
);
  always @(posedge CLOCK_SIGNAL or posedge rst) begin
    if (rst) out <= 8'd0;
    else out <= out + 1'b1;
  end
endmodule
