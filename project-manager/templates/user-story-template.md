# Story `[Story ID]`: `[Story Title]`

## 🎯 Goal & Context

### User Story

> As a `[User Persona/Role]`, I want `[to perform an action/achieve a goal]` so that `[I get this benefit/value]`.

### Description & Rationale

`[Provide brief context explaining the 'Why' behind this story. How does it contribute to the Epic/Project goals? Reference relevant PRD sections or business objectives.]`

### Assumptions & Dependencies

*   **Assumptions:** `[List key assumptions made, e.g., Existing API is stable, User understands concept X]`
*   **Dependencies:** `[List prerequisite stories or external factors, e.g., Depends on US-123, Requires API Key from Service Y]`

---

## ✅ Acceptance Criteria (AC)

_Criteria that must be met for this story to be considered complete. Use clear, testable statements (e.g., Given/When/Then or bullet points)._

### Functional Criteria

*   AC1: `[Specific functional behavior, e.g., Given user is logged in, When they tap 'Save Profile', Then profile data is updated in the backend.]`
*   AC2: `[Another functional behavior, e.g., Then a success message "Profile Saved!" is displayed.]`
*   AC3: `[Error handling scenario, e.g., Given network error occurs during save, Then an error message "Save failed. Please try again." is displayed.]`
*   ...

### Non-Functional Criteria (NFRs)

*   **Performance:**
    *   `[Specify relevant performance target, e.g., Screen loads in under 1.5s on target device.]`
    *   `[Specify relevant backend interaction time, e.g., Backend query completes in < 500ms.]`
*   **Security:**
    *   `[Specify security check, e.g., Data access adheres to defined Security Rules / RLS policies.]`
    *   `[Specify security check, e.g., Input is validated/sanitized on client and server-side.]`
*   **Accessibility:**
    *   `[Specify check, e.g., All interactive elements have appropriate tap target sizes (e.g., WCAG 2.5.5 Target Size).]`
    *   `[Specify check, e.g., All interactive elements have semantic labels and roles for screen readers (e.g., ARIA attributes if web).]`
    *   `[Specify check, e.g., Text content meets color contrast requirements (e.g., WCAG AA).]`
    *   `[Specify check, e.g., UI adapts to various zoom levels and font scaling (e.g., 200% text resize without loss of content/functionality).]`
    *   `[Specify check, e.g., Keyboard navigability and focus indicators are clear.]`
*   **Usability:**
    *   `[Specify usability aspect, e.g., Follows established design guidelines (e.g., Material Design, Human Interface Guidelines).]`
*   **Reliability:**
    *   `[Specify reliability aspect, e.g., Handles intermittent network connectivity gracefully.]`
*   ...

---

## 🛠️ Implementation Guidance

_Provide technical context and pointers for the development team._

### UI/UX Considerations

*   **Relevant Designs:** `[Link to specific design mockups, wireframes, prototypes (e.g., Figma, Sketch, Adobe XD)]`
*   **Key UI Components/Patterns:** `[Mention core UI elements or patterns involved, e.g., Data table, Modal dialog, Infinite scroll list, Specific library components]`
*   **State Management (if applicable):** `[Briefly mention approach or relevant stores/reducers/controllers, e.g., Redux, Vuex, Context API, Provider/Riverpod/Bloc]`
*   **Navigation Flow:** `[Specify navigation target/method, e.g., Navigate to UserSettingsScreen, Use specific router paths/names]`
*   **Responsiveness & Adaptability:** `[Note requirements for different screen sizes, orientations, or devices]`
*   **Accessibility Implementation Notes:** `[Highlight specific elements requiring careful accessibility implementation (e.g., ARIA roles, focus management, semantic HTML)]`

### Backend Interactions / API Endpoints

*   **Authentication/Authorization:** `[Specify requirements, e.g., Requires authenticated user, Specific roles/permissions needed]`
*   **Data Storage / Database:**
    *   `[e.g., Service Name: Firebase Firestore]`
        *   `[Collection/Document path, Read/Write operation, Query details, Expected data structure]`
    *   `[e.g., Service Name: Supabase Postgres]`
        *   `[Table(s), SELECT/INSERT/UPDATE/DELETE operation, Query/Filter details, RPC call]`
    *   `[e.g., Service Name: Custom REST API]`
        *   Endpoint: `[HTTP Method] /path/to/resource`
        *   Request Body/Params: `[Details]`
        *   Expected Response: `[Details, Status Codes]`
*   **File Storage (if applicable):**
    *   `[e.g., Service Name: Firebase Storage / Supabase Storage / AWS S3]`
        *   `[Bucket path, Upload/Download operation, Metadata]`
*   **Serverless Functions / Microservices (if applicable):**
    *   `[e.g., Function Name: processOrder (AWS Lambda / Google Cloud Function / Supabase Edge Function)]`
        *   `[Trigger, Expected payload/response]`
*   **Security Considerations:** `[e.g., Data validation, Rate limiting, Specific security rules/policies to consider/test against]`
*   **Realtime (if applicable):** `[e.g., Channel/Topic to subscribe to, Event handling]`

### Key Technologies / Libraries

*   `[List any specific frontend/backend libraries, frameworks, or SDKs crucial for this story, e.g., React, Angular, Vue, specific UI component libraries, data fetching libraries]`

### Relevant Files (Estimation)

*   Files to Create: `[Suggest new files, e.g., user_profile_component.jsx, auth_service.ts, order_model.py]`
*   Files to Modify: `[Suggest existing files needing changes, e.g., api_client.js, main_router.js, user_repository.java]`

---

## 🔗 Related Artifacts

*   UI/UX Designs: `[Link]`
*   PRD Section: `[Link]`
*   Architecture Document Section: `[Link]`
*   API Documentation: `[Link]`
*   Data Model Specification: `[Link]`
*   User Research Findings: `[Link]`
*   Related Story/Epic: `[Link]`

---

## 📊 Priority & Estimation

*   **Priority:** `[Must | Should | Could | Won't]` or `[High | Medium | Low]` or `[Rank]`
*   **Estimated Size:** `[Story Points]` or `[T-Shirt Size]` or `[Ideal Days/Hours]`
*   **Estimation Notes:** `[Brief reasoning for size, complexity factors]`

---

## ❓ Notes & Open Questions

*   `[Capture any additional implementation notes, edge cases to consider, or potential technical challenges.]`
*   `[List any questions that need answers before or during development. Assign owners.]`
    *   Q1: `[Question...? - @Owner]` - Status: `[Open/Answered]`
    *   Q2: `[Question...? - @Owner]` - Status: `[Open/Answered]`
*   `[Explicitly list anything considered out of scope for THIS specific story.]`
