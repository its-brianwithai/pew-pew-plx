# Supabase Communication

This document outlines the architecture and patterns we use for communicating with Supabase in the FloatNote mobile application. Our approach provides a reactive, type-safe, and scalable way to manage data.

## 1. High-Level Architecture

Our Supabase communication is structured in three main layers:

1.  **API Layer (`SupabaseApi`)**: A generic, low-level, stateless wrapper around the `supabase_flutter` package. This class is responsible for direct communication with a specific Supabase table (e.g., `tasks`, `profiles`).
2.  **Service Layer (`SyncedDocService` & `SyncedDocsService`)**: Stateful, singleton services that manage the application's state. They use a `SupabaseApi` instance to listen to real-time streams, hold the data in memory, and provide business logic for CRUD operations.
3.  **UI Layer (ViewModels & Widgets)**: The UI layer consumes data from the services, typically through `ValueListenable`s, to build a reactive user interface.

This architecture ensures a clear separation of concerns, making the codebase easier to manage, test, and scale.

## 2. Core Concepts

### `SupabaseApi<T>`

`SupabaseApi<T>` is our generic class for all table-specific APIs. It's instantiated inside a service and configured for a specific table and DTO.

**`lib/supabase/services/supabase_api.dart`**
```dart
class SupabaseApi<T extends SupabaseDto> with Loglytics {
  SupabaseApi({
    required this.client,
    required this.table,
    required this.fromJsonFactory,
    required this.toJsonFactory,
  });
  // ... methods for create, getById, getAll, update, delete, streamDocs, etc.
}
```
It is typically instantiated directly within the service that uses it, like in `TaskService`.

### `SyncedDocService` & `SyncedDocsService`

These are the base classes for our stateful services that need to sync with Supabase data.
-   `SyncedDocsService`: Manages a collection of documents from a table. It holds a `Map<String, T>` of documents in memory.
-   `SyncedDocService`: Manages a single document from a table. It holds a single `T?` object in memory.

## 3. Real-time Data Streaming and Syncing with `AuthSyncService`

Data synchronization is tied to the user's authentication state via the `AuthSyncService` base class, which `SyncedDoc(s)Service` extends.

1.  **Auth-Aware Streaming**: When a user logs in, `AuthSyncService` is triggered.
2.  **Defining the Stream**: Each service overrides the `stream` getter to define which Supabase query to listen to. For example, `TaskService` listens for tasks that are not yet completed.
    ```dart
    // in tasks/services/task_service.dart
    @override
    FutureOr<Stream<Map<String, TaskDto>?>> Function(User user) get stream =>
        (user) => syncConfig.syncFromRemote
            ? syncer
                .streamDocsWithFilter(
                  column: kCompletedAt,
                  value: null,
                )
                .map(
                  (event) => switch (event) {
                    Success<List<TaskDto>>() => event.result.toIdMap(
                        (element) => element.id,
                      ),
                    Fail<List<TaskDto>>() => defaultValues().toIdMap(
                        (element) => element.id,
                      ),
                  },
                )
            : const Stream<Map<String, TaskDto>>.empty();
    ```
3.  **Processing Data**: The `onData` getter in `AuthSyncService` processes the data from the stream and updates the local in-memory state (`_docs` informer). This automatically updates any listening UI components.
    ```dart
    // in data/services/synced_docs_service.dart
    @override
    void Function(Map<String, T>? value, User? user) get onData => (value, user) {
          if (user == null) {
            // Clear data on logout
            _docs.update(defaultValues().toIdMap((element) => element.id));
            return;
          }
          // Update the in-memory map of documents
          _docs.update(value ?? defaultValues().toIdMap((element) => element.id));
        };
    ```

## 4. CRUD Operations

All create, update, and delete operations are handled by methods in our services (e.g., `TaskService`). These methods use the underlying `SupabaseApi` to perform the remote operation and then update the local state.

**Example from `SyncedDocsService`:**
```dart
// in data/services/synced_docs_service.dart
Future<TurboResponse<T>> updateDoc(
  T value, {
  bool doNotifyListeners = true,
  bool awaitSync = false,
}) async {
  // 1. Optimistic local update
  _docs.updateCurrent(
    (cValue) => cValue..[value.id] = value,
  );
  // 2. Remote Supabase update
  if (awaitSync) {
    await _trySyncUpdate(value: value);
  } else {
    unawaited(_trySyncUpdate(value: value));
  }
  return TurboResponse.success(result: value);
}
```
This pattern provides an "optimistic update" where the UI reacts instantly to the local state change, while the remote update happens in the background.

## 5. Finding and Sorting Data

-   **Finding Docs by ID**: Services provide a `docs[id]` lookup on the in-memory map. This is extremely fast as it doesn't require a database query.
-   **Sorting**: Sorting is done in-memory, often using an `Isolator` for performance if the list is large. This ensures that the data exposed to the UI via `ValueListenable`s is always in the desired order without blocking the UI thread.
    ```dart
    // in tasks/services/task_service.dart
    Future<List<TaskDto>> sortedPer({ ... }) async {
      return await _taskIsolator.run(
        input: pTasks,
        computation: (input, sendProgress) {
          // ... sorting logic ...
        },
      );
    }
    ```