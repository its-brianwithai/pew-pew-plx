# Routers

Routers provide a structured and convenient way to handle navigation for a specific feature area of the application. They are an abstraction on top of `go_router`.

## 1. File Naming and Location

-   **Location**: `lib/<feature>/routers/<feature>_router.dart`
-   **Naming**: The file is named in `snake_case` and ends with `_router.dart`. The class name is the `PascalCase` version.

**Example:** `lib/home/routers/home_router.dart`

## 2. Structure and Conventions

-   **Base Class**: Router classes extend `BaseNavigation` from `lib/routing/abstracts/base_navigation.dart`.
-   **Dependency Injection**: Routers are registered with `GetIt` as factories and provide a static `locate` getter and `registerFactory` method.
-   **Core Properties**:
    -   `root`: A getter that specifies the root path for this feature's navigation stack (e.g., `'/home'`).
    -   `navigationTab`: A getter that associates the router with a specific tab in the main shell navigation, if applicable.
-   **Navigation Methods**:
    -   The class provides strongly-typed methods for navigating to the screens within its feature (e.g., `goHomeView()`, `pushSettingsView()`).
    -   These methods handle the construction of the route path and the packaging of `ViewArguments` into the `extra` parameter for `go_router`.
    -   They use the `go`, `push`, and `pushReplacement` methods from the `BaseNavigation` class.
-   **Route Definitions**: The actual `GoRoute` definitions are centralized in `lib/routing/services/base_router_service.dart`. The feature-specific router classes are primarily for providing a clean, type-safe API for triggering navigation.

## 3. Example

```dart
// lib/home/routers/home_router.dart

import 'package:{project_name}/home/views/home/home_view.dart';
import 'package:{project_name}/routing/abstracts/base_navigation.dart';
// ... other imports

class HomeRouter extends BaseNavigation {
  // 1. GetIt Registration
  static HomeRouter get locate => GetIt.I.get();
  static void registerFactory() => GetIt.I.registerFactory(HomeRouter.new);

  // 2. Core Properties
  @override
  NavigationTab? get navigationTab => NavigationTab.home;

  @override
  String get root => HomeView.path.asRootPath;

  // 3. Navigation Methods
  void goHomeView({
    StatefulNavigationShell? statefulNavigationShell,
  }) {
    if (statefulNavigationShell != null) {
      goBranch(statefulNavigationShell: statefulNavigationShell);
    } else {
      go(location: root);
    }
  }

  void pushSettingsView() {
    push(
      location: '$root/${SettingsView.path}',
      extra: [
        SettingsViewArguments(),
      ],
    );
  }
}
```
