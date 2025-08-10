# Maestro Commands Documentation

This document compiles all available Maestro commands scraped from the official Maestro documentation. Each command is documented with its syntax, parameters, and examples.

## Table of Contents

- [Media Commands](#media-commands)
- [Assertion Commands](#assertion-commands)
- [Navigation Commands](#navigation-commands)
- [State Management Commands](#state-management-commands)
- [Text and Input Commands](#text-and-input-commands)
- [App Lifecycle Commands](#app-lifecycle-commands)
- [Screen Interaction Commands](#screen-interaction-commands)
- [Control Flow Commands](#control-flow-commands)
- [Device Control Commands](#device-control-commands)
- [Recording Commands](#recording-commands)
- [Location and Motion Commands](#location-and-motion-commands)
- [Wait Commands](#wait-commands)

---

## Media Commands

### addMedia

Allows you to add media to the device's gallery for both Android and iOS, making them accessible for use in your application flow.

```yaml
- addMedia:
    - "./assets/foo.png" # path of media file in workspace
    - "./assets/foo.mp4"
```

**Supported mime types:**
- PNG
- JPEG
- JPG
- GIF
- MP4

---

## Assertion Commands

### assertVisible

To assert whether an element is **visible**, use the following command that takes the same parameters as `tapOn`:

```yaml
- assertVisible:
    # Same exact parameters as in tapOn or any other command that uses selectors
```

This command will wait for view to appear if it is not visible yet.

**Common properties:**
- `text` - text in a view
- `id` - id of a view
- `enabled` - `true` if view is enabled
- `checked` - `true` if view is checked
- `focused` - `true` if view has keyboard focus
- `selected` - `true` if view is selected

**Examples:**

```yaml
- assertVisible: "My Button"

- assertVisible:
    text: "My Button"
    enabled: true
```

### assertNotVisible

To assert whether an element is **not visible**:

```yaml
- assertNotVisible:
    # Same exact parameters as tapOn
```

This command will wait for view to disappear if it is currently visible.

**Examples:**

```yaml
- assertNotVisible: "My Button"

- assertNotVisible:
    text: "My Button"
    enabled: true
```

### assertTrue

Asserts whether given value is either true, non-empty, or _truthy_ (in JavaScript terms):

```yaml
- assertTrue: ${value}
```

**Examples:**

```yaml
- copyTextFrom: View A
- evalScript: ${output.viewA = maestro.copiedText}
- copyTextFrom: View B
- assertTrue: ${output.viewA == maestro.copiedText}

- assertTrue:
    condition: ${false}
    label: This will always fail
```

### assertWithAI

**This is an experimental feature powered by LLM technology.**

```yaml
- assertWithAI:
    assertion: Login and password text fields are visible.
```

Takes a screenshot, uploads it to an LLM with a pre-made prompt combined with `assertion`, and asks the model if assertion is true.

**When to use:** When it's hard (or even impossible) to write the assertion using default assertion commands. Good example: asserting the presence of a two-factor authentication prompt.

**Example:**

```yaml
- assertWithAI:
    assertion: A two-factor authentication prompt, with space for 6 digits, is visible.
```

### assertNoDefectsWithAI

**This is an experimental feature powered by LLM technology.**

```yaml
- assertNoDefectsWithAI
```

Takes a screenshot, uploads it to an LLM with a pre-made prompt, and asks the model if it sees any common defects in the provided screenshot.

Common defects include text and UI elements being cut off, overlapping, or not being centered within their containers.

**When to use:** As a "smoke test" for parts of your app that you want to ensure that "look right".

---

## Navigation Commands

### back

The following command navigates user to the previous screen (Android-only at the moment):

```yaml
- back
```

### openLink

To open a link on a device (i.e. a deep link):

```yaml
- openLink: https://example.com
```

**Auto verification for Android Apps:**

```yaml
- openLink:
    link: https://example.com
    autoVerify: true
```

**Opening web links in browser for Android:**

```yaml
- openLink:
    link: https://example.com
    browser: true
```

**Deeplinks and Custom Protocols:**

```yaml
- openLink:
    link: awesomeapp://settings
```

**iOS Security Confirmation Dialogs example:**

```yaml
- openLink:
    link: awesomeapp://settings
- runFlow:
    when:
      visible: 'Open in "Awesome App"'
    commands:
      - tapOn: Open
```

---

## State Management Commands

### clearKeychain

Clears the **entire** iOS keychain (not applicable on Android):

```yaml
- clearKeychain
```

### clearState

Clears the application state:

```yaml
- clearState            # clears the state of the current app
- clearState: app.id    # clears the state of an arbitrary app
```

**What is being cleared:**
- **Android:** Equivalent to `adb shell pm clear {package name}` - removes all app-related data (shared preferences, databases, accounts, etc.)
- **iOS:** Removes the contents of the application's data folder. Equivalent to `idb file rm --application {bundle id}/`

---

## Text and Input Commands

### copyTextFrom

You can copy text from an element and save it in-memory, to paste later:

```yaml
- copyTextFrom:
    id: "someId"
```

**Usage Example:**

```yaml
appId: com.example.app
---
- launchApp
- copyTextFrom:
    id: "someId"
- tapOn:
    id: "searchFieldId"
- pasteText
```

The copied text can also be accessed in JavaScript using the `maestro.copiedText` property:

```yaml
- inputText: ${'Pasted using JavaScript: ' + maestro.copiedText}
```

### inputText

Inputs text (regardless of whether any text field is currently focused or not):

```yaml
- inputText: "Hello World"
```

**Note:** Unicode characters are not supported yet on Android platform.

**Input random text:**

```yaml
- inputRandomEmail       # Enters a random Email address
- inputRandomPersonName  # Enters a random person name
- inputRandomNumber      # Enters a random integer number
- inputRandomText        # Enters random unstructured text
```

**Length parameters:**

```yaml
- inputRandomNumber:
    length: 10  #(default: 8)
- inputRandomText:
    length: 10  #(default: 8)
```

**Re-using random input:**

```yaml
- tapOn:
    id: MyTextInput
- inputRandomText
- copyTextFrom:
    id: MyTextInput
- tapOn: 'Submit'
- assertVisible: ${maestro.copiedText}
```

### pasteText

Paste any text copied with `copyTextFrom` into the currently focused field:

```yaml
- pasteText
```

**Usage Example:**

```yaml
- copyTextFrom:
    id: "someId"
- tapOn:
    id: "searchFieldId"
- pasteText
```

### eraseText

The `eraseText` command removes characters from the currently selected text field:

```yaml
- eraseText # Removes up to 50 characters (default)
- eraseText: 100    # Removes up to 100 characters
```

**iOS Flakiness Workaround:**

```yaml
- longPressOn: "<input text id>"
- tapOn: 'Select All'
- eraseText
```

### hideKeyboard

To hide the software keyboard:

```yaml
- hideKeyboard
```

**Note:** On iOS, hideKeyboard can be flaky.

---

## App Lifecycle Commands

### launchApp

To launch the app under test:

```yaml
- launchApp
```

To launch an arbitrary app with a given id:

```yaml
- launchApp: appId
```

**With additional options:**

```yaml
- launchApp:
    appId: "com.example.app"
    clearState: true
    clearKeychain: true   # optional: clear *entire* iOS keychain
    stopApp: false # optional (true by default): stop the app before launching it
    permissions: { all: deny } # optional: by default all permissions are allowed
```

**Specific permissions:**

```yaml
- launchApp:
    permissions:
        notifications: unset # notification permission is unset
        android.permission.ACCESS_FINE_LOCATION: deny # Android fine location permission is denied
```

**Launch Arguments:**

```yaml
- launchApp:
    appId: "com.example.app"
    arguments:
       foo: "This is a string"
       isFooEnabled: false
       fooValue: 3.24
       fooInt: 3
```

### stopApp

Stops current application if it is running:

```yaml
- stopApp
- stopApp: appId  # Stop specific app
```

### killApp

The `killApp` command kills the app on Android. On iOS and Web, it's just an alias for `stopApp`:

```yaml
- killApp
```

**System-initiated Process Death example:**

```yaml
- pressKey: Home # Puts the app into the background
- killApp # Kills the app (adb shell am kill)
- launchApp: # Relaunches the app
    stopApp: false # Without adb shell am stop
```

---

## Screen Interaction Commands

### tapOn

In order to tap on a view with text:

```yaml
- tapOn: "My text"
```

Using other selectors:

```yaml
- tapOn:
    id: "id" # or any other selector
```

**Repeat taps:**

```yaml
- tapOn:
    text: "Button"
    repeat: 3
    delay: 500 # (optional) Delay between taps. Default 100ms
```

**Retry configuration:**

```yaml
- tapOn:
    id: "someId"
    retryTapIfNoChange: false
```

**Control wait time:**

```yaml
- tapOn:
    text: "Button"
    waitToSettleTimeoutMs: 500 # ms
```

**Tapping on coordinates:**

```yaml
# Relative position
- tapOn:
    point: 50%,50%      # middle of the screen

# Absolute coordinates
- tapOn:
    point: 100,200    # x:100 y:200 in pixels
```

**Tapping within another element:**

```yaml
- tapOn:
    text: "A text with a hyperlink"
    point: "90%,50%"
```

### doubleTapOn

Double tap on a selected element or point:

```yaml
- doubleTapOn: "Button"

- doubleTapOn:
    id: "someId" # or any other selector
    delay: 100 # (optional) Delay between taps. Default, 100ms
```

### longPressOn

Like tapOn, but for longer presses. See the tapOn docs for examples of usage patterns.

```yaml
- longPressOn: Text
- longPressOn:
    id: view_id
- longPressOn:
    point: 50%,50%
```

### swipe

To have control over the swipe gesture:

**Relative Swipe Using Percentages:**

```yaml
- swipe:
    start: 90%, 50% # From (90% of width, 50% of height)
    end: 10%, 50% # To (10% of width, 50% of height)
```

**Swiping Directions:**

```yaml
- swipe:              # This command swipes in the left direction from the middle of the device.
    direction: LEFT
```

Available directions: LEFT, RIGHT, UP, DOWN

**Swiping elements:**

```yaml
- swipe:
   from:
     id: "feeditem_identifier" # From (x, y) center of element
   direction: UP # To (50% of width, 10% of height)
```

**Swiping coordinates:**

```yaml
- swipe:                 # This command swipes from point (x:100, y:200) to point (x: 300, y:400). Units are in pixels
    start: 100, 200
    end: 300, 400
```

**Swiping speed:**

```yaml
- swipe:
    direction: LEFT
    duration: 2000      # Values are in ms.
```

### scroll

To do a simple vertical scroll:

```yaml
- scroll
```

### scrollUntilVisible

To scroll towards a direction until an element becomes visible:

```yaml
- scrollUntilVisible:
    element:
      id: "viewId" # or any other selector
    direction: DOWN # DOWN|UP|LEFT|RIGHT (optional, default: DOWN)
    timeout: 50000 # (optional, default: 20000) ms
    speed: 40 # 0-100 (optional, default: 40) Scroll speed
    visibilityPercentage: 100 # 0-100 (optional, default: 100) Percentage of element visible
    centerElement: false # true|false (optional, default: false)
```

**Examples:**

```yaml
- scrollUntilVisible:
    element: "My text" # or any other selector
    direction: DOWN

- scrollUntilVisible:
    element:
      id: ".*some_view_id" # or any other selector
    direction: DOWN
```

### takeScreenshot

`takeScreenshot` saves a screenshot as a PNG file in the Maestro workspace:

```yaml
- takeScreenshot:
    path: LoginScreen # screenshot will be stored as LoginScreen.png

# Short form:
- takeScreenshot: MainScreen # screenshot will be stored as MainScreen.png
```

---

## Control Flow Commands

### repeat

A command to repeat a set commands until a condition is met.

**Repeat N times:**

```yaml
- repeat:
    times: 3
    commands:
      - tapOn: Button
      - scroll
```

**Repeat-while:**

```yaml
- repeat:
    while:
      notVisible: "ValueX"
    commands:
      - tapOn: Button
```

**With JavaScript condition:**

```yaml
- evalScript: ${output.counter = 0}
- repeat:
    while:
      true: ${output.counter < 3}
    commands:
      - tapOn: Button
      - evalScript: ${output.counter = output.counter + 1}
```

### retry

For flaky behavior, retry commands a limited number of times:

```yaml
- retry:
    maxRetries: 3
    commands:
      - tapOn:
          id: 'button-that-might-not-be-here-yet'
```

**Parameters:**
- `maxRetries` - integer indicating the number of times to attempt the flow. Minimum 0, maximum 3. Defaults to 1 retry attempt.
- `commands` - list of commands to run. This, or `file`, must be provided.
- `file` - reference to another flow to attempt. This, or `commands`, must be provided (but not both).

### runFlow

Runs commands from another file:

```yaml
- runFlow: anotherFlow.yaml
```

**With arguments:**

```yaml
- runFlow:
    file: anotherFlow.yaml
    env:
      MY_PARAMETER: "123"
```

**Inline flows:**

```yaml
- runFlow:
    env:
      INNER_ENV: Inner Parameter
    commands:
      - inputText: ${INNER_ENV}
```

### runScript

The `runScript` command runs a provided JavaScript file:

```yaml
- runScript: myScript.js
```

**With parameters:**

```yaml
- runScript:
    file: script.js
    env:
       myParameter: 'Parameter'
```

**File Paths:** Paths can be relative or absolute. Relative paths are required for cloud running and are relative to the calling flow.

### evalScript

For simple computations, `evalScript` allows you to specify JavaScript directly in your Maestro flow:

```yaml
- evalScript: ${output.myFlow = MY_NAME.toUpperCase()}
- inputText: ${output.myFlow}
```

---

## Device Control Commands

### pressKey

`pressKey` command allows you to press a set of special keys:

```yaml
- pressKey: Enter
```

**Available keys:**
- `home` - home button
- `lock` - button to lock the device screen
- `enter` - enter button
- `backspace` - backspace button
- `volume up` and `volume down` - control the volume
- `back` - back button (Android only)
- `power` - power button (Android only)
- `tab` - tab button (Android only)

**Android TV controls:**
- `Remote Dpad Up`, `Remote Dpad Down`, `Remote Dpad Left`, `Remote Dpad Right`, `Remote Dpad Center`
- `Remote Media Play Pause`, `Remote Media Stop`, `Remote Media Next`, `Remote Media Previous`
- `Remote Media Rewind`, `Remote Media Fast Forward`
- `Remote System Navigation Up`, `Remote System Navigation Down`
- `Remote Button A`, `Remote Button B`, `Remote Menu`
- `TV Input`, `TV Input HDMI 1`, `TV Input HDMI 2`, `TV Input HDMI 3`

### setAirplaneMode

`setAirplaneMode` allows controlling the airplane mode of the device:

```yaml
- setAirplaneMode: enabled
- setAirplaneMode: disabled
```

**Note:** iOS simulators don't have an airplane mode, this is only available on Android.

### toggleAirplaneMode

`toggleAirplaneMode` toggles the airplane mode of the device:

```yaml
- toggleAirplaneMode
```

**Note:** iOS simulators don't have an airplane mode, this is only available on Android.

---

## Recording Commands

### startRecording

To start a screen recording:

```yaml
- startRecording: recording
```

**Long form:**

```yaml
- startRecording:
    path: 'logging_in'
    label: 'Begin collecting test evidence'
    optional: true
```

### stopRecording

To stop a recording in progress:

```yaml
- stopRecording
```

---

## Location and Motion Commands

### setLocation

`setLocation` command applies a mock geolocation to the device:

```yaml
- setLocation:
    latitude: 52.3599976
    longitude: 4.8830301
```

**Notes:**
- This only updates the co-ordinate location of the emulator/simulator
- When running in the cloud, if your app relies on IP location, this will still resolve to US
- For Android, this only works on API level 31 or above

### travel

The `travel` command can be used to mock the motion of the user:

```yaml
- travel:
    points: # set of lat/long coordinates where user motion should be mocked
      - 0.0,0.0
      - 0.1,0.0
      - 0.1,0.1
      - 0.0,0.1
    speed: 7900 # 7.9 km/s aka orbital velocity
```

---

## Wait Commands

### extendedWaitUntil

Waits until an element becomes visible. Fails if the element is not visible after the timeout expires:

```yaml
- extendedWaitUntil:
    visible: "My text that should be visible" # or any other selector
    timeout: 10000      # Timeout in milliseconds
```

**Wait until element disappears:**

```yaml
- extendedWaitUntil:
    notVisible:
        id: "elementId" # or any other selector
    timeout: 10000
```

### waitForAnimationToEnd

Waits until an ongoing animation/video is fully finished and screen becomes static:

```yaml
- waitForAnimationToEnd

# With timeout
- waitForAnimationToEnd:
    timeout: 5000
```

The timeout is optional (in milliseconds) after which, if the animation is still running, the command is marked as successful and flow continues regardless.

---

## Notes

- Most commands support [Selectors](https://docs.maestro.dev/api-reference/selectors) for targeting elements
- Commands can include common arguments like `label`, `optional`, and `env`
- JavaScript expressions can be used throughout flows for dynamic behavior
- For cloud running, remember to specify folders on the command line, not just flow files
- Some commands have platform-specific limitations (iOS vs Android)

This documentation was compiled from the official Maestro documentation. For the most up-to-date information, always refer to the [official Maestro documentation](https://docs.maestro.dev/).