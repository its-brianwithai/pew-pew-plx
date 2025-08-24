# Extensions

Extensions are used to add new functionality to existing classes without modifying their source code. They are a powerful way to add utility and helper methods to both core Dart types and custom classes.

## 1. File Naming and Location

-   **Location**: `lib/<feature>/extensions/<class_name>_extension.dart`
-   **Naming**: The file is named in `snake_case` and ends with `_extension.dart`. The extension itself is usually named `<ClassName>Extension`.

**Example:** `lib/data/extensions/string_extension.dart`

## 2. Structure and Conventions

-   **Definition**: Standard Dart `extension` syntax is used.
    ```dart
    extension StringExtension on String {
      // ... methods
    }
    ```
-   **Purpose**:
    -   **Utility Methods**: Add convenient helper methods to core types like `String`, `DateTime`, `List`, and `Widget`. This helps to create a fluent and readable API.
    -   **Domain-Specific Logic**: Encapsulate logic related to a specific type in a clean, reusable way. For example, `AnimationExtension` adds animation methods directly to the `Widget` class.
-   **Clarity**: Extension methods should be well-named and have a clear, single purpose to avoid polluting the namespace of the extended class.
-   **Statelessness**: Extension methods should be pure functions that operate on the instance of the class they are extending (`this`). They cannot store their own state.

## 3. Example

```dart
// lib/data/extensions/string_extension.dart

extension StringExtension on String {
  String get withPeriod {
    if (isEmpty) return '';
    return endsWith('.') ? this : '${trim()}.';
  }

  String capitalize({bool forceLowercase = false}) {
    if (isEmpty) {
      return '';
    }
    return forceLowercase
        ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}'
        : '${this[0].toUpperCase()}${substring(1)}';
  }

  String? get nullIfEmpty => trim().isEmpty ? null : this;
}
```