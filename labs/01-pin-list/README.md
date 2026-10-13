# Lab 01 — Check a pin list (everyone)

Goal: do one small project together, whatever your discipline, and meet the
three things you will do with Claude Code every day: ask about files, let it
run a tool, and review a change it makes.

The project is a block pin list. RTL design owns the names, directions and
widths, layout owns the edges, and DV binds a testbench to it, so everyone
has a reason to want it right. Work in mixed groups if you can.

`pins.csv` is the pin list for a made-up block, `bias_dac`. `check_pins.tcl`
checks a pin list against the rules below. It runs under plain `tclsh`:

```
cd labs/01-pin-list
tclsh check_pins.tcl pins.csv
```

## Pin list rules

1. Every row has five fields: `name,direction,width,type,edge`.
2. A name is a lowercase letter followed by lowercase letters, digits or
   underscores, and appears only once in the file.
3. `direction` is `input`, `output` or `inout`.
4. `width` is the number of wires as an integer of 1 or more (a 6-bit bus is `6`).
5. `type` is `digital`, `analog` or `supply`.
6. Analog and supply pins have width 1. Supply pins are `inout`.
7. `edge` is `left`, `right`, `top` or `bottom`.

The script does not enforce all of these yet, and `pins.csv` has mistakes in it.

## Part A — ask, without changing anything

1. `Explain @labs/01-pin-list/check_pins.tcl: what it reads, what it checks and what it prints.`
2. `Compare the rules in @labs/01-pin-list/README.md with the script. Which rules does it enforce and which not? Give the line for each.`
3. `Read @labs/01-pin-list/pins.csv and list every row that breaks a rule. Do not run anything.`

## Part B — let it run the tool

4. `Run the checker on pins.csv and tell me the result.`
   Compare this with the answer to step 3. What did the script miss?

## Part C — your first reviewed change

5. Before changing anything, copy `pins.csv` to `pins_bad.csv`. It is your
   failing test for the rest of the lab.
6. Add the missing rules one at a time, for example:
   `Add the unique-name check to check_pins.tcl, then run it on pins_bad.csv.`
   Read each diff before you accept it.
7. Correct `pins.csv` until the checker prints `PASS`. One of the mistakes
   has no right answer in the file. Decide it as a group and tell Claude.

## Part D — one addition for your own discipline

Pick the one closest to your work, write the request yourself, and show the
result to the other groups. Say what the output should look like and how
Claude can check it.

- **RTL design:** print a SystemVerilog module header for the block from the
  pin list. Check that it compiles: `iverilog -g2012 -t null bias_dac.sv`.
- **DV:** print a testbench skeleton: one signal per pin and an instance of
  the block with named port connections.
- **Analog layout:** report the number of wires on each edge and the shortest
  edge that fits them at a pin pitch given on the command line.

## Things to notice

- `tclsh` ran without a permission prompt, but the edit asked first. Find out
  why in `.claude/settings.json`.
- Step 3 is Claude reading; step 4 is a script running. Reading is quick and
  can miss a row or flag a good one. The script gives the same answer every time.
- Ask "how do you know?" when an answer is not obviously right. It should
  point to a line. If it cannot, treat the answer as a guess.
- In step 7 Claude cannot know the design intent. Watch whether it asks or
  guesses, and write that down in your `NOTES.md`.

## Done when

The checker enforces all seven rules, reports all five mistakes in
`pins_bad.csv`, and prints `PASS` on your corrected `pins.csv`.
