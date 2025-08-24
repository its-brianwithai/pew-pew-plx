---
name: informer-box-pattern
description: "Pattern for managing collections of reactive state using InformerBox and other Box utilities for dynamic UI resources."
---
# 📦 InformerBox Pattern

Pattern for managing collections of reactive state where each item needs its own `Informer` instance.

## InformerBox for Dynamic Collections

When dealing with lists where each item has reactive state (e.g., task completion status):

```dart
// In ViewModel
final taskCompletionInformers = InformerBox<bool>(initialValue: false);

// In View
ListView.builder(
  itemCount: tasks.length,
  itemBuilder: (context, index) {
    final task = tasks[index];
    return ValueListenableBuilder<bool>(
      valueListenable: model.taskCompletionInformers.get(task.id),
      builder: (context, isCompleted, _) {
        return Checkbox(
          value: isCompleted,
          onChanged: (value) => model.toggleTask(task.id),
        );
      },
    );
  },
)
```

## Benefits

- **Dynamic Management**: Creates `Informer`s on-demand for specific IDs
- **Automatic Disposal**: Handles cleanup of unused `Informer`s
- **Perfect for ListView.builder**: Each list item gets its own reactive state

## Other Box Utilities

Following the same pattern for UI resource management:

- **`FocusNodeBox`**: Manages collection of `FocusNode`s
- **`ScrollControllerBox`**: Manages `ScrollController`s  
- **`TextEditingControllerBox`**: Manages `TextEditingController`s

## Separation of Concerns

These Box utilities allow ViewModels to control UI resources (focus, scrolling, text input) without holding direct widget references, maintaining clean separation between logic and UI layers.