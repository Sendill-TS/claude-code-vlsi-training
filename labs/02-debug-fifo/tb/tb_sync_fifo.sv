`timescale 1ns/1ps

module tb_sync_fifo;

  localparam int WIDTH = 8;
  localparam int DEPTH = 8;

  logic             clk = 1'b0;
  logic             rst_n = 1'b0;
  logic             wr_en = 1'b0;
  logic [WIDTH-1:0] wr_data = '0;
  logic             rd_en = 1'b0;
  logic [WIDTH-1:0] rd_data;
  logic             full;
  logic             empty;

  int errors = 0;

  sync_fifo #(
    .WIDTH(WIDTH),
    .DEPTH(DEPTH)
  ) dut (
    .clk    (clk),
    .rst_n  (rst_n),
    .wr_en  (wr_en),
    .wr_data(wr_data),
    .rd_en  (rd_en),
    .rd_data(rd_data),
    .full   (full),
    .empty  (empty)
  );

  always #5 clk = ~clk;

  task automatic push(input logic [WIDTH-1:0] data);
    @(negedge clk);
    wr_en   = 1'b1;
    wr_data = data;
    @(negedge clk);
    wr_en   = 1'b0;
  endtask

  task automatic pop_check(input logic [WIDTH-1:0] expected);
    @(negedge clk);
    if (rd_data !== expected) begin
      errors++;
      $display("FAIL: read %0h, expected %0h", rd_data, expected);
    end
    rd_en = 1'b1;
    @(negedge clk);
    rd_en = 1'b0;
  endtask

  initial begin
    repeat (2) @(negedge clk);
    rst_n = 1'b1;

    for (int i = 0; i < 4; i++) push(8'hA0 + i[WIDTH-1:0]);
    for (int i = 0; i < 4; i++) pop_check(8'hA0 + i[WIDTH-1:0]);

    if (!empty) begin
      errors++;
      $display("FAIL: FIFO not empty after draining");
    end

    if (errors == 0) $display("PASS");
    else             $display("FAILED with %0d errors", errors);
    $finish;
  end

endmodule
