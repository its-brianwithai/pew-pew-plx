---
document_type: code of conduct
goal: define process for testing file operations using IOOverrides
gpt_action: follow these steps when testing code that uses Directory.current
---

# 🔍 Initial Research

1. [[GPT Agent]] [[analyze testing challenges]]
   1. [[analyze testing challenges]]
      1. Tests might interact with real project files
      2. File paths tied to actual working directory
      3. Hard to isolate test file operations
      4. Risk of polluting project directory

2. [[GPT Agent]] [[confirm solution approach]]
   1. [[confirm solution approach]]
      1. Use Dart's IOOverrides to control Directory.current
      2. Intercept file and directory operations
      3. Redirect to test directory
      4. Keep production code unchanged

# 🛠️ Implementation

1. [[GPT Agent]] [[create test override]]
   1. [[create test override]]
      1. Implement IOOverrides class:
```dart
class _TestIOOverrides extends IOOverrides {
  final Directory _testDir;
  _TestIOOverrides(this._testDir);

  @override
  Directory getCurrentDirectory() => _testDir;
}
```

2. [[GPT Agent]] [[setup test environment]]
   1. [[setup test environment]]
      1. Create test directory and override:
```dart
setUp(() async {
  // Create fresh test directory
  tempDir = await Directory.systemTemp.createTemp('test_workspace');
  
  // Set up test files
  await sourceDir.create(recursive: true);
  await File(...).writeAsString(...);
  
  // Override Directory.current
  IOOverrides.global = _TestIOOverrides(tempDir);
});
```

3. [[GPT Agent]] [[implement cleanup]]
   1. [[implement cleanup]]
      1. Clean up after tests:
```dart
tearDown(() async {
  // Remove override
  IOOverrides.global = null;
  
  // Clean up test directory
  await tempDir.delete(recursive: true);
});
```

# ✅ Verification

1. [[GPT Agent]] [[verify test isolation]]
   1. [[verify test isolation]]
      1. Tests use temporary directories
      2. No interaction with real project files
      3. File operations properly intercepted
      4. Production code remains unchanged

2. [[GPT Agent]] [[verify cleanup process]]
   1. [[verify cleanup process]]
      1. Overrides removed after each test
      2. Test directories cleaned up
      3. No leftover test files
      4. System state restored

3. [[GPT Agent]] [[verify best practices]]
   1. [[verify best practices]]
      1. Always use temporary directories
      2. Clean up after each test
      3. Remove overrides in tearDown
      4. Keep production code using Directory.current
      5. Don't modify implementation for testing 
