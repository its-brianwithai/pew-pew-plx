---
name: task-template
description: Use this template to define a small, actionable technical task that is part of a larger story or epic.
instructions: Make sure that when you implement this template, you don't include these instructions or any other front matter from this template in your work. Output should always and only be the markdown part outside of the front matter. Never include any tags like <example>, <commentary>, or similar tags - these serve only to increase clarity about implementation. Always use single [ ] brackets to indicate instructions the implementer should follow. When referencing other documents from this project, use wikilinks format [[filename]] to reference them. Do not include the file extension or path.
---
# ✅ Task: [Title]

## 🎯 Objective
> 💡 *A clear and concise statement describing the goal of this task. What is the expected outcome when this task is complete?*
---
[e.g., Implement the UI for the login button based on the Figma design.]

## 🔗 Parent Story / Epic
> 💡 *Link to the parent User Story or Epic that this task belongs to. This provides context.*
---
*   **Story:** [[story-filename]]
*   **Epic:** [[epic-filename]]

## 📝 Description & Context
> 💡 *Provide any necessary details, context, or background information required to complete the task. This can include links to specific documentation, code snippets, or design assets.*
---
*   **Figma Link:** [Link to specific component in Figma]
*   **Relevant Code:** `path/to/login_screen.dart`
*   **Notes:** [e.g., The button should use the primary color from the design system and have a loading state.]

## ⚙️ Technical Specifications
> 💡 *Outline the specific technical requirements for this task. This is the "how" for the implementer.*
---
*   **File(s) to Modify:** `path/to/file_to_change.ext`
*   **Function(s) to Create/Update:** [e.g., create `loginButton()` widget]
*   **Dependencies:** [e.g., Requires the `auth_service` to be available via dependency injection.]
*   **Data Structure:** [If applicable, describe any data structures involved.]
*   **API Endpoint:** [If applicable, specify the API endpoint to be called.]

```mermaid
graph TD
    A[UI Action] --> B[Call ViewModel/Controller Method];
    B --> C[Perform Logic];
    C --> D[Return Result];
```

## ✅ Acceptance Criteria
> 💡 *A simple checklist of conditions that must be met for this task to be considered "done". This should be very specific and testable.*
---
- [ ] The component is implemented according to the design specifications.
- [ ] The code follows the established project style guide.
- [ ] All required unit tests for the new/modified code are written and pass.
- [ ] The component is integrated into the parent feature without breaking existing functionality.
- [ ] The task has been peer-reviewed and approved.
