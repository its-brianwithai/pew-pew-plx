.PHONY: sync claude pull main watch clean

# Sync Claude Code
sync:
ifeq ($(word 2,$(MAKECMDGOALS)),claude)
ifeq ($(word 3,$(MAKECMDGOALS)),clean)
	@echo "Syncing Claude Code with clean..."
	@./scripts/claude-code/sync-claude-code.sh --clean
endif
	@echo "Syncing Claude Code..."
	@./scripts/claude-code/sync-claude-code.sh
else
	@echo "Usage: make sync claude [clean]"
endif

# Pull latest from main branch
pull:
ifeq ($(word 2,$(MAKECMDGOALS)),main)
	@echo "📥 Pulling latest from main branch..."
	@curl -L https://github.com/its-brianwithai/pew-pew-plx/archive/refs/heads/main.zip -o .fetched_repo.zip
	@echo "📦 Extracting files..."
	@unzip -q .fetched_repo.zip
	@echo "📁 Updating project files..."
	@# Copy everything except what's in .plxignore
	@cd pew-pew-plx-main && \
	if [ -f .plxignore ]; then \
		rsync -av --exclude-from=.plxignore . ../ ; \
	else \
		cp -R * ../ ; \
		cp -R .[^.]* ../ 2>/dev/null || true ; \
	fi
	@echo "🧹 Cleaning up..."
	@rm -rf pew-pew-plx-main .fetched_repo.zip
	@echo "✅ Pull complete!"
else
	@echo "Usage: make pull main"
endif

# Watch for changes and auto-sync
watch:
ifeq ($(word 2,$(MAKECMDGOALS)),claude)
	@echo "👀 Watching for changes in agents/ and prompts/ directories..."
	@./scripts/claude-code/watch-claude-code.sh
else
	@echo "Usage: make watch claude"
endif

# Allow main/claude as targets to prevent "No rule to make target" error
main:
	@:

claude:
	@:

clean:
	@:
