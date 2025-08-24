# Utils (Utilities)

Utility files contain helper classes that provide specific, reusable functionality that doesn't fit neatly into other categories like services or extensions.

## 1. File Naming and Location

-   **Location**: `lib/state/utils/` (This project centralizes many core utilities here).
-   **Naming**: Files are named in `snake_case` based on the utility they provide.

**Example:** `lib/state/utils/debouncer.dart`

## 2. Structure and Conventions

-   **Class-Based**: Utilities are typically implemented as classes rather than top-level functions, allowing them to manage their own state if necessary.
-   **Single Responsibility**: Each utility class has a clear and single purpose.
    -   `Debouncer`: Delays execution of a function until a certain period of inactivity has passed.
    -   `Mutex`: Ensures that a piece of code is not executed concurrently.
    -   `ScrollControllerBox`: Manages a collection of `ScrollController` instances.
-   **Instantiation**: They are instantiated directly where needed; they are not typically registered with `GetIt` unless they manage a shared, singleton resource.
-   **Lifecycle**: If a utility class holds resources that need to be cleaned up (like a `Timer` in `Debouncer` or controllers in `ScrollControllerBox`), it provides a `dispose` method.

## 3. Example

```dart
// lib/state/utils/debouncer.dart

import 'dart:async';
import 'dart:ui';
import '../../data/constants/k_durations.dart';

class Debouncer {
  Debouncer({
    Duration duration = kDurationsAnimation,
  }) : _duration = duration;

  final Duration _duration;
  Timer? _timer;

  /// Schedules a callback to be run after the specified duration.
  void run(VoidCallback voidCallback) {
    tryCancel();
    _timer = Timer(
      _duration,
      () {
        voidCallback();
      },
    );
  }

  /// Cancels any pending callback if one exists.
  void tryCancel() {
    if (_timer != null) {
      _timer?.cancel();
    }
  }
}
```