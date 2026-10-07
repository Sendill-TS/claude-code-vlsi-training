# Lab 04 — Tcl for analog layout

Goal: use Claude Code to write and extend layout automation scripts, and learn
where it needs to be kept on a short leash: tool-specific commands.

`place_pins.tcl` spreads pins evenly along the left edge of a cell and prints
their coordinates. It runs under plain `tclsh`, no layout tool needed:

```
cd labs/04-tcl-layout
tclsh place_pins.tcl pins.csv 12.0 0.005
```

## Part A — pure Tcl (everyone)

1. Ask Claude to explain the script and run it.
2. Extend it, one request at a time, running it after each:
   - an edge argument (`left`, `right`, `top`, `bottom`) and a cell width;
   - a minimum pin pitch, with an error if the pins do not fit;
   - a per-pin optional fixed position in the CSV that the spreading works around;
   - differential pairs (`inp`/`inn`) kept adjacent and symmetric about the cell centre.
3. Ask for a test script (`test_place_pins.tcl`) using the `tcltest` package,
   and have Claude run it.

## Part B — your layout tool

Port the output stage to the tool you actually use (Custom Compiler, Virtuoso
via its Tcl/SKILL bridge, Magic, Calibre, ...).

1. Keep the geometry calculation as it is. Add a separate proc that takes the
   computed positions and issues the tool's pin-creation commands.
2. **Give Claude the tool's documentation for those commands** — paste the
   help text or point it at the reference file. Do not let it write tool
   commands from memory; command names and options differ by tool and version,
   and a plausible-looking wrong option is the common failure here.
3. Run it in the tool on a scratch cell and feed any error message back.

## Things to notice

- Part A goes fast because Claude can run `tclsh` and see results. Part B is
  slower because it cannot run your layout tool unless Claude Code runs on the
  machine that has it. That difference is worth a line in your `NOTES.md`.
- Never paste PDK layer maps or rule values into this repo. Use made-up layer
  names (`M1`, `M2`) in lab files.

## Done when

Part A's tests pass under `tclsh`, and Part B places pins on a scratch cell in
your tool.
