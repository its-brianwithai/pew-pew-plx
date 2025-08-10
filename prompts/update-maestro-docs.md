# Update Maestro Documentation

## Instructions

You are tasked with checking for Maestro documentation updates and synchronizing our local documentation. Follow these steps:

### 1. Check for Updates

Visit the official Maestro repository to check for recent updates:
- **Repository**: https://github.com/mobile-dev-inc/maestro
- Check the commit history for documentation changes
- Review recent releases and changelog
- Look for new features or deprecated functionality

### 2. Scan Current Documentation

Review our existing Maestro documentation files:

**Instruction Documents:**
- [[maestro-flutter-instructions]] - Flutter-specific testing patterns
- [[maestro-commands-instructions]] - Command reference
- [[maestro-testing-patterns-instructions]] - Best practices
- [[maestro-selectors-instructions]] - Selector strategies
- [[maestro-mcp-tools-instructions]] - MCP tools guide

**Agent Documentation:**
- [[maestro-test-expert]] - Main testing agent

**Draft/Collection Files:**
- `drafts/maestro-relevant-docs.md` - Scraped documentation
- `context/collections/all-maestro-commands.md` - Command compilation

### 3. Identify Changes

Compare official documentation with our local copies:

```markdown
## Documentation Update Report

### New Features
- [ ] [Feature name] - [Description]
- [ ] [New command] - [Purpose]

### Updated Features
- [ ] [Feature] - [What changed]
- [ ] [Command] - [New parameters/behavior]

### Deprecated Features
- [ ] [Feature] - [Replacement/Migration path]

### Documentation Improvements
- [ ] [Topic] - [Enhancement]
```

### 4. Update Documentation Files

For each identified change:

1. **Update instruction files** with new information
2. **Add examples** for new features
3. **Mark deprecated** features clearly
4. **Update command syntax** where changed
5. **Add migration guides** for breaking changes

### 5. Update Links and References

Ensure all documentation includes current links:

**Primary Documentation Sources:**
- 📖 [Main Docs](https://docs.maestro.dev/)
- 🎮 [Commands Reference](https://docs.maestro.dev/api-reference/commands)
- 🎯 [Flutter Guide](https://docs.maestro.dev/platform/flutter)
- 🌐 [Web Testing](https://docs.maestro.dev/platform/web-desktop-browser)
- ☁️ [Cloud Testing](https://docs.maestro.dev/cloud/run-maestro-tests-in-the-cloud)
- 📊 [Test Suites](https://docs.maestro.dev/cli/test-suites-and-reports)
- 🏷️ [Tags](https://docs.maestro.dev/cli/tags)
- ⚙️ [Configuration](https://docs.maestro.dev/api-reference/configuration/workspace-configuration)
- 🔄 [Continuous Mode](https://docs.maestro.dev/cli/continuous-mode)
- 📱 [Device Management](https://docs.maestro.dev/cli/specify-a-device)

**Advanced Topics:**
- 🔁 [Nested Flows](https://docs.maestro.dev/advanced/nested-flows)
- 🎯 [Selectors](https://docs.maestro.dev/api-reference/selectors)
- 🔐 [Permissions](https://docs.maestro.dev/advanced/permissions-setup-for-ios-and-android-apps)
- 🔍 [Detect Maestro](https://docs.maestro.dev/advanced/detect-maestro-in-your-app)
- 🎣 [Hooks](https://docs.maestro.dev/advanced/maestro-hooks-onflowstart-and-onflowcomplete)
- 📦 [Best Practices](https://docs.maestro.dev/best-practices/structuring-your-test-suite)

### 6. Validate Updates

After updating documentation:

1. **Check consistency** across all files
2. **Verify examples** work with current version
3. **Test new commands** if possible with MCP tools
4. **Update agent knowledge** in [[maestro-test-expert]] if needed
5. **Review wikilinks** to ensure all references are valid

### 7. Create Update Summary

Provide a summary of all changes:

```markdown
## Maestro Documentation Update Summary

**Date**: [Current date]
**Maestro Version**: [Latest version checked]

### Files Updated
- [x] `maestro-commands-instructions.md` - Added new commands
- [x] `maestro-flutter-instructions.md` - Updated Flutter patterns
- [ ] [Other files...]

### Key Changes
1. [Major change and impact]
2. [New feature and usage]
3. [Deprecation notice]

### Action Items
- [ ] Update existing tests for compatibility
- [ ] Train team on new features
- [ ] Migrate deprecated patterns

### Resources
- [Link to official changelog]
- [Link to migration guide]
```

### 8. Version Tracking

Add version information to updated files:
```yaml
# At the top of instruction files
---
name: [instruction-name]
description: [description]
last_updated: [date]
maestro_version: [version]
---
```

## Important Notes

- ALWAYS preserve our project-specific patterns and conventions
- NEVER remove Flutter-specific guidance even if not in official docs
- ALWAYS test examples before including them
- KEEP both official links and local documentation in sync
- DOCUMENT the source and date of updates
- MAINTAIN backward compatibility notes where applicable

## Quick Check Commands

Use these MCP commands to verify documentation accuracy:

```typescript
// Get latest command reference
mcp__maestro__cheat_sheet({})

// Query specific documentation
mcp__maestro__query_docs({ 
  question: "What's new in latest Maestro version?" 
})
```
