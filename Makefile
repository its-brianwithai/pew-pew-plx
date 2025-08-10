.PHONY: sync claude pull main watch clean

# Sync Claude Code
sync:
ifeq ($(word 2,$(MAKECMDGOALS)),claude)
ifeq ($(word 3,$(MAKECMDGOALS)),clean)
	@echo "Syncing Claude Code with clean..."
	@./scripts/claude-code/sync-claude-code.sh --clean
else
	@echo "Syncing Claude Code..."
	@./scripts/claude-code/sync-claude-code.sh
endif
else
	@echo "Usage: make sync claude [clean]"
endif

# Pull latest from any branch or repository
pull:
ifneq ($(word 2,$(MAKECMDGOALS)),)
	@# Check if it's a URL (contains :// or starts with git@)
	@if echo "$(word 2,$(MAKECMDGOALS))" | grep -qE '(://|^git@)'; then \
		repo_url="$(word 2,$(MAKECMDGOALS))"; \
		branch="$(word 3,$(MAKECMDGOALS))"; \
		if [ -z "$$branch" ]; then branch="main"; fi; \
		echo "📥 Pulling from external repository..."; \
		echo "   Repository: $$repo_url"; \
		echo "   Branch: $$branch"; \
		if echo "$$repo_url" | grep -q '^git@'; then \
			ssh_url="$$repo_url"; \
			repo_path=$$(echo "$$ssh_url" | sed 's/git@github.com://; s/\.git$$//'); \
			https_url="https://github.com/$$repo_path"; \
		else \
			https_url=$$(echo "$$repo_url" | sed 's/\.git$$//'); \
		fi; \
		repo_name=$$(basename "$$https_url"); \
		zip_url="$$https_url/archive/refs/heads/$$branch.zip"; \
		echo "📦 Downloading from: $$zip_url"; \
		curl -fL "$$zip_url" -o .fetched_repo.zip || { echo "❌ Failed to download. Check if the repository and branch exist."; exit 1; }; \
		echo "📦 Extracting files..."; \
		unzip -q .fetched_repo.zip || { echo "❌ Failed to extract files."; rm -f .fetched_repo.zip; exit 1; }; \
		extracted_dir="$$repo_name-$$branch"; \
	else \
		branch="$(word 2,$(MAKECMDGOALS))"; \
		echo "📥 Pulling latest from $$branch branch..."; \
		curl -fL "https://github.com/its-brianwithai/pew-pew-plx/archive/refs/heads/$$branch.zip" -o .fetched_repo.zip || { echo "❌ Failed to download. Check if the branch '$$branch' exists."; exit 1; }; \
		echo "📦 Extracting files..."; \
		unzip -q .fetched_repo.zip || { echo "❌ Failed to extract files."; rm -f .fetched_repo.zip; exit 1; }; \
		extracted_dir="pew-pew-plx-$$branch"; \
	fi; \
	echo "📁 Updating project files..."; \
	cd "$$extracted_dir" && \
	if [ -f .plxignore ]; then \
		rsync -av --exclude-from=.plxignore . ../ ; \
	else \
		cp -R * ../ ; \
		cp -R .[^.]* ../ 2>/dev/null || true ; \
	fi; \
	cd ..; \
	echo "🧹 Cleaning up..."; \
	rm -rf "$$extracted_dir" .fetched_repo.zip; \
	echo "✅ Pull complete!"
else
	@echo "Usage:"
	@echo "  make pull <branch>                    # Pull from pew-pew-plx repository"
	@echo "  make pull <repository-url> [branch]   # Pull from any repository"
	@echo ""
	@echo "Examples:"
	@echo "  make pull main                        # Pull main branch from pew-pew-plx"
	@echo "  make pull beta                        # Pull beta branch from pew-pew-plx"
	@echo "  make pull https://github.com/user/repo.git main"
	@echo "  make pull git@github.com:user/repo.git develop"
endif

# Watch for changes and auto-sync
watch:
ifeq ($(word 2,$(MAKECMDGOALS)),claude)
	@echo "👀 Watching for changes in agents/ and prompts/ directories..."
	@./scripts/claude-code/watch-claude-code.sh
else
	@echo "Usage: make watch claude"
endif

# Allow targets as secondary parameters to prevent "No rule to make target" error
main:
	@:

claude:
	@:

clean:
	@:

# Allow any word to be used as a target (for branch names and URLs)
%:
	@:
