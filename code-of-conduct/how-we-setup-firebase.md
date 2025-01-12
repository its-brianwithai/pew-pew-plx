---
document_type: code of conduct
goal: define process for setting up Firebase in mono repo projects
gpt_action: follow these steps when setting up Firebase for Flutter applications
---

# 🔍 Initial Research

1. [[GPT Agent]] [[verify requirements]]
   1. [[verify requirements]]
      1. Check required Firebase services
      2. Verify target platforms
      3. Review development environment needs
      4. Confirm mono repo structure:
```
project_mono/
  ├── project_firebase/
  └── project_flutter/
```

2. [[GPT Agent]] [[confirm setup details]]
   1. [[confirm setup details]]
      1. Verify Firebase CLI requirements
      2. Check FlutterFire CLI needs
      3. Review emulator requirements
      4. Confirm environment switching needs

# 🛠️ Implementation

1. [[GPT Agent]] [[install prerequisites]]
   1. [[install prerequisites]]
      1. Install required CLIs:
```bash
# Install Firebase CLI
npm install -g firebase-tools

# Install FlutterFire CLI
dart pub global activate flutterfire_cli

# Log in to Firebase
firebase login
```

2. [[GPT Agent]] [[setup firebase project]]
   1. [[setup firebase project]]
      1. Create project in Firebase Console
      2. Initialize Firebase:
```bash
# Navigate to Firebase directory
cd your_project_firebase

# Initialize Firebase
firebase init

# Select required features:
# - Firestore
# - Authentication
# - Storage
# - Emulators
```

3. [[GPT Agent]] [[configure flutter]]
   1. [[configure flutter]]
      1. Run FlutterFire configuration:
```bash
# Navigate to Flutter directory
cd your_project_flutter

# Run FlutterFire configure
flutterfire configure --project=your-firebase-project
```
      2. Add environment configuration:
```dart
enum Environment {
  production,
  emulators;

  static Environment get current => 
    const String.fromEnvironment('env') == 'emulators' 
      ? Environment.emulators 
      : Environment.production;
}
```
      3. Initialize Firebase in app:
```dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  if (Environment.isEmulators) {
    await connectToEmulators();
  }
  
  runApp(const MyApp());
}
```

4. [[GPT Agent]] [[test setup]]
   1. [[test setup]]
      1. Run with emulators:
```bash
flutter run --dart-define=env=emulators
```
      2. Verify Firebase connection in logs

# ✅ Verification

1. [[GPT Agent]] [[verify installation]]
   1. [[verify installation]]
      1. Firebase CLI installed and logged in
      2. FlutterFire CLI installed
      3. Project created in Firebase Console
      4. Firebase initialized in project

2. [[GPT Agent]] [[verify configuration]]
   1. [[verify configuration]]
      1. FlutterFire configured in Flutter app
      2. Environment configuration set up
      3. Firebase initialization working
      4. App connects to Firebase services

3. [[GPT Agent]] [[verify emulators]]
   1. [[verify emulators]]
      1. Emulator configuration working
      2. App connects to emulators
      3. Services accessible in emulator mode
      4. Environment switching works 
