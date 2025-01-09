---
document_type: wiki
goal: define process for organizing and using constants and globals
gpt_action: follow these patterns when working with constants and globals
---

# 🔍 Initial Research

1. [[GPT Agent]] [[verify constant type]]
   1. [[verify constant type]]
      1. Check if app-wide constant
      2. Check if feature-specific constant
      3. Review usage scope
      4. Identify constant category

2. [[GPT Agent]] [[confirm location]]
   1. [[confirm location]]
      1. Core constants in `/lib/core/constants/`
      2. Feature constants in `/features/*/constants/`
      3. Verify file category
      4. Check naming convention

# 🛠️ Implementation

1. [[GPT Agent]] [[implement key constants]]
   1. [[implement key constants]]
      1. Use k_keys.dart for string keys:
```dart
// Bad
map['parentId'] = value;

// Good
map[kKeysParentId] = value;
```

2. [[GPT Agent]] [[implement value constants]]
   1. [[implement value constants]]
      1. Use k_values.dart for default values:
```dart
// Bad
final defaultDuration = 60;

// Good
final defaultDuration = kValuesDefaultDurationInMinutes;
```

3. [[GPT Agent]] [[implement asset constants]]
   1. [[implement asset constants]]
      1. Organize by asset type:
```dart
// k_svgs.dart
final kSvgLogo = 'assets/svgs/logo.svg';

// k_pngs.dart
final kPngBackground = 'assets/images/background.png';

// k_lottie.dart
final kLottieSuccess = 'assets/lottie/success.json';

// k_mds.dart
final kMdChangelog = 'assets/markdown/changelog.md';
```

4. [[GPT Agent]] [[implement globals]]
   1. [[implement globals]]
      1. Core globals implementation:
```dart
// g_strings.dart
Text(gStrings.hello);

// g_print.dart
log.debug('Debug info');

// g_feedback.dart
gFeedback.showSnackBar(...);

// g_settings.dart
TimeFormat get gTimeFormat => SettingsService.locate.timeFormat;
DateFormat get gDateFormat => SettingsService.locate.dateFormat;
```

5. [[GPT Agent]] [[organize file structure]]
   1. [[organize file structure]]
      1. Follow standard structure:
```
lib/
├── core/
│   ├── constants/
│   │   ├── k_keys.dart      # Map/JSON keys
│   │   ├── k_values.dart    # Default values
│   │   ├── k_sizes.dart     # UI sizes
│   │   ├── k_colors.dart    # Colors
│   │   ├── k_svgs.dart      # SVG assets
│   │   └── k_lottie.dart    # Lottie animations
│   └── globals/
│       ├── g_strings.dart   # Localization
│       ├── g_print.dart     # Logging
│       └── g_feedback.dart  # User feedback
└── features/
    └── feature_name/
        ├── constants/
        │   └── k_feature_specific.dart
        └── globals/
            └── g_feature_specific.dart
```

# ✅ Verification

1. [[GPT Agent]] [[verify naming]]
   1. [[verify naming]]
      1. Constants use `k` prefix
      2. Globals use `g` prefix
      3. Names are descriptive
      4. Categories are clear

2. [[GPT Agent]] [[verify organization]]
   1. [[verify organization]]
      1. Files in correct locations
      2. Constants properly categorized
      3. Feature-specific items in feature folders
      4. Shared items in core

3. [[GPT Agent]] [[verify best practices]]
   1. [[verify best practices]]
      1. No magic values used
      2. Constants used consistently
      3. Documentation clear
      4. Feature organization correct 
