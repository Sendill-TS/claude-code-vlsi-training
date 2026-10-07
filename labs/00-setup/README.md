# Lab 00 — Setup

Goal: Claude Code running in this repo, with the open-source tools the labs use.

## 1. Where to run

EDA tools live on Linux, so run Claude Code where the tools are:

- **Linux workstation or EDA server** — preferred. Install Claude Code there
  and work over SSH or in the VS Code extension with Remote-SSH.
- **Windows laptop** — use WSL2 (Ubuntu). The labs work there; native Windows
  is fine for Claude Code itself but awkward for the simulators.

Check with your IT/security contact before installing on a company EDA server.

## 2. Install

Claude Code: follow https://code.claude.com/docs/en/setup, then run `claude`
and log in.

Lab tools (Ubuntu/WSL2):

```
sudo apt install git iverilog verilator tcl gtkwave
```

Check:

```
iverilog -V | head -1
verilator --version
echo 'puts $tcl_version' | tclsh
```

## 3. First session

From the repo root run `claude`, then try:

1. `What is in this repo and how is it organised?`
2. `Which tools do the labs need, and are they installed on this machine?`
   Claude will ask permission to run commands. Read each prompt before you
   approve it; this is the habit the lab is teaching.
3. `/help` to see the built-in commands. Note `/clear`, `/model` and `/config`.

## Done when

- `claude` starts in the repo and answers question 1 sensibly.
- All three check commands above print a version.
- You can explain what `CLAUDE.md` and `.claude/settings.json` in the repo root do.
