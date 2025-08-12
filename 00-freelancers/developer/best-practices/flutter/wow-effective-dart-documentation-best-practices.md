# Dart Documentation Best Practices

This guide outlines Dart's recommended practices for writing effective documentation. Following these guidelines will help you create clear, concise, and consistent documentation for your Dart code.

## Table of Contents

1. [Comments](#comments)
2. [Doc Comments](#doc-comments)
3. [Markdown](#markdown)
4. [Writing Style](#writing-style)

## Comments

These tips apply to regular comments that won't be included in generated documentation.

### DO format comments like sentences

```dart
// Not if anything comes before it.
if (_chunks.isNotEmpty) return false;
```

Capitalize the first word unless it's a case-sensitive identifier. End comments with a period. This applies to all comments: doc comments, inline comments, and TODOs.

### DON'T use block comments for documentation

```dart
// GOOD
void greet(String name) {
  // Assume we have a valid name.
  print('Hi, $name!');
}

// BAD
void greet(String name) {
  /* Assume we have a valid name. */
  print('Hi, $name!');
}
```

Use block comments (`/* ... */`) only to temporarily comment out code. For all other comments, use `//`.

## Doc Comments

Doc comments are parsed by `dart doc` to generate API documentation. They use the special `///` syntax.

### DO use `///` doc comments to document members and types

```dart
/// The number of characters in this chunk when unsplit.
int get length => ...
```

Using proper doc comments enables `dart doc` to find and generate documentation for your API.

### PREFER writing doc comments for public APIs

You don't need to document every single library, variable, type, and member, but you should document most public APIs.

### CONSIDER writing a library-level doc comment

A library doc comment should introduce the reader to the main concepts and functionality. It can include:
- A single-sentence summary
- Explanations of terminology
- Code samples
- Links to important classes and functions
- Links to external references

Place a doc comment before the `library` directive:

```dart
/// A really great test library.
@TestOn('browser')
library;
```

### CONSIDER writing doc comments for private APIs

Doc comments can also be helpful for understanding private members that are called from other parts of the library.

### DO start doc comments with a single-sentence summary

```dart
/// Deletes the file at [path] from the file system.
void delete(String path) {
  ...
}
```

Start with a brief, user-centric description that provides just enough context for the reader.

### DO separate the first sentence of a doc comment into its own paragraph

```dart
/// Deletes the file at [path].
///
/// Throws an [IOError] if the file could not be found. Throws a
/// [PermissionError] if the file is present but could not be deleted.
void delete(String path) {
  ...
}
```

Add a blank line after the first sentence to split it into its own paragraph. This helps you write a concise summary and allows tools like `dart doc` to use it in summaries.

### AVOID redundancy with the surrounding context

```dart
// GOOD
class RadioButtonWidget extends Widget {
  /// Sets the tooltip to [lines], which should have been word wrapped using
  /// the current font.
  void tooltip(List<String> lines) {
    ...
  }
}

// BAD
class RadioButtonWidget extends Widget {
  /// Sets the tooltip for this radio button widget to the list of strings in
  /// [lines].
  void tooltip(List<String> lines) {
    ...
  }
}
```

Focus on explaining what readers don't already know from the declaration itself.

### PREFER starting function or method comments with third-person verbs

```dart
/// Returns `true` if every element satisfies the [predicate].
bool all(bool predicate(T element)) => ...

/// Starts the stopwatch if not already running.
void start() {
  ...
}
```

Focus on what the code does.

### PREFER starting a non-boolean variable or property comment with a noun phrase

```dart
/// The current day of the week, where `0` is Sunday.
int weekday;

/// The number of checked buttons on the page.
int get checkedCount => ...
```

Stress what the property is, even for getters that may do calculation.

### PREFER starting a boolean variable or property comment with "Whether" followed by a noun or gerund phrase

```dart
/// Whether the modal is currently displayed to the user.
bool isVisible;

/// Whether the modal should confirm the user's intent on navigation.
bool get shouldConfirm => ...

/// Whether resizing the current browser window will also resize the modal.
bool get canResize => ...
```

Clarify the states this variable represents.

### DON'T write documentation for both the getter and setter of a property

```dart
/// The pH level of the water in the pool.
///
/// Ranges from 0-14, representing acidic to basic, with 7 being neutral.
int get phLevel => ...
set phLevel(int level) => ...
```

If a property has both getter and setter, create a doc comment for only one of them. `dart doc` treats them as a single field and discards the setter's doc comment.

### PREFER starting library or type comments with noun phrases

```dart
/// A chunk of non-breaking output text terminated by a hard or soft newline.
///
/// ...
class Chunk {
   ...
}
```

Doc comments for classes establish terminology and provide context for member documentation.

### CONSIDER including code samples in doc comments

```dart
/// Returns the lesser of two numbers.
///
/// ```dart
/// min(5, 3) == 3
/// ```
num min(num a, num b) => ...
```

Even a single code sample makes an API easier to learn.

### DO use square brackets in doc comments to refer to in-scope identifiers

```dart
/// Throws a [StateError] if ...
/// similar to [anotherMethod()], but ...
```

When you surround identifiers in square brackets, `dart doc` links to the relevant API docs. Parentheses are optional but can clarify when you're referring to a method or constructor.

To link to a member of a specific class:

```dart
/// Similar to [Duration.inDays], but handles fractional days.
```

For named constructors or the unnamed constructor:

```dart
/// To create a point, call [Point.new] or use [Point.polar] to ...
```

### DO use prose to explain parameters, return values, and exceptions

```dart
// GOOD
/// Defines a flag.
///
/// Throws an [ArgumentError] if there is already an option named [name] or
/// there is already an option using abbreviation [abbr]. Returns the new flag.
Flag addFlag(String name, String abbr) => ...

// BAD
/// Defines a flag with the given name and abbreviation.
///
/// @param name The name of the flag.
/// @param abbr The abbreviation for the flag.
/// @returns The new flag.
/// @throws ArgumentError If there is already an option with
///     the given name or abbreviation.
Flag addFlag(String name, String abbr) => ...
```

Integrate parameter and return descriptions into the text, highlighting parameters with square brackets.

### DO put doc comments before metadata annotations

```dart
// GOOD
/// A button that can be flipped on and off.
@Component(selector: 'toggle')
class ToggleComponent {}

// BAD
@Component(selector: 'toggle')
/// A button that can be flipped on and off.
class ToggleComponent {}
```

## Markdown

Dart documentation supports most Markdown formatting.

### AVOID using markdown excessively

When in doubt, format less. Let your content shine through.

### AVOID using HTML for formatting

Use HTML only in rare cases for things like tables. If it's too complex to express in Markdown, you're probably better off simplifying it.

### PREFER backtick fences for code blocks

```dart
/// You can use [CodeBlockExample] like this:
///
/// ```dart
/// var example = CodeBlockExample();
/// print(example.isItGreat); // "Yes."
/// ```
```

Backtick fences avoid indentation issues, allow you to indicate the code's language, and are consistent with using backticks for inline code.

## Writing Style

### PREFER brevity

Be clear and precise, but also terse.

### AVOID abbreviations and acronyms unless they are obvious

Many people don't know what "i.e.", "e.g.", and "et al." mean. Be mindful that acronyms familiar to you may not be widely known.

### PREFER using "this" instead of "the" to refer to a member's instance

```dart
class Box {
  /// The value this wraps.
  Object? _value;

  /// True if this box contains a value.
  bool get hasValue => _value != null;
}
```

When documenting a member, using "this" instead of "the" is clearer when referring to the object the member is being called on.

## Summary

Following these documentation best practices will make your Dart code more accessible, easier to understand, and more maintainable. The effort you put into writing good documentation today will benefit your future self and other developers working with your code. 