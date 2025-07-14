Please create a series of {file_type} at {file_path} that explains exactly how we handle {concepts} so that {main_goal}. Add anything I might have missed based purely on the {project_context}. Do NOT reference other files for explanation, the document should be self contained and fully independently useable.

<project_context>
- <file_map>
- <file_contents>
</project_context>

<concepts>Please create a series of {file_type} at {file_path} that explains exactly how we handle {concepts} so that {main_goal}. Add anything I might have missed based purely on the {project_context}. Do NOT reference other files for explanation, the document should be self contained and fully independently useable.

<project_context>
- <file_map>
- <file_contents>
  </project_context>

<concepts>
1.  **Create `how-we-handle-state.md`**:
    *   **Core Pattern:** MVVM (Model-View-ViewModel) with reactive programming.
    *   **State Holder:** Detail the custom `Informer<T>` class as our primary `ValueListenable`. Explain why we use it over `ValueNotifier`.
    *   **Updating State:** Document the `.update()`, `.updateCurrent()`, and `silentUpdate()` methods with examples.
    *   **Views & ViewModels:** Explain the strict separation. Views are `StatelessWidget`s. ViewModels extend `BaseViewModel`. Use `ViewModelBuilder` to connect them.
    *   **UI Updates:** Emphasize using `ValueListenableBuilder` (and `X2`, `X3` helpers) for targeted rebuilds.
    *   **No `StatefulWidget`:** State a firm rule against using `StatefulWidget` for business logic, with the only exception being for framework needs like `AnimationController`.
    *   **Shared State:** Describe how Services (e.g., `AuthService`, `TaskService`) are used for global or feature-wide state, also using the `Informer` pattern.
    *   **Dependency Injection:** Mention that `get_it` is used to access Services and ViewModels.
    *   **Collection State:** Explain the `InformerBox`, `FocusNodeBox`, and `TextEditingControllerBox` utilities for managing lists of UI elements.
    *   **Global Busy State:** Document the `BusyService` and the `gSetBusy()` / `gSetIdle()` global functions for managing a global loading indicator.

2.  **Create `how-we-handle-views-and-view-models.md`**:
    *   **MVVM:** Reiterate the core principles.
    *   **File Structure:** Define the standard folder structure for a new view (`views/feature_name/feature_view.dart`, `feature_view_model.dart`, etc.).
    *   **ViewModel Structure:** Detail the mandatory sectioned layout for all ViewModels (`LOCATOR`, `DEPENDENCIES`, `INIT & DISPOSE`, `STATE`, `FETCHERS`, `MUTATORS`, etc.) with explanations for each section.
    *   **View Structure:** Explain that Views must be `StatelessWidget`s, use `ViewModelBuilder`, and define a static `path` for routing.
    *   **System Integration:** Detail how to register a ViewModel with `GetIt` in `locator_service.dart` and how to add a View to `go_router` in the appropriate feature router.
    *   **Arguments:** Explain the `ViewArguments` pattern for passing data during navigation.

3.  **Create `how-we-handle-dependency-injection.md`**:
    *   **Tool:** `get_it` package.
    *   **Pattern:** Service Locator. All DI is managed in `LocatorService`.
    *   **Convention:** Document the mandatory `// 📍 LOCATOR` block in every injectable class, with static `locate` and `register...` methods.
    *   **Registration Types:** Explain `registerFactory` (for ViewModels, Forms), `registerLazySingleton` (for most Services), and when to use them.
    *   **Accessing Dependencies:** Detail the three approved patterns for declaring dependencies in a class: `final` (always used), `late final` (sometimes used), and `get` (rarely used). Forbid calling `.locate` inside methods.

4.  **Create `how-we-do-error-handling-and-user-feedback.md`**:
    *   **Core Concept:** The `TurboResponse<T>` sealed class (`Success` and `Fail`).
    *   **Golden Rule:** Explain the principle of *not* showing UI error states. The UI should remain in its last valid state, and feedback is given via toasts or dialogs.
    *   **Feedback Mechanisms:** Define when to use Toasts (`ToastService` for success/info) vs. Dialogs (`DialogService` for critical errors/confirmation).
    *   **Layered `try-catch`:**
        *   **Layer 1 (API/Low-Level):** Convert raw exceptions into `TurboResponse.fail` with user-friendly messages.
        *   **Layer 2 (Business Logic):** Do not use `try-catch`. Propagate the `TurboResponse` up.
        *   **Layer 3 (ViewModel):** Consume the `TurboResponse` with `.when()` and show the appropriate user feedback. Use a top-level `try-catch` to handle unexpected errors.

5.  **Create `how-we-do-crash-reporting-and-analytics.md`**:
    *   **Core Tech:** Explain the `loglytics` abstraction layer.
    *   **Services:** Sentry for crash reporting, PostHog for analytics.
    *   **Initialization:** Detail the setup in `main.dart`, including `runZonedGuarded`, Sentry/PostHog init, and `Loglytics.setUp`.
    *   **Crash Reporting:** Mandate using `log.error(message, error: e, stackTrace: s)` in all `catch` blocks.
    *   **Analytics:** Describe the structured event system: `Subject` + `Action` + `Parameters`. Provide a step-by-step guide for adding a new event (define subject, create method in a feature-specific `...Analytics` class, trigger it).

6.  **Create `how-we-handle-firestore-communication.md`**:
    *   **Architecture:** Detail the three layers: API (`RmyApi`), Service (`TurboCollectionService`), and UI.
    *   **Core Package:** `turbo_firestore_api`.
    *   **`FirestoreCollection` Enum:** Emphasize this enum as the central registry for collection paths and `fromJson`/`toJson` factories.
    *   **Real-time Sync:** Explain how `TurboAuthSyncService` drives data streaming based on auth state.
    *   **CRUD Operations:** Describe the "optimistic update" pattern (update local state first, then call remote API).
    *   **Context-Aware Services:** Explain `HouseholdCollectionSyncService` for data that depends on a user's selected context (e.g., a workspace or team).

7.  **Create `how-we-handle-user-input-and-forms.md`**:
    *   **Architecture:** `TFormConfig` (defines a form), `TFormFieldConfig` (state for one field), `TFormField` (UI widget).
    *   **Creating a Form:** Provide a step-by-step guide: create a field enum, create a `TFormConfig` class, and register it.
    *   **Validation:** Explain field-level validation (`valueValidator`) and form-level validation (`form.isValid`).
    *   **Data Flow:** Describe how to prefill data (`updateInitialValue`) and access submitted data (`.cValue`).
    *   **UI Rendering:** Show how to use the `TFormField` widget with a `builder` to connect a `TFormFieldConfig` to a UI input like `ShadInput`.

8.  **Create `how-we-handle-widgets-and-theming.md`**:
    *   **Two-Widget Pattern:** Mandate the separation of logic and UI.
        *   `T<WidgetName>`: The "smart" state-managing wrapper.
        *   `Stateless<WidgetName>`: The "dumb," pure UI widget that takes only primitive parameters.
    *   **Theming:** Explain that styling must come from `context` extensions (`context.colors`, `context.texts`, `context.sizes`) provided by `shadcn_ui`. Forbid hardcoded values.
    *   **Spacing:** Mandate the use of the `TGap` widget for consistent spacing.
    *   **Callbacks:** Explain that logic is passed into widgets via callbacks, using custom `typedef`s for clarity.
    *   **Conditional Rendering:** Document the use of `SlideShrink` for performant show/hide animations.

9.  **Create `how-we-handle-localization.md`**:
    *   **System:** Flutter's standard i18n with `.arb` files and code generation via `intl_utils`.
    *   **Global Access:** Detail the `gStrings` global accessor for easy, context-free access to strings.
    *   **Language Switching:** Describe the role of `LanguageService` in managing and persisting the current language and how `MyAppView` rebuilds on change.

10. **Create `how-we-optimize-for-performance.md`**:
    *   **UI:** No logic in `build`, use `ValueListenableBuilder`, use `const` widgets, use `RepaintBoundary` for animations, and `SlideShrink` for conditional UI.
    *   **Async/Intensive Ops:** Document our utility classes: `Isolator` for CPU-bound work, `Mutex` for race conditions, `Throttler` and `Debouncer` for rate limiting.
    *   **Data Handling:** Mandate `Map<String, T>` for fast ID-based lookups. Reiterate the optimistic update pattern for perceived performance.

11. **Create `how-we-handle-enum-types.md`**:
    *   **Core Principle:** Use enums for type safety instead of strings or ints.
    *   **Usage:** Explain how exhaustive `switch` statements provide compile-time safety.
    *   **Enhancing Enums:** Show how to add getters and methods to enums to co-locate related logic (e.g., `enum.color`, `enum.label`).

12. **Create `how-we-manage-supabase-collections.md`**:
    *   **Source of Truth:** Emphasize that collection schemas are defined in YAML files in a separate `taskflow-firebase` repository first.
    *   **Process:** Detail the steps: Define in YAML -> Create DTO in Flutter -> Add to `FirestoreCollection` enum -> Create API class -> Create Service.
    *   **Security Rules:** Outline principles: default deny, auth required, data validation mirroring the YAML, and ownership checks.

13. **Create `how-we-show-user-feedback.md`**:
    *   **Source of Feedback:** The `title` and `message` fields in `TurboResponse`.
    *   **Golden Rule:** Reiterate not showing UI error states.
    *   **Mechanisms:** Define when to use Toasts (`gShowNotification`), Dialogs (`gShowOkDialog`), and Sheets (`SheetService`). Provide a complete ViewModel example showing the flow from confirmation dialog to service call to final feedback.
        </concepts>

<main_goal>
Provide all the context necessary to handle {concepts} perfectly following this projects conventions exactly without error when working inside this project as a highly skilled collaborator.
</main_goal>

—
file_type: highly detailed documentation documents
file_path: context/how-we/write-code/{subject-in-kebab-case}.md
1.  **Create `how-we-handle-state.md`**:
    *   **Core Pattern:** MVVM (Model-View-ViewModel) with reactive programming.
    *   **State Holder:** Detail the custom `Informer<T>` class as our primary `ValueListenable`. Explain why we use it over `ValueNotifier`.
    *   **Updating State:** Document the `.update()`, `.updateCurrent()`, and `silentUpdate()` methods with examples.
    *   **Views & ViewModels:** Explain the strict separation. Views are `StatelessWidget`s. ViewModels extend `BaseViewModel`. Use `ViewModelBuilder` to connect them.
    *   **UI Updates:** Emphasize using `ValueListenableBuilder` (and `X2`, `X3` helpers) for targeted rebuilds.
    *   **No `StatefulWidget`:** State a firm rule against using `StatefulWidget` for business logic, with the only exception being for framework needs like `AnimationController`.
    *   **Shared State:** Describe how Services (e.g., `AuthService`, `TaskService`) are used for global or feature-wide state, also using the `Informer` pattern.
    *   **Dependency Injection:** Mention that `get_it` is used to access Services and ViewModels.
    *   **Collection State:** Explain the `InformerBox`, `FocusNodeBox`, and `TextEditingControllerBox` utilities for managing lists of UI elements.
    *   **Global Busy State:** Document the `BusyService` and the `gSetBusy()` / `gSetIdle()` global functions for managing a global loading indicator.

2.  **Create `how-we-handle-views-and-view-models.md`**:
    *   **MVVM:** Reiterate the core principles.
    *   **File Structure:** Define the standard folder structure for a new view (`views/feature_name/feature_view.dart`, `feature_view_model.dart`, etc.).
    *   **ViewModel Structure:** Detail the mandatory sectioned layout for all ViewModels (`LOCATOR`, `DEPENDENCIES`, `INIT & DISPOSE`, `STATE`, `FETCHERS`, `MUTATORS`, etc.) with explanations for each section.
    *   **View Structure:** Explain that Views must be `StatelessWidget`s, use `ViewModelBuilder`, and define a static `path` for routing.
    *   **System Integration:** Detail how to register a ViewModel with `GetIt` in `locator_service.dart` and how to add a View to `go_router` in the appropriate feature router.
    *   **Arguments:** Explain the `ViewArguments` pattern for passing data during navigation.

3.  **Create `how-we-handle-dependency-injection.md`**:
    *   **Tool:** `get_it` package.
    *   **Pattern:** Service Locator. All DI is managed in `LocatorService`.
    *   **Convention:** Document the mandatory `// 📍 LOCATOR` block in every injectable class, with static `locate` and `register...` methods.
    *   **Registration Types:** Explain `registerFactory` (for ViewModels, Forms), `registerLazySingleton` (for most Services), and when to use them.
    *   **Accessing Dependencies:** Detail the three approved patterns for declaring dependencies in a class: `final` (always used), `late final` (sometimes used), and `get` (rarely used). Forbid calling `.locate` inside methods.

4.  **Create `how-we-do-error-handling-and-user-feedback.md`**:
    *   **Core Concept:** The `TurboResponse<T>` sealed class (`Success` and `Fail`).
    *   **Golden Rule:** Explain the principle of *not* showing UI error states. The UI should remain in its last valid state, and feedback is given via toasts or dialogs.
    *   **Feedback Mechanisms:** Define when to use Toasts (`ToastService` for success/info) vs. Dialogs (`DialogService` for critical errors/confirmation).
    *   **Layered `try-catch`:**
        *   **Layer 1 (API/Low-Level):** Convert raw exceptions into `TurboResponse.fail` with user-friendly messages.
        *   **Layer 2 (Business Logic):** Do not use `try-catch`. Propagate the `TurboResponse` up.
        *   **Layer 3 (ViewModel):** Consume the `TurboResponse` with `.when()` and show the appropriate user feedback. Use a top-level `try-catch` to handle unexpected errors.

5.  **Create `how-we-do-crash-reporting-and-analytics.md`**:
    *   **Core Tech:** Explain the `loglytics` abstraction layer.
    *   **Services:** Sentry for crash reporting, PostHog for analytics.
    *   **Initialization:** Detail the setup in `main.dart`, including `runZonedGuarded`, Sentry/PostHog init, and `Loglytics.setUp`.
    *   **Crash Reporting:** Mandate using `log.error(message, error: e, stackTrace: s)` in all `catch` blocks.
    *   **Analytics:** Describe the structured event system: `Subject` + `Action` + `Parameters`. Provide a step-by-step guide for adding a new event (define subject, create method in a feature-specific `...Analytics` class, trigger it).

6.  **Create `how-we-handle-firestore-communication.md`**:
    *   **Architecture:** Detail the three layers: API (`RmyApi`), Service (`TurboCollectionService`), and UI.
    *   **Core Package:** `turbo_firestore_api`.
    *   **`FirestoreCollection` Enum:** Emphasize this enum as the central registry for collection paths and `fromJson`/`toJson` factories.
    *   **Real-time Sync:** Explain how `TurboAuthSyncService` drives data streaming based on auth state.
    *   **CRUD Operations:** Describe the "optimistic update" pattern (update local state first, then call remote API).
    *   **Context-Aware Services:** Explain `HouseholdCollectionSyncService` for data that depends on a user's selected context (e.g., a workspace or team).

7.  **Create `how-we-handle-user-input-and-forms.md`**:
    *   **Architecture:** `TFormConfig` (defines a form), `TFormFieldConfig` (state for one field), `TFormField` (UI widget).
    *   **Creating a Form:** Provide a step-by-step guide: create a field enum, create a `TFormConfig` class, and register it.
    *   **Validation:** Explain field-level validation (`valueValidator`) and form-level validation (`form.isValid`).
    *   **Data Flow:** Describe how to prefill data (`updateInitialValue`) and access submitted data (`.cValue`).
    *   **UI Rendering:** Show how to use the `TFormField` widget with a `builder` to connect a `TFormFieldConfig` to a UI input like `ShadInput`.

8.  **Create `how-we-handle-widgets-and-theming.md`**:
    *   **Two-Widget Pattern:** Mandate the separation of logic and UI.
        *   `T<WidgetName>`: The "smart" state-managing wrapper.
        *   `Stateless<WidgetName>`: The "dumb," pure UI widget that takes only primitive parameters.
    *   **Theming:** Explain that styling must come from `context` extensions (`context.colors`, `context.texts`, `context.sizes`) provided by `shadcn_ui`. Forbid hardcoded values.
    *   **Spacing:** Mandate the use of the `TGap` widget for consistent spacing.
    *   **Callbacks:** Explain that logic is passed into widgets via callbacks, using custom `typedef`s for clarity.
    *   **Conditional Rendering:** Document the use of `SlideShrink` for performant show/hide animations.

9.  **Create `how-we-handle-localization.md`**:
    *   **System:** Flutter's standard i18n with `.arb` files and code generation via `intl_utils`.
    *   **Global Access:** Detail the `gStrings` global accessor for easy, context-free access to strings.
    *   **Language Switching:** Describe the role of `LanguageService` in managing and persisting the current language and how `MyAppView` rebuilds on change.

10. **Create `how-we-optimize-for-performance.md`**:
    *   **UI:** No logic in `build`, use `ValueListenableBuilder`, use `const` widgets, use `RepaintBoundary` for animations, and `SlideShrink` for conditional UI.
    *   **Async/Intensive Ops:** Document our utility classes: `Isolator` for CPU-bound work, `Mutex` for race conditions, `Throttler` and `Debouncer` for rate limiting.
    *   **Data Handling:** Mandate `Map<String, T>` for fast ID-based lookups. Reiterate the optimistic update pattern for perceived performance.

11. **Create `how-we-handle-enum-types.md`**:
    *   **Core Principle:** Use enums for type safety instead of strings or ints.
    *   **Usage:** Explain how exhaustive `switch` statements provide compile-time safety.
    *   **Enhancing Enums:** Show how to add getters and methods to enums to co-locate related logic (e.g., `enum.color`, `enum.label`).

12. **Create `how-we-manage-supabase-collections.md`**:
    *   **Source of Truth:** Emphasize that collection schemas are defined in YAML files in a separate `taskflow-firebase` repository first.
    *   **Process:** Detail the steps: Define in YAML -> Create DTO in Flutter -> Add to `FirestoreCollection` enum -> Create API class -> Create Service.
    *   **Security Rules:** Outline principles: default deny, auth required, data validation mirroring the YAML, and ownership checks.

13. **Create `how-we-show-user-feedback.md`**:
    *   **Source of Feedback:** The `title` and `message` fields in `TurboResponse`.
    *   **Golden Rule:** Reiterate not showing UI error states.
    *   **Mechanisms:** Define when to use Toasts (`gShowNotification`), Dialogs (`gShowOkDialog`), and Sheets (`SheetService`). Provide a complete ViewModel example showing the flow from confirmation dialog to service call to final feedback.
</concepts>

<main_goal>
Provide all the context necessary to handle {concepts} perfectly following this projects conventions exactly without error when working inside this project as a highly skilled collaborator.
</main_goal>

—
file_type: highly detailed documentation documents
file_path: context/how-we/write-code/{subject-in-kebab-case}.md
