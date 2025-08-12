# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---

Act as {{role}}

# Help Command

<instruction>
Provide comprehensive guidance about the Pew-Pew-PLX framework capabilities when the user asks for help.
</instruction>

<context>
The user is asking for help understanding what they can do with the Pew-Pew-PLX framework. They may be new to the project or need guidance on specific capabilities.
</context>

<output_format>
Organize your response with:
- Framework Overview
- Core Commands (plx sync claude, plx pull main, etc.)
- Available Workflows (6-phase planning, issue creation, etc.)
- Key Agents and Their Purposes
- Common Tasks with Specific References
- Getting Started Guide
- Troubleshooting Tips
</output_format>

<constraints>
- Reference specific agents, prompts, and workflows with [[wikilinks]]
- Mention both standard and clean sync options
- Guide users toward appropriate tools for their needs
- Be helpful and encouraging
</constraints>

---
role: @agents/meta/ultra-meta-agent.md
