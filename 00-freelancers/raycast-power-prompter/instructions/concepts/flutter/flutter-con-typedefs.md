# Typedefs

Typedefs are used to create a custom type alias for a function signature. This improves code readability and makes it easier to use complex function types as parameters.

## 1. File Naming and Location

-   **Location**: `lib/<feature>/typedefs/<typedef_name>.dart`
-   **Naming**: The file is named in `snake_case`.

**Example:** `lib/components/typedefs/on_component_pressed.dart`

## 2. Structure and Conventions

-   **Definition**: The `typedef` keyword is used to define the alias.
-   **Naming**: The typedef name is `PascalCase` and should clearly describe the purpose of the function signature it represents.
-   **Purpose**: They are most useful for defining callbacks or builder functions that are passed as parameters to widgets or other methods. This makes the code that uses them cleaner and more self-documenting.

## 3. Example

```dart
// lib/components/typedefs/on_component_pressed.dart

import 'package:{project_name}/components/enums/t_component.dart';

typedef OnComponentPressed = void Function(TComponent component);
```

```dart
// lib/state/typedefs/lazy_locator_def.dart

/// Used to store locate calls inside a callback.
///
/// This way the actual locate call is only called when necessary.
typedef LazyLocatorDef<T extends Object> = T Function();
```
