# Mixins

Mixins are used to share a piece of reusable code and functionality across multiple classes, most commonly `ViewModel`s.

## 1. File Naming and Location

-   **Location**: `lib/<feature>/mixins/<mixin_name>.dart`
-   **Naming**: Files are named in `snake_case`. The `mixin` name is `PascalCase`.

**Example:** `lib/auth/mixins/logout_management.dart`

## 2. Structure and Conventions

-   **Definition**: Standard Dart `mixin` syntax is used.
-   **Target Class**: Mixins often have an `on` clause to specify the type of class they can be used with (e.g., `mixin LogoutManagement on BaseViewModel`). This allows the mixin to access members of that class.
-   **Functionality**: They encapsulate a specific, reusable piece of logic. For instance, `LogoutManagement` provides a ready-to-use `onLogoutPressed` method that can be called from any `ViewModel` that uses it.
-   **Dependencies**: Mixins can locate and use services via `GetIt` just like `ViewModel`s or other classes, making them self-contained units of functionality.
-   **Usage**: To use a mixin, a class includes it with the `with` keyword (e.g., `class SettingsViewModel extends BaseViewModel with LogoutManagement`).

## 3. Example

```dart
// lib/auth/mixins/logout_management.dart

import 'dart:async';
import 'package:{project_name}/auth/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:veto/data/models/base_view_model.dart';

mixin LogoutManagement on BaseViewModel {
  // 1. Locate dependencies
  AuthService get _authService => AuthService.locate;
  DialogService get _dialogService => DialogService.locate;

  // 2. Provide a reusable method
  Future<void> onLogoutPressed({required BuildContext context}) async {
    try {
      final shouldLogout = await _dialogService.showOkCancelDialog(
        title: 'Logout',
        message: 'Are you sure you want to logout?',
        context: context,
      );

      if (shouldLogout == true) {
        // ... logout logic using _authService
      }
    } catch (error, stackTrace) {
      // ... error handling
    }
  }
}
```
