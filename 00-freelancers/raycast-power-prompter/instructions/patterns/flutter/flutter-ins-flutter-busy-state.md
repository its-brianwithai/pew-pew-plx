---
name: busy-state-pattern
description: "Global busy state management pattern for showing loading indicators during asynchronous operations."
---
# ⏳ Busy State Pattern

Global busy state management for consistent loading indicators during asynchronous operations.

## BusyService Core

The `BusyService` singleton manages application-wide busy state, exposing a `ValueListenable<BusyModel>` for UI listening.

## Setting Busy State from ViewModels

### Option 1: BusyServiceManagement Mixin

For ViewModels that frequently manage busy states:

```dart
class MyViewModel extends BaseViewModel with BusyServiceManagement {
  Future<void> doSomething() async {
    setBusy(true);
    await _myApi.fetchData();
    setIdle(); // Equivalent to setBusy(false)
  }
}
```

### Option 2: Global Functions

For quick, one-off access:

```dart
import 'package:float_note/state/globals/g_busy.dart';

class MyViewModel extends BaseViewModel {
  Future<void> doSomething() async {
    gSetBusy();
    await _myApi.fetchData();
    gSetIdle();
  }
}
```

## Global UI Integration

The busy indicator is handled at the top level of the widget tree using `BusyListenableBuilder`:

```dart
// In main app shell
Stack(
  children: [
    // App content
    BusyListenableBuilder(
      builder: (context, busyModel, child) {
        return IsBusyIcon(busyModel: busyModel);
      },
    ),
  ],
)
```

## Benefits

- **Consistent UX**: Same loading indicator across entire app
- **Clean ViewModels**: No need for individual loading state management
- **Global Control**: Single source of truth for busy state
- **Automatic Display**: Loading overlay appears automatically when `gSetBusy()` is called

## Customization

Both `setBusy()` and `gSetBusy()` accept parameters to customize behavior:
- Show backdrop
- Ignore pointer events
- Custom loading messages