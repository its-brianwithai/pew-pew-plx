---
name: maestro-commands-instructions
description: "Complete reference of all Maestro commands with syntax, parameters, and usage examples."
---

# 🎮 Maestro Commands Reference
> 💡 *Complete guide to all available Maestro commands for mobile and web testing.*

## Command Categories

### Assertion Commands

#### assertVisible / assertNotVisible
```yaml
# Assert element is visible
- assertVisible: "My Button"
- assertVisible:
    text: "My Button"
    enabled: true

# Assert element is not visible
- assertNotVisible: "Loading..."
```

#### assertTrue
```yaml
# Assert condition is true
- assertTrue: ${value}
- assertTrue:
    condition: ${output.isValid}
    label: Validation check
```

#### AI-Powered Assertions
```yaml
# Assert with AI description
- assertWithAI:
    assertion: Login and password text fields are visible.

# Assert no UI defects
- assertNoDefectsWithAI
```

### Input Commands

#### inputText
```yaml
# Basic text input
- inputText: "Hello World"

# Random input generators
- inputRandomEmail
- inputRandomPersonName
- inputRandomNumber:
    length: 10
- inputRandomText:
    length: 20
```

#### copyTextFrom / pasteText
```yaml
# Copy text from element
- copyTextFrom:
    id: "someId"

# Paste copied text
- tapOn: "Search field"
- pasteText

# Use copied text in JavaScript
- inputText: ${'Copied: ' + maestro.copiedText}
```

#### eraseText
```yaml
# Erase characters from field
- eraseText  # Default: 50 characters
- eraseText: 100  # Erase 100 characters
```

### Interaction Commands

#### tapOn
```yaml
# Simple tap
- tapOn: "Button"

# Tap with selector
- tapOn:
    id: "submit_button"
    
# Tap on coordinates
- tapOn:
    point: 50%,50%  # Center of screen
    
# Repeat taps
- tapOn:
    text: "Increment"
    repeat: 3
    delay: 500
```

#### doubleTapOn / longPressOn
```yaml
# Double tap
- doubleTapOn: "Image"
- doubleTapOn:
    id: "zoomable_image"
    delay: 100

# Long press
- longPressOn: "Menu item"
- longPressOn:
    point: 50%,50%
```

#### swipe
```yaml
# Directional swipe
- swipe:
    direction: LEFT  # LEFT, RIGHT, UP, DOWN

# Custom swipe
- swipe:
    start: 90%, 50%
    end: 10%, 50%
    
# Swipe with duration
- swipe:
    direction: UP
    duration: 2000  # ms
```

#### scroll / scrollUntilVisible
```yaml
# Simple scroll
- scroll

# Scroll until element visible
- scrollUntilVisible:
    element:
      text: "Footer"
    direction: DOWN
    timeout: 30000
    speed: 40
    visibilityPercentage: 100
    centerElement: true
```

### App Lifecycle Commands

#### launchApp
```yaml
# Basic launch
- launchApp

# Launch with options
- launchApp:
    appId: "com.example.app"
    clearState: true
    clearKeychain: true
    stopApp: false
    permissions:
      all: deny
      camera: allow
      location: allow
    arguments:
      isTest: true
      environment: "staging"
```

#### stopApp / killApp
```yaml
# Stop app gracefully
- stopApp
- stopApp: "com.example.app"

# Kill app (Android force stop)
- killApp
```

#### clearState / clearKeychain
```yaml
# Clear app data
- clearState
- clearState: "com.example.app"

# Clear iOS keychain
- clearKeychain
```

### Navigation Commands

#### back
```yaml
# Navigate back (Android)
- back
```

#### openLink
```yaml
# Open URL
- openLink: https://example.com

# Open with options
- openLink:
    link: https://example.com
    autoVerify: true
    browser: true

# Deep link
- openLink: myapp://settings
```

### Control Flow Commands

#### repeat
```yaml
# Repeat N times
- repeat:
    times: 3
    commands:
      - tapOn: "Refresh"
      - scroll

# Repeat while condition
- repeat:
    while:
      notVisible: "Done"
    commands:
      - tapOn: "Next"
```

#### retry
```yaml
# Retry on failure
- retry:
    maxRetries: 3
    commands:
      - tapOn: "Flaky Button"
```

#### runFlow
```yaml
# Run external flow
- runFlow: login.yaml

# With parameters
- runFlow:
    file: login.yaml
    env:
      USERNAME: "test@example.com"
      PASSWORD: "secret123"

# Inline flow
- runFlow:
    commands:
      - tapOn: "Accept"
      - scroll
```

#### runScript / evalScript
```yaml
# Run JavaScript file
- runScript: helpers.js
- runScript:
    file: setup.js
    env:
      API_KEY: "abc123"

# Inline JavaScript
- evalScript: ${output.timestamp = Date.now()}
- evalScript: ${output.isValid = maestro.copiedText.length > 0}
```

### Device Control Commands

#### pressKey
```yaml
# Press special keys
- pressKey: Enter
- pressKey: Home
- pressKey: Back  # Android only
- pressKey: "Volume Up"
```

#### setLocation / travel
```yaml
# Set location
- setLocation:
    latitude: 52.3599976
    longitude: 4.8830301

# Mock motion
- travel:
    points:
      - 0.0,0.0
      - 0.1,0.0
      - 0.1,0.1
    speed: 7900  # km/s
```

#### setAirplaneMode
```yaml
# Control airplane mode (Android)
- setAirplaneMode: enabled
- setAirplaneMode: disabled
- toggleAirplaneMode
```

### Media Commands

#### addMedia
```yaml
# Add media to device gallery
- addMedia:
    - "./assets/test-image.png"
    - "./assets/test-video.mp4"
```

#### takeScreenshot
```yaml
# Take screenshot
- takeScreenshot: LoginScreen  # Saves as LoginScreen.png
- takeScreenshot:
    path: screenshots/login
```

#### Recording
```yaml
# Start recording
- startRecording: test_flow
- startRecording:
    path: "login_test"
    label: "Recording login flow"

# Stop recording
- stopRecording
```

### Wait Commands

#### extendedWaitUntil
```yaml
# Wait for element
- extendedWaitUntil:
    visible: "Welcome"
    timeout: 10000

# Wait for element to disappear
- extendedWaitUntil:
    notVisible:
      id: "loading_spinner"
    timeout: 30000
```

#### waitForAnimationToEnd
```yaml
# Wait for animations
- waitForAnimationToEnd
- waitForAnimationToEnd:
    timeout: 5000
```

### Keyboard Commands

#### hideKeyboard
```yaml
# Hide keyboard
- hideKeyboard
```

## Common Command Arguments

All commands support these optional arguments:

```yaml
# Add label for clarity
- tapOn:
    id: "submit"
    label: "Submit the form"

# Make command optional (don't fail flow)
- assertVisible:
    text: "Optional banner"
    optional: true
```

## Best Practices

1. **Use descriptive labels** - Makes test output readable
2. **Leverage selectors** - Prefer `id` over `text` for stability
3. **Handle timing** - Use wait commands for async operations
4. **Keep flows atomic** - Test one scenario per flow
5. **Use parameters** - Make flows reusable with `env` variables
6. **Add retries** - Handle flaky behavior gracefully
7. **Clear state** - Ensure consistent starting conditions