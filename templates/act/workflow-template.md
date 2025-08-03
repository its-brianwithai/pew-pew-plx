---
name: workflow-template
description: "Use this template when defining orchestrated multi-step processes with defined agents, prompts, inputs, and outputs."
instructions: "Make sure that when you implement this template, you don't include these instructions or any other front matter from this template in your work. Output should always and only be the markdown part outside of the front matter. Never include any tags like <example>, <commentary>, or similar tags - these serve only to increase clarity about implementation. Always use single [ ] brackets to indicate instructions the implementer should follow. When referencing other documents from this project, use wikilinks format [[filename]] to reference them. Do not include the file extension or path."
---
# 🌊 [Workflow Name]: [Descriptive Title]
> 💡 *Clear description of what this workflow accomplishes.*

[Brief description of the workflow's purpose and value]

## 🎭 Orchestrator
> 💡 *The agent responsible for executing this workflow.*

[[agent-name]] - [Brief description of why this agent orchestrates this workflow]

## 🚶 Steps
> 💡 *Sequential steps to complete the workflow.*

[List each step with instructions, optional sub-agent, and expected output]

```
<example>
1. [Step Name]
   - Instructions: [What to do] or [[prompt-name]]
   - Agent: [[sub-agent-name]] (optional)
   - Output: [Expected result] or [[template-name]]

2. [Step Name]
   - Instructions: [What to do] or [[prompt-name]]
   - Agent: [[sub-agent-name]] (optional)
   - Output: [Expected result] or [[template-name]]

3. [Step Name]
   - Instructions: [What to do] or [[prompt-name]]
   - Agent: [[sub-agent-name]] (optional)
   - Output: [Expected result] or [[template-name]]
</example>
```