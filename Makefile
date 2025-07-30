.PHONY: sync claude

# Sync Claude Code
sync:
ifeq ($(word 2,$(MAKECMDGOALS)),claude)
	@echo "Syncing Claude Code..."
	@./scripts/claude-code/sync-claude-code.sh
else
	@echo "Usage: make sync claude"
endif
