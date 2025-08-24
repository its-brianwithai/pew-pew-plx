# Annotations

Annotations are a form of metadata that can be added to your code. They don't affect the execution of the code itself but provide valuable information to developers or tools.

## 1. File Naming and Location

-   **Location**: `lib/state/annotations/`
-   **Naming**: Files are named in `snake_case`. The annotation class name is `PascalCase`.

**Example:** `lib/state/annotations/can_throw.dart`

## 2. Structure and Conventions

-   **Class Type**: An annotation is a `const` class. It is good practice to also annotate it with `@immutable`.
-   **Constructor**: The constructor must be `const`.
-   **Purpose**: They serve as documentation and hints about the code's behavior or intended use.
    -   `@canThrow`: Marks a method that is expected to throw exceptions, signaling to the caller that they need to implement `try-catch` handling.
    -   `@DisposeMe`: Indicates that an instance of a class should be disposed of when it's no longer needed.
    -   `@DoNotChangeOrder`: Warns that the order of values in an `enum` or fields in a class is significant and should not be altered.
-   **Usage**: They are used by prefixing a class, method, or property declaration with `@YourAnnotation()`.

## 3. Example

```dart
// lib/state/annotations/can_throw.dart

import 'package:flutter/foundation.dart';

/// A constant instance of [CanThrow] for convenient use.
const canThrow = CanThrow._();

/// An annotation indicating that a method can throw an exception.
@immutable
class CanThrow {
  const CanThrow._();
}
```

**Usage Example:**

```dart
@canThrow
void riskyOperation() {
  throw Exception('Something went wrong');
}
```