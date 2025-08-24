# Error Handling and User Feedback Pattern

## Core Concept: TurboResponse

All asynchronous operations return `TurboResponse<T>` - a sealed class representing success or failure.

### Response Types
```dart
// Success with result
TurboResponse.success(result: value, title: 'Done', message: 'Operation completed')

// Failure with error
TurboResponse.fail(error: e, stackTrace: s, title: 'Error', message: 'Failed')

// Convenience constructors
TurboResponse.successAsBool() // When no result needed
TurboResponse.failAsBool()    // Default failure
```

## Golden Rule: No Error States in UI

**Never show error states in the UI.** Keep the last valid state and provide feedback via:
- **Toasts**: Non-blocking notifications for success/minor errors
- **Dialogs**: Blocking alerts for critical errors requiring acknowledgment

Exception: Form validation errors shown inline.

## Layered Error Handling

### Layer 1: API/Low-Level Services
Convert raw exceptions to TurboResponse:

```dart
Future<TurboResponse<AuthResponse>> login({
  required String email,
  required String password,
}) async {
  try {
    final authResponse = await _supabase.client.auth.signInWithPassword(
      email: email,
      password: password,
    );
    return TurboResponse.success(result: authResponse);
  } on AuthException catch (error) {
    return tryHandleSupabaseAuthException(
      supabaseAuthException: error,
      log: log,
    );
  } catch (error, stackTrace) {
    log.error('Login failed', error: error, stackTrace: stackTrace);
    return TurboResponse.fail(
      title: 'Login failed',
      message: 'An unknown error occurred',
      error: error,
    );
  }
}
```

### Layer 2: Business Services
Propagate TurboResponse without try-catch:

```dart
Future<TurboResponse<TaskDto>> updateTask(TaskDto task) async {
  final response = await api.updateDoc(task);
  return response; // Propagate as-is
}
```

### Layer 3: ViewModels
Convert TurboResponse to user feedback:

```dart
Future<void> onDeletePressed(BuildContext context, TaskDto task) async {
  try {
    setBusy(true);
    final response = await TaskService.locate.deleteTask(id: task.id);
    
    response.when(
      success: (_) {
        ToastService.locate.showToast(
          context: context,
          title: 'Task deleted',
        );
      },
      fail: (_) {
        DialogService.locate.showOkDialog(
          context: context,
          title: 'Error',
          message: 'Could not delete task',
        );
      },
    );
  } catch (error, stackTrace) {
    log.error('Unexpected error', error: error, stackTrace: stackTrace);
    DialogService.locate.showSomethingWentWrongDialog(context: context);
  } finally {
    setBusy(false);
  }
}
```

## User Feedback Services

### ToastService
```dart
ToastService.locate.showToast(
  context: context,
  title: 'Success',
  subtitle: 'Changes saved',
);
```

### DialogService
```dart
DialogService.locate.showOkDialog(
  context: context,
  title: 'Error',
  message: 'Connection failed',
);

DialogService.locate.showOkCancelDialog(
  context: context,
  title: 'Confirm',
  message: 'Delete this item?',
);
```

## Handling TurboResponse

### Safe Pattern: .when()
```dart
response.when(
  success: (s) => handleSuccess(s),
  fail: (f) => handleFailure(f),
);
```

### Conditional Checks
```dart
if (response.isSuccess) {
  // Handle success
}
```

### Dangerous: Direct .result
```dart
// Only after checking isSuccess!
if (response.isSuccess) {
  final value = response.result;
}
```

### Transaction Pattern: .throwWhenFail()
```dart
// In database transactions only
response.throwWhenFail();
```

## Supabase Integration

Services using `SupabaseApi` automatically return `TurboResponse`:
- All CRUD operations wrapped
- `SupabaseAuthExceptionHandler` mixin for auth errors
- Consistent error messages across the app