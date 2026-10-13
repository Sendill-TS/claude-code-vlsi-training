# Lab 06 — RTL integration

Goal: generate a top level from a written spec, and learn to check generated
connectivity rather than trust it.

`rtl/` has two leaf blocks. `spec.md` describes the top level that connects
them. There is no top-level file yet.

## Tasks

1. `Read @spec.md and the modules in rtl/. Before writing anything, list every connection you will make and anything in the spec that is ambiguous or inconsistent with the RTL.`
   The spec has gaps on purpose. Resolve them by editing `spec.md`, not by
   letting Claude guess.
2. Have Claude write `rtl/pwm_top.sv` and lint it:
   `verilator --lint-only -Wall -Irtl rtl/pwm_top.sv`
   Let it loop on the lint output until clean. Watch that it fixes causes and
   does not just add `/* verilator lint_off */`.
3. Ask for a connectivity table (instance.port → net → instance.port or top
   port) generated **from the RTL it wrote**, and diff it against the spec by eye.
4. Ask for a smoke testbench that checks the duty cycle for 0, 25%, 50% and 100%.
5. Change the spec (make the counter width a top-level parameter) and ask
   Claude to update the RTL, the table and the test to match.

## Scaling this up

On a real SoC the spec is a spreadsheet, IP-XACT, or a connectivity CSV with
hundreds of rows. The approach that holds up there is not "Claude writes the
top level" but "Claude writes a script that generates the top level from the
spec", because the script is reviewable and rerunnable. As a stretch task,
ask for that: a Tcl or Python generator driven by a connections CSV, and put
it up as a pull request to `scripts/integration/`.

## Done when

`pwm_top.sv` lints clean with no waivers, the smoke test prints `PASS`, and
the spec, RTL and connectivity table agree after the change in step 5.
