# Claude Code for VLSI — team training repo

Shared repo for learning Claude Code on semiconductor work: design verification,
Tcl scripting for analog layout, and RTL integration. It holds two things:

- `labs/` — a graded series of exercises, beginner to advanced. Start at `labs/README.md`.
- `scripts/` — reusable scripts the team writes along the way and wants to keep.

## Quick start

1. Install Claude Code and the lab tools: see `labs/00-setup/README.md`.
2. Clone this repo and run `claude` from the repo root.
3. Work through the labs in order. Each lab has a `README.md` with the task and
   the Claude Code skills it is meant to teach.

## Layout

| Path | What it is |
| --- | --- |
| `CLAUDE.md` | Team instructions Claude Code loads in every session in this repo |
| `.claude/settings.json` | Shared permissions (which commands run without a prompt) |
| `.claude/skills/` | Shared skills, e.g. `/triage-sim-log` |
| `labs/` | Training exercises |
| `scripts/` | Shared, reviewed scripts (`tcl/`, `dv/`, `integration/`) |

## Rules

- **No proprietary data in this repo.** No PDK files, foundry rule decks, vendor
  IP, customer RTL, or licence files. Labs use only open, self-written examples.
- Do your lab work on a branch named `<yourname>/lab-NN`. Do not push lab
  solutions to `main`; the starting state of each lab must stay intact for the
  next person.
- Anything going into `scripts/` goes through a pull request with one reviewer.
- If Claude gets something wrong in a way others will hit too, fix it in
  `CLAUDE.md` rather than only in your own session.
