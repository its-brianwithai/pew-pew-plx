# Crash Reporting and Analytics Pattern

## Overview
This pattern defines how crash reporting and analytics should be implemented when enabled in the Float Note project.

## Current Status
Analytics and crash reporting are **disabled** but dependencies remain:
- `posthog_flutter: ^5.0.0` (commented out in main.dart)
- `sentry_flutter: ^9.4.0` (commented out in main.dart)
- `loglytics: ^0.16.1` (active for logging only)

## Pattern Structure

### 1. Error Catching Foundation
```dart
// Global error handling in main.dart
runZonedGuarded(
  () async {
    // App initialization
    runApp(...);
  },
  (error, stack) {
    Log(location: 'Zoned').error(
      'Unhandled exception caught: ${error.toString()}',
      error: error,
      stackTrace: stack,
    );
  },
);
```

### 2. Service Integration Pattern
When re-enabling analytics:

```dart
// Initialize PostHog
final config = PostHogConfig('YOUR_KEY');
config.debug = kDebugMode;
config.captureApplicationLifecycleEvents = true;
config.host = 'https://eu.i.posthog.com';

// Wrap in Sentry
await SentryFlutter.init(
  (options) {
    options.dsn = 'YOUR_DSN';
    options.sendDefaultPii = true;
    options.tracesSampleRate = 1.0;
  },
  appRunner: () async {
    await Posthog().setup(config);
    // Run app
  },
);
```

### 3. Loglytics Abstraction Pattern
```dart
Loglytics.setUp(
  crashReportsInterface: CrashReportsImplementation(),
  analyticsInterface: AnalyticsImplementation(),
  analytics: (analyticsFactory) {
    // Register feature analytics
  },
  logLevel: kDebugMode ? LogLevel.trace : LogLevel.info,
);
```

### 4. Error Reporting Pattern
Always use Loglytics for error reporting:

```dart
class MyService with Loglytics {
  Future<void> riskyOperation() async {
    try {
      // Operation
    } catch (e, s) {
      log.error(
        'Operation failed',
        error: e,
        stackTrace: s,
      );
      rethrow;
    }
  }
}
```

### 5. Analytics Event Pattern
When implemented, analytics follow:
- **Subject**: What entity (task, float, auth)
- **Action**: What happened (created, deleted, tapped)
- **Parameters**: Context data

```dart
class TaskAnalytics extends TAnalytics {
  void taskCompleted({required String taskId}) {
    service.completed(
      subject: subjects.task,
      parameters: parameters(id: taskId),
    );
  }
}
```

## Integration Points
- Supabase auth events sync with analytics when enabled
- User identification flows through all services
- Error context includes user properties

## Re-enabling Checklist
1. Create missing TAnalytics infrastructure
2. Uncomment initialization code
3. Add environment-specific API keys
4. Register feature analytics classes
5. Add analytics calls to ViewModels
6. Test in development first