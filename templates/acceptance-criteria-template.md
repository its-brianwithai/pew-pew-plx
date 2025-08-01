---
name: acceptance-criteria-template
description: Use this template to document Acceptance Criteria for a project or feature.
instructions: Make sure that when you implement this template, you don't include these instructions or any other front matter from this template in your work. Output should always and only be the markdown part outside of the front matter. Never include any tags like <example>, <commentary>, or similar tags - these serve only to increase clarity about implementation. Always use single [ ] brackets to indicate instructions the implementer should follow. When referencing other documents from this project, use wikilinks format [[filename]] to reference them. Do not include the file extension or path.
---
# ✅ Acceptance Criteria for: [Project/Feature Name]

> This document outlines the specific, testable criteria that must be met for the `[Project/Feature Name]` to be considered complete and successful. It serves as a definitive checklist for developers, testers, and stakeholders to ensure the final result aligns with all expectations.

## 1. 🎯 Related Documents
> 💡 *Link to the primary requirement documents that these criteria are based on.*
---
*   **User Story / PRD:** [[story-or-prd-name]]
*   **Quality Standards:** [[quality-standards-template]]
*   **Rules & Restrictions:** [[rules-template]], [[restrictions-template]]

---

## 2. ☑️ Criteria Checklist

### Category: Functional Criteria
> 💡 *Criteria that test *what* the system does. These are typically derived from user stories and functional requirements.*

- [ ] **AC-FUNC-01:** `[e.g., User can successfully log in using a valid email and password.]`
- [ ] **AC-FUNC-02:** `[e.g., User receives a specific error message ("Invalid credentials") when login fails due to incorrect password.]`
- [ ] **AC-FUNC-03:** `[e.g., All data submitted through the contact form is successfully saved to the database.]`
- [ ] ...

### Category: UI/UX & Design Criteria
> 💡 *Criteria that test the look, feel, and usability of the interface. These are based on design mockups and usability standards.*

- [ ] **AC-UI-01:** `[e.g., The login form's layout and styling match the Figma mockup (Frame 2.1) pixel-perfectly.]`
- [ ] **AC-UI-02:** `[e.g., The login button displays a loading spinner animation while the login request is in progress.]`
- [ ] **AC-UI-03:** `[e.g., All interactive elements provide visual feedback on hover and click states.]`
- [ ] **AC-UI-04:** `[e.g., The application is fully responsive and usable on standard mobile, tablet, and desktop screen sizes.]`
- [ ] ...

### Category: Performance Criteria
> 💡 *Criteria that test the speed, responsiveness, and efficiency of the system.*

- [ ] **AC-PERF-01:** `[e.g., The main dashboard must load in under 2 seconds on a standard broadband connection.]`
- [ ] **AC-PERF-02:** `[e.g., The system must handle 100 concurrent users performing login actions without response times exceeding 500ms.]`
- [ ] ...

### Category: Security & Access Control Criteria
> 💡 *Criteria that test the security and data protection measures of the system.*

- [ ] **AC-SEC-01:** `[e.g., A non-authenticated user attempting to access a dashboard URL is redirected to the login page.]`
- [ ] **AC-SEC-02:** `[e.g., User passwords are not stored in plain text in the database.]`
- [ ] **AC-SEC-03:** `[e.g., Input fields are sanitized to prevent XSS attacks.]`
- [ ] ...

### Category: Accessibility Criteria
> 💡 *Criteria that ensure the application is usable by people with disabilities.*

- [ ] **AC-A11Y-01:** `[e.g., All images have descriptive alt-text.]`
- [ ] **AC-A11Y-02:** `[e.g., All form fields have associated labels for screen readers.]`
- [ ] **AC-A11Y-03:** `[e.g., The entire user flow can be navigated using only a keyboard.]`
- [ ] ...