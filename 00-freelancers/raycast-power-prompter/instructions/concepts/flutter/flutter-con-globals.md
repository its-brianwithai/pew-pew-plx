# Globals

Globals files provide easy, global access to variables or service instances that may be computed at runtime. They are used sparingly to simplify access to frequently needed, app-wide values.

## 1. File Naming and Location

-   **Location**: `lib/<feature>/globals/<global_name>.dart`
-   **Naming**: The file is typically prefixed with `g_` (for "global"), e.g., `g_now.dart`.

**Example:** `lib/data/globals/g_now.dart`

## 2. Structure and Conventions

-   **Declaration**: Globals are defined as top-level getters or variables.
-   **Getters vs. Variables**:
    -   **Getters** are used for values that should be re-computed every time they are accessed (e.g., `gNow()` which should always return the current time).
    -   **Variables** can be used for globally accessible instances that are initialized once.
-   **Purpose**:
    -   **Runtime Values**: Provide access to values that change during runtime (e.g., `gNow()`, `gUserId`).
    -   **Service Accessors**: Create convenient shortcuts to access service instances or their properties (e.g., `gStrings` which provides access to the localization service's current strings).
    -   **Localization**: `gStrings` is the primary way to access localized strings throughout the application. All user-facing text should use `gStrings` (e.g., `gStrings.today`, `gStrings.tomorrow`, `gStrings.cancel`).
-   **Distinction from Constants**: Unlike constants (which must be known at compile-time), globals can be initialized or computed at runtime.
-   **Localization Workflow**:
    -   Add new strings to the ARB files (`lib/l10n/config/intl_en.arb` and `intl_nl.arb`)
    -   Access them via `gStrings.yourStringKey`
    -   **NEVER** run build commands to generate localization files - the project has a plugin that generates them automatically

## 3. Example

```dart
// lib/data/globals/g_now.dart

/// Returns the current [DateTime] using [DateTime.now].
DateTime get gNow() => DateTime.now();
```

```dart
// lib/data/globals/g_user_id.dart

import 'package:{project_name}/auth/services/auth_service.dart';
import 'package:{project_name}/data/constants/k_values.dart';

/// Returns the current user's unique identifier.
///
/// Returns [kValuesNoAuthId] if no user is currently signed in.
String get gUserId => AuthService.locate.user?.id ?? kValuesNoAuthId;
```
