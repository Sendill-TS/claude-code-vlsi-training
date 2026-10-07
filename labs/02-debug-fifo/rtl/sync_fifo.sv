// Synchronous FIFO with registered pointers and combinational read data.
// DEPTH must be a power of two.
module sync_fifo #(
  parameter int WIDTH = 8,
  parameter int DEPTH = 8
) (
  input  logic             clk,
  input  logic             rst_n,
  input  logic             wr_en,
  input  logic [WIDTH-1:0] wr_data,
  input  logic             rd_en,
  output logic [WIDTH-1:0] rd_data,
  output logic             full,
  output logic             empty
);

  localparam int AW = $clog2(DEPTH);

  logic [WIDTH-1:0] mem [0:DEPTH-1];
  logic [AW:0]      wr_ptr;
  logic [AW:0]      rd_ptr;

  assign empty   = (wr_ptr == rd_ptr);
  assign full    = (wr_ptr[AW-1:0] == rd_ptr[AW-1:0]) && (wr_ptr[AW] != rd_ptr[AW]);
  assign rd_data = mem[rd_ptr[AW-1:0]];

  always_ff @(posedge clk) begin
    if (wr_en) begin
      mem[wr_ptr[AW-1:0]] <= wr_data;
    end
  end

  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      wr_ptr <= '0;
      rd_ptr <= '0;
    end else begin
      if (wr_en) begin
        wr_ptr <= wr_ptr + 1'b1;
      end
      if (rd_en && !empty) begin
        rd_ptr <= rd_ptr + 1'b1;
      end
    end
  end

endmodule
