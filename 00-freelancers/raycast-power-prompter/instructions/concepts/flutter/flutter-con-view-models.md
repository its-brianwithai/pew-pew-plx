# View Models

View Models manage the state and business logic for a specific `View`. They orchestrate data flow between services and the UI.

## 1. File Naming and Location

-   **Location**: `lib/<feature>/views/<screen_name>/<screen_name>_view_model.dart`
-   **Naming**: The file is named in `snake_case` and ends with `_view_model.dart`. The class name is the `PascalCase` version.

**Example:** `lib/auth/views/auth/auth_view_model.dart`

## 2. Structure and Conventions

-   **Base Class**: ViewModels extend `BaseViewModel` from the `veto` package. If they need to accept navigation arguments, they are typed, e.g., `BaseViewModel<MyViewArguments>`.
-   **Mixins**: They commonly use mixins like `Loglytics` for logging and `BusyServiceManagement` for handling loading states.
-   **Dependency Injection**:
    -   ViewModels are registered with `GetIt` as factories.
    -   They must have a static `locate` getter and a static `registerFactory` method.
    -   Dependencies (like services and routers) are retrieved within the ViewModel using their respective `.locate` getters.
    ```dart
    class AuthViewModel extends BaseViewModel with Loglytics {
      static AuthViewModel get locate => GetIt.I.get();
      static void registerFactory() => GetIt.I.registerFactory(AuthViewModel.new);

      final _toastService = ToastService.locate;
      // ...
    }
    ```
-   **State Management**:
    -   State is managed using `Informer` objects (from the `informers` package). An `Informer` is a `ValueNotifier`.
    -   State is exposed to the `View` as a `ValueListenable<T>` via a getter.
    ```dart
    final _authViewMode = Informer<AuthViewMode>(AuthViewMode.defaultValue);
    ValueListenable<AuthViewMode> get authViewMode => _authViewMode;
    ```
-   **Lifecycle**:
    -   `initialise()`: This method is overridden to perform setup logic, like adding listeners or fetching initial data.
    -   `dispose()`: This method is overridden to clean up resources, such as canceling subscriptions or disposing controllers and `Informer`s.
-   **Business Logic**:
    -   Public methods contain the logic for handling user interactions from the `View` (e.g., `onLoginPressed`).
    -   Asynchronous operations that interact with services return a `Future<TurboResponse>`. The ViewModel handles the success and failure cases of the response, often showing a toast or dialog.
    -   A `Mutex` is often used to prevent concurrent execution of critical asynchronous operations like login or registration.
-   **Localization**:
    -   Always use `gStrings` for user-facing text in toasts, dialogs, and error messages.
    -   Import `package:{project_name}/l10n/globals/g_strings.dart` to access localized strings.
    -   Example: `_toastService.showToast(context: context, title: gStrings.taskDeletedSuccessfully);`

## 3. Example

```dart
// lib/auth/views/auth/auth_view_model.dart

class AuthViewModel extends BaseViewModel with Loglytics, BusyServiceManagement {
  // 1. GetIt Locator and Registration
  static AuthViewModel get locate => GetIt.I.get();
  static void registerFactory() => GetIt.I.registerFactory(AuthViewModel.new);

  // 2. Dependencies
  final _toastService = ToastService.locate;
  final _emailService = EmailService.locate;
  // ...

  // 3. Lifecycle
  @override
  Future<void> initialise() async {
    _authViewMode.addListener(_onAuthViewModeChanged);
    super.initialise();
  }

  @override
  void dispose() {
    _authViewMode.removeListener(_onAuthViewModeChanged);
    super.dispose();
  }

  // 4. State Management
  final _authViewMode = Informer<AuthViewMode>(AuthViewMode.defaultValue);
  ValueListenable<AuthViewMode> get authViewMode => _authViewMode;

  // 5. Business Logic
  Future<void> onLoginPressed({
    required AuthViewMode authViewMode,
    required BuildContext context,
  }) async {
    // ... logic to call services and handle TurboResponse
  }
}
```
