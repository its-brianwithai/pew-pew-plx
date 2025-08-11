# 📋 Issue: Merge three repos and unify prompts + CLI

Merge this repo with `pew-pew-cli` (content-only import), keep `ultra-wide-turbo-workspace` as its own Git repo with history. Pause content moves for now; use `workspace/` as-is.

## 📝 Initial Requirement

### Requirements
1. Remove the git link from this repo. Keep ultra-wide-turbo-workspace Git intact.
2. Do not move/reshape content now; keep `workspace/00-freelancers`…`100-all-teams` as-is.
3. Copy all logic from `pew-pew-cli` and build a proper CLI here following its conventions, README, commands, and logic.
4. Config discovery: use nearest ancestor config when walking up from CWD; else use the user root `~/plx/config.yaml`; else bundled default. Sync uses that config.

## Implementation Checkpoints
- Remove remote origin and repository metadata on this repo; retain UWTW as separate repo.
- Catalogue `workspace/` structure; identify overlaps with existing `prompts/`, `agents/`, `templates/` (no moves yet).
- Deep-dive `pew-pew-cli` commands, config, and conventions; map 1:1 into a unified `plx` CLI.
- Remove Makefile path; replace with Node CLI (commander) with verb-first commands (`plx <verb> <subcommand>` max one subcommand; flags/options for the rest).
- Add config discovery precedence in CLI: nearest ancestor → `~/plx/config.yaml` → bundled default.
- Plan CLI verbs: `plx pull repo [--repo <url>] [--branch <name>] [--yes]` (always confirm unless `--yes` or invoked by `plx sync`); `plx sync repo` runs pull then sync; aliases `plx pull` and `plx sync` to the repo variants.
- Migrate pew task commands under `plx` verbs (set/paste/next/reset/update) and unify pew.yaml fields into PLX config.

## Single Question
- Should we rename `config.yaml` to `plx.yaml` globally and update discovery accordingly?
