---
document_type: wiki
goal: define standard structure for organizing class code with clear sections
gpt_action: follow these section patterns when creating or modifying class files
---

# 🔍 Initial Research

1. [[GPT Agent]] [[verify class needs]]
   1. [[verify class needs]]
      1. Check if service class
      2. Check if view model
      3. Check if widget class
      4. Identify required sections

2. [[GPT Agent]] [[confirm section requirements]]
   1. [[confirm section requirements]]
      1. Check dependency injection needs
      2. Review state management needs
      3. Verify event handling needs
      4. Identify helper methods needed

# 🛠️ Implementation

1. [[GPT Agent]] [[setup class sections]]
   1. [[setup class sections]]
      1. Add section headers with dividers:
```dart
// 📍 LOCATOR ------------------------------------------------------------------------------- \\
// For dependency injection and service location
- Static getters/methods for dependency injection
- Factory registration methods

// 🧩 DEPENDENCIES -------------------------------------------------------------------------- \\
// For injected dependencies and services
- Final service instances
- API instances
- Other dependencies

// 🎬 INIT & DISPOSE ------------------------------------------------------------------------ \\
// For initialization and cleanup
- initState/dispose overrides
- Custom initialization methods
- Cleanup methods

// 👂 LISTENERS ----------------------------------------------------------------------------- \\
// For event listeners and subscriptions
- Stream subscriptions
- Event handlers
- Callback methods

// ⚡️ OVERRIDES ----------------------------------------------------------------------------- \\
// For method overrides from parent classes
- Required overrides
- Optional overrides
- Interface implementations

// 🎩 STATE --------------------------------------------------------------------------------- \\
// For state management
- ValueNotifiers
- StateNotifiers
- Form controllers
- Local state variables

// 🛠 UTIL ---------------------------------------------------------------------------------- \\
// For technical utilities
- Mutexes
- Debouncers
- Technical helpers

// 🧲 FETCHERS ------------------------------------------------------------------------------ \\
// For data retrieval
- Getters
- Data fetching methods

// 🏗️ HELPERS ------------------------------------------------------------------------------- \\
// For complex operations and business logic
- Business logic methods
- Complex calculations
- Data transformations
- Helper functions
- Formatters

// 🪄 MUTATORS ------------------------------------------------------------------------------ \\
// For state mutations and updates
- Methods that change state
- Update operations
- API calls
```

2. [[GPT Agent]] [[implement service example]]
   1. [[implement service example]]
      1. Create example service class:
```dart
class DataService extends BaseService {
  // 📍 LOCATOR
  static DataService get locate => GetIt.I.get();
  static void registerLazySingleton() => GetIt.I.registerLazySingleton(DataService.new);

  // 🧩 DEPENDENCIES
  final _parentService = ParentService.locate;
  final _api = DataApi.locate;

  // 🎬 INIT & DISPOSE
  @override
  Future<void> dispose() async {
    _items.dispose();
    await super.dispose();
  }

  // 🎩 STATE
  final _items = Informer<List<ItemDto>>([]);
  final _isProcessing = ValueNotifier<bool>(false);

  // 🧲 FETCHERS
  ValueListenable<List<ItemDto>> get items => _items;
  ValueListenable<bool> get isProcessing => _isProcessing;
  String get genId => _api.genId;

  // 🏗️ HELPERS
  List<ItemDto> _processItems(List<ItemDto> items) {
    return items..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  // 🪄 MUTATORS
  Future<TurboResponse<DocumentReference>> createItem({
    required String name,
    String? parentId,
  }) async {
    try {
      _isProcessing.value = true;
      
      final item = ItemDto(
        id: genId,
        name: name,
        parentId: parentId,
        createdAt: gNow,
        updatedAt: gNow,
        createdBy: currentUser.id,
      );
      
      return createDoc(doc: item);
    } finally {
      _isProcessing.value = false;
    }
  }
}
```

3. [[GPT Agent]] [[implement view model example]]
   1. [[implement view model example]]
      1. Create example view model class:
```dart
class ItemViewModel extends BaseViewModel {
  // 📍 LOCATOR
  static ItemViewModel get locate => GetIt.I.get();
  static void registerFactory() => GetIt.I.registerFactory(ItemViewModel.new);

  // 🧩 DEPENDENCIES
  final _service = DataService.locate;
  final _dialogService = DialogService.locate;

  // 🎩 STATE
  late final _form = ItemForm();
  final _isSaving = ValueNotifier<bool>(false);

  // 🧲 FETCHERS
  ValueListenable<List<ItemDto>> get items => _service.items;
  ValueListenable<bool> get isSaving => _isSaving;
  bool get isValid => _form.isValid;

  // 🪄 MUTATORS
  Future<void> onSavePressed() async {
    if (gIsBusy || !isValid) return;

    try {
      gSetBusy();
      _isSaving.value = true;

      final response = await _service.createItem(
        name: _form.nameField.value!,
        parentId: currentParent?.id,
      );

      response.fold(
        ifSuccess: (_) => gShowNotification(title: gStrings.itemCreated),
        orElse: (response) => gShowResponse(response: response),
      );
    } catch (error, stackTrace) {
      log.error(
        'Error creating item',
        error: error,
        stackTrace: stackTrace,
      );
    } finally {
      _isSaving.value = false;
      gSetIdle();
    }
  }
}
```

# ✅ Verification

1. [[GPT Agent]] [[verify section structure]]
   1. [[verify section structure]]
      1. All sections present and in order
      2. Proper dividers and emojis used
      3. Section comments explain purpose
      4. Code organized in correct sections

2. [[GPT Agent]] [[verify examples]]
   1. [[verify examples]]
      1. Service example demonstrates sections
      2. View model example shows patterns
      3. Code follows section guidelines
      4. Examples are clear and complete

3. [[GPT Agent]] [[verify snippet]]
   1. [[verify snippet]]
      1. Save as `allheaders` snippet:
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
