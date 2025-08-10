---
name: milestone-template
description: Use this template when creating individual milestone documentation. A milestone is a collection of features, tasks, and activities required to achieve a specific project goal.
instructions: Make sure that when you implement this template, you don't include these instructions or any other front matter from this template in your work. Output should always and only be the markdown part outside of the front matter. Never include any tags like <example>, <commentary>, or similar tags - these serve only to increase clarity about implementation. Always use single [ ] brackets to indicate instructions the implementer should follow. When referencing other documents from this project, use wikilinks format [[filename]] to reference them. Do not include the file extension or path.
---
# 🎯 Milestone: [Milestone Name]
> 💡 *A significant project goal that represents a collection of features, tasks, and activities. Clear and concise description of this milestone, its purpose, and the value it brings to this project.*

[Description of this milestone, its goals, and why it's important]

---

## 🎯 Goal & Value
> 💡 *Clear articulation of what this milestone achieves and the user or business value it delivers.*

**Goal**: [What this milestone aims to accomplish]  
**Value**: [The benefit to users or the business]  
**Target Date**: [Sprint number or target date]

---

## 📦 Deliverables
> 💡 *Clear list of concrete outputs and assets that will exist when this milestone is completed.*

[List the specific deliverables that will be created for this milestone]

```
<example>
- [[login-screen]]: User authentication interface
- [[auth-service]]: Backend authentication logic
- [[session-management]]: Token-based session handling
- [[password-recovery-flow]]: Self-service password reset
- [[user-profile-component]]: Basic user profile display
</example>
```

---

## 📝 User Stories
> 💡 *Detailed user stories that make up this milestone, each focused on delivering specific value.*

[List user stories with their details]

```
<example>
### Story 1: User Registration
**As a** new user  
**I want to** create an account  
**So that** I can access personalized features

**Points**: 3  
**Priority**: High  
**Deliverable**: [[user-registration-flow]]

### Story 2: Secure Login
**As a** registered user  
**I want to** log in securely  
**So that** I can access my account

**Points**: 2  
**Priority**: High  
**Deliverable**: [[login-component]]
</example>
```

---

## ✅ Acceptance Criteria
> 💡 *The criteria that must be met for this milestone to be considered successfully completed.*

[Define measurable acceptance criteria for the milestone]

```
<example>
### Functional Criteria
- [ ] Users can register with email and password
- [ ] Email verification prevents unauthorized access
- [ ] Users can log in and maintain sessions
- [ ] Password recovery works end-to-end
- [ ] User profile displays correct information

### Technical Criteria
- [ ] All API endpoints respond correctly
- [ ] Database operations maintain data integrity
- [ ] Authentication tokens expire appropriately
- [ ] Security best practices implemented
- [ ] Performance benchmarks met

### Quality Criteria
- [ ] Unit test coverage > 80%
- [ ] All integration tests pass
- [ ] Code review completed
- [ ] Documentation updated
- [ ] No critical bugs
</example>
```

---

## 🔗 Dependencies
> 💡 *External dependencies, prerequisites, or blockers that could impact this milestone.*

[List dependencies and their status]

```
<example>
### Technical Dependencies
- [[design-system]]: UI components library (Available)
- [[auth-library]]: Authentication framework (Need to select)
- [[email-service]]: Email delivery system (In progress)

### Resource Dependencies
- [[frontend-team]]: 2 developers allocated
- [[backend-team]]: 1 developer allocated
- [[design-team]]: Mockups completed

### Blockers
- [ ] Waiting for security audit approval
- [ ] Email service provider selection pending
</example>
```

---

## ⏱️ Timeline & Effort
> 💡 *Estimated effort and timeline for completing this milestone.*

**Total Estimated Effort**: [Total hours/points]  
**Duration**: [Number of sprints/weeks]  
**Team Size**: [Number of people]

```
<example>
### Effort by Role
- Design: 20 hours (completed)
- Frontend Development: 60 hours
- Backend Development: 40 hours
- QA & Testing: 30 hours
- DevOps: 10 hours
- **Total**: 160 hours

### Sprint Breakdown
- Sprint 1: User registration and email verification
- Sprint 2: Login and session management
- Sprint 3: Password recovery and user profile
- Sprint 4: Integration testing and bug fixes
</example>
```
