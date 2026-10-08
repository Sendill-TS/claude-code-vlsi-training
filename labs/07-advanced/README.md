# Lab 07 — Make it yours

Goal: move from using Claude Code to shaping it for your project. Each part
ends in a pull request to this repo, so the whole team gets the result.

Do these against a real block from your project where policy allows, in that
project's own repo. Bring back only the generic, non-proprietary parts.

## Part 1 — CLAUDE.md for a real project

Run `/init` in your project repo, then cut the result down to what Claude gets
wrong without being told: how to run one test, how to run lint, naming rules,
what must never be edited (generated files, vendor IP). Short and specific
beats long. Compare yours with a colleague's.

## Part 2 — A skill

A skill is a reusable procedure in `.claude/skills/<name>/SKILL.md`. Read
`.claude/skills/triage-sim-log/SKILL.md` in this repo and try it on a failing
log from lab 04. Then write one for a task you repeat, for example:

- review a Tcl script against the team's conventions;
- turn a waveform observation plus a log into a bug report in your tracker's format;
- check an integration spec against the generated top level.

## Part 3 — A hook

Hooks are commands the harness runs on events, configured in
`.claude/settings.json`. Add a `PostToolUse` hook that runs
`verilator --lint-only` on any `.sv` file Claude edits, so lint errors come
straight back to it. Ask Claude Code to set it up, then read what it wrote.

## Part 4 — Subagents and parallel work

Pick a job that splits cleanly, such as triaging twenty failing regression
logs. Ask Claude to use subagents, one per log, and summarise by root cause.
Note what it cost in time and tokens against doing it in one session; fan-out
is worth it for wide independent work and wasteful for anything else.

## Part 5 — Headless

`claude -p "<prompt>"` runs without the interactive UI, so it can sit in a
script or a nightly job. Build one: after the nightly regression, run the
triage skill over the failures and write a summary file. Start with read-only
permissions and keep a human between its output and any code change.

## Done when

You have merged at least one skill or script into this repo, and added at
least one line to the root `CLAUDE.md` that came from a real mistake.
