---
name: localization-pattern
description: "The architectural pattern for implementing localization and internationalization (i18n) in this Flutter project using ARB files and code generation."
---
# 🌍 Localization Pattern

This pattern describes how localization is architecturally implemented in this project using Flutter's internationalization approach with ARB files and code generation.

## Pattern Overview

Our localization architecture follows these key principles:
- **ARB Files**: Source of truth for all translations (`lib/l10n/intl_en.arb`, `lib/l10n/intl_nl.arb`)
- **Code Generation**: The `intl_utils` package generates type-safe Dart classes from ARB files
- **Global Accessor**: A simple global getter `gStrings` provides context-free access to localized strings
- **Language Service**: The `LanguageService` manages language state and switching

## ARB File Structure

Each entry in an `.arb` file consists of a key-value pair:

```json
{
  "@@locale": "en",
  "welcome": "Welcome",
  "helloUsername": "Hello @{username}",
  "@helloUsername": {
    "placeholders": {
      "username": {
        "type": "Object"
      }
    }
  }
}
```

Keys become getters in the generated `S` class, placeholders become method parameters.

## Global String Access Pattern

**File:** `lib/l10n/globals/g_strings.dart`

```dart
import 'package:float_note/l10n/strings/gen/l10n.dart';

/// Returns the current instance of [S] for localization.
S get gStrings => S.current;
```

This enables context-free string access anywhere in the application.

## Language Loading Flow

1. App starts → `MyAppViewModel` calls `_setupStrings()`
2. `_setupStrings()` calls `S.load()` with locale from `LanguageService`
3. `LanguageService` retrieves saved language from `LocalStorageService` (defaults to `en`)
4. Strings are loaded and available via `gStrings`

## Language Switching Flow

1. User selects language → calls `LanguageService.updateLanguage()`
2. `LanguageService` saves choice to local storage
3. Updates `ValueListenable<TSupportedLanguage>` triggering listeners
4. `MyAppView` rebuilds `ShadApp.router` with new locale
5. Widget tree rebuilds with new locale, `gStrings` provides updated strings

## Generated Files

Running `flutter pub run intl_utils:generate` creates:
- `lib/l10n/strings/gen/l10n.dart`: Contains the `S` class delegate
- `lib/l10n/strings/gen/intl/messages_*.dart`: Message lookups for each language