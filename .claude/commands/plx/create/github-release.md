---
name: create-github-release
description: "Create a comprehensive GitHub release with changelog updates, documentation validation, tagging, and release creation."
---
# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---


# 🚀 Create GitHub Release

Act as @agents/dev/git-expert.md and handle this complete GitHub release process following all project conventions.

## Release Workflow

This prompt will guide you through the complete release process:

1. **Documentation Validation & Updates**
2. **Changelog Version Management** 
3. **Version Validation & Tag Checking**
4. **Commit Documentation Changes**
5. **Create Git Tag**
6. **Create GitHub Release**

---

## Phase 1: Documentation Validation & Updates

### 1.1 README.md Validation
Please read `README.md` with your Read tool and ensure:
- All information is up to date and accurate
- Version badges reflect the current release version
- Add any missing features or capabilities from recent changes
- Remove any outdated or invalid information
- Verify installation and usage instructions are correct
- Update any links or references that may have changed
- Ensure all command examples work with current version

### 1.2 Additional Documentation Scan
Scan the project for other relevant documentation and update as needed:
- Check for any outdated documentation
- Add missing documentation for new features
- Remove invalid or deprecated documentation
- Ensure all references and links are working
- Update any version-specific documentation

---

## Phase 2: Changelog Version Management

### 2.1 Read Current Changelog
Please read `CHANGELOG.md` with your Read tool to understand the current state.

### 2.2 Version the Unreleased Section
- Convert the current `## [Unreleased]` section to a proper version
- Ask the user what version number to use (e.g., v0.7.0, v1.0.0, etc.)
- Format as: `## [v{VERSION}] - {YYYY-MM-DD}` using today's date
- Ensure all changes are properly categorized under:
  - ### 💔 Breaking:
  - ### ✨ Features:
  - ### 🛠️ Improvements:
  - ### 🐛 Bug fixes:

### 2.3 Create New Unreleased Section
- Add a new `## [Unreleased]` section at the top for future changes
- Leave it empty with just the header

### 2.4 Update Version References
- Update any version references in README.md badges
- Update any other version references found in documentation

---

## Phase 3: Version Validation & Tag Checking

### 3.1 Fetch Current Tags
Run `git tag -l` to see all existing tags and verify:
- The new version doesn't already exist
- The version follows the project's versioning convention
- The version is higher than the current latest version

### 3.2 Validate Version Format
Ensure the version follows semantic versioning (if applicable) or the project's convention:
- Format matches existing tags (e.g., `v0.6.0`, `0.6.0`, etc.)
- Version increment makes sense (major.minor.patch)

---

## Phase 4: Commit Documentation Changes

### 4.1 Stage All Documentation Updates
Run `git add -A` to stage all documentation changes made in previous phases.

### 4.2 Create Release Commit
First check recent commit history with `git log --oneline -5` to identify the project key pattern.

Create a commit with the message format:
```
[PROJECT_KEY] Release v{VERSION}

- Update changelog for v{VERSION}
- Update README and documentation
- Prepare for release
```

Replace `PROJECT_KEY` with the actual project key found in recent commits (e.g., PPW, AUTH, API, etc.).

### 4.3 Verify Clean State
Run `git status` to ensure working directory is clean after commit.

---

## Phase 5: Create Git Tag

### 5.1 Create Annotated Tag
Create an annotated tag with:
```bash
git tag -a v{VERSION} -m "Release v{VERSION}"
```

### 5.2 Verify Tag Creation
Run `git tag -l` to confirm the tag was created successfully.

---

## Phase 6: Create GitHub Release

### 6.1 Push Changes and Tags
Push both the commit and the new tag:
```bash
git push origin main
git push origin v{VERSION}
```

### 6.2 Create GitHub Release
Use the `gh` CLI tool to create the GitHub release:
```bash
gh release create v{VERSION} --title "Release v{VERSION}" --notes-from-tag
```

Or provide custom release notes extracted from the changelog section for this version.

### 6.3 Verify Release Creation
- Confirm the release appears on GitHub
- Verify the release notes are properly formatted
- Check that the tag is correctly associated

---

## Success Confirmation

Once complete, verify:
- [ ] All documentation is updated and accurate
- [ ] Changelog properly versions the unreleased section
- [ ] New version tag exists in git
- [ ] GitHub release is published
- [ ] Release notes match changelog content
- [ ] Working directory is clean

## Error Handling

If any step fails:
1. **Documentation Issues**: Fix and restart from Phase 1
2. **Version Conflicts**: Check existing tags and choose new version
3. **Commit Issues**: Resolve conflicts and recommit
4. **Tag Issues**: Delete tag if needed: `git tag -d v{VERSION}`
5. **GitHub Issues**: Verify `gh` CLI is authenticated and repository access

The release process ensures comprehensive documentation updates, proper versioning, and clean GitHub releases following all project conventions.
