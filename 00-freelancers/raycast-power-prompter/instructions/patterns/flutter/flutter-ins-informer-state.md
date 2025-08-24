---
name: informer-state-pattern
description: "The core pattern for reactive state management using Informer<T> instead of ValueNotifier in ViewModels and Services."
---
# 📡 Informer State Pattern

The core pattern for reactive state management using `Informer<T>` as the foundation for all state handling.

## What is Informer?

`Informer<T>` is our custom `ValueListenable<T>` that replaces Flutter's `ValueNotifier` for consistency and extended functionality.

## Basic Usage Pattern

```dart
class MyViewModel extends BaseViewModel {
  // Private mutable state holder
  final _isLoading = Informer<bool>(false);

  // Public immutable stream for UI
  ValueListenable<bool> get isLoading => _isLoading;

  void fetchData() {
    _isLoading.update(true);
    // ... fetch data ...
    _isLoading.update(false);
  }
}
```

## State Mutation Methods

### Direct Update: `update()`
For simple state replacements:
```dart
void setLoading(bool isLoading) {
  _isLoading.update(isLoading);
}
```

### Functional Update: `updateCurrent()`
When new state depends on current state (preferred for complex objects):
```dart
final _counter = Informer<int>(0);

void increment() {
  _counter.updateCurrent((cValue) => cValue + 1);
}

// With collections
final _tasks = ListInformer<Task>([]);

void addTask(Task newTask) {
  _tasks.updateCurrent((currentTasks) {
    currentTasks.add(newTask); // Safe - works with fresh copy
    return currentTasks;
  });
}
```

### Silent Updates
For batching multiple state changes:
```dart
void updateTwoThingsSilently() {
  _informerA.silentUpdate(newValueA);
  _informerB.silentUpdate(newValueB);
  
  // Manually trigger rebuild
  _informerA.rebuild();
  _informerB.rebuild();
}
```

## Key Principles

- All state mutations must happen inside the ViewModel/Service that owns the state
- Private `_informer` instances are mutable, public getters return `ValueListenable`
- Use `updateCurrent()` when new state depends on current state for atomicity
- Silent updates allow batching multiple changes for single UI rebuild