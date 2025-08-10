---
name: maestro-flutter-instructions
description: "Instructions for testing Flutter applications with Maestro, including semantics handling, widget interaction, and best practices."
---

# 🎯 Maestro Flutter Testing Instructions
> 💡 *Comprehensive guide for testing Flutter applications with Maestro's first-class Flutter support.*

## Flutter Widget Interaction

### Semantics-Based Testing

Maestro interacts with Flutter widgets through their semantics information. By default, this includes all widgets that display text (`Text` widget data, `TextField` hintText, etc.).

#### Basic Text Interaction
```yaml
# Tap on a Text widget
- tapOn: Open Browser

# Enter text in a TextField
- tapOn: Enter your username
- inputText: charlie_root

# Assert text visibility
- assertVisible: Welcome back, dear Test User!
```

#### Adding Semantics to Widgets

For widgets without implicit semantics (like `Icon`), add semantics explicitly:

```dart
// Using semanticLabel on Icon
FloatingActionButton(
  onPressed: _incrementCounter,
  child: Icon(Icons.add, semanticLabel: 'fabAddIcon'),
)
```

```yaml
- tapOn: fabAddIcon
```

#### Wrapping with Semantics Widget

```dart
Semantics(
  label: 'funky yellow box',
  child: Container(
    color: Colors.yellow,
    width: 100,
    height: 100,
  ),
)
```

```yaml
- tapOn: funky yellow box
```

### Semantic Identifiers (Flutter 3.19+)

For better test maintainability, use semantic identifiers instead of labels:

```dart
Semantics(
  identifier: 'signin_button',
  child: ElevatedButton(
    onPressed: _signIn,
    child: Text('Sign in'),
  ),
)
```

```yaml
- tapOn:
    id: signin_button
```

### Best Practices

#### Enforcing Accessibility Identifiers

Create custom widgets that require identifiers:

```dart
class FancyButton extends StatelessWidget {
  FancyButton({
    super.key,
    required this.identifier,
    required this.onPressed,
  });

  final String identifier;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      identifier: identifier,
      child: RawMaterialButton(
        onPressed: onPressed,
        // ...
      ),
    );
  }
}
```

Usage:
```dart
FancyButton(
  identifier: 'buy_premium',
  onPressed: _buyPremium,  
)
```

#### Lint Rules for Consistency

Use lint rules to enforce custom widget usage:

```yaml
# analysis_options.yaml
include: package:leancode_lint/analysis_options.yaml

custom_lint:
  rules:
    - use_design_system_item:
      FancyButton:
        - instead_of: ElevatedButton
          from_package: flutter
          
analyzer:
  plugins:
    - custom_lint
```

## Flutter-Specific Considerations

### Priority Order
1. When both `semanticLabel` and text are provided, `semanticLabel` takes precedence
2. Use `maestro studio` to identify which labels Maestro can see
3. Prefer semantic identifiers over labels for multi-language apps

### Flutter Keys vs Semantics

**Important:** Flutter widget keys cannot be used in Maestro as they're not exposed through the accessibility bridge. Always use Semantics instead.

Workaround if you really want to use keys:

```dart
class FancyButton extends StatelessWidget {
  FancyButton({
    required String key,
    required this.onPressed,
  })  : _key = key,
        super(key: ValueKey(key));

  final String _key;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      identifier: _key,
      child: RawMaterialButton(
        onPressed: onPressed,
        // ...
      ),
    );
  }
}
```

## Platform Support

- ✅ **Mobile Flutter Apps**: Full support for both pure and hybrid (add-to-app) Flutter apps
- ✅ **Flutter Web**: Works exactly like regular web testing
- ❌ **Flutter Desktop**: Not yet supported

## GitHub Actions Integration

### Android Build and Test

```yaml
name: Build and run Maestro tests (Flutter Android)

on:
  workflow_dispatch:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  upload:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
        with:
          channel: "stable"
      - run: flutter build apk --debug
      - uses: mobile-dev-inc/action-maestro-cloud@v1
        with:
          api-key: ${{ secrets.MAESTRO_CLOUD_API_KEY }}
          project-id: ${{ secrets.MAESTRO_PROJECT_ID }}
          app-file: build/app/outputs/flutter-apk/app-debug.apk
```

### iOS Build and Test

```yaml
name: Build and run Maestro tests (Flutter iOS)

on:
  workflow_dispatch:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  ios:
    runs-on: macos-13
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
        with:
          channel: "stable"
      - run: flutter build ios --debug --simulator
      - uses: mobile-dev-inc/action-maestro-cloud@v1
        with:
          api-key: ${{ secrets.MAESTRO_CLOUD_API_KEY }}
          project-id: ${{ secrets.MAESTRO_PROJECT_ID }}
          app-file: build/ios/iphonesimulator/Runner.app # replace `Runner` with your app name
```

## Tips for Flutter Testing

1. **Always use semantics** - Make your app accessible for all users, not just tests
2. **Prefer identifiers over labels** - Better for internationalization and A/B testing
3. **Use maestro studio** - Essential for identifying available selectors
4. **Test on both platforms** - Flutter behavior can differ between iOS and Android
5. **Keep tests atomic** - Each test should be independent and focused on a single scenario