# Lab 03 — Debug a FIFO

Goal: let Claude Code run the simulator, reproduce a bug, and fix it test-first.

## The situation

`rtl/sync_fifo.sv` passes its testbench:

```
cd labs/03-debug-fifo
iverilog -g2012 -o sim.vvp rtl/sync_fifo.sv tb/tb_sync_fifo.sv && vvp sim.vvp
```

But the integration team reports corrupted data downstream when the producer
sends long bursts. Nobody has a failing test.

## Tasks

1. Run the existing test through Claude: `Run the FIFO testbench in labs/03-debug-fifo and tell me the result.`
2. Give it the bug report in your own words and ask for a hypothesis **before**
   any code change.
3. Ask it to extend the testbench so the test fails because of the bug.
   Run it and confirm it fails.
4. Only then ask for the RTL fix. Review the diff line by line.
5. Run the test again, and lint: `verilator --lint-only -Wall rtl/sync_fifo.sv`.

## Things to notice

- Step 3 before step 4 is the point of the lab. A fix with no failing test
  first is a fix you cannot trust.
- Try the lazy prompt on a fresh branch too: `fix the fifo`. Compare what you
  get. Write the difference in your `NOTES.md`.

## Done when

The extended testbench fails on the original RTL and prints `PASS` on the
fixed RTL, and you can state the bug in one sentence.
