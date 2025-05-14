---
name: 🐞 Bug Report
about: Describe a bug to help us improve
title: "🐞 [BUG] - Brief description of bug"
labels: 🐞 bug
---
# 🔖 Description
> 💡 *A clear and concise summary of the bug. What is the problem?*
---

# 🚶 Steps to Reproduce
> 💡 *Provide a precise, step-by-step plan to reliably reproduce the bug. Number each step.*
> 1. Go to '...'
> 2. Click on '....'
> 3. Scroll down to '....'
> 4. See error / unexpected behavior
---

# 🦋 Expected Result
> 💡 *What should have happened if the bug did not occur? Describe the correct behavior.*
---

# 🐛 Actual Result
> 💡 *What actually happened? Describe the erroneous behavior observed.*
---

# 🌍 Environment
> 💡 *Specify the environment(s) where the bug was observed. This helps in reproducing and diagnosing the issue.*
> - **Operating System:** [e.g., Windows 10, macOS Sonoma, Ubuntu 22.04]
> - **Browser (if applicable):** [e.g., Chrome 120, Firefox 118, Safari 17]
> - **App Version (if applicable):** [e.g., v1.2.3, Build 456]
> - **Device (if applicable):** [e.g., iPhone 13, Samsung Galaxy S22, Desktop]
> - **Login Status (if applicable):** [e.g., Logged in as admin, Logged out, Specific user role]
> - **Other relevant environment details:** [e.g., Specific network conditions, Third-party integrations active]
---

# 🔥 Impact / Severity
> 💡 *Describe the impact of this bug on users or the system. Assess its severity.*
> - **Severity:** [Blocker / Critical / Major / Minor / Trivial]
>   > *Blocker: Prevents core functionality, no workaround.*
>   > *Critical: Major functionality impacted, or data loss/corruption.*
>   > *Major: Significant functionality impacted, but a workaround exists.*
>   > *Minor: Minor functionality impacted, or UI/UX issue with low impact.*
>   > *Trivial: Cosmetic issue, typo, or very minor inconvenience.*
> - **Frequency:** [Always / Often / Sometimes / Rarely / Once]
>   > *How often does this bug occur?*
> - **Workaround:** [Yes / No / Partial]
>   > *Is there a way for users to bypass this bug? If yes, describe briefly.*
> - **User Impact:** [e.g., Prevents users from completing a key task, Causes data inconsistency, Minor annoyance]
---

# 📸 Screenshots / Videos (Optional)
> 💡 *Attach screenshots, GIFs, or videos that clearly demonstrate the bug. This is often very helpful.*
> *[Link to screenshot/video or embed here]*
---

# ✅ Acceptance Criteria for Fix
> 💡 *Specific, testable conditions that must be met for this bug to be considered resolved. How will we know it's fixed?*
> - [ ] Criterion 1: *[e.g., The error message 'X' no longer appears when performing action 'Y'.]*
> - [ ] Criterion 2: *[e.g., Users can successfully complete task 'Z' without encountering the reported issue.]*
> - [ ] Criterion 3: *[e.g., The data in field 'A' is now correctly displayed as 'B'.]*
---

# 🤝 Manual Acceptance Test Plan
> 💡 *Provide a step-by-step plan for manually verifying that the bug fix works as expected in the primary use case(s).*
> 1. Prerequisite: *[e.g., User is logged in as 'X', specific data setup]*
> 2. Action: *[e.g., Navigate to page 'Y']*
> 3. Expected Outcome: *[e.g., Page 'Y' loads correctly, no error message]*
> 4. Action: *[e.g., Perform original step 'Z' that caused the bug]*
> 5. Expected Outcome: *[e.g., Step 'Z' completes successfully, expected result 'W' is observed]*
---

# 💡 Suggested Fix / Investigation Notes (Optional)
> 💡 *If you have any initial thoughts on the cause of the bug, potential solutions, or areas of the codebase to investigate, note them here. This can help the developer assigned to the bug.*
---

# 🧪 Tests for Verification & Regression (If Applicable)
> 💡 *What automated tests (unit, integration, E2E) should be added or updated to verify this fix and prevent regressions?*
> - **Unit Tests:** *[e.g., Test function 'X' with input 'Y' to ensure output 'Z'.]*
> - **Integration Tests:** *[e.g., Verify interaction between module 'A' and module 'B' after the fix.]*
> - **E2E Tests:** *[e.g., Update E2E scenario 'C' to include verification of the fixed behavior.]*
---

# 💾 Data Model (If Applicable)
> 💡 *Describe any data model inconsistencies or issues related to this bug. Note if the fix requires data model changes or data migration.*
---

# 🔒 Security Implications (If Applicable)
> 💡 *Does this bug have any security implications (e.g., data exposure, unauthorized access)? If the fix involves changes to security rules or access controls, describe them.*
---

# 🐒 API (If Applicable)
> 💡 *If the bug is related to an API endpoint, or if the fix requires API changes, describe them here (e.g., request/response changes, new endpoints, deprecated endpoints).*
---

# 📊 Analytics (If Applicable)
> 💡 *Does this bug affect analytics tracking? If the fix requires changes to analytics events or properties, describe them.*
---

# 🎨 UI/UX Considerations (If Applicable)
> 💡 *Are there any UI/UX aspects to consider for the fix? (e.g., error message display, loading states, visual consistency).*
---

# ☎️ Impact Communication
> 💡 *Who needs to be informed once this bug is fixed and deployed? (e.g., Specific users, support team, marketing, other development teams).*
---

# ⏱️ Estimated Effort to Fix (Optional)
> 💡 *A rough estimate of the effort required to fix this bug. This can be refined later.*
> - **Investigation:** [X] hours
> - **Implementation:** [X] hours
> - **Testing (Dev):** [X] hours
> - **Total:** [Y] hours
---

# 🎯 Roles & Todos (Optional)
> 💡 *Who is responsible for what regarding this bug?*
> ```
> * 🕵️ **Investigator/Reporter**:
>     - [x] Bug reported
>     - [ ] Provide additional details if requested
> * 🔧 **Developer**:
>     - [ ] Investigate root cause
>     - [ ] Implement fix
>     - [ ] Write/update automated tests
>     - [ ] Request code review
> * 🧐 **Code Reviewer**:
>     - [ ] Review proposed fix
> * ✅ **QA/Tester**:
>     - [ ] Verify fix based on Acceptance Criteria and Test Plan
>     - [ ] Perform regression testing
> * 🚀 **Deployer**:
>     - [ ] Deploy fix to relevant environments
> ```
---

# 👉️ Final Remarks
> 💡 *Any other relevant information, dependencies, related issues, or things to be extra cautious about.*
> - **Related Issues:** *[Link to any related bugs, stories, or tasks]*
> - **Dependencies:** *[e.g., Blocked by X, Requires Y to be completed first]*
> - **Notes:** *[Any other comments]*
