---
name: milestone-template
description: Use this template to outline a milestone. A milestone is a collection of features, tasks, and activities required to achieve a specific project goal. It provides a clear overview of what needs to be done, by whom, and what the expected outcomes are.
instructions: Make sure that when you implement this template, you don't include these instructions or any other front matter from this template in your work. Output should always and only be the markdown part outside of the front matter. Never include any tags like <example>, <commentary>, or similar tags - these serve only to increase clarity about implementation. Always use single [ ] brackets to indicate instructions the implementer should follow. When referencing other documents from this project, use wikilinks format [[filename]] to reference them. Do not include the file extension or path.
---
# [Fitting Emoji] Milestone: [Name]
> 💡 *A significant project goal that represents a collection of features, tasks, and activities. Clear and concise description of this milestone, its purpose, and the value it brings to this project.*

[Description of this milestone]

---

## 📦 Deliverables
> 💡 *Clear list of concrete outputs and assets that will exist when this milestone is completed.*

[List the specific deliverables that will be created for this milestone]

<example>
- [ ] [[example-login-screen]] with email/password fields
- [ ] User authentication API endpoint in [[example-auth-service]]
- [ ] Session management system
- [ ] [[example-home-screen]] with hamburger menu
- [ ] Settings page navigation to [[example-settings-screen]]
</example>

---

## ⚙️ Component Breakdown
> 💡 *Who does what? What can they do? How? What are the steps? What do we need to create? Where? Break down the milestone into concrete scenarios showing how actors interact with components.*

[Create scenarios that break down the milestone into concrete user interactions and system behaviors]

<example>
## 🎯 Scenario: [[example-actor]] can create item

### 👣 Steps:
> 💡 *Break down each step showing what the actor does and what components need to be built to support that action.*

[[example-actor]] opens the [[example-dashboard-component]]
- [[example-team-frontend]]
  - [ ] Navigation link to [[example-dashboard-component]]
  - [ ] Page layout with [[example-header-component]]
  - [ ] Empty state placeholder for [[example-item-list]]
- [[example-team-backend]]
  - [ ] Dashboard route endpoint

[[example-actor]] selects a category
- [[example-team-frontend]]
  - [ ] [[example-category-selector]] dropdown component
  - [ ] Selected category indicator in [[example-category-display]]
- [[example-team-backend]]
  - [ ] Categories API endpoint

[[example-actor]] enters item details
- [[example-team-frontend]]
  - [ ] [[example-item-form]] component
  - [ ] Title and description input fields
  - [ ] [[example-date-selector]] component
- [[example-team-backend]]
  - [ ] Form validation schema

[[example-actor]] submits the item
- [[example-team-backend]]
  - [ ] Create item API endpoint
- [[example-team-frontend]]
  - [ ] Success confirmation message in [[example-notification-component]]
- [[example-team-mobile]]
  - [ ] [[example-push-notification-service]] system
</example>

---

## ✅ Acceptance Criteria
> 💡 *The criteria that must be met for this milestone to be considered successfully completed.*

[Define acceptance criteria organized by team, outlining what each team needs to deliver]

<example>
[[example-team-backend]]
- [ ] All API endpoints respond with correct status codes
- [ ] Database operations complete without data loss
- [ ] [[example-authentication-system]] validates user credentials

[[example-team-frontend]]
- [ ] User interface displays all required data fields
- [ ] Form validations prevent invalid data submission in [[example-contact-form]]
- [ ] Navigation flows work as expected between [[example-home-screen]] and [[example-settings-screen]]

[[example-team-mobile]]
- [ ] App launches successfully on target devices
- [ ] User interactions trigger appropriate responses in [[example-mobile-app]]
- [ ] Data syncs correctly between [[example-mobile-app]] and [[example-api-service]]
</example>

---

## ⏱️ Effort Breakdown & Estimates
> 💡 *Break down the estimated effort for all components within this milestone. QA is calculated as 25% of core work (Design + Refinement + Front-end + Back-end + Operations), Testing as 15% of core work, and Delay Margin defaults to 10% of total estimated work (increasing for high-risk items).*

[Create a table showing effort estimates across different work types for each feature or component]

<example>
| Feature/Component/Story | Design (hrs) | Refinement (hrs) | Front-end (hrs) | Back-end (hrs) | Operations (hrs) | Core Total | QA (hrs) | Testing (hrs) | Subtotal | Delay Margin (%) | Delay Margin (hrs) | Total Hours |
| :---------------------- | :----------- | :--------------- | :-------------- | :------------- | :------------ | :--------- | :------- | :------------ | :------- | :--------------- | :----------------- | :---------- |
| [[example-user-authentication]] | 8            | 4                | 16              | 12             | 2             | 42         | 10.5     | 6.3           | 58.8     | 10%              | 5.9                | 65          |
| [[example-item-management]] | 12           | 6                | 24              | 18             | 4             | 64         | 16       | 9.6           | 89.6     | 15%              | 13.4               | 103         |
| [[example-dashboard-navigation]] | 6            | 3                | 12              | 8              | 2             | 31         | 7.8      | 4.7           | 43.5     | 10%              | 4.4                | 48          |
| **TOTAL**              | **26**       | **13**           | **52**          | **38**         | **8**         | **137**    | **34.3** | **20.6**      | **191.9** | **12%**          | **23.7**           | **216**     |
</example>
