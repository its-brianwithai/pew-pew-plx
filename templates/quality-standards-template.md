---
name: quality-standards-template
description: Use this template to define quality standards for a project.
instructions: Make sure that when you implement this template, you don't include these instructions or any other front matter from this template in your work. Output should always and only be the markdown part outside of the front matter. Never include any tags like <example>, <commentary>, or similar tags - these serve only to increase clarity about implementation. Always use single [ ] brackets to indicate instructions the implementer should follow. When referencing other documents from this project, use wikilinks format [[filename]] to reference them. Do not include the file extension or path.
---
# 🏆 Quality Standards for: [Project Name]

> This document defines the quality standards and expectations for `[Project Name]`. It serves as a rubric for developers and reviewers to ensure that all work meets a consistent and high-quality bar. These standards supplement the specific acceptance criteria for any given feature.

## 1. 🧭 Guiding Principles
> 💡 *High-level principles that should guide all work on this project.*
---
*   **Principle 1: User-Centricity:** The end-user experience is the ultimate measure of quality.
*   **Principle 2: Robustness:** Build for resilience. The system should be reliable and handle errors gracefully.
*   **Principle 3: Maintainability:** Write clean, well-documented code and processes that are easy for others to understand and modify.
*   **Principle 4: Consistency:** Adhere to established patterns, style guides, and conventions to create a cohesive product.

---

## 2. 📊 Quality Rubric

| ID | Category | Standard / Expectation | How to Measure / Verify |
|:---|:---|:---|:---|
| **Code Quality** |
| `QS-CODE-01` | **Style & Formatting** | All code must adhere to the `[e.g., PSR-12, Google Java Style Guide]` and project-specific conventions. | Passes automated linter checks with zero errors. Code review sign-off. |
| `QS-CODE-02` | **Documentation** | All public methods, complex logic, and API endpoints must have clear, concise comments/documentation explaining their purpose, parameters, and return values. | Manual code review. Documentation coverage tools (if applicable). |
| `QS-CODE-03` | **Test Coverage** | Critical business logic must have a unit test coverage of at least `[e.g., 80%]`. | Code coverage reports from the CI/CD pipeline. |
| `QS-CODE-04` | **Simplicity** | Avoid premature optimization and overly complex solutions. Prefer simple, readable code over clever, obscure code. | Manual code review. Peer feedback. |
| **UI/UX Quality** |
| `QS-UI-01` | **Design Fidelity** | Implemented UI should be "pixel-perfect" when compared to the final Figma/Sketch mockups. | Visual comparison during review. Use of tools like Pixel-perfect extensions. |
| `QS-UI-02` | **Responsiveness** | All UI components must render correctly and be fully functional on standard viewport sizes (e.g., 360px, 768px, 1280px, 1920px). | Manual testing on different devices/emulators. |
| `QS-UI-03` | **Consistency** | Use components, colors, and typography from the established Design System. Do not introduce one-off styles. | Review against the Design System documentation. |
| **Documentation & Reporting** |
| `QS-DOC-01` | **Clarity** | All reports (e.g., Result Report) and internal documentation must be written in clear, unambiguous language, understandable by its intended audience. | Peer review. |
| `QS-DOC-02` | **Completeness** | The Result Report must be fully completed, with no empty sections. All changes must be documented. | Manual check against the template during review. |
| **Process Quality** |
| `QS-PROC-01` | **Traceability** | All work must be traceable back to a specific requirement, story, or task. | Commit messages should reference ticket IDs. Pull requests should link to the relevant story. |
| ... | ... | ... | ... |