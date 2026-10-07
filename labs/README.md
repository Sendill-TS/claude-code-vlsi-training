# Labs

Do them in order. Each one adds a Claude Code skill on top of the previous lab.
Times are rough guides for a first pass.

| Lab | Level | VLSI topic | Claude Code skill it teaches | Time |
| --- | --- | --- | --- | --- |
| [00-setup](00-setup/README.md) | Beginner | — | Install, log in, first prompt, permission prompts | 30 min |
| [01-explore-rtl](01-explore-rtl/README.md) | Beginner | Reading RTL | Asking questions, `@file` references, read-only use | 45 min |
| [02-debug-fifo](02-debug-fifo/README.md) | Beginner | DV: bug hunt | Letting Claude run tools, reviewing diffs, test-first fixing | 1.5 h |
| [03-dv-testbench](03-dv-testbench/README.md) | Intermediate | DV: testbench | Plan mode, iterating on a larger change, `/code-review` | 3 h |
| [04-tcl-layout](04-tcl-layout/README.md) | Intermediate | Tcl for analog layout | Writing specs as prompts, porting to a tool API safely | 2 h |
| [05-rtl-integration](05-rtl-integration/README.md) | Intermediate | RTL integration | Generating from a spec, lint loops, checking Claude's work | 2 h |
| [06-advanced](06-advanced/README.md) | Advanced | Your own project | `CLAUDE.md`, skills, hooks, subagents, headless runs | open |

## How to work on a lab

```
git checkout main && git pull
git checkout -b <yourname>/lab-02
claude
```

Keep a short `NOTES.md` on your branch for each lab: which prompts worked, where
Claude went wrong, and what you had to correct. Those notes are the main input
to the team review at the end of each level, and the good ones become lines in
the root `CLAUDE.md`.

## Habits to build from lab 01 onwards

- Give Claude the way to check its own work (a sim command, a lint command).
  It does far better when it can run something and see the result.
- Read every diff before accepting it. You sign off the RTL, not Claude.
- Point at files and specs instead of describing them from memory.
- When a session goes wrong, `/clear` and restart with a better prompt rather
  than piling on corrections.
