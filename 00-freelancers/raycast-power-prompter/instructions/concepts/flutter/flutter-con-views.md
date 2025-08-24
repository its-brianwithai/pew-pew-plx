# Views

Views are the UI-facing components of a feature screen. They are responsible for rendering the UI and delegating user interactions to a `ViewModel`.

## 1. File Naming and Location

-   **Location**: `lib/<feature>/views/<screen_name>/<screen_name>_view.dart`
-   **Naming**: The file is named in `snake_case` and ends with `_view.dart`. The class name is the `PascalCase` version of the file name (e.g., `auth_view.dart` contains `AuthView`).

**Example:** `lib/auth/views/auth/auth_view.dart`

## 2. Structure and Conventions

-   **Base Class**: Views are always `StatelessWidget`. All state and logic are handled by the `ViewModel`.
-   **ViewModel Connection**: The `View` connects to its corresponding `ViewModel` using the `ViewModelBuilder` widget from the `veto` package.
-   **ViewModel Instantiation**: The `ViewModel` is provided to the `ViewModelBuilder` via its static `locate` getter, which uses `GetIt` for service location.
    ```dart
    ViewModelBuilder<AuthViewModel>(
      viewModelBuilder: () => AuthViewModel.locate,
      builder: (context, model, isInitialised, child) {
        // ... build UI using `model`
      },
    )
    ```
-   **UI Construction**:
    -   The root widget is typically a `TScaffold`, which provides a consistent screen layout.
    -   The UI is built reactively based on the `ViewModel`'s state, which is exposed through `ValueListenable`s (like `Informer`). `ValueListenableBuilder` (and its variants `...X2`, `...X3`, etc.) are used to listen to these state changes and rebuild parts of the UI.
    -   Widgets are composed from the project's UI library (`lib/uiux/widgets/`), which are often prefixed with `T`, and from the `shadcn_ui` package.
    -   **IMPORTANT**: Always prefer `shadcn_ui` widgets over Flutter's built-in widgets when available:
        -   Use `ShadButton` instead of `ElevatedButton`/`TextButton`
        -   Use `ShadDatePicker` or `ShadCalendar` with `ShadPopover` instead of `showDatePicker`
        -   Use `ShadDialog` instead of `showDialog` where appropriate
        -   Use `ShadIconButton` for icon buttons
    -   For date/time selection in task planning features, restrict selection to today and tomorrow only using `selectableDayPredicate`
-   **Routing**:
    -   Views that represent a screen have a `static const String path` property that defines their route path for `go_router`.
-   **Arguments**:
    -   If a `View` requires data to be passed to it during navigation, it will have a constructor that accepts an `arguments` parameter (e.g., `final VerifyEmailArguments? arguments;`). This is then passed to the `ViewModelBuilder`'s `argumentBuilder`.

## 3. Example

```dart
// lib/auth/views/verify_email/verify_email_view.dart

import 'package:{project_name}/uiux/widgets/t_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:veto/data/models/base_view_model.dart';
import 'verify_email_arguments.dart';
import 'verify_email_view_model.dart';

class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({
    super.key,
    this.arguments,
  });

  final VerifyEmailArguments? arguments;

  static const String path = 'verify-email';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VerifyEmailViewModel>(
      argumentBuilder: () => arguments,
      builder: (context, model, isInitialised, child) {
        if (!isInitialised) return const SizedBox.shrink();

        return TScaffold(
          // ... UI implementation using `model`
        );
      },
      viewModelBuilder: () => VerifyEmailViewModel.locate,
    );
  }
}
```
