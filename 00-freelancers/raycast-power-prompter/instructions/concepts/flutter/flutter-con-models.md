# Models

Models are plain Dart classes that represent data structures used within the application's business logic. They differ from DTOs in that they are not necessarily tied to a remote data source and are often used for UI state or internal logic.

## 1. File Naming and Location

-   **Location**: `lib/<feature>/models/<model_name>.dart`
-   **Naming**: The file is named in `snake_case`. The class name is `PascalCase`.

**Example:** `lib/data/models/sync_config.dart`

## 2. Structure and Conventions

-   **Class Type**: Models are typically simple Dart classes.
-   **Immutability**: Properties are often `final` to encourage immutability, and a `copyWith` method may be provided.
-   **Purpose**: They can serve various purposes:
    -   **Configuration**: Holding configuration data (e.g., `SyncConfig`).
    -   **UI State**: Representing a piece of UI state that is more complex than a primitive type.
    -   **Logic Grouping**: Grouping related data and functions (e.g., `CRUD` model holds a set of callbacks).
-   **Serialization**: Unlike DTOs, models are generally not annotated for JSON serialization unless they need to be persisted locally or sent over the network in a non-database context.

## 3. Example

```dart
// lib/data/models/sync_config.dart

/// Configuration for controlling sync behavior and direction.
class SyncConfig {
  /// Creates a new configuration instance.
  const SyncConfig({
    this.syncFromRemote = false,
    this.syncToRemote = true,
  });

  final bool syncFromRemote;
  final bool syncToRemote;

  /// Creates a copy of this configuration with optional overrides.
  SyncConfig copyWith({
    bool? syncFromRemote,
    bool? syncToRemote,
  }) =>
      SyncConfig(
        syncFromRemote: syncFromRemote ?? this.syncFromRemote,
        syncToRemote: syncToRemote ?? this.syncToRemote,
      );
}
```