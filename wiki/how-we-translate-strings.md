---
document_type: wiki
goal: define process for managing multilingual string translations
gpt_action: follow these steps when adding or modifying translations
---

# 🔍 Initial Research

1. [[GPT Agent]] [[verify translation needs]]
   1. [[verify translation needs]]
      1. Check if string exists in English (en)
      2. Check if string exists in Dutch (nl)
      3. Review string usage context
      4. Identify dynamic content needs

2. [[GPT Agent]] [[confirm file locations]]
   1. [[confirm file locations]]
      1. English file at `lib/core/strings/intl_en.arb`
      2. Dutch file at `lib/core/strings/intl_nl.arb`
      3. Verify file structure matches
      4. Check key ordering consistency

# 🛠️ Implementation

1. [[GPT Agent]] [[add translation keys]]
   1. [[add translation keys]]
      1. Use descriptive camelCase names:
```json
{
  "welcomeUser": "Welcome message here",
  "itemCreated": "Creation message here",
  "itemUpdated": "Update message here"
}
```

2. [[GPT Agent]] [[implement translations]]
   1. [[implement translations]]
      1. Add English translations first:
```json
// English (intl_en.arb)
{
  "welcomeUser": "👋 Welcome, {username}!",
  "itemCreated": "Item created",
  "itemUpdated": "Item updated",
  "itemDeleted": "Item deleted",
  "status": {
    "active": "Active",
    "inactive": "Inactive",
    "pending": "Pending"
  }
}
```
      2. Add Dutch translations:
```json
// Dutch (intl_nl.arb)
{
  "welcomeUser": "👋 Welkom, {username}!",
  "itemCreated": "Item aangemaakt",
  "itemUpdated": "Item bijgewerkt",
  "itemDeleted": "Item verwijderd",
  "status": {
    "active": "Actief",
    "inactive": "Inactief",
    "pending": "In afwachting"
  }
}
```

3. [[GPT Agent]] [[handle dynamic content]]
   1. [[handle dynamic content]]
      1. Use placeholders with descriptive names:
```json
{
  "welcomeUser": "👋 Welcome, {username}!",
  "itemCount": "You have {count} items",
  "lastUpdated": "Last updated on {date}"
}
```

4. [[GPT Agent]] [[implement in code]]
   1. [[implement in code]]
      1. Access translations through gStrings:
```dart
Text(gStrings.welcomeUser(username: user.name)),
Text(gStrings.itemCount(count: items.length)),
Text(gStrings.lastUpdated(date: formatDate(item.updatedAt))),
```

# ✅ Verification

1. [[GPT Agent]] [[verify translations]]
   1. [[verify translations]]
      1. All keys present in both files
      2. Natural language used (not literal)
      3. Cultural context considered
      4. Consistent key ordering

2. [[GPT Agent]] [[verify placeholders]]
   1. [[verify placeholders]]
      1. All variables properly named
      2. Placeholders match in both files
      3. Variables used correctly in code
      4. Format strings work as expected

3. [[GPT Agent]] [[verify implementation]]
   1. [[verify implementation]]
      1. Translations accessible via gStrings
      2. No missing translations
      3. No runtime errors
      4. Proper fallback behavior
