---
name: triage-sim-log
description: Triage a simulation log. Use when the user gives a simulator log file or asks why a test or regression failed.
---

Triage the simulation log the user points to.

1. Find the first error or failed check in time order. Later failures are
   usually consequences of it, so report the first one separately.
2. Group the remaining messages by signature (same message text with numbers
   and paths removed) and give a count for each group.
3. For the first failure, read the testbench and RTL it refers to and state the
   most likely cause, naming the file and line. Say plainly whether it looks
   like a design bug, a testbench bug, or an environment problem (missing file,
   licence, timeout).
4. Do not change any code. End with the one next step you recommend.
