# 🎯 Creating Milestones and User Stories Using Expert Prompts

This tutorial demonstrates how to use the `Milestone Proposal Expert` and `User Story Expert` AI prompts along with their respective templates to generate structured project milestones and detailed user story proposals. Following these steps will help ensure consistency and completeness in your project planning artifacts.

## 🎯 Part 1: Creating a Project Milestone

This section explains how to use the `Milestone Proposal Expert` prompt and the `milestone-template.md` to define a project milestone.

### 📥 Step 1: Understand the Inputs

The `Milestone Proposal Expert` requires specific inputs to function correctly:

1.  **User Instructions:** Your specific request detailing the goal and scope of the milestone.
2.  **File Map (Optional but helpful):** An overview of project files for context.
3.  **File Contents:** The actual content of relevant files, most importantly the `milestone-template.md` and the `you-are-a-milestone-proposal-expert.md` prompt itself.

### 🛠️ Step 2: Prepare the Prompt and Template

Ensure you provide the AI with the full content of the `Milestone Proposal Expert` prompt and the `milestone-template.md`.

**Milestone Proposal Expert Prompt (`you-are-a-milestone-proposal-expert.md`):**```markdown
# Role: Milestone Proposal Expert

## Goal:
Your primary goal is to create well-defined project milestones based on user requirements and a provided template (`milestone-template.md`). You will analyze the user's request, leverage the structure of the template, and generate a complete milestone definition ready for use in project planning.

## Input Context:
You will receive the following information to perform your task:
1.  **User Instructions:** Specific requirements or context for the milestone, enclosed in `<user_instructions>` tags.
2.  **File Map:** An overview of relevant project files, enclosed in `<file_map>` tags (primarily for context, the template content is key).
3.  **File Contents:** The content of relevant files, crucially including the `milestone-template.md`, enclosed in `<file_contents>` tags.

## Process:
1.  **Understand the Request:** Carefully read the `<user_instructions>` to grasp the purpose and scope of the requested milestone.
2.  **Identify the Template:** Locate the `milestone-template.md` within the `<file_contents>`. Familiarize yourself with its sections (Goal, Tasks, Related User Stories, Deliverables, Acceptance Criteria, etc.).
3.  **Structure the Milestone:** Use the exact structure and headings provided in the `milestone-template.md` for your output. Do not deviate from this structure.
4.  **Populate Sections:** Fill in each section of the template based on the user's request and the nature of the milestone:
    *   **Milestone Title:** Create a concise and descriptive title based on the user instructions.
    *   **Goal / Objective:** Clearly articulate the primary goal this milestone aims to achieve, derived from the user instructions.
    *   **Key Tasks / Activities:** List the specific, actionable tasks required to reach the milestone goal. Infer these from the user instructions or state that they need further definition if not provided. Use the checklist format `[ ] Task Description`.
    *   **Related User Stories:** List the user stories that fall under this milestone's scope. These stories are intended to be refined later using the `user-story-proposal-template.md` (often by a `User Story Expert`). Use the format `[ ] User Story Title: [Brief Description or Link]`. Infer potential stories from the goal and tasks if not explicitly provided, noting that they need refinement.
    *   **Deliverables / Artifacts:** List the tangible outputs expected upon completion (e.g., code, documents, features). Infer these based on the tasks and goal.
    *   **Acceptance Criteria:** Define specific, measurable criteria that confirm the milestone goal has been met. These should directly relate to the goal and deliverables.
    *   **Dependencies / Related Links (Optional):** Include if mentioned or clearly implied in the user instructions.
    *   **Notes (Optional):** Add any relevant context, assumptions, or risks mentioned or inferred.
5.  **Clarity and Completeness:** Ensure the goal is clear, tasks are actionable, deliverables are tangible, and acceptance criteria are specific. If information is missing in the user request to fill a mandatory section (like Goal or Tasks), state what is needed or make reasonable assumptions and note them. Ensure listed User Stories logically align with the milestone's scope.

## Output Format:
Produce the complete Milestone definition in Markdown format, strictly adhering to the structure and headings found in the `milestone-template.md`. Do not include any introductory or concluding remarks outside of the template structure. Start directly with the `# Milestone: [Generated Title]` heading.
```

**Milestone Template (`milestone-template.md`):**

```markdown
# Milestone: [Enter Milestone Title Here]

---

## 🎯 Goal / Objective
*   _Clearly state the primary goal or objective this milestone aims to achieve. What does success look like for this specific milestone?_

---

## 🛠️ Key Tasks / Activities
*   [ ] Task 1: _Describe the first key task required._
*   [ ] Task 2: _Describe the second key task required._
*   [ ] Task 3: _Add more tasks as needed._
*   ...

---

## 👤 Related User Stories
*   _List the specific User Stories associated with this milestone. These stories will be further detailed using the User Story Proposal template._
    *   [ ] User Story 1 Title: [Link to proposal if available, or brief description]
    *   [ ] User Story 2 Title: [Link to proposal if available, or brief description]
    *   ...

---

## 📦 Deliverables / Artifacts
*   _List the tangible outputs or artifacts that will be produced upon completion of this milestone._
    *   Example: Updated `README.md`
    *   Example: Functional prototype link
    *   Example: Test results document

---

## ✅ Acceptance Criteria
*   _Define the specific, measurable criteria that must be met for this milestone to be considered complete._
    *   Criterion 1: _e.g., Code merged to main branch._
    *   Criterion 2: _e.g., Feature X is demonstrable in the staging environment._
    *   Criterion 3: _e.g., All tasks listed above are marked as complete._

---

## 🔗 Dependencies / Related Links (Optional)
*   _List any dependencies (e.g., previous milestones, external factors) or relevant links (e.g., design docs, tickets)._
    *   Dependency: [Link or Description]
    *   Related: [Link or Description]

---

## 📝 Notes (Optional)
*   _Add any additional context, notes, or risks relevant to this milestone._

---
```

### ✍️ Step 3: Provide User Instructions

Craft your specific request for the milestone. Enclose it in `<user_instructions>` tags.

**Example User Instructions:**

```xml
<user_instructions>
Create a milestone for implementing the basic user authentication feature for our new mobile app. This should include user registration, login, and password reset functionality. The goal is to have a working authentication flow ready for internal testing.
</user_instructions>
```

### 🚀 Step 4: Generate the Milestone

Provide the prompt, template, and your user instructions to the AI. The AI, acting as the `Milestone Proposal Expert`, will generate the milestone definition based on the template.

**Example Expected Output:**

```markdown
# Milestone: Implement Basic User Authentication

---

## 🎯 Goal / Objective
*   To implement and internally test the core user authentication features (registration, login, password reset) for the mobile app, enabling secure user access.

---

## 🛠️ Key Tasks / Activities
*   [ ] Design authentication UI screens (Registration, Login, Password Reset).
*   [ ] Set up backend infrastructure for user accounts (database schema, API endpoints).
*   [ ] Implement user registration logic (front-end and backend).
*   [ ] Implement user login logic (front-end and backend, including session management).
*   [ ] Implement password reset flow (request token, email sending, reset form).
*   [ ] Write basic unit/integration tests for authentication endpoints.
*   [ ] Conduct internal testing of the complete authentication flow.

---

## 👤 Related User Stories
*   _These stories need further refinement using the User Story Proposal template._
    *   [ ] User Registration: As a new user, I want to create an account so I can access the app's features.
    *   [ ] User Login: As a registered user, I want to log in to my account securely.
    *   [ ] Password Reset: As a user who forgot my password, I want to reset it so I can regain access to my account.

---

## 📦 Deliverables / Artifacts
*   Functional authentication UI components (Registration, Login, Password Reset screens).
*   Backend API endpoints for registration, login, and password reset.
*   User account data storage mechanism.
*   Automated tests for authentication logic.
*   Internal test report confirming flow functionality.

---

## ✅ Acceptance Criteria
*   New users can successfully register an account via the app UI.
*   Registered users can successfully log in using their credentials.
*   Users can successfully initiate and complete the password reset process via email.
*   Authentication API endpoints function as expected and handle common error cases.
*   The authentication flow is demonstrable in the internal testing environment.
*   All key tasks listed above are marked as complete.

---

## 🔗 Dependencies / Related Links (Optional)
*   Dependency: Base project setup and navigation structure.
*   Related: UI/UX Design mockups for authentication screens (link if available).

---

## 📝 Notes (Optional)
*   This milestone focuses on core functionality. Advanced features like social login or two-factor authentication are out of scope for this milestone.
*   Assumes email service integration is available for password reset.

---
```

## 👤 Part 2: Creating a User Story Proposal

This section explains how to use the `User Story Expert` prompt and the `user-story-proposal-template.md` to detail a specific user story, often one identified within a milestone.

### Step 1: Understand the Inputs

The `User Story Expert` requires:

1.  **User Instructions:** Your specific request detailing the user story to be elaborated.
2.  **File Map (Optional):** Project file context.
3.  **File Contents:** The content of the `user-story-proposal-template.md` and the `you-are-a-user-story-expert.md` prompt.

### Step 2: Prepare the Prompt and Template

Provide the AI with the full content of the `User Story Expert` prompt and the `user-story-proposal-template.md`.

**User Story Expert Prompt (`you-are-a-user-story-expert.md`):**

```markdown
# Role: User Story Expert

## Goal:
Your primary goal is to create comprehensive and well-structured User Story Proposals based on user requirements and a provided template. You will analyze the user's request, leverage the structure of the `user-story-proposal-template.md`, and generate a detailed proposal ready for review and refinement.

## Input Context:
You will receive the following information to perform your task:
1.  **User Instructions:** Specific requirements for the user story, enclosed in `<user_instructions>` tags.
2.  **File Map:** An overview of the relevant project files, enclosed in `<file_map>` tags.
3.  **File Contents:** The content of relevant files, particularly the template (`user-story-proposal-template.md`), enclosed in `<file_contents>` tags.

## Process:
1.  **Understand the Request:** Carefully read the `<user_instructions>` to grasp the core user story, its objectives, and any specific details provided by the user.
2.  **Identify the Template:** Locate the `user-story-proposal-template.md` within the `<file_contents>`. Familiarize yourself with its sections.
3.  **Structure the Proposal:** Use the exact structure and headings provided in the `user-story-proposal-template.md` for your output.
4.  **Populate Sections:** Fill in each section of the template based on the user's request:
    *   **User Story:** Clearly articulate the user story based on the instructions.
    *   **High-Level Solution Approach:** Briefly outline a potential technical approach. If not specified, make reasonable assumptions or state that it needs further definition.
    *   **Effort Breakdown & Estimates:** Provide realistic hour estimates for Design, Refinement, Front-end, Backend, and General Work. **Crucially, include clear reasoning** for each estimate, referencing the complexity or tasks involved. If a category is not applicable, mark it as 0 hours and explain why.
    *   **QA, Testing & Delay Margin:** Estimate hours and percentages for QA, Testing (unit, integration, e2e), and a Delay Margin. Provide reasoning based on the story's complexity and potential risks.
    *   **Total Estimated Effort:** Calculate the sum of all estimates.
    *   **Deliverables / Artifacts:** List the tangible outputs expected (e.g., code components, documentation, test results).
    *   **Acceptance Criteria:** Define specific, measurable, achievable, relevant, and time-bound (SMART) criteria for accepting the story.
    *   **Assumptions & Notes:** List any assumptions made during estimation and any relevant notes, dependencies, or risks.
5.  **Clarity and Detail:** Ensure your reasoning for estimates is clear and justifies the numbers. Define deliverables and acceptance criteria precisely.
6.  **Handle Missing Information:** If critical information is missing from the user instructions, state what is needed or make a reasonable assumption and clearly note it in the "Assumptions & Notes" section.

## Output Format:
Produce the complete User Story Proposal in Markdown format, strictly adhering to the structure and headings found in the `user-story-proposal-template.md`. Do not include any introductory or concluding remarks outside of the template structure.
```

**User Story Proposal Template (`user-story-proposal-template.md`):**

```markdown
# 📝 User Story Proposal: [User Story]

---

## 1. 👤 User Story
_Provide a clear and concise description of the user story, its purpose, and the value it brings._

---

## 2. 🔍 High-Level Solution Approach
_Outline the proposed technical approach to implement this user story. Mention key technologies, components, or strategies involved._

---

## 3. ⏱️ Effort Breakdown & Estimates

*   **Design:** [X] hours
    *   _Reasoning: [Explain why this amount of design effort is needed, or 0 if none]_
*   **Refinement:** [X] hours
    *   _Reasoning: [Explain the effort needed for planning, detailing requirements, and refining the approach for this user story]_
*   **Front-end:** [X] hours
    *   _Reasoning: [Explain the front-end development tasks involved (UI implementation, state management, etc.)]_
*   **Backend:** [X] hours
    *   _Reasoning: [Explain the backend development tasks involved (API endpoints, database changes, logic, etc.)]_
*   **General Work:** [X] hours
    *   _Reasoning: [Explain any other tasks not covered above (e.g., documentation, specific integrations)]_

---

## 4. 🧪 QA, Testing & Delay Margin

*   **QA:** [X] hours ([Y]%)
    *   _Reasoning: [Based on complexity, explain the QA effort needed (manual testing, exploratory testing)]_
*   **Testing:** [X] hours ([Y]%)
    *   _Reasoning: [Based on complexity, explain the testing effort needed (unit tests, integration tests, e2e tests)]_
*   **Delay Margin:** [X] hours ([Y]%)
    *   _Reasoning: [Based on complexity and potential risks/unknowns, explain the buffer needed]_

---

## 5. 📊 Total Estimated Effort
*   **Total Effort:** [Sum of all estimates above] hours

---

## 6. 📦 Deliverables / Artifacts
_List the tangible outputs or artifacts that will be produced upon completion of this user story._
*   [Deliverable 1: e.g., New UI component in Storybook]
*   [Deliverable 2: e.g., API endpoint documentation]
*   [Deliverable 3: e.g., Updated user guide section]
*   [Deliverable 4: e.g., Set of passing automated tests]

---

## 7. ✅ Acceptance Criteria
_Define the specific, measurable criteria that must be met for this user story to be considered complete and accepted._
*   [Criterion 1: e.g., User can successfully perform X action via the new UI]
*   [Criterion 2: e.g., Backend endpoint Y returns the expected data structure]
*   [Criterion 3: e.g., All related unit tests pass]
*   [Criterion 4: e.g., Feature meets the design specifications]

---

## 8. 📝 Assumptions & Notes
*   _List any assumptions made during the estimation process (e.g., availability of specific APIs, existing infrastructure)._
*   _Include any important notes, exclusions, dependencies, or potential risks related to this specific user story._
```

### Step 3: Provide User Instructions

Craft the request for the specific user story proposal.

**Example User Instructions:**

```xml
<user_instructions>
Create a user story proposal for the "User Login" story identified in the Basic Authentication milestone. The story is: "As a registered user, I want to log in to my account securely." Assume standard email/password login. We need estimates for design (basic screen layout), refinement, front-end (React Native), and backend (Node.js/Express API, PostgreSQL DB). Consider it medium complexity (3/5).
</user_instructions>
```

### 🚀 Step 4: Generate the User Story Proposal

Provide the prompt, template, and user instructions to the AI. The `User Story Expert` will generate the detailed proposal.

**Example Expected Output:**

```markdown
# 📝 User Story Proposal: User Login

---

## 1. 👤 User Story
As a registered user, I want to log in to my account securely using my email and password so that I can access my personalized content and features within the app.

---

## 2. 🔍 High-Level Solution Approach
*   **Front-end (React Native):** Create a Login screen with input fields for email and password, a submit button, and error message display. Implement state management for input values and loading/error states. On successful login, store the authentication token (e.g., JWT) securely and navigate the user to the main app screen.
*   **Backend (Node.js/Express):** Create a `/login` API endpoint that accepts email and password. Validate inputs. Query the PostgreSQL database to find the user by email. Verify the provided password against the stored hash. If valid, generate a JWT containing user identification and return it to the client. Implement appropriate error handling for invalid credentials or server issues.

---

## 3. ⏱️ Effort Breakdown & Estimates

*   **Design:** 2 hours
    *   _Reasoning: Basic wireframing and layout definition for the login screen, including input fields, button placement, and error message styling._
*   **Refinement:** 2 hours
    *   _Reasoning: Finalizing requirements, defining API contract details between front-end and backend, clarifying error handling specifics._
*   **Front-end:** 8 hours
    *   _Reasoning: Implementing the React Native Login screen component, handling user input, integrating with state management, making the API call, handling responses/errors, secure token storage, and navigation logic._
*   **Backend:** 6 hours
    *   _Reasoning: Creating the Express route and controller for `/login`, writing database query logic (PostgreSQL), implementing password hashing verification (e.g., using bcrypt), generating JWT, and adding input validation and error handling._
*   **General Work:** 0 hours
    *   _Reasoning: No additional general tasks identified for this specific story beyond standard development practices covered in other categories._

---

## 4. 🧪 QA, Testing & Delay Margin

*   **Subtotal (Design + Refine + FE + BE):** 2 + 2 + 8 + 6 = 18 hours
*   **QA:** 4.5 hours (25%)
    *   _Reasoning: Manual testing of the login flow on different devices/scenarios (valid credentials, invalid email, invalid password, empty fields), checking error messages, verifying successful navigation._
*   **Testing:** 2.7 hours (15%)
    *   _Reasoning: Writing unit tests for the backend login endpoint logic (validation, password check, token generation) and potentially basic front-end component tests for the login form._
*   **Complexity Factor:** 3/5 (Medium)
*   **Delay Margin:** 5.0 hours (20% of Subtotal + QA + Testing = 20% of 25.2 hours)
    *   _Reasoning: Medium complexity involves integration between front-end, backend, and database, potential issues with token handling or environment setup warrant a 20% buffer._

---

## 5. 📊 Total Estimated Effort
*   **Total Effort:** 18 (Dev) + 4.5 (QA) + 2.7 (Testing) + 5.0 (Delay) = **30.2 hours** (Rounded estimate: ~30 hours)

---

## 6. 📦 Deliverables / Artifacts
*   Login screen UI component implemented in React Native.
*   `/login` API endpoint implemented in Node.js/Express.
*   Unit tests for backend login logic.
*   Documentation for the `/login` API endpoint.
*   QA test results confirming successful login functionality and error handling.

---

## 7. ✅ Acceptance Criteria
*   Given a registered user provides their correct email and password on the Login screen, when they tap "Login", they are successfully authenticated, redirected to the main app screen, and an auth token is stored securely.
*   Given a user provides an incorrect email or password, when they tap "Login", an appropriate error message is displayed on the Login screen, and they remain on the Login screen.
*   Given a user leaves the email or password field blank, when they tap "Login", a validation error message is displayed.
*   The backend `/login` endpoint correctly validates input data format.
*   The backend `/login` endpoint returns a valid JWT upon successful authentication.
*   The backend `/login` endpoint returns appropriate error codes/messages for failed login attempts (e.g., 401 Unauthorized).
*   Unit tests for the backend login logic pass.

---

## 8. 📝 Assumptions & Notes
*   Assumes the user registration feature (database schema, password hashing) is already implemented or will be available.
*   Assumes a standard JWT library is available for token generation/verification.
*   Assumes secure storage mechanism (e.g., AsyncStorage, Keychain) is set up on the front-end.
*   Excludes "Remember Me" functionality for this story.
*   Depends on the base API setup and database connection being functional.

```

## ✅ Conclusion

By using the `Milestone Proposal Expert` and `User Story Expert` prompts with their corresponding templates, you can systematically break down project work into manageable milestones and detailed user stories. This structured approach facilitates clearer planning, estimation, and execution. Remember to provide the full prompt and template content along with clear user instructions for the best results.
