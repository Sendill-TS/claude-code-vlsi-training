# Lab 02 — Explore RTL (read-only)

Goal: use Claude Code to understand code you did not write, without changing
anything. This is the lowest-risk way to use it on a real project and the one
you will use most.

Uses the FIFO in `labs/03-debug-fifo/`. Do not fix anything yet.

## Tasks

Ask each of these, and compare the answer against the source yourself:

1. `Explain @labs/03-debug-fifo/rtl/sync_fifo.sv to me as a block: ports, parameters, and how full and empty are derived.`
2. `Why are the pointers one bit wider than the address? What breaks if they are not?`
3. `Draw an ASCII timing diagram for three writes followed by three reads after reset.`
4. `What does @labs/03-debug-fifo/tb/tb_sync_fifo.sv actually check, and what does it not check?`
5. `List the corner cases a FIFO verification plan should cover. Mark which ones the current testbench reaches.`

## Things to notice

- `@path` puts a file in front of Claude directly. Without it, Claude searches.
- Ask "how do you know?" when an answer is not obviously right. It should
  point to a line. If it cannot, treat the answer as a guess.
- Answer 5 is the start of lab 04's test plan. Save it in your `NOTES.md`.

## Done when

You can explain the FIFO to a colleague, and you have a list of untested
corner cases.
