Act as `{{role}}`.

<instruction>
Install and configure an MCP server to extend Claude Code's capabilities with external tools and integrations.

<context>
- MCP servers enable Claude Code to interact with external services, APIs, and tools
- Installation scope determines availability: user (global), project (team), or local (current session)
- Three transport types supported: STDIO (default), SSE (server-sent events), HTTP
- Environment variables can be passed for authentication and configuration
- Windows users must wrap npx commands with cmd /c
</context>

<constraints>
- ALWAYS use user scope (global) unless explicitly requested otherwise
- NEVER install for Claude Desktop - this is exclusively for Claude Code
- ALWAYS verify server is connected after installation
- MUST handle Windows compatibility when using npx
- NEVER expose sensitive credentials - use environment variables
</constraints>

<task>
Install the MCP server from the provided repository or package.

<steps>
1. Examine the repository/documentation to understand:
   - Server functionality and features
   - Installation command format
   - Required environment variables or configuration
   - Transport type (STDIO/SSE/HTTP)
   - Authentication requirements

2. Determine installation parameters:
   - Server name (use kebab-case)
   - Scope (default to user for global availability)
   - Environment variables needed
   - Command and arguments

3. Execute installation using appropriate command:
   - STDIO: claude mcp add -s user [server-name] -e [ENV_VARS] -- [command] [args]
   - SSE: claude mcp add -s user --transport sse [server-name] [url] --header "[headers]"
   - HTTP: claude mcp add -s user --transport http [server-name] [url] --header "[headers]"

4. Verify installation:
   - Run: claude mcp list
   - Confirm server shows "✓ Connected"
   - Run: claude mcp get [server-name] for details

5. Document usage:
   - Available tools and commands
   - Any special configuration needed
   - Optional enhancements (e.g., API tokens for rate limits)
</steps>
</task>

<output_format>
1. Server description and capabilities
2. Installation command executed
3. Verification results showing connection status
4. Brief usage instructions
5. Optional enhancements or configuration tips
</output_format>

<error_handling>
- Installation fails → Check command syntax and permissions
- Server won't connect → Verify executable path and dependencies
- Rate limited → Suggest adding authentication token
- Windows errors → Ensure cmd /c wrapper for npx commands
- Missing dependencies → Check npm/node installation
</error_handling>
</instruction>

<request>
$ARGUMENTS
</request>

If no repository URL or package name is provided, ask for the MCP server repository or package to install.

---
role: [[claude-code-mcp-specialist]]
