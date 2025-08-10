---
name: work-log-template
description: Use this template to log the work completed for a ticket or story, providing a comprehensive overview of all changes made.
instructions: Make sure that when you implement this template, you don't include these instructions or any other front matter from this template in your work. Output should always and only be the markdown part outside of the front matter. Never include any tags like <example>, <commentary>, or similar tags - these serve only to increase clarity about implementation. Always use single [ ] brackets to indicate instructions the implementer should follow. When referencing other documents from this project, use wikilinks format [[filename]] to reference them. Do not include the file extension or path.
---
# 📋 Work Log: [Title of Task/Story]
> 💡 *This report details the implementation of the work described in a specific ticket or story. It provides a comprehensive overview of all changes, the reasoning behind them, and a guide for verification, giving any stakeholder a complete understanding of the work done.*

## 📄 Summary & Key Documents
> 💡 *A high-level summary of the work completed and links to all relevant documents that provided context for the implementation.*

**Summary:** [Briefly summarize what was accomplished. e.g., "Implemented the user login feature, including the UI, state management, and API integration, as specified in the development plan."]

**Key Documents:**
- [[dev-plan-name]]
- [[story-or-prd-name]]
- [[architecture-document-name]]
- [Link to UI/UX Designs]

## 🚀 Implementation Overview
> 💡 *A narrative describing the overall approach taken to implement the feature. Explain the high-level strategy and how different parts of the system were connected.*

[e.g., The implementation followed a standard MVVM pattern. A new LoginScreen was created to house the UI components. The LoginViewModel handles user input and communicates with a new AuthService, which is responsible for making the API call to the backend.]

<example>
```mermaid
graph TD
    A[User on LoginScreen] -->|Enters credentials & taps Login| B(LoginViewModel);
    B -->|Calls signIn()| C(AuthService);
    C -->|Sends request| D[Backend API];
    D -- Success --> C;
    C -- Returns User object --> B;
    B -->|Updates state & navigates| E[HomeScreen];
```
</example>

## ⚙️ Detailed Changes
> 💡 *A detailed breakdown of all changes made to the project, categorized by type.*

### 📂 File & Code Changes
> 💡 *List all files created, updated, or deleted. For significant changes, provide a summary of the new logic.*

- **Created:** `path/to/new_file.js`
    - **Reasoning:** [e.g., This new file contains the AuthService, created to encapsulate all authentication-related logic.]
- **Updated:** `path/to/existing_file.js`
    - **Reasoning:** [e.g., Added a new route to handle navigation to the LoginScreen.]
- **Deleted:** `path/to/old_file.js`
    - **Reasoning:** [e.g., This file contained legacy logic that has now been replaced by the new AuthService.]

### 💾 Data Model / Database Changes
> 💡 *Describe any changes to the database schema or data models.*

- **Table/Collection:** [e.g., `users`]
    - **Change:** [e.g., Added a new column `last_login_at` of type TIMESTAMP.]
    - **Reasoning:** [e.g., To track user activity for analytics.]

### 🔌 API Changes
> 💡 *Describe any new, updated, or deleted API endpoints.*

- **Endpoint:** `POST /api/v1/login`
    - **Change:** [New endpoint created.]
    - **Description:** [Accepts 'email' and 'password'. Returns a JWT on success.]

## ✅ Acceptance Test Guide
> 💡 *A step-by-step guide for a non-technical stakeholder to manually verify that the implementation meets the requirements.*

**Objective:** To verify that the user login functionality works as expected.

| Step | Action                                             | Expected Result                                                   |
| :--- | :------------------------------------------------- | :---------------------------------------------------------------- |
| 1.   | Navigate to the application's login page.          | The login form with "Email", "Password", and "Login" is visible.  |
| 2.   | Enter a **valid** email and **correct** password.  | The user is successfully logged in and redirected to the dashboard. |
| 3.   | Enter a **valid** email and **incorrect** password.| An error message "Invalid credentials" appears.                   |


## 🤔 Decisions & Trade-offs
> 💡 *Document any significant decisions made during implementation that were not explicitly defined in the planning documents, including any trade-offs.*

- **Decision:** [e.g., Used third-party library 'form-validator' for input validation.]
    - **Reasoning:** [e.g., To speed up development and rely on a well-tested solution.]
    - **Trade-off:** [e.g., Adds a new dependency to the project.]

## 🏁 Conclusion
> 💡 *A final summary of the work and its impact.*

[The feature has been successfully implemented and tested according to the provided plans. The system is now ready for formal review and user acceptance testing.]
