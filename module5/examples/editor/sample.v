// Sample file for Module 5 editor example.
// Open from terminal: nano sample.v   or   code sample.v
// Practice search (Ctrl+W in nano, Ctrl+F in VS Code) for "clock".

module sample (
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
