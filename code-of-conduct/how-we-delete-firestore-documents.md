---
document_type: code of conduct
goal: define process for deleting Firestore documents safely and consistently
gpt_action: follow these steps when implementing Firestore document deletion
---

# 🔍 Initial Research

1. [[GPT Agent]] [[verify deletion requirements]]
   1. [[verify deletion requirements]]
      1. Check if document can be deleted
      2. Verify any dependent documents
      3. Check security rules for deletion
      4. Review existing deletion patterns

2. [[GPT Agent]] [[confirm implementation details]]
   1. [[confirm implementation details]]
      1. Verify service layer implementation
      2. Check UI requirements
      3. Review error handling needs
      4. Confirm logging requirements

# 🛠️ Implementation

1. [[GPT Agent]] [[implement service layer]]
   1. [[implement service layer]]
      1. Add delete functionality with validation:
```dart
Future<TurboResponse<void>> deleteItem(ItemDto item) async {
  // Add validation logic
  if (item.isProtected) {
    log.debug('Cannot delete protected item');
    return TurboResponse.error(
      title: gStrings.somethingWentWrong,
      message: 'This item cannot be deleted.',
    );
  }
  
  log.debug('Deleting item with id: ${item.id}');
  return deleteDoc(doc: item);
}
```

2. [[GPT Agent]] [[implement UI]]
   1. [[implement UI]]
      1. Add delete button to view:
```dart
BaseAppBar(
  context: context,
  header: EmojiHeader.scaffoldTitle(
    emoji: Emoji.yourEmoji,
    title: model.title,
  ),
  actions: [
    if (item?.isProtected == false)
      RightPadding(
        child: IconButton(
          iconData: Icons.delete_rounded,
          onPressed: () => model.onDeletePressed(context),
        ),
      ),
  ],
),
```

3. [[GPT Agent]] [[implement view model]]
   1. [[implement view model]]
      1. Add deletion logic with confirmation:
```dart
Future<void> onDeletePressed(BuildContext context) async {
  if (gIsBusy) return;

  final shouldDelete = await gShowOkCancelDialog(
    title: (strings) => gStrings.deleteItem,
    message: (strings) => gStrings.areYouSureYouWantToDeleteThis,
  );

  if (shouldDelete != true) return;

  try {
    gSetBusy();
    final item = _item.value;
    if (item == null) {
      throw const UnexpectedResultException(reason: 'Item not found');
    }
    
    _ignoreChanges = true;
    
    final response = await _service.deleteItem(item);
    response.fold(
      ifSuccess: (response) {
        gShowNotification(title: gStrings.itemDeleted);
        gPop(context);
      },
      orElse: (response) {
        gShowOkDialog(
          title: (strings) => strings.somethingWentWrong,
          message: (strings) => gStrings.failedToDeleteItemPleaseTryAgainLater,
        );
        _ignoreChanges = false;
      },
    );
  } catch (error, stackTrace) {
    log.error(
      '$error caught while deleting item',
      error: error,
      stackTrace: stackTrace,
    );
    _ignoreChanges = false;
  } finally {
    gSetIdle();
  }
}
```

4. [[GPT Agent]] [[handle empty states]]
   1. [[handle empty states]]
      1. Implement empty state handling:
```dart
ValueListenableBuilder<List<ItemDto>>(
  valueListenable: model.items,
  builder: (context, items, child) {
    if (items.isEmpty) {
      return EmptyPlaceholder(
        message: strings.noItemsFound,
        ctaText: strings.goBack,
        onCtaPressed: () => model.onGoBackPressed(context),
      );
    }
    
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ItemListTile(item: item);
      },
    );
  },
);
```

# ✅ Verification

1. [[GPT Agent]] [[verify service layer]]
   1. [[verify service layer]]
      1. Validate deletion method works
      2. Confirm TurboResponse handling
      3. Check logging implementation

2. [[GPT Agent]] [[verify UI layer]]
   1. [[verify UI layer]]
      1. Test delete widget functionality
      2. Verify empty state handling
      3. Check error state display

3. [[GPT Agent]] [[verify view model]]
   1. [[verify view model]]
      1. Test busy state handling
      2. Verify confirmation dialog
      3. Check update blocking during deletion
      4. Test error handling
      5. Verify navigation after deletion
      6. Confirm proper cleanup in dispose
