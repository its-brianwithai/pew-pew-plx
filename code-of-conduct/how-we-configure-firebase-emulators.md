---
document_type: code of conduct
goal: define process for configuring Firebase emulators in mono repo structure
gpt_action: follow these steps when setting up Firebase emulators for local development
---

# 🔍 Initial Setup

1. [[GPT Agent]] [[verify project structure]]
   1. [[verify project structure]]
      1. Check for mono repo structure
      2. Verify Firebase project location
      3. Verify Flutter project location
      4. Confirm scripts directory exists

2. [[GPT Agent]] [[confirm requirements]]
   1. [[confirm requirements]]
      1. Check Firebase CLI installation
      2. Verify Node.js installation
      3. Check Flutter SDK installation
      4. Confirm port availability

# 🛠️ Configuration

1. [[GPT Agent]] [[setup project structure]]
   1. [[setup project structure]]
      1. Create Firebase project structure:
```
project_mono/
  ├── project_firebase/        # Firebase project
  │   ├── firebase.json            # Firebase configuration
  │   ├── firestore.rules          # Firestore security rules
  │   ├── storage.rules            # Storage security rules
  │   ├── functions/               # Cloud Functions
  │   └── scripts/                 # Emulator scripts
  │       ├── run_emulators.sh
  │       └── export_emulators_firebase_data.sh
  │
  └── project_flutter/        # Flutter project
      ├── lib/
      │   └── core/
      │       ├── config/
      │       │   └── emulator_config.dart
      │       └── utils/
      │           ├── app_setup.dart
      │           └── environment.dart
      └── scripts/
          └── run_emulators.sh
```

2. [[GPT Agent]] [[configure firebase]]
   1. [[configure firebase]]
      1. Set up emulator ports in `firebase.json`:
```json
{
  "functions": [
    {
      "source": "functions",
      "codebase": "default",
      "ignore": [
        "node_modules",
        ".git",
        "firebase-debug.log",
        "firebase-debug.*.log"
      ],
      "predeploy": [
        "npm --prefix \"$RESOURCE_DIR\" run lint",
        "npm --prefix \"$RESOURCE_DIR\" run build"
      ]
    }
  ],
  "firestore": {
    "rules": "firestore.rules"
  },
  "storage": {
    "rules": "storage.rules"
  },
  "emulators": {
    "auth": {
      "port": 9099
    },
    "functions": {
      "port": 5001
    },
    "firestore": {
      "port": 8080
    },
    "storage": {
      "port": 9199
    },
    "ui": {
      "enabled": true,
      "port": 4000
    }
  }
}
```

3. [[GPT Agent]] [[create scripts]]
   1. [[create scripts]]
      1. Create Firebase emulator script:
```bash
#!/bin/bash

# Kill any running firebase emulators
echo "Killing any running firebase emulators..."
lsof -t -i:9099 -i:5001 -i:8080 -i:9199 -i:4000 | while read -r pid; do
    if ps -p $pid -o command | grep -q "firebase"; then
        kill -9 $pid 2>/dev/null || true
    fi
done

# Navigate to functions directory and do a clean build
cd ../functions || exit
rm -rf lib/
npm run build

cd ../ || exit

if [ -d "exports/firestore_export" ] || [ -f "exports/auth_export.json" ]; then
    echo "Starting emulators with data import..."
    firebase emulators:start --import=exports
else
    echo "No exports found, starting clean emulators..."
    firebase emulators:start
fi
```
      2. Create data export script:
```bash
#!/bin/bash

cd ../ || exit

echo "Exporting emulator data..."
firebase emulators:export exports
```
      3. Create Flutter emulator script:
```bash
#!/bin/bash

# Navigate to firebase scripts directory and run emulators
cd ../../project_firebase/scripts && ./run_emulators.sh
```

4. [[GPT Agent]] [[implement flutter config]]
   1. [[implement flutter config]]
      1. Create environment configuration:
```dart
abstract class Environment {
  static String? currentVersion;

  static const String _emulators = 'emulators';
  static const String _dev = 'dev';
  static const String _prod = 'prod';

  static const argumentKey = 'env';

  static EnvironmentType get current {
    switch (const String.fromEnvironment(
      Environment.argumentKey,
      defaultValue: _prod,
    )) {
      case _emulators:
        return EnvironmentType.emulators;
      case _dev:
        return EnvironmentType.dev;
      case _prod:
      default:
        return EnvironmentType.prod;
    }
  }

  static bool get isEmulators => current == EnvironmentType.emulators;
  static bool get isDev => current == EnvironmentType.dev;
  static bool get isProd => current == EnvironmentType.prod;
}

enum EnvironmentType {
  emulators,
  dev,
  prod;
}
```
      2. Create emulator configuration:
```dart
class EmulatorConfig {
  static const _localhost = 'localhost';
  static const _host = '127.0.0.1';

  static const _portAuth = 9099;
  static const _portFirestore = 8080;
  static const _portFunctions = 5001;
  static const _portStorage = 9199;

  static void configureEmulators() {
    if (kDebugMode && Environment.isEmulators) {
      final host = kIsWeb ? _localhost : _host;
      log.debug('Configuring Firebase emulators on $host');

      FirebaseAuth.instance.useAuthEmulator(host, _portAuth);
      FirebaseFirestore.instance.useFirestoreEmulator(host, _portFirestore);
      FirebaseFunctions.instance.useFunctionsEmulator(host, _portFunctions);
      FirebaseStorage.instance.useStorageEmulator(host, _portStorage);

      log.debug('Firebase emulators configured successfully');
    }
  }
}
```

# ✅ Verification

1. [[GPT Agent]] [[verify setup]]
   1. [[verify setup]]
      1. Make scripts executable:
```bash
chmod +x scripts/run_emulators.sh
cd ../../project_firebase/scripts
chmod +x run_emulators.sh
chmod +x export_emulators_firebase_data.sh
```
      2. Start emulators:
```bash
cd project_mono/project_flutter/scripts
./run_emulators.sh
```
      3. Run Flutter app:
```bash
flutter run --dart-define=env=emulators
```

2. [[GPT Agent]] [[confirm functionality]]
   1. [[confirm functionality]]
      1. Verify emulator startup logs
      2. Check emulator UI at localhost:4000
      3. Confirm Firebase services connect to emulators
      4. Test basic operations in emulator environment
      5. Verify data persistence with export/import
