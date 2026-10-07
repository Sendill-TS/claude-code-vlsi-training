# Team instructions for Claude Code

This is a training repo for VLSI engineers learning Claude Code. Users range
from first-time users to experienced ones; explain what you are doing and why
when working inside `labs/`.

## Languages and tools

- RTL and testbenches: SystemVerilog (IEEE 1800-2012). Keep lab code compatible
  with Icarus Verilog (`iverilog -g2012`) and Verilator, since not everyone has
  a commercial simulator licence on their machine.
- Scripts: Tcl 8.6. Lab scripts must run under plain `tclsh` with no EDA tool
  loaded. Tool-specific code (layout editor, P&R, simulator) goes in a separate
  proc or file so the logic can be tested without a licence.
- Lint RTL with `verilator --lint-only -Wall` before calling it done.

## RTL conventions

- `always_ff` for sequential logic, `always_comb` for combinational, `logic`
  instead of `reg`/`wire`.
- Active-low asynchronous reset named `rst_n`; clock named `clk`.
- One module per file, file name equals module name.
- Named port connections only. No `.*` and no positional connections.

## Verification conventions

- Testbenches are self-checking and end by printing exactly `PASS` or
  `FAILED with <n> errors`.
- Never weaken or delete a failing check to make a test pass. If a check looks
  wrong, say so and ask.
- When fixing an RTL bug, first add a test that fails because of it.

## Boundaries

- Never add PDK data, foundry rules, vendor IP or licence files to this repo.
- Inside `labs/`, do not modify a lab's `README.md` or starting files on `main`.
- Do not invent EDA tool commands or options. If you are not sure a command
  exists in the user's tool version, say so and ask them to check the tool's
  own help.
