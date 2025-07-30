.PHONY: sync claude pull main

# Sync Claude Code
sync:
ifeq ($(word 2,$(MAKECMDGOALS)),claude)
	@echo "Syncing Claude Code..."
	@./scripts/claude-code/sync-claude-code.sh
else
	@echo "Usage: make sync claude"
endif

# Pull latest from main branch
pull:
ifeq ($(word 2,$(MAKECMDGOALS)),main)
	@echo "📥 Pulling latest from main branch..."
	@curl -L https://github.com/its-brianwithai/pew-pew-projects/archive/refs/heads/main.zip -o .fetched_repo.zip
	@echo "📦 Extracting files..."
	@unzip -q .fetched_repo.zip
	@echo "📁 Updating project files..."
	@cp -R pew-pew-projects-main/* .
	@cp -R pew-pew-projects-main/.[^.]* . 2>/dev/null || true
	@echo "🧹 Cleaning up..."
	@rm -rf pew-pew-projects-main .fetched_repo.zip
	@echo "✅ Pull complete!"
else
	@echo "Usage: make pull main"
endif

# Allow main as a target to prevent "No rule to make target" error
main:
	@:
