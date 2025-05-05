# Story `[Story ID]`: `[Story Title]`

*   **Status:** `[To Do | In Progress | Review | Done]`
*   **Epic/Feature Link:** `[Link to parent Epic/Feature in tracking tool/PRD]`
*   **Date Created:** `YYYY-MM-DD`
*   **Assigned To:** `[Developer Name/Team]`

---

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
    *   `[Specify security check, e.g., Data access adheres to defined Firebase Security Rules / Supabase RLS policies.]`
    *   `[Specify security check, e.g., Input is validated/sanitized on client and server-side.]`
*   **Accessibility (Flutter Specific):**
    *   `[Specify check, e.g., All interactive elements have minimum 48dp/44pt tap target size.]`
    *   `[Specify check, e.g., All interactive elements have semantic labels for screen readers.]`
    *   `[Specify check, e.g., Text contrast meets WCAG AA.]`
    *   `[Specify check, e.g., UI adapts correctly to 200% font scaling.]`
*   **Usability:**
    *   `[Specify usability aspect, e.g., Follows Material 3 / Cupertino design guidelines.]`
*   **Reliability:**
    *   `[Specify reliability aspect, e.g., Handles intermittent network connectivity gracefully.]`
*   ...

---

## 🛠️ Implementation Guidance

_Provide technical context and pointers for the development team._

### Flutter UI/UX Considerations

*   **Relevant Designs:** `[Link to specific Figma screens, components, or prototypes]`
*   **Key Widgets:** `[Mention core Flutter widgets likely involved, e.g., ListView.builder, FutureBuilder, CustomButtonWidget]`
*   **State Management:** `[Briefly mention approach, e.g., Update state via Provider/Riverpod/Bloc]`
*   **Navigation:** `[Specify navigation target/method, e.g., Navigate to ProfileScreen using GoRouter]`
*   **Responsiveness:** `[Note any specific requirements for different screen sizes/orientations]`
*   **Accessibility Notes:** `[Highlight specific elements requiring careful Semantics implementation]`

### Firebase/Supabase Backend Interactions

*   **Firebase:**
    *   Auth: `[Specify required interaction, e.g., Check currentUser, getIdToken]`
    *   Firestore: `[Collection/Document path, Read/Write operation, Query details, Expected data structure]`
    *   RTDB: `[Path, Read/Write operation, Listener usage]`
    *   Storage: `[Bucket path, Upload/Download operation, Metadata]`
    *   Cloud Functions: `[Function name to call, Expected payload/response]`
    *   Security Rules: `[Reference specific rules to consider/test against]`
*   **Supabase:**
    *   Auth: `[Specify required interaction, e.g., Check session, SignOut]`
    *   Database (Postgres): `[Table(s), SELECT/INSERT/UPDATE/DELETE operation, Query/Filter details, RPC call]`
    *   Storage: `[Bucket path, Upload/Download operation]`
    *   Edge Functions: `[Function name to call, Expected payload/response]`
    *   Realtime: `[Channel/Topic to subscribe to, Event handling]`
    *   RLS Policies: `[Reference specific policies to consider/test against]`

### Key Technologies / Libraries

*   `[List any specific Flutter packages or backend libraries crucial for this story]`

### Relevant Files (Estimation)

*   Files to Create: `[Suggest new files, e.g., login_screen.dart, auth_service.dart]`
*   Files to Modify: `[Suggest existing files needing changes, e.g., user_repository.dart, main_navigation.dart]`

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
