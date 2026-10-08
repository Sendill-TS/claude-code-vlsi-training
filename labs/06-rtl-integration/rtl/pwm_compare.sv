// Registered PWM comparator: output is high while count < duty.
module pwm_compare #(
  parameter int WIDTH = 8
) (
  input  logic             clk,
  input  logic             rst_n,
  input  logic [WIDTH-1:0] count,
  input  logic [WIDTH-1:0] duty,
  output logic             pwm
);

  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      pwm <= 1'b0;
    end else begin
      pwm <= (count < duty);
    end
  end

endmodule
