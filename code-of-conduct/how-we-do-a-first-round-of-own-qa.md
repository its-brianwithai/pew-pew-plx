---
document_type: code of conduct
goal: define process for performing first round of quality assurance on own code
gpt_action: follow these steps when doing self QA on implemented features
---

# 🔍 Initial Review

1. [[GPT Agent]] [[verify code structure]]
   1. [[verify code structure]]
      1. Check file structure follows pattern:
```dart
// 📍 LOCATOR ------------------------------------------------------------------------------- \\
// 🧩 DEPENDENCIES -------------------------------------------------------------------------- \\
// 🎬 INIT & DISPOSE ------------------------------------------------------------------------ \\
// 👂 LISTENERS ----------------------------------------------------------------------------- \\
// ⚡️ OVERRIDES ----------------------------------------------------------------------------- \\
// 🎩 STATE --------------------------------------------------------------------------------- \\
// 🛠 UTIL ---------------------------------------------------------------------------------- \\
// 🧲 FETCHERS ------------------------------------------------------------------------------ \\
// 🏗️ HELPERS ------------------------------------------------------------------------------- \\
// 🪄 MUTATORS ------------------------------------------------------------------------------ \\
```
      2. Verify public/private access modifiers
      3. Check method naming conventions
      4. Sort items alphabetically where possible
      5. Remove unused code

2. [[GPT Agent]] [[review methods]]
   1. [[review methods]]
      1. Check logging implementation
      2. Verify analytics tracking
      3. Review documentation
      4. Validate busy states and user feedback
      5. Check timeout implementations
      6. Review error handling
      7. Verify translations
      8. Assess method size and complexity

# 🛠️ Implementation Review

1. [[GPT Agent]] [[verify logging]]
   1. [[verify logging]]
      1. Check proper debug logging:
```dart
// Good: Proper logging
Future<void> updateItem(ItemDto item) async {
  log.debug('Updating item: ${item.id}');
  try {
    await _api.updateItem(item);
    log.debug('Item updated successfully');
  } catch (error, stackTrace) {
    log.error(
      'Error updating item',
      error: error,
      stackTrace: stackTrace,
    );
    rethrow;
  }
}
```

2. [[GPT Agent]] [[verify user feedback]]
   1. [[verify user feedback]]
      1. Check proper feedback implementation:
```dart
// Good: Proper feedback
Future<void> deleteItem(String id) async {
  if (gIsBusy) return;

  try {
    gSetBusy();
    final response = await _api.deleteItem(id);
    response.fold(
      ifSuccess: (_) => gShowNotification(title: gStrings.itemDeleted),
      orElse: (response) => gShowResponse(response: response),
    );
  } catch (error, stackTrace) {
    log.error(
      'Error deleting item',
      error: error,
      stackTrace: stackTrace,
    );
  } finally {
    gSetIdle();
  }
}
```

3. [[GPT Agent]] [[verify state management]]
   1. [[verify state management]]
      1. Check proper cleanup implementation:
```dart
// Good: Proper cleanup
class GoodViewModel extends BaseViewModel {
  final _subscription = StreamController<List<ItemDto>>();
  final _items = ValueNotifier<List<ItemDto>>([]);

  @override
  Future<void> dispose() async {
    await _subscription.close();
    _items.dispose();
    super.dispose();
  }
}
```

4. [[GPT Agent]] [[verify error handling]]
   1. [[verify error handling]]
      1. Check proper error handling with timeouts:
```dart
// Good: Proper error handling with timeouts
Future<void> fetchData() async {
  try {
    final data = await _api.getData().timeout(
      const Duration(seconds: 10),
      onTimeout: () => throw TimeoutException('Fetch data timeout'),
    );
    _items.value = data;
  } on TimeoutException catch (error) {
    log.error('Fetch data timeout', error: error);
    gShowDialog(
      title: gStrings.error,
      message: gStrings.connectionTimeout,
    );
  } catch (error, stackTrace) {
    log.error(
      'Error fetching data',
      error: error,
      stackTrace: stackTrace,
    );
    gShowDialog(
      title: gStrings.error,
      message: gStrings.generalError,
    );
  }
}
```

# ✅ Verification

1. [[GPT Agent]] [[verify code quality]]
   1. [[verify code quality]]
      1. Documentation is complete
      2. No magic numbers/strings
      3. Consistent naming conventions
      4. No commented-out code

2. [[GPT Agent]] [[verify error handling]]
   1. [[verify error handling]]
      1. Try/catch blocks implemented
      2. User feedback for all actions
      3. Proper error logging
      4. Timeouts where needed

3. [[GPT Agent]] [[verify state management]]
   1. [[verify state management]]
      1. All disposables cleaned up
      2. No memory leaks
      3. Efficient UI updates

4. [[GPT Agent]] [[verify performance]]
   1. [[verify performance]]
      1. No unnecessary rebuilds
      2. Heavy operations off main thread
      3. Proper resource caching

5. [[GPT Agent]] [[verify security]]
   1. [[verify security]]
      1. No sensitive data in logs
      2. All user input validated
      3. Proper access control
      4. No hardcoded credentials
