---
document_type: code of conduct
goal: define process for syncing parent-dependent Firestore data
gpt_action: follow these steps when implementing parent-dependent data sync
---

# 🔍 Initial Research

1. [[GPT Agent]] [[verify sync requirements]]
   1. [[verify sync requirements]]
      1. Check if data needs preprocessing (BeforeParentSyncService)
      2. Check if data needs postprocessing (AfterParentSyncService)
      3. Check if no processing needed (ParentSyncService)
      4. Confirm parent ID field requirements

2. [[GPT Agent]] [[confirm security needs]]
   1. [[confirm security needs]]
      1. Verify parent membership rules
      2. Check access control requirements
      3. Review data cleanup needs
      4. Confirm subscription management

# 🛠️ Implementation

1. [[GPT Agent]] [[create data model]]
   1. [[create data model]]
      1. Create DTO with parent ID:
```dart
@JsonSerializable(includeIfNull: true, explicitToJson: true)
class ItemDto extends TurboWriteableId<String> {
  ItemDto({
    required this.id,
    required this.parentId,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
  });

  final String parentId;
  final String name;
  @TimestampConverter()
  final DateTime createdAt;
  @TimestampConverter()
  final DateTime updatedAt;
  final String createdBy;
}
```

2. [[GPT Agent]] [[implement sync service]]
   1. [[implement sync service]]
      1. Choose appropriate base service:
```dart
// For preprocessing data
class ItemsService extends BeforeParentSyncService<ItemDto, ItemsApi> {
  // ...
}

// For direct sync
class SubItemsService extends ParentSyncService<SubItemDto, SubItemsApi> {
  // ...
}

// For postprocessing data
class InvitesService extends AfterParentSyncService<InviteDto, InvitesApi> {
  // ...
}
```

3. [[GPT Agent]] [[configure parent stream]]
   1. [[configure parent stream]]
      1. Implement parent stream method:
```dart
@override
FutureOr<Stream<List<ItemDto?>>> parentStream(User user, String? parentId) {
  if (parentId == null) return Stream.value(null);
  return api.findStreamByQueryWithConverter(
    whereDescription: 'parentId is $parentId',
    collectionReferenceQuery: (collectionReference) => 
      collectionReference.where(kKeysParentId, isEqualTo: parentId),
  );
}
```

4. [[GPT Agent]] [[setup security rules]]
   1. [[setup security rules]]
      1. Add Firestore security rules:
```
match /items/{documentId} {
  allow create: if hasAuth() && 
    request.auth.uid == request.resource.data.createdBy && 
    isParentMember(request.resource.data.parentId);
  allow read, update, delete: if hasAuth() && 
    isParentMember(resource.data.parentId);
}
```

# ✅ Verification

1. [[GPT Agent]] [[verify implementation]]
   1. [[verify implementation]]
      1. DTO includes parentId field
      2. Service extends correct base class
      3. parentStream method filters correctly
      4. Security rules enforce parent membership

2. [[GPT Agent]] [[verify cleanup]]
   1. [[verify cleanup]]
      1. Old subscriptions are cleaned up
      2. Data resets on parent change
      3. New parent data resubscribes
      4. No memory leaks present

3. [[GPT Agent]] [[verify error handling]]
   1. [[verify error handling]]
      1. Parent ID null cases handled
      2. Stream errors caught
      3. Security rule violations handled
      4. Parent change errors managed
