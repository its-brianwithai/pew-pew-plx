---
name: roadmap-template
description: Use this template when in Phase 4 of the plan workflow to create a project roadmap that organizes deliverables into milestones and create user stories with effort estimates.
instructions: Make sure that when you implement this template, you don't include these instructions or any other front matter from this template in your work. Output should always and only be the markdown part outside of the front matter. Never include any tags like <example>, <commentary>, or similar tags - these serve only to increase clarity about implementation. Always use single [ ] brackets to indicate instructions the implementer should follow. When referencing other documents from this project, use wikilinks format [[filename]] to reference them. Do not include the file extension or path.
---
# 🗺️ Roadmap: [Project Name]
> 💡 *Project roadmap that organizes deliverables into releasable milestones and detailed user stories. This document provides the complete implementation timeline and effort breakdown.*

[Brief overview of the milestones and their goals]

---

## 🎯 Milestones
> 💡 *Testable, releasable units of work that deliver user value. Each milestone groups related deliverables that can be deployed together as one cohesive feature set.*

[Define each milestone with its scope and acceptance criteria]

```
<example>
### Milestone 1: [[authentication-milestone]]
**Goal**: Enable users to securely access the system
**Value**: Users can create accounts and log in to access personalized features
**Target Date**: [Sprint/Date]

#### Included Deliverables
- [[user-registration-flow]]: Account creation with email verification
- [[login-component]]: Secure authentication interface
- [[session-management]]: Token-based session handling
- [[password-recovery]]: Self-service password reset

#### Acceptance Criteria
- [ ] Users can register with email and password
- [ ] Email verification prevents unauthorized access
- [ ] Users can log in and maintain sessions
- [ ] Password recovery works end-to-end
- [ ] All security best practices implemented

### Milestone 2: [[data-management-milestone]]
**Goal**: [Next milestone goal]
**Value**: [User or business value]
**Target Date**: [Sprint/Date]

[Continue with additional milestones]
</example>
```

---

## 📝 User Stories
> 💡 *Detailed user stories for each deliverable, organized by milestone. Each story includes acceptance criteria and is sized at 3 story points or less.*

[Create user stories for each deliverable within milestones]

```
<example>
### Milestone: [[authentication-milestone]]

#### Story: User Registration
**As a** new user  
**I want to** create an account  
**So that** I can access personalized features

**Deliverable**: [[user-registration-flow]]
**Points**: 3
**Priority**: High

**Acceptance Criteria**:
- [ ] Registration form validates email format
- [ ] Password meets security requirements
- [ ] Verification email sent upon submission
- [ ] Account inactive until email verified
- [ ] Clear error messages for validation failures

**Technical Constraints**:
- Use [[auth-service]] for backend logic
- Follow [[design-system]] for UI components
- Implement [[security-standards]] for password handling

#### Story: Secure Login
**As a** registered user  
**I want to** log in securely  
**So that** I can access my account

**Deliverable**: [[login-component]]
**Points**: 2
**Priority**: High

[Continue with more stories]
</example>
```

---

## ⏱️ Effort Breakdown
> 💡 *Consolidated effort estimates for all milestones and stories. Core work includes Design, Refinement, Frontend, Backend, and Operations. QA is 25% of core work, Testing is 15% of core work, and Delay Margin accounts for risk.*

[Create effort breakdown table for all milestones]

```
<example>

| Milestone/Story | Design | Refinement | Frontend | Backend | Operations | Core Total | QA (25%) | Testing (15%) | Subtotal | Risk | Delay Margin | Total Hours |
|:----------------|:-------|:-----------|:---------|:--------|:-----------|:-----------|:---------|:--------------|:---------|:-----|:-------------|:------------|
| **[[authentication-milestone]]** | | | | | | | | | | | | |
| User Registration | 4 | 2 | 8 | 6 | 1 | 21 | 5.25 | 3.15 | 29.4 | Low | 10% (2.9) | 32 |
| Secure Login | 2 | 1 | 4 | 4 | 1 | 12 | 3 | 1.8 | 16.8 | Low | 10% (1.7) | 19 |
| Session Management | 1 | 2 | 3 | 8 | 2 | 16 | 4 | 2.4 | 22.4 | Med | 15% (3.4) | 26 |
| Password Recovery | 3 | 1 | 6 | 4 | 1 | 15 | 3.75 | 2.25 | 21 | Low | 10% (2.1) | 23 |
| **Subtotal** | **10** | **6** | **21** | **22** | **5** | **64** | **16** | **9.6** | **89.6** | | | **100** |
| | | | | | | | | | | | | |
| **[[data-management-milestone]]** | | | | | | | | | | | | |
| [Continue with next milestone] | | | | | | | | | | | | |
| **TOTAL PROJECT** | **X** | **X** | **X** | **X** | **X** | **X** | **X** | **X** | **X** | | **X** | **X** |

</example>
```
