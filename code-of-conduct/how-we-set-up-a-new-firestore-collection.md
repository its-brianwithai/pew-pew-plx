---
document_type: code of conduct
goal: define process for setting up new Firestore collections with proper architecture
gpt_action: follow these steps when implementing a new Firestore collection
---

# 🔍 Initial Research

1. [[GPT Agent]] [[verify collection requirements]]
   1. [[verify collection requirements]]
      1. Check if collection already exists
      2. Review data structure needs
      3. Verify parent-child relationships
      4. Confirm security requirements

2. [[GPT Agent]] [[confirm implementation details]]
   1. [[confirm implementation details]]
      1. Verify DTO structure
      2. Check service layer needs
      3. Review API requirements
      4. Confirm dependency setup

# 🛠️ Implementation

1. [[GPT Agent]] [[setup collection structure]]
   1. [[setup collection structure]]
      1. Add to FirestoreCollection enum:
```dart
enum FirestoreCollection {
  users,
  items, // New collection
  ;
}
```
      2. Create DTO with required fields:
```dart
@JsonSerializable(includeIfNull: true, explicitToJson: true)
class ItemDto extends TurboWriteableId<String> {
  ItemDto({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.name,
    this.parentId,
  });

  @override
  final String id;
  @TimestampConverter()
  final DateTime createdAt;
  @TimestampConverter()
  final DateTime updatedAt;
  final String createdBy;
  final String name;
  final String? parentId; // Optional, for hierarchical data
}
```

2. [[GPT Agent]] [[configure security]]
   1. [[configure security]]
      1. Update security rules:
```
match /items/{documentId} {
  allow create: if hasAuth() && 
    request.auth.uid == request.resource.data.createdBy && 
    isParentMember(request.resource.data.parentId);
  allow read: if hasAuth() && 
    isParentMember(resource.data.parentId);
  allow update: if hasAuth() && 
    isParentMember(resource.data.parentId);
  allow delete: if hasAuth() && 
    isParentMember(resource.data.parentId);
}
```

3. [[GPT Agent]] [[implement service layer]]
   1. [[implement service layer]]
      1. Create collection service:
```dart
class ItemsService extends CollectionService<ItemDto, ItemsApi> {
  ItemsService() : super(api: ItemsApi.locate);

  @override
  Stream<List<ItemDto>> Function(User user) get stream =>
      (user) => api.findStreamWithConverter();
}
```

4. [[GPT Agent]] [[setup dependencies]]
   1. [[setup dependencies]]
      1. Register in locator:
```dart
class Locator {
  static void _registerFactories() {
    ItemsApi.registerFactory();
  }

  static void _registerLazySingletons() {
    ItemsService.registerLazySingleton();
  }
}
```

5. [[GPT Agent]] [[implement usage]]
   1. [[implement usage]]
      1. Create view model implementation:
```dart
class ItemViewModel extends BaseViewModel {
  // Access the service through the locator
  final _itemsService = ItemsService.locate;
}
```

# ✅ Verification

1. [[GPT Agent]] [[verify structure]]
   1. [[verify structure]]
      1. Collection enum is updated
      2. DTO implements TurboWriteableId
      3. Required fields are defined
      4. Timestamps use proper converter

2. [[GPT Agent]] [[verify security]]
   1. [[verify security]]
      1. Read rules are properly scoped
      2. Write rules include auth checks
      3. Parent-child relationships secured
      4. User permissions validated

3. [[GPT Agent]] [[verify implementation]]
   1. [[verify implementation]]
      1. Service extends correct base class
      2. API registration is complete
      3. Dependencies are properly registered
      4. Stream handling is implemented
      5. View model access is configured 
