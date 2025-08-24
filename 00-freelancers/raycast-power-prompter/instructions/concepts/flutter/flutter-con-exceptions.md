# Exceptions

Custom exception classes are used to handle specific, known error cases in a structured and readable way.

## 1. File Naming and Location

-   **Location**: `lib/state/exceptions/`
-   **Naming**: Files are named in `snake_case` and end with `_exception.dart`. The class name is `PascalCase`.

**Example:** `lib/state/exceptions/unexpected_null_exception.dart`

## 2. Structure and Conventions

-   **Class Type**: In this project, custom exceptions are plain Dart classes. They do not always implement the standard `Exception` interface, but they are used with the `throw` keyword.
-   **Properties**: They typically have a `final String reason` property to describe the nature of the error.
-   **Constructor**: A `const` constructor is provided.
-   **`toString()` Override**: They override the `toString()` method to provide a clear and informative string representation of the exception, which is useful for logging and debugging.
-   **Purpose**: They are thrown when the application enters a state that should be impossible according to the logic, helping to identify bugs and logical errors quickly.

## 3. Example

```dart
// lib/state/exceptions/unexpected_null_exception.dart

class UnexpectedNullException {
  const UnexpectedNullException({
    required this.reason,
  });

  final String reason;

  @override
  String toString() {
    return 'UnexpectedNullException{reason: $reason}';
  }
}
```