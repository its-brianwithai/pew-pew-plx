# Abstracts

Abstract classes and mixins are used to define contracts, interfaces, or shared structures that other classes must implement or can use. They are fundamental to creating a consistent and maintainable architecture.

## 1. File Naming and Location

-   **Location**: `lib/<feature>/abstracts/<abstract_name>.dart`
-   **Naming**: The file is named in `snake_case`. The abstract class or mixin name is `PascalCase`.

**Example:** `lib/data/abstracts/has_id.dart`

## 2. Structure and Conventions

-   **Definition**: They are defined using the `abstract class` or `mixin` keywords.
-   **Purpose**:
    -   **Interface/Contract**: An `abstract class` can define a set of methods and properties that concrete classes must implement. This enforces a common API. For example, `SupabaseDto` requires all DTOs to have an `id` and a `toJson()` method.
    -   **Shared Structure**: An `abstract class` can also provide a partial implementation that subclasses can inherit and extend.
    -   **Shared Behavior**: A `mixin` can provide a set of methods and properties that can be added to a class without inheritance.
-   **Abstract Methods**: Methods without a body are declared, forcing the implementing/extending class to provide the implementation.

## 3. Examples

### Abstract Class as an Interface

```dart
// lib/core/dto/supabase_dto.dart

abstract class SupabaseDto {
  /// The unique identifier for the DTO.
  String get id;

  /// Converts this DTO instance into a JSON map.
  Map<String, dynamic> toJson();

  DateTime get createdAt;
  DateTime get updatedAt;
}
```

### Abstract Class as a Base

```dart
// lib/state/abstracts/initialisable.dart

abstract class Initialisable {
  Initialisable() {
    initialise();
  }

  var _isInitialised = false;
  Future get isReady => _isReady.future;

  @mustCallSuper
  void initialise() => markAsReady();
  
  // ... other implemented methods
}
```