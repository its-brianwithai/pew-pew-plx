# View Arguments

View Arguments are simple data classes used to pass type-safe data to a new view during navigation.

## 1. File Naming and Location

-   **Location**: `lib/<feature>/views/<screen_name>/<screen_name>_arguments.dart`
-   **Naming**: The file is named in `snake_case` and ends with `_arguments.dart`. The class name is the `PascalCase` version.

**Example:** `lib/auth/views/verify_email/verify_email_arguments.dart`

## 2. Structure and Conventions

-   **Base Class**: Argument classes must extend `ViewArguments` from `lib/routing/abstracts/view_arguments.dart`.
-   **Purpose**: They act as a container for data that a `ViewModel` needs to initialize itself.
-   **Immutability**: Properties of the class are `final`.
-   **Serialization**:
    -   They must implement a `toMap()` method to convert the object's properties into a `Map<String, dynamic>`.
    -   They must have a `factory YourArguments.fromMap(Map<String, dynamic> map)` constructor to create an instance from a map. This is used by the routing system to reconstruct the arguments.

## 3. Example

```dart
// lib/auth/views/verify_email/verify_email_arguments.dart

import 'package:{project_name}/routing/abstracts/view_arguments.dart';

class VerifyEmailArguments extends ViewArguments {
  VerifyEmailArguments({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  Map<String, dynamic> toMap() => {
        'email': email,
        'password': password,
      };

  factory VerifyEmailArguments.fromMap(Map<String, dynamic> map) => VerifyEmailArguments(
        email: map['email'] as String,
        password: map['password'] as String,
      );
}
```
