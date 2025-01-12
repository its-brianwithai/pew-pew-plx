---
document_type: code of conduct
goal: define structure and process for creating Firestore documents
gpt_action: follow these steps when implementing Firestore document functionality
---

# 🔍 Initial Research

1. [[GPT Agent]] [[verify existing components]]
   1. [[verify existing components]]
      1. Search for DTOs in feature's `dtos` folder
      2. Check for services in feature's `services` folder
      3. Look for APIs in feature's `apis` folder
      4. Verify similar existing implementations

2. [[GPT Agent]] [[confirm implementation details]]
   1. [[confirm implementation details]]
      1. Verify Firestore collection structure
      2. Confirm if using `CollectionService` or `DocumentService`
      3. Check required relationships with other collections
      4. Search for similar implementations

3. [[GPT Agent]] [[state assumptions]]
   1. [[state assumptions]]
      1. We extend either `CollectionService` or `DocumentService`
      2. We use DTOs implementing `TurboWriteableId<String>`
      3. We follow consistent collection structure
      4. We implement proper logging using Loglytics
      5. We reuse existing components when possible

4. [[GPT Agent]] [[request clarification]]
   1. [[request clarification]]
      1. Confirm if data belongs in collection or single document
      2. Verify collection security rules requirements
      3. Check specific error handling requirements
      4. Confirm specific logging requirements
      5. Ask about reusable components

# 🛠️ Implementation

1. [[GPT Agent]] [[setup collection]]
   1. [[setup collection]]
      1. Create Firestore collection with proper structure
      2. Set up security rules:
```firestore-security-rules
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /items/{itemId} {
      allow read, write: if request.auth != null;
    }
  }
}
```

2. [[GPT Agent]] [[create DTO]]
   1. [[create DTO]]
      1. Implement `TurboWriteableId<String>`
      2. Define required fields
      3. Create factory methods:
```dart
class ItemDto implements TurboWriteableId<String> {
  @override
  final String id;
  final String name;
  @TimestampConverter()
  final DateTime createdAt;
  @TimestampConverter()
  final DateTime updatedAt;
  final String createdBy;
  final String? parentId;

  @override
  bool get isLocalDefault => false;

  ItemDto({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    this.parentId,
  });

  factory ItemDto.defaultValue({
    required String id,
    required String userId,
    String? parentId,
    required String name,
  }) {
    final now = gNow;
    return ItemDto(
      id: id,
      name: name,
      createdAt: now,
      updatedAt: now,
      createdBy: userId,
      parentId: parentId,
    );
  }
}
```

3. [[GPT Agent]] [[implement service]]
   1. [[implement service]]
      1. Create API extending `BaseApi`:
```dart
class ItemsApi extends BaseApi<ItemDto> {
  ItemsApi()
      : super(
          firestoreCollection: FirestoreCollection.items,
        );
}
```
      2. Create service extending base service:
```dart
class ItemsService extends CollectionService<ItemDto, ItemsApi> {
  ItemsService({
    required super.api,
  });

  Future<TurboResponse<DocumentReference>> createItem({
    required String name,
    String? parentId,
  }) async {
    log.debug('Creating item with name: $name');
    
    final item = ItemDto.defaultValue(
      id: api.genId,
      userId: currentUser.id,
      parentId: parentId,
      name: name,
    );
    
    return createDoc(doc: item);
  }
}
```

4. [[GPT Agent]] [[implement UI]]
   1. [[implement UI]]
      1. IF [[using form input]]
```dart
void onCreateShoppingListTapped() {
  _sheetService.showInputSheet(
    sheetBuilder: (context) {
      return TextFormFieldSheet(
        title: strings.createShoppingList,
        message: strings.enterTheNameForTheNewShoppingList,
        saveButtonText: strings.create,
        formFieldLabel: strings.name,
        formFieldHint: strings.shoppingLists,
        onSavedPressed: (context) => _onSaveNewShoppingListPressed(
          context: context,
        ),
        textFormFieldConfig: _shoppingListForm.nameField,
      );
    },
  );
}
```
      2. IF [[using direct creation]]
```dart
Future<void> onCreateDefaultListTapped() async {
  try {
    log.debug('Creating default shopping list');
    final response = await _shoppingListsService.createShoppingList(
      title: 'My Shopping List',
    );
    
    if (response.isSuccess) {
      gShowNotification(title: gStrings.createShoppingList);
    } else {
      gShowResponse(response: response);
    }
  } catch (error, stackTrace) {
    log.error(
      'Error creating default shopping list',
      error: error,
      stackTrace: stackTrace,
    );
  }
}
```

# ✅ Verification

1. [[GPT Agent]] [[verify implementation]]
   1. [[verify implementation]]
      1. Firestore collection properly set up
      2. Security rules configured correctly
      3. Service extends appropriate base service
      4. Service registered with dependencies
      5. UI provides clear feedback
      6. Form validation implemented (if applicable)
      7. Document creation tested
