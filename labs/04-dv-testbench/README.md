# Lab 04 — Build a real testbench

Goal: drive a multi-file change with a plan, instead of one prompt at a time.

Start from your fixed FIFO from lab 03 (copy `rtl/sync_fifo.sv` into this
folder on your branch).

## Tasks

1. **Write the test plan first.** Take your corner-case list from lab 02 and
   turn it into `testplan.md`: one row per feature, with the stimulus and the
   check. Write it yourself; ask Claude only to review it for gaps.
2. **Plan mode.** Press Shift+Tab until plan mode is on, then:
   `Using @testplan.md, plan a self-checking testbench for sync_fifo that runs under iverilog -g2012: reference model, randomised stimulus with a fixed seed, simultaneous read/write, full and empty boundaries, reset in the middle of traffic.`
   Push back on the plan until you agree with it. Then let it implement.
3. **Assertions.** Ask for immediate assertions on the invariants (never full
   and empty together, pointers never differ by more than DEPTH).
4. **Prove the testbench works.** Ask Claude to inject three different bugs
   into a copy of the RTL, one at a time, and show that the testbench catches
   each one. A testbench that has never failed has not been tested.
5. **Review.** Run `/code-review` on your branch and deal with the findings.

## Things to notice

- Icarus does not support classes, constrained random or covergroups well.
  Claude should work within that because `CLAUDE.md` says so. If it reaches
  for UVM anyway, that is a `CLAUDE.md` improvement to propose.
- If you have VCS, Xcelium or Questa access, repeat step 2 asking for a UVM
  environment and compare how much review each version needed.

## Done when

Every row of `testplan.md` maps to a test that prints `PASS`, and all three
injected bugs were caught.
