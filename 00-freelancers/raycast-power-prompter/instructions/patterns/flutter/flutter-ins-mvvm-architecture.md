---
name: mvvm-architecture-pattern
description: "The Model-View-ViewModel architectural pattern implementation with strict separation of concerns and reactive UI updates."
---
# 🏗️ MVVM Architecture Pattern

Implementation of Model-View-ViewModel pattern with strict separation of concerns and reactive programming principles.

## Core Philosophy

- **Separation of Concerns**: UI (View) is "dumb", all state/logic in ViewModel
- **Reactivity**: UI reacts to state changes automatically, not imperatively updated
- **Single Source of Truth**: State centralized in Services and ViewModels
- **Immutability**: Prefer immutable state objects, update by creating new instances

## Views (UI Layer)

**Characteristics:**
- Almost always `StatelessWidget`
- Contain no business logic or mutable state
- Receive state and callbacks from ViewModel
- Rebuild specific parts using `ValueListenableBuilder`

## ViewModels (Logic Layer)

**Characteristics:**
- Hold all state for a view using `Informer`s
- Contain all business logic (button actions, data formatting, etc.)
- Expose state via public `ValueListenable` getters
- Provided to View using `ViewModelBuilder`

## UI Updates with ValueListenableBuilder

Reactive UI updates by listening to ViewModel state:

```dart
// Single state listener
ValueListenableBuilder<bool>(
  valueListenable: model.isLoading,
  builder: (context, isLoading, child) {
    return isLoading
        ? const CircularProgressIndicator()
        : const Text('Data Loaded!');
  },
)

// Multiple state listeners
ValueListenableBuilderX2<String, int>(
  valueListenable: model.username,
  valueListenable2: model.itemCount,
  builder: (context, username, count, child) {
    return Text('$username has $count items');
  },
)
```

## StatefulWidget Restrictions

**Never use `StatefulWidget`** for business or UI logic state.

**Exception:** Only when absolutely necessary for Flutter framework integration (e.g., animations requiring `TickerProviderStateMixin`). Must contain minimal logic required for mixin functionality.

**Reasoning:** `StatefulWidget` mixes state, logic, and UI code, making it hard to test and maintain while scattering state across the widget tree.