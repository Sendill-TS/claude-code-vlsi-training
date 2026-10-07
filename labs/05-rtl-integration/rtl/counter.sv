// Free-running up counter with enable and synchronous clear.
module counter #(
  parameter int WIDTH = 8
) (
  input  logic             clk,
  input  logic             rst_n,
  input  logic             en,
  input  logic             clear,
  output logic [WIDTH-1:0] count,
  output logic             wrap
);

  assign wrap = en && (count == '1);

  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      count <= '0;
    end else if (clear) begin
      count <= '0;
    end else if (en) begin
      count <= count + 1'b1;
    end
  end

endmodule
