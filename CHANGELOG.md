## 0.0.2 (April 2, 2025)

### ✨ Features:
- **New Templates**: Added specialized templates for different ticket types:
  - Bug tickets template
  - Task tickets template 
  - Story tickets template
  - Systems template
- **Marketeer Role**: Enhanced the Marketeer role with wiki resources:
  - Blog sites documentation
  - Community channels (Discord and Slack)
  - Forums (general and Reddit)
  - Social media accounts
- **Resources Folder**: Added a dedicated resources folder to the standard structure for all roles
- **Ghost Blog Integration**: Added complete Ghost Blog API integration with the MCP tool supporting:
  - Retrieving posts and content (GET)
  - Creating draft posts with markdown support (POST)
  - Updating existing posts (PUT)
  - Deleting posts (DELETE)
- **Typefully Integration**: Added Typefully social media management integration with MCP tool supporting:
  - Creating drafts with scheduling and threadify options
  - Retrieving scheduled drafts
  - Retrieving published drafts

### 🛠️ Improvements:
- Renamed `template-for-plan.md` to `template-for-project-plans.md` for clarity
- Updated roles in README with proper links to respective directories
- Enhanced workspace operator script and prompts
- Added cursor rules file for better IDE integration
- Fixed JWT token generation for Ghost Admin API to properly include the key ID in the header
- Improved documentation for the Ghost blog integration with clear examples using the markdown card in mobiledoc format

### 🐛 Bug fixes:
- Fixed issue with Ghost Admin API authentication by properly handling the API key format
- Fixed content display issues in Ghost posts by using the markdown card instead of HTML content
- Fixed JSON parsing issues in the MCP server by removing console.log statements that interfered with the output
- Fixed 405 Method Not Allowed error in Typefully MCP by adding trailing slash to draft creation endpoint URL

## 0.0.1 (March 31, 2025)

### ✨ Features:
- **Turbo Developer MCP Tool**: Added a custom Model Context Protocol (MCP) server that provides tools and services for integration with Cursor IDE. This tool allows seamless integration with AI assistants like Claude, providing standardized interfaces for development workflows.
- **Developer Role**: Added the initial Developer role to the workspace, with a dedicated folder structure, prompts, instructions and documentation.
- **Developer Wiki**: Added a wiki section with comprehensive documentation of available prompts for easy reference.

### 🛠️ Improvements:
- Updated folder structure to improve organization and clarity
- Enhanced documentation and README files
- Implemented standardized templates for various project documents
- Added developer/wiki/all-developer-prompts.md with detailed descriptions of each prompt
- Updated README with a link to the developer prompts documentation

### 💔 Breaking:
- **Initial Workspace Refactor Release**: Released the first version of the new Ultra Wide Turbo Workspace (UWTW), featuring improved project structure, comprehensive roles documentation and development tools.