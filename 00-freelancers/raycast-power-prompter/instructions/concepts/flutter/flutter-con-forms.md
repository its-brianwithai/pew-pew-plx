# Forms

Form configurations centralize the definition, state, and validation logic for a form in the application.

## 1. File Naming and Location

-   **Location**: `lib/<feature>/forms/<form_name>_form.dart`
-   **Naming**: The file is named in `snake_case` and ends with `_form.dart`. The class name is the `PascalCase` version.

**Example:** `lib/auth/forms/login_form.dart`

## 2. Structure and Conventions

-   **Base Class**: Form classes extend `FormConfig` from `lib/forms/abstracts/form_config.dart`.
-   **Dependency Injection**:
    -   Forms are registered with `GetIt` as factories.
    -   They must have a static `locate` getter and a static `registerFactory` method.
-   **Field Enum**: A private `enum` is defined within the file to represent the unique identifiers for each form field.
    ```dart
    enum _LoginFormField {
      email,
      password,
    }
    ```
-   **Field Configuration**:
    -   The class overrides the `formFieldConfigs` getter, which returns a `Map<Enum, TFormFieldConfig>`.
    -   This map links each field `enum` value to a `TFormFieldConfig` instance.
    -   `TFormFieldConfig` defines everything about a field: its type (`TFieldType`), validation logic (`valueValidator`), initial value, whether it's obscured, etc.
-   **Validation**:
    -   Validation logic is provided via the `valueValidator` property of `TFormFieldConfig`.
    -   Validators are typically composed using `kValueValidatorsMultiple` and other helpers from `lib/forms/constants/k_value_validators.dart`.
-   **Field Accessors**: The class provides public getters to easily access the `TFormFieldConfig` for each field from the `ViewModel`.
    ```dart
    TFormFieldConfig<String> get email => formFieldConfig(_LoginFormField.email);
    ```

## 3. Example

```dart
// lib/auth/forms/login_form.dart

import 'package:{project_name}/forms/abstracts/form_config.dart';
import 'package:{project_name}/forms/config/t_form_field_config.dart';
// ... other imports

enum _LoginFormField {
  email,
  password,
}

class LoginForm extends FormConfig {
  // 1. GetIt registration
  static LoginForm get locate => GetIt.I.get();
  static void registerFactory() => GetIt.I.registerFactory(LoginForm.new);

  // 2. Field accessors
  TFormFieldConfig<String> get email => formFieldConfig(_LoginFormField.email);
  TFormFieldConfig<String> get password => formFieldConfig(_LoginFormField.password);

  // 3. Field configuration map
  @override
  late final Map<Enum, TFormFieldConfig> formFieldConfigs = {
    _LoginFormField.email: TFormFieldConfig<String>(
      id: _LoginFormField.email,
      fieldType: TFieldType.textInput,
      valueValidator: kValueValidatorsMultiple(
        [
          kValueValidatorsRequired(errorText: () => gStrings.enterYourEmail),
          kValueValidatorsEmail(errorText: () => gStrings.enterAValidEmail),
        ],
      ),
    ),
    _LoginFormField.password: TFormFieldConfig<String>(
      id: _LoginFormField.password,
      fieldType: TFieldType.textInput,
      obscureText: true,
      valueValidator: kValueValidatorsRequired(errorText: () => gStrings.enterYourPassword),
    ),
  };
}
```
