# Enums

Enums are used to represent a fixed number of constant values, such as states, types, or modes.

## 1. File Naming and Location

-   **Location**: `lib/<feature>/enums/<enum_name>.dart`
-   **Naming**: The file is named in `snake_case`. The `enum` name itself is `PascalCase`.

**Example:** `lib/auth/enums/auth_view_mode.dart`

## 2. Structure and Conventions

-   **Definition**: Standard Dart `enum` syntax is used.
-   **Helper Getters**: Enums often include helper getters to make checking for a specific value more readable and less error-prone.
    ```dart
    enum AuthViewMode {
      login,
      register;

      bool get isLogin => this == AuthViewMode.login;
      bool get isRegister => this == AuthViewMode.register;
    }
    ```
-   **Default Value**: If an enum has a logical default state, a `static const` field named `defaultValue` is often provided.
    ```dart
    enum AuthViewMode {
      login,
      register;

      static const defaultValue = AuthViewMode.login;
    }
    ```
-   **Associated Data**: When an enum value needs to be associated with more complex data (like a display name or an icon), getters are used to provide this information.

## 3. Example

```dart
// lib/auth/enums/auth_view_mode.dart

enum AuthViewMode {
  login,
  register,
  forgotPassword;

  // Default value
  static const defaultValue = AuthViewMode.login;

  // Helper getters
  bool get isLogin => this == AuthViewMode.login;
  bool get isRegister => this == AuthViewMode.register;
  bool get isForgotPassword => this == AuthViewMode.forgotPassword;
}
```