# Constants

Constants files are used to store compile-time constant values that are used throughout the application. Centralizing constants helps avoid magic numbers/strings and makes maintenance easier.

## 1. File Naming and Location

-   **Location**: `lib/<feature>/constants/<constants_name>.dart`
-   **Naming**: The file is typically prefixed with `k_` (for "konstant"), e.g., `k_durations.dart`.

**Example:** `lib/data/constants/k_durations.dart`

## 2. Structure and Conventions

-   **Declaration**: All variables in a constants file must be declared as `const`.
-   **Top-Level**: Constants are defined as top-level variables within the file, not inside a class.
-   **Purpose**: They are used for values that will not change at runtime, such as:
    -   Animation durations (`kDurationsAnimation`)
    -   JSON keys (`kKeysUserId`)
    -   Default values or limits (`kLimitsMinUsernameLength`)
    -   Asset paths (`kPngsDoveOfPeace`)
-   **Organization**: Constants are grouped into separate files based on their domain (e.g., `k_durations.dart`, `k_keys.dart`).

## 3. Example

```dart
// lib/data/constants/k_durations.dart

const kDurationsAnimationX0p5 = Duration(milliseconds: 113);
const kDurationsAnimation = Duration(milliseconds: 225);
const kDurationsAnimationX2 = Duration(milliseconds: 450);
const kDurationsHover = Duration(milliseconds: 50);
const kDurationsTimeOut = Duration(seconds: 10);
```