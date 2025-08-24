# ⚡ Concurrency Patterns

Patterns for managing asynchronous operations and keeping the UI thread responsive using project-specific utilities.

## Heavy Work with Isolator

For CPU-intensive tasks, use `Isolator` (`lib/state/utils/isolator.dart`) to run work on separate isolates.

**When to use:** Computations taking more than a few milliseconds that aren't I/O-bound.

```dart
// In service
Future<File> compressImage(File file) async {
  final isolator = TIsolator<File, File>();
  return await isolator.run(
    input: file,
    computation: (file, sendProgress) {
      // Heavy processing logic here
      return compressedFile;
    },
  );
}
```

## Race Condition Prevention with Mutex

Use `Mutex` (`lib/state/utils/mutex.dart`) when state can be modified by multiple async operations.

**When to use:** Updating critical state in response to async events.

```dart
final _mutex = Mutex();

void onData(User? user) => _mutex.lockAndRun(
  run: (unlock) async {
    // Protected code - only one operation at a time
    _currentUser.add(user);
    unlock();
  },
);
```

## Rate Limiting with Throttler

Use `Throttler` (`lib/state/utils/throttler.dart`) to limit function execution frequency.

**When to use:** Rapid-fire events where only the latest event matters within a time window.

```dart
final _throttler = Throttler(duration: 1.seconds);

void _manageHouseholdMembers() => _throttler.run(() {
  // Runs at most once per second
});
```

## Delayed Execution with Debouncer

Use `Debouncer` (`lib/state/utils/debouncer.dart`) to delay execution until activity stops.

**When to use:** User input like search fields - wait until user stops typing.

```dart
final _debouncer = Debouncer(duration: kDurationsAnimationX0p5);

void _tryUpdateUsernameAvailability() => _debouncer.run(() async {
  // Runs only after user stops typing for 500ms
  final isAvailable = await _usernamesApi.usernameIsAvailable();
  _usernameIsAvailable.update(isAvailable);
});
```
