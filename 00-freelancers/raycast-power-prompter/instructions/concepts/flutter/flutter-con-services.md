# Services

Services encapsulate specific business logic, interact with external APIs (like Supabase), or manage a shared resource. They are the backbone of the application's logic layer.

## 1. File Naming and Location

-   **Location**: `lib/<feature>/services/<service_name>_service.dart`
-   **Naming**: The file is named in `snake_case` and ends with `_service.dart`. The class name is the `PascalCase` version.

**Example:** `lib/auth/services/auth_service.dart`

## 2. Structure and Conventions

-   **Class Type**: Services are plain Dart classes. They often use mixins like `Loglytics` for structured logging.
-   **Dependency Injection**:
    -   Services are registered with `GetIt` as either lazy singletons or factories.
    -   They must provide a static `locate` getter and a static registration method (`registerLazySingleton` or `registerFactory`).
    ```dart
    class AuthService with Loglytics {
      static AuthService get locate => GetIt.I.get();
      static void registerLazySingleton() => GetIt.I.registerLazySingleton(AuthService.new);
      // ...
    }
    ```
-   **Asynchronous Operations**:
    -   Methods that perform asynchronous work (e.g., API calls) must return a `Future<TurboResponse<T>>`.
    -   The `TurboResponse` wrapper provides a standardized way to handle success and failure cases, including user-friendly titles and messages.
-   **Error Handling**:
    -   Services are responsible for catching exceptions from external sources (e.g., `PostgrestException` from Supabase) and converting them into a `TurboResponse.fail`.
    -   Mixins like `SupabaseAuthExceptionHandler` are used to centralize the handling of common API exceptions.
-   **State Management**:
    -   Services can manage application-wide state. For example, `AuthService` manages the authentication stream.
    -   State that needs to be observed by the UI is typically exposed through a `Stream` or `ValueListenable`.

## 3. Example

```dart
// lib/auth/services/email_service.dart

import 'package:{project_name}/auth/mixins/supabase_auth_exception_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:loglytics/loglytics.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:turbo_response/turbo_response.dart';

class EmailService with Loglytics, SupabaseAuthExceptionHandler {
  // 1. GetIt Locator and Registration
  static EmailService get locate => GetIt.I.get();
  static void registerFactory() => GetIt.I.registerFactory(EmailService.new);

  // 2. Dependencies
  Supabase get _supabase => Supabase.instance;

  // 3. Public Method with TurboResponse and Error Handling
  Future<TurboResponse<AuthResponse>> login({
    required String email,
    required String password,
  }) async {
    try {
      log.info('Logging in...');
      final authResponse = await _supabase.client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return TurboResponse.success(result: authResponse);
    } on AuthException catch (error) {
      log.warning('Unable to login user! Reason: ${error.message}');
      return tryHandleSupabaseAuthException(
        supabaseAuthException: error,
        log: log,
      );
    } catch (error, stackTrace) {
      // ... handle generic error
      return TurboResponse.fail(...);
    }
  }
}
```
