---
document_type: wiki
goal: define process for passing data between views using ViewArguments and routing
gpt_action: follow these steps when implementing data passing between views
---

# 🔍 Initial Research

1. [[GPT Agent]] [[verify requirements]]
   1. [[verify requirements]]
      1. Check if data needs to be passed via URL parameters
      2. Verify if complex objects need to be passed
      3. Review required vs optional parameters
      4. Check existing argument patterns

2. [[GPT Agent]] [[confirm implementation details]]
   1. [[confirm implementation details]]
      1. Verify view-specific argument needs
      2. Check routing requirements
      3. Review state management needs
      4. Confirm default values

# 🛠️ Implementation

1. [[GPT Agent]] [[create view arguments]]
   1. [[create view arguments]]
      1. Create view-specific arguments class:
```dart
class MyViewArguments extends ViewArguments {
  MyViewArguments({
    required this.requiredField,
    this.optionalField,
  });

  final String requiredField;
  final String? optionalField;

  @override
  Map<String, dynamic> toMap() => {
    'requiredField': requiredField,
    'optionalField': optionalField,
  };
}
```
      2. Update ViewArgumentsImpl:
```dart
class ViewArgumentsImpl extends ViewArguments {
  ViewArgumentsImpl({
    // ... existing fields
    this.requiredField,
    this.optionalField,
  });

  final String? requiredField;
  final String? optionalField;
}
```

2. [[GPT Agent]] [[implement state extension]]
   1. [[implement state extension]]
      1. Add getters to GoRouterState:
```dart
extension on GoRouterState {
  ViewArgumentsImpl? arguments() => extra?.asType<ViewArgumentsImpl>();
  
  // Required field with default
  String get requiredField => arguments()?.requiredField ?? '';
  
  // Optional field
  String? get optionalField => arguments()?.optionalField;
  
  // URL parameter example
  String? get itemId => 
      pathParameters[kKeysItemId] ?? 
      uri.queryParameters[kKeysItemId] ?? 
      arguments()?.itemId;
}
```

3. [[GPT Agent]] [[configure routing]]
   1. [[configure routing]]
      1. Create route in BaseRouter:
```dart
static GoRoute get myView => GoRoute(
  path: MyView.path.asRootPath,
  pageBuilder: (context, state) => CustomTransitionPage(
    child: MyView(
      arguments: MyViewArguments(
        requiredField: state.requiredField,
        optionalField: state.optionalField,
      ),
    ),
  ),
);
```
      2. Add to router's routes:
```dart
final coreRouter = GoRouter(
  routes: [
    // ... existing routes
    myView,
  ],
);
```

4. [[GPT Agent]] [[implement navigation]]
   1. [[implement navigation]]
      1. Create navigation method:
```dart
Future<void> pushMyView({
  required String requiredField,
  String? optionalField,
}) async =>
    push(
      location: MyView.path.asRootPath,
      extra: ViewArgumentsImpl(
        requiredField: requiredField,
        optionalField: optionalField,
      ),
    );
```

# ✅ Verification

1. [[GPT Agent]] [[verify argument handling]]
   1. [[verify argument handling]]
      1. Check required fields are non-nullable in view arguments
      2. Verify optional fields are nullable in ViewArgumentsImpl
      3. Confirm default values in state extension
      4. Test argument passing with different data types

2. [[GPT Agent]] [[verify routing]]
   1. [[verify routing]]
      1. Test URL parameter handling
      2. Verify route registration
      3. Check navigation methods
      4. Test argument preservation during navigation

3. [[GPT Agent]] [[verify naming]]
   1. [[verify naming]]
      1. View arguments class follows `[ViewName]Arguments` pattern
      2. Route getter follows `get [viewName]` pattern
      3. Path constant follows `path = '[view-name]'` pattern
      4. Navigation methods follow established naming conventions 
