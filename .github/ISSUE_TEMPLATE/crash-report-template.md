---
name: 💥 Crash Report
about: Document and investigate a crash from an automated reporting service
title: "💥 Crash: [Brief summary of crash or error message]"
labels: 💥 crash
---
# 🚨 Original Crash Report
> 💡 *Paste the raw details from the crash reporting service (e.g., Sentry, Firebase Crashlytics). Include key information that helps identify and understand the crash.*
---

*   **Source:** [e.g., Sentry, Firebase Crashlytics, Manual Report]
*   **Report Link:** [Link to the specific crash report in the service]
*   **Timestamp of First Occurrence:** [Date and Time]
*   **Timestamp of Last Occurrence:** [Date and Time]
*   **Affected Version(s):** [e.g., App v1.2.3, Build 456]
*   **Error Message / Exception Type:**
    ```
    [Paste primary error message or exception type here]
    ```
*   **Stack Trace:**
    ```
    [Paste full stack trace here]
    ```
*   **Device Information (from report):**
    *   OS & Version: [e.g., Android 12, iOS 15.5]
    *   Device Model: [e.g., Pixel 6, iPhone 13 Pro]
    *   Orientation: [e.g., Portrait, Landscape]
    *   RAM Free/Total:
    *   Disk Space Free/Total:
*   **User Information (if available):**
    *   User ID:
    *   Custom Attributes:
*   **Breadcrumbs / Event Log (if available):**
    ```
    [Paste relevant breadcrumbs or event logs leading up to the crash]
    ```

# 🤖 AI Agent Context
> 💡 *Essential information for the AI agent to understand and execute this ticket effectively. Review all linked resources thoroughly before proceeding.*
---

## 📚 Relevant Project Files & Code
> 💡 *List all project files, code snippets, or directories that the AI agent **must read and understand** to effectively complete the tasks. Include paths relative to the project root and a brief note on their relevance.*
---
*   `[path/to/relevant/file1.ext]` - (Relevance: e.g., Contains the data model for X)
*   `[path/to/relevant/directory/]` - (Relevance: e.g., Contains all UI components for feature Y)
*   *Example: `src/models/user_model.dart` - (Relevance: Defines the User data structure)*

## 🌐 Relevant Documentation & Links
> 💡 *List any external web pages, API documentation, design specifications (e.g., Figma links), or other online resources the AI agent should consult. Include a brief note on their relevance.*
---
*   `[Link to relevant document/page 1]` - (Relevance: e.g., API endpoints for user service)
*   `[Link to Figma design for screen X]` - (Relevance: UI and UX specifications)
*   *Example: `https://api.example.com/v1/docs` - (Relevance: Official API documentation)*

## 💡 Other Key Information
> 💡 *Include any other critical context, specific instructions, or points the AI agent needs to be aware of. This could include previous decisions, specific constraints, key architectural considerations, or even links to previous related tickets/discussions.*
---
*   `[Context point 1: e.g., This task is a follow-up to ticket #123. Ensure consistency with its implementation.]`
*   `[Context point 2: e.g., Pay special attention to performance implications on mobile devices.]`
*   *Example: The primary goal is to refactor for readability, not to add new features.*
---

# 🔍 Initial Triage & Investigation
> 💡 *Preliminary analysis of the crash report to understand its scope and potential cause.*
---

*   **Frequency / Number of Occurrences:** [e.g., 100 times in last 24h, 5 unique users]
*   **Number of Affected Users:**
*   **First Seen In Version:**
*   **Regression? (If yes, from which version/change):**
*   **Known Related Issues/Tickets:** [Link any existing related bugs or issues]
*   **Initial Hypothesis (What might be causing this?):**
*   **Steps to Reproduce (if known or suspected):**
    > 1.
    > 2.
    > 3.
*   **Impact Assessment:**
    *   **Severity:** [Blocker / Critical / Major / Minor / Trivial]
        > *Blocker: Prevents core functionality for many users, no workaround.*
        > *Critical: Major functionality impacted, potential data loss/corruption.*
        > *Major: Significant functionality impacted, but a workaround might exist or affects a subset of users.*
        > *Minor: Minor functionality impacted, or UI/UX issue with low impact.*
        > *Trivial: Very minor inconvenience, rare occurrence.*
    *   **User Impact:** [e.g., App becomes unusable, Specific feature fails, Data corruption]

# 🔬 Root Cause Analysis
> 💡 *Detailed findings after investigating the crash. What is the confirmed cause?*
---

*   **Confirmed Cause:** [Describe the root cause of the crash in detail]
*   **Key Code Sections Involved:** [Identify specific files, functions, or modules]
*   **Conditions Leading to Crash:** [Specific scenarios or states that trigger the crash]

# 🛠️ Resolution Plan
> 💡 *How will this crash be fixed? This section mirrors the bug fixing process.*
---

## ✅ Acceptance Criteria for Fix
> 💡 *Specific, testable conditions that must be met for this crash to be considered resolved.*
---
> - [ ] Criterion 1: *[e.g., The app no longer crashes when performing action 'X' under condition 'Y'.]*
> - [ ] Criterion 2: *[e.g., The specific error message from the original report is no longer observed.]*
> - [ ] Criterion 3: *[e.g., Monitoring shows a significant reduction/elimination of this crash type.]*

## 🤝 Manual Acceptance Test Plan
> 💡 *Provide a step-by-step plan for manually verifying that the fix prevents the crash and doesn't introduce regressions.*
---
> 1. Prerequisite: *[e.g., User is on version X with the fix, specific data setup]*
> 2. Action: *[e.g., Attempt to reproduce original crash steps, if known]*
> 3. Expected Outcome: *[e.g., App functions correctly, no crash occurs]*
> 4. Action: *[e.g., Test related functionality]*
> 5. Expected Outcome: *[e.g., Related functionality remains unaffected]*

## 💡 Suggested Fix / Implementation Details
> 💡 *Describe the proposed technical solution to fix the crash.*
---

[Describe suggested fix here.]

## 🧪 Tests for Verification & Regression (If Applicable)
> 💡 *What automated tests (unit, integration, E2E) should be added or updated to verify this fix and prevent regressions?*
---
> - **Unit Tests:** *[e.g., Test function 'A' with edge case 'B' that previously led to crash.]*
> - **Integration Tests:** *[e.g., Verify interaction between component 'X' and 'Y' under specific conditions.]*
> - **E2E Tests:** *[e.g., Add/update E2E scenario to cover the user flow that triggered the crash.]*

## 💾 Data Model (If Applicable)
> 💡 *Describe any data model inconsistencies or issues related to this crash. Note if the fix requires data model changes or data migration.*
---

[Describe data model issues here.]

## 🔒 Security Implications (If Applicable)
> 💡 *Does this crash have any security implications (e.g., data exposure, denial of service)? If the fix involves changes to security rules or access controls, describe them.*
---

[Describe security implications here.]

## 🐒 API (If Applicable)
> 💡 *If the crash is related to an API interaction, or if the fix requires API changes, describe them here.*
---

[Describe API issues here.]

## 📊 Analytics (If Applicable)
> 💡 *Does this crash affect analytics tracking? If the fix requires changes to analytics events or properties, describe them.*
---

[Describe analytics impact here.]

## 🎨 UI/UX Considerations (If Applicable)
> 💡 *Are there any UI/UX aspects to consider for the fix (e.g., graceful error handling if a similar condition is met but doesn't crash)?*
---

[Describe UI/UX considerations here.]

# ☎️ Impact Communication
> 💡 *Who needs to be informed once this crash is fixed and deployed? (e.g., Support team, users if it was widespread).*
---

[List who to inform here.]

# ⏱️ Estimated Effort to Fix (Optional)
> 💡 *A rough estimate of the effort required to fix this crash. This can be refined later.*
---
> - **Investigation:** [X] hours (if not already fully completed)
> - **Implementation:** [X] hours
> - **Testing (Dev):** [X] hours
> - **Total:** [Y] hours

# 🎯 Roles & Todos (Optional)
> 💡 *Who is responsible for what regarding this crash?*
---
> ```
> * 🕵️ **Investigator/Reporter**:
>     - [x] Crash reported/logged
>     - [ ] Investigate root cause (if not done)
>     - [ ] Provide additional details if requested
> * 🔧 **Developer**:
>     - [ ] Implement fix
>     - [ ] Write/update automated tests
>     - [ ] Request code review
> * ✅ **QA/Tester**:
>     - [ ] Verify fix based on Acceptance Criteria and Test Plan
>     - [ ] Perform regression testing
> * 🚀 **Deployer**:
>     - [ ] Deploy fix to relevant environments
> ```

# 👉️ Final Remarks
> 💡 *Any other relevant information, dependencies, related issues, or things to be extra cautious about.*
---
> - **Related Issues:** *[Link to any related bugs, stories, or tasks]*
> - **Dependencies:** *[e.g., Blocked by X, Requires Y to be completed first]*
> - **Notes:** *[Any other comments, e.g., monitoring plan post-deployment]*