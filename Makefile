.PHONY: sync claude clean

# Sync Claude Code
sync:
ifeq ($(word 2,$(MAKECMDGOALS)),claude)
	@echo "Syncing Claude Code..."
ifeq ($(word 3,$(MAKECMDGOALS)),clean)
	@./scripts/claude-code/sync-claude-code.sh --clean
else
	@./scripts/claude-code/sync-claude-code.sh
endif
else
	@echo "Usage: make sync claude [clean]"
endif

# Allow clean as a target to prevent "No rule to make target" error
clean:
	@:
