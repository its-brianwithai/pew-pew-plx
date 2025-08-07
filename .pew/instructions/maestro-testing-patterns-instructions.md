---
name: maestro-testing-patterns-instructions
description: "Best practices and patterns for organizing and writing effective Maestro test suites."
---

# 🎯 Maestro Testing Patterns & Best Practices
> 💡 *Proven patterns and strategies for building maintainable, scalable Maestro test suites.*

## Test Organization

### Flow Structure Principles

**A Flow should test a single user scenario**

Avoid creating monolithic flows that test your entire app. Instead:
- Break down flows by user intent ("Search for item", "Complete purchase")
- Each flow should be independently runnable
- Flows should not depend on state from other flows

### Directory Structure

#### Feature-Based Organization
```
.maestro/
├── auth/
│   ├── login.yaml
│   ├── logout.yaml
│   └── registration.yaml
├── checkout/
│   ├── checkout-credit-card.yaml
│   ├── checkout-paypal.yaml
│   └── checkout-validation.yaml
├── search/
│   ├── search-basic.yaml
│   ├── search-filters.yaml
│   └── search-history.yaml
├── common/
│   ├── login-helper.yaml
│   └── navigation-utils.yaml
└── config.yaml
```

#### Journey-Based Organization
```
.maestro/
├── new-users/
│   ├── onboarding.yaml
│   ├── first-purchase.yaml
│   └── tutorial.yaml
├── existing-users/
│   ├── quick-reorder.yaml
│   ├── account-settings.yaml
│   └── loyalty-rewards.yaml
└── utils/
    └── test-data.js
```

### Configuration Management

#### Workspace Configuration (config.yaml)
```yaml
# Include specific directories
flows:
  - "auth/*"
  - "checkout/*"
  - "search/*"

# Or use recursive patterns
flows:
  - "**"  # Include all flows recursively

# Exclude utility flows
excludeTags:
  - util
  - helper

# Platform-specific settings
platform:
  ios:
    disableAnimations: true
  android:
    disableAnimations: true
```

## Flow Tags Strategy

### Using Tags for Test Execution

```yaml
# flow.yaml
appId: com.example.app
tags:
  - smoke
  - regression
  - critical
---
- launchApp
# ... test steps
```

### Tag-Based Execution

```bash
# Run smoke tests only
maestro test --include-tags smoke .maestro/

# Run all except slow tests
maestro test --exclude-tags slow .maestro/

# Combine tags
maestro test --include-tags critical --exclude-tags flaky .maestro/
```

### Global Tags Configuration

```yaml
# config.yaml
includeTags:
  - regression
excludeTags:
  - experimental
```

## Test Execution Patterns

### Sequential Execution

```yaml
# config.yaml
executionOrder:
  continueOnFailure: false
  flowsOrder:
    - setup-test-data
    - login
    - main-test-flow
    - cleanup
```

### Parallel Execution (Sharding)

```bash
# Run same tests on 3 devices
maestro test --shard-all 3 .maestro/

# Split tests across 3 devices
maestro test --shard-split 3 .maestro/
```

## Reusable Components

### Helper Flows

```yaml
# common/login.yaml
appId: com.example.app
---
- tapOn: "Sign In"
- inputText: ${USERNAME}
- tapOn: "Password"
- inputText: ${PASSWORD}
- tapOn: "Submit"
```

### Using Helper Flows

```yaml
# checkout-test.yaml
- runFlow:
    file: common/login.yaml
    env:
      USERNAME: "test@example.com"
      PASSWORD: "testpass123"
- tapOn: "Shop Now"
# ... continue with test
```

## Hooks and Setup

### Flow Lifecycle Hooks

```yaml
# test-with-hooks.yaml
appId: com.example.app
onFlowStart:
  - runScript: setup-test-data.js
  - clearState
onFlowComplete:
  - takeScreenshot: final-state
  - runScript: cleanup.js
---
# Main test steps
- launchApp
- assertVisible: "Welcome"
```

## Handling Dynamic Content

### Conditional Flows

```yaml
# Handle optional popups
- runFlow:
    when:
      visible: "Special Offer"
    commands:
      - tapOn: "Dismiss"

# Continue with main flow
- tapOn: "Continue"
```

### Waiting Strategies

```yaml
# Wait for content to load
- extendedWaitUntil:
    visible: "Content Loaded"
    timeout: 10000

# Wait for animation
- waitForAnimationToEnd:
    timeout: 5000
```

## Error Handling

### Retry Patterns

```yaml
# Retry flaky operations
- retry:
    maxRetries: 3
    commands:
      - tapOn: "Refresh"
      - assertVisible: "Updated Content"
```

### Optional Assertions

```yaml
# Don't fail on optional content
- assertVisible:
    text: "Promotional Banner"
    optional: true
```

## Test Data Management

### Using JavaScript for Dynamic Data

```yaml
# Generate test data
- evalScript: ${output.timestamp = Date.now()}
- evalScript: ${output.email = 'test' + output.timestamp + '@example.com'}

- inputText: ${output.email}
```

### Environment Variables

```yaml
# Access environment variables
- inputText: ${MAESTRO_TEST_USER}
- inputText: ${MAESTRO_TEST_PASSWORD}
```

## Performance Testing Patterns

### Continuous Mode Development

```bash
# Auto-restart on file changes
maestro test -c flow.yaml
```

### Recording Test Evidence

```yaml
# Record critical flows
- startRecording: checkout-flow
# ... perform checkout
- stopRecording

# Take screenshots at key points
- takeScreenshot: cart-page
- tapOn: "Checkout"
- takeScreenshot: payment-page
```

## CI/CD Integration

### GitHub Actions Example

```yaml
# .github/workflows/maestro-tests.yml
name: Maestro Tests

on:
  pull_request:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: mobile-dev-inc/action-maestro-cloud@v1
        with:
          api-key: ${{ secrets.MAESTRO_CLOUD_API_KEY }}
          app-file: app.apk
          include-tags: smoke
```

### Test Reporting

```bash
# Generate JUnit report
maestro test --format junit --output report.xml .maestro/

# Generate HTML report
maestro test --format html --output report.html .maestro/
```

## Advanced Patterns

### Custom Scroll Strategies

```yaml
# Scroll in specific area
- repeat:
    while:
      notVisible: "Target Element"
    commands:
      - swipe:
          start: 50%, 80%
          end: 50%, 30%
```

### State Verification

```yaml
# Copy and verify state
- copyTextFrom: "Order Total"
- evalScript: ${output.total = maestro.copiedText}
# ... perform action
- copyTextFrom: "Final Total"
- assertTrue: ${output.total == maestro.copiedText}
```

## Testing Checklist

✅ Each flow tests a single scenario
✅ Flows are organized by feature or journey
✅ Common actions are extracted to helper flows
✅ Tests use semantic selectors (IDs) where possible
✅ Appropriate waits handle async operations
✅ Flaky tests use retry mechanisms
✅ Test data is generated dynamically
✅ CI/CD integration is configured
✅ Reports are generated for test runs
✅ Screenshots/recordings capture evidence