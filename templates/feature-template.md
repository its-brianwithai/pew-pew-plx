---
name: feature-template
description: Use this template to outline the key aspects of a specific feature. We illustrate this by sketching scenarios that may occur when the feature is successfully executed. These scenarios represent states; for example, an app, a backend, or other concepts can embody certain states, and various actors can perform actions or assume certain states. The focus is on the ability to perform actions or embody states, applicable to both actors and components. We strive for simplicity by starting each scenario with an actor or component, followed by the desired end state, and then listing steps that demonstrate the successful execution of that scenario.
instructions: Make sure that when you implement this template, you don't include these instructions or any other front matter from this template in your work. Output should always and only be the markdown part outside of the front matter. Never include any tags like <example>, <commentary>, or similar tags - these serve only to increase clarity about implementation. Always use single [ ] brackets to indicate instructions the implementer should follow. When referencing other documents from this project, use wikilinks format [[filename]] to reference them. Do not include the file extension or path.
---
# [Fitting Emoji] Feature: [Name]
> 💡 *A specific functionality or capability that delivers value to users or the system.*

[Short description]

## 🧩 Scenarios
> 💡 *Concrete scenarios that demonstrate how this feature works in practice using Gherkin format (Given-When-Then). Each scenario should clearly describe the context, action, and expected outcome.*

[Write scenarios using Gherkin format to describe different ways this feature can be used. Include multiple scenarios to cover various use cases and edge cases.]

<example>
**Scenario:** [Actor performs primary action]
- **Given** [[example-actor]] is on [[initial-component]]
- **And** [[example-actor]] has [required permissions/state]
- **When** [[example-actor]] clicks submit in [[target-component]]
- **And** [[example-actor]] enters "[example data]"
- **Then** [[system-component]] should validate the input
- **And** [[example-actor]] should see success message in [[ui-component]]

**Scenario:** [System handles edge case]
- **Given** [[system-component]] has [specific state]
- **And** user is authenticated
- **When** network connection fails
- **Then** [[system-component]] should display error message
- **And** [[related-component]] should log the error
</example>
