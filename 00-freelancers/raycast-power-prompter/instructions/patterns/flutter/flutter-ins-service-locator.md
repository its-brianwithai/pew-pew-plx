---
name: service-locator-pattern
description: "The Service Locator pattern implementation using GetIt for dependency injection with standardized locator conventions."
---
# 📍 Service Locator Pattern

Service Locator pattern implementation using `get_it` package for centralized dependency management.

## Core Setup

All dependency injection is managed in `lib/core/services/locator_service.dart` using the `GetIt` service locator.

## Locator Pattern Convention

Every injectable class follows this standardized pattern:

```dart
class PosthogService {
  // 📍 LOCATOR -------------------------------------------------------------------------------

  /// Returns the singleton instance of [PosthogService].
  static PosthogService get locate => GetIt.I.get();

  /// Registers this service as a lazy singleton in the GetIt service locator.
  static void registerLazySingleton() => GetIt.I.registerLazySingleton(PosthogService.new);

  // ... rest of the class
}
```

## Required Elements

- **`// 📍 LOCATOR`** comment block
- **Static `locate` getter** to retrieve instance from GetIt
- **Static `register...` method** to handle its own registration logic

## Benefits

- **Decoupling**: Classes don't create their own dependencies
- **Centralized Management**: All registrations in one place
- **Testability**: Easy to swap implementations for testing
- **Modularity**: Clear separation of concerns