---
name: service-state-pattern
description: "Pattern for managing shared application state and business logic using Services with dependency injection."
---
# 🔧 Service State Pattern

Pattern for managing shared application state and business logic using Services registered with dependency injection.

## When to Use Services

Services are for state or business logic that needs to be shared across multiple features or screens.

**Examples:** `AuthService`, `HouseholdService`, `ShoppingListService`

## Service Implementation

Services use the same `Informer` pattern as ViewModels for state management:

```dart
class MyService {
  // Private state
  final _data = Informer<List<Item>>([]);
  
  // Public state access
  ValueListenable<List<Item>> get data => _data;
  
  // Business logic
  void addItem(Item item) {
    _data.updateCurrent((current) {
      current.add(item);
      return current;
    });
  }
}
```

## Dependency Injection with GetIt

**Registration:** In `lib/core/services/locator_service.dart`

- `registerLazySingleton()`: Single instance throughout app lifecycle
- `registerFactory()`: New instance each time requested (for ViewModels)

```dart
// Service registration
class MyService {
  static void registerLazySingleton() => 
      GetIt.I.registerLazySingleton(MyService.new);
  static MyService get locate => GetIt.I.get();
}

// Accessing in ViewModel
final _myService = MyService.locate;
```

## Sync Services

For data from Supabase, use specialized abstract services:
- `AuthSyncService`: Authentication-aware data sync
- `HouseholdCollectionSyncService`: Household-scoped collections

These automatically handle:
- Listening to Supabase streams
- Updating state in response to data changes
- Authentication event handling