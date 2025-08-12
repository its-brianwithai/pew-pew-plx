# CLI commands inventory and decisions

- **Goal**: unify this repo and pew-pew-cli under a single Node CLI (drop Makefile). Tick decisions and add notes.

## Current repo (plx)

- [ ] Keep - [x] Drop - [ ] Change — `plx init`
  - does: initialize project (pulls framework, extracts, copies)
  - notes:
- [ ] Keep - [x] Drop - [ ] Change — `plx sync claude`
  - does: sync agents/prompts/templates/workflows/modes; wikilinks; pre/post cleanup via config
  - notes:
- [ ] Keep - [x] Drop - [ ] Change — `plx watch claude`
  - does: watch sources and auto-sync
  - notes:
- [ ] Keep - [x] Drop - [ ] Change — `plx pull <branch|repo-url> [branch]`
  - does: update framework files from repo/branch archive
  - notes:
- [ ] Keep - [x] Drop - [ ] Change — `plx-config json|get|list|sources|validate`
  - does: inspect/validate config; discovery: nearest ancestor → `~/plx/config.yaml` → bundled
  - notes:

- plx pull repo — should pull all files from the repo, folders determined per keys defined from nearest config to the root and do nothing else; MUST prompt confirmation; if user says no, stop. If part of sync, continue sync after pull. `plx pull` defaults to `plx pull repo`.
- plx sync repo — runs pull repo then syncs files per nearest config targets. `plx sync` defaults to `plx sync repo`.

## pew-pew-cli (pew)

- [ ] Keep - [x] Drop - [ ] Change — `pew init`
  - does: initialize pewPewCLI structure; create `pew.yaml`
  - notes: place all config vars of pew.yaml into the plx config.yaml
- [x] Keep - [ ] Drop - [x] Change — `pew set path --field tasks --value <path> [--global]`
  - does: set config values
  - notes:
- [x] Keep - [ ] Drop - [x] Change — `pew paste tasks [--overwrite|--append|--insert] [--path <file>]`
  - does: paste clipboard content into task file
  - notes:
- [x] Keep - [ ] Drop - [x] Change — `pew next task`
  - does: mark current 👉 done, advance to next unchecked task across configured files
  - notes: allow user to set the marker in the config.yaml - default 👉
- [x] Keep - [ ] Drop - [x] Change — `pew reset tasks`
  - does: reset completed tasks in configured files
  - notes:
- [x] Keep - [ ] Drop - [x] Change — `pew update`
  - does: self-update from npm
  - notes:

## Removals and migrations

- [x] Remove — Makefile passthrough in `bin/plx.js` (migrate to Node CLI commander)
- [x] Remove — `sync claude` suffix; standardize as `plx sync`
- [ ] Migrate — `plx-config` into `plx config ...` (this is not a verb; see proposals below)

## Config and discovery

- [x] Confirm — discovery order: nearest ancestor `config.yaml` → `~/plx/config.yaml` → bundled default
- [x] Confirm — `sync_sources` domains (no `issues/`, `drafts/`, `context`)
- [x] Decide — filename templating in `sync_targets` (e.g., `.claude/agents/as-{filename}.yaml`)

## README and help

- [x] Adopt — one README with consolidated command docs

## Processed TODOs & command model proposals

- Verb-first rule with max one subcommand: `plx <verb> <subcommand>`; all else are flags/options.

### Replace dropped/legacy commands
- plx init → none (not needed). Installation places files under `~/plx`.
- plx watch claude → plx watch
- plx sync claude → plx sync (defaults to `plx sync repo`)
- plx pull <branch|url> [branch] → plx pull repo [--repo <url>] [--branch <name>] (always confirm)

### New unified commands
- plx pull repo [--repo <url>] [--branch <name>] [--yes]
  - Pull to folders determined by nearest config; confirmation required unless `--yes` or invoked by `plx sync`.
- plx sync repo [--repo <url>] [--branch <name>] [--yes]
  - Executes `plx pull repo` then syncs to targets per nearest config.
- plx sync [--yes]
  - Alias for `plx sync repo`.
- plx pull [--yes]
  - Alias for `plx pull repo`.

### Config introspection (verb-based)
- plx get <path>
- plx set <path> <value> [--global?]
- plx list <path>
- plx validate
- plx show-paths (prints resolved search/target paths)

### Tasks (pew features re-homed under verb-first)
- plx set tasks --field <field> --value <path> [--global]
- plx paste tasks [--overwrite|--append|--insert] [--path <file>]
- plx next task
- plx reset tasks
- plx update cli (self-update when distributed via npm)

### Config unification (pew.yaml → config.yaml)
- Add under config.yaml:
  - tasks:
    - all: []
    - primary: ''
    - paste: ''
    - marker: "👉"
  - updates:
    - lastUpdateCheckTimestamp: 0

### README requirements
- Document verb-first rule and one subcommand max.
- Show examples for each command and flags.
- Explain config discovery order and defaults.

## Notes

- Add any specific feedback or desired renames here.
// TODO(GPT-AGENT): 12 Aug 2025 : call it plx.yaml instead of config.yaml