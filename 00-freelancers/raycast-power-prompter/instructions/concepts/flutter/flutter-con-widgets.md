# Widgets

Widgets are reusable UI components that can be used across different views in the application.

## 1. File Naming and Location

-   **Location**: Widgets are typically located in a `widgets` directory within a feature folder (`lib/<feature>/widgets/`) or in a shared UI folder (`lib/uiux/widgets/`).
-   **Naming**:
    -   Files are named in `snake_case`.
    -   A common convention is to prefix custom, project-specific widgets with `t_` (e.g., `t_button.dart`, `t_scaffold.dart`). This distinguishes them from standard Flutter or third-party widgets.

**Examples:**
-   `lib/uiux/widgets/buttons/t_button.dart`
-   `lib/auth/widgets/logout_button.dart`

## 2. Structure and Conventions

-   **Base Class**: Most reusable widgets are `StatelessWidget`s. `StatefulWidget`s are only used when the widget needs to manage its own internal, ephemeral state, such as animations or temporary user input.
-   **Self-Contained**: Widgets should be self-contained and not depend on a specific `ViewModel`. They receive all necessary data and callbacks through their constructor parameters.
-   **Styling and Theming**:
    -   Widgets should use the project's centralized theme and sizing system for consistent styling. This is accessed via the `BuildContext` extension methods.
    -   **Colors**: `context.colors.primary`, `context.colors.background` (Note: `context.colors` uses properties like `icon`, `background`, `border`, etc., not `foreground`)
    -   **Text Styles**: `context.texts.h1`, `context.texts.p`
    -   **Sizing**: `TSizes.appPadding` (constants), `context.sizes.width` (responsive)
-   **UI Component Library**: 
    -   **ALWAYS** use `shadcn_ui` package widgets when available (e.g., `ShadButton`, `ShadCalendar`, `ShadPopover`, `ShadDatePicker`)
    -   When implementing date/time pickers, use `ShadDatePicker` or `ShadCalendar` with `ShadPopover` instead of Flutter's built-in `showDatePicker`
    -   Reference local packages at `flutter-packages` for package documentation when needed (these are symlinks to the local git repos - all important packages are included here - ask for any missing packages if needed)
-   **Localization**:
    -   Use `gStrings` for all user-facing text (e.g., `gStrings.today`, `gStrings.tomorrow`)
    -   Add new strings to ARB files (`lib/l10n/config/intl_en.arb` and `intl_nl.arb`)
    -   **NEVER** run build commands to generate localization files - the project has a plugin that generates them automatically
-   **Date Restrictions**: When implementing date selection for task planning, restrict selection to today and tomorrow only
-   **Customization**: Widgets are designed to be customizable through constructor parameters, allowing them to be adapted for different use cases.
    -   **Text Parameters**: Pass user-facing text (titles, button labels, etc.) as String parameters instead of hardcoding them in the widget
    -   **Spacing**: Use `TGap()` for standard spacing instead of `SizedBox(height: TSizes.appPadding)`
-   **Responsiveness**: Reusable widgets should be designed to work well on different screen sizes.
-   **Sheets and Dialogs**:
    -   When creating custom sheets, extend `ShadSheet` directly instead of returning it from `build()`
    -   Separate the sheet structure from its content by using a private content widget

## 3. Example

```dart
// lib/uiux/widgets/t_badge.dart

import 'package:{project_name}/uiux/extensions/color_extension.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TBadge extends StatelessWidget {
  const TBadge({
    super.key,
    this.text,
    this.iconData,
    required this.color,
    // ... other parameters
  });

  final String? text;
  final IconData? iconData;
  final Color color;
  // ...

  @override
  Widget build(BuildContext context) {
    // Using theme extensions for consistent styling
    final backgroundColor = color.badgeBackground();
    final foregroundColor = color.badgeForeground;
    final borderColor = color.badgeBorder();

    return ShadBadge(
      // ... implementation
    );
  }
}
```
