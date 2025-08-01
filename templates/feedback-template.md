---
name: feedback-template
description: Use this template to provide structured feedback on completed work.
instructions: Make sure that when you implement this template, you don't include these instructions or any other front matter from this template in your work. Output should always and only be the markdown part outside of the front matter. Never include any tags like <example>, <commentary>, or similar tags - these serve only to increase clarity about implementation. Always use single [ ] brackets to indicate instructions the implementer should follow. When referencing other documents from this project, use wikilinks format [[filename]] to reference them. Do not include the file extension or path.
---
# 📝 Feedback Report for: [Project/Feature Name]

> This document provides structured feedback on the work completed for `[Project/Feature Name]`. The review was conducted by comparing the implementation against all relevant project documentation, including acceptance criteria, quality standards, and the original requirements.

## 1. 🎯 Review Context

*   **Work Reviewed:** [Result Report: Title of Task/Story]
*   **Reviewer(s):** [@username or Name]
*   **Date of Review:** [YYYY-MM-DD]
*   **Key Documents Used in Review:**
    *   Result Report: [[work-log-template]]
    *   Acceptance Criteria: [[acceptance-criteria-template]]
    *   Quality Standards: [[quality-standards-template]]
    *   Rules & Restrictions: [[rules-template]], [[restrictions-template]]
    *   Original PRD/Story: [[story-or-prd-name]]

## 2. 📈 High-Level Summary
> 💡 *A brief summary of the review findings. Is the work approved, approved with conditions, or does it require revisions?*
---
`[e.g., The feature is well-implemented and meets most functional criteria. However, several revisions are required to meet performance and UI standards before final approval.]`

## 3. 📋 Detailed Feedback
> 💡 *A categorized list of all feedback items. Each item includes a description, the reasoning, and a suggested solution to guide the revision process.*

| ID | Category | Reference | Description of Issue | Reasoning / Impact | Suggested Solution | Priority | Status |
|:---|:---|:---|:---|:---|:---|:---|:---|
| `FB-001` | **Bug** | `AC-FUNC-02` | The error message for incorrect password is "An error occurred" instead of the specified "Invalid credentials". | Fails acceptance criteria and provides a poor user experience. | Update the error message string in `path/to/login_view_model.js` to match the AC. | **High** | `Open` |
| `FB-002` | **Suggestion** | `QS-UI-01` | The loading spinner on the login button is slightly off-center. | Does not meet the "pixel-perfect" quality standard and looks unprofessional. | Adjust the CSS padding for the spinner element within the button component. | **Medium** | `Open` |
| `FB-003` | **Question** | `Result Report` | The report mentions using 'form-validator' library, which was not in the original plan. Was this approved? | Introduces a new dependency that needs to be tracked and maintained. | Please add the approval for this library to the "Decisions & Trade-offs" section of the result report. | **Low** | `Open` |
| `FB-004` | **Compliance** | `RULE-01` | The "Terms of Service" link is missing from the sign-up page. | Violates the mandatory legal rule for user registration. | Add a checkbox and link to the Terms of Service on the sign-up form. | **High** | `Open` |
| ... | ... | ... | ... | ... | ... | ... | ... |