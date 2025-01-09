---
document_type: wiki
goal: define process for updating Firestore fields with proper handling of nullable values
gpt_action: follow these steps when implementing Firestore field updates
---

# 🔍 Initial Research

1. [[GPT Agent]] [[verify update requirements]]
   1. [[verify update requirements]]
      1. Check if fields are nullable
      2. Review data integrity needs
      3. Check real-time update needs
      4. Identify input collection methods

2. [[GPT Agent]] [[confirm request types]]
   1. [[confirm request types]]
      1. Check if regular update request
      2. Check if nullable fields request
      3. Review JSON serialization needs
      4. Verify DTO field matching

# 🛠️ Implementation

1. [[GPT Agent]] [[create update requests]]
   1. [[create update requests]]
      1. Regular update request:
```dart
@JsonSerializable(includeIfNull: false, explicitToJson: true)
class UpdateItemDtoRequest extends Writeable {
  UpdateItemDtoRequest({
    required this.name,
  });

  final String name;
}
```
      2. Nullable fields request:
```dart
@JsonSerializable(includeIfNull: true, explicitToJson: true)
class UpdateCompletedAtRequest extends Writeable {
  UpdateCompletedAtRequest({
    required this.completedAt,
    required this.completedBy,
  });

  @TimestampConverter()
  final DateTime? completedAt;
  final String? completedBy;
}
```

2. [[GPT Agent]] [[implement service updates]]
   1. [[implement service updates]]
      1. Regular field update:
```dart
Future<TurboResponse<DocumentReference>> updateItemName({
  required String itemId,
  required String name,
}) async {
  final item = findById(itemId);
  final updatedItem = item.copyWith(name: name);
  
  return updateDoc(
    doc: updatedItem,
    remoteUpdateRequestBuilder: (doc) => UpdateItemDtoRequest(
      name: name,
    ),
  );
}
```
      2. Nullable field update:
```dart
Future<TurboResponse<DocumentReference>> updateCompletionStatus({
  required String itemId,
  required DateTime? completedAt,
  required String? completedBy,
}) async {
  final item = findById(itemId);
  final updatedItem = item.copyWith(
    completedAt: completedAt,
    completedBy: completedBy,
    forceNull: true, // Important for nullable fields
  );
  
  return updateDoc(
    doc: updatedItem,
    remoteUpdateRequestBuilder: (doc) => UpdateCompletedAtRequest(
      completedAt: completedAt,
      completedBy: completedBy,
    ),
  );
}
```

3. [[GPT Agent]] [[implement dto support]]
   1. [[implement dto support]]
      1. Add copyWith with nullable support:
```dart
YourDto copyWith({
  String? name,
  DateTime? completedAt,
  String? completedBy,
  bool forceNull = false, // Add this parameter
}) =>
    YourDto(
      // Regular fields
      name: name ?? this.name,
      // Nullable fields
      completedAt: forceNull ? completedAt : completedAt ?? this.completedAt,
      completedBy: forceNull ? completedBy : completedBy ?? this.completedBy,
    );
```

4. [[GPT Agent]] [[handle responses]]
   1. [[handle responses]]
      1. Implement response handling:
```dart
final response = await updateCompletionStatus(
  itemId: 'id',
  completedAt: null,
  completedBy: null,
);

if (response.isSuccess) {
  // Show success feedback
} else {
  // Show error feedback
}
```

# ✅ Verification

1. [[GPT Agent]] [[verify request objects]]
   1. [[verify request objects]]
      1. Regular updates use includeIfNull: false
      2. Nullable updates use includeIfNull: true
      3. Field names match DTO structure
      4. Proper JSON serialization support

2. [[GPT Agent]] [[verify service layer]]
   1. [[verify service layer]]
      1. Immediate local state updates work
      2. Optimistic UI updates function
      3. Specific field updates work
      4. Nullable fields handled correctly

3. [[GPT Agent]] [[verify dto implementation]]
   1. [[verify dto implementation]]
      1. copyWith supports nullable fields
      2. forceNull parameter works
      3. Regular fields update correctly
      4. Error handling works properly 
