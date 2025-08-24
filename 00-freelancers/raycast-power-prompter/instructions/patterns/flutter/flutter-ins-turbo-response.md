---
name: turbo-response-feedback-pattern
description: "Pattern for standardized user feedback using TurboResponse for consistent success and error handling."
---
# 🎯 TurboResponse Feedback Pattern

Standardized approach to user feedback using `TurboResponse<T>` for consistent operation outcomes.

## TurboResponse Structure

**`Success<T>`** - Successful operations:
- `result`: The value of type `T` returned
- `title` & `message`: Optional strings for success toasts

**`Fail<T>`** - Failed operations:
- `error`: Underlying `Object` that caused failure
- `stackTrace`: Stack trace for debugging
- `title` & `message`: User-friendly error explanations

## Golden Rule: Keep UI Stable

**Never update UI into error state** - avoid disruptive red error messages.

**Instead:**
1. **Keep UI in last valid state** - user can continue interacting
2. **Provide non-intrusive feedback** via Toasts or blocking Dialogs/Sheets

**Exception:** Form validation errors below form fields are acceptable UX pattern.

## Service Layer Contract

Every fallible operation returns `Future<TurboResponse>`:

```dart
Future<TurboResponse<User>> updateProfile(UserProfile profile) async {
  try {
    final user = await _api.updateUser(profile);
    return Success(
      result: user,
      title: 'Success',
      message: 'Profile updated successfully',
    );
  } catch (e, stackTrace) {
    return Fail(
      error: e,
      stackTrace: stackTrace,
      title: 'Update Failed',
      message: 'Could not update profile. Please try again.',
    );
  }
}
```

This ensures ViewModels receive structured responses for appropriate feedback handling.