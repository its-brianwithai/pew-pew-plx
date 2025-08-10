---
name: maestro-mcp-tools-instructions
description: "Guide to using the Maestro MCP tools for automated testing and device interaction."
---

# 🔧 Maestro MCP Tools Guide
> 💡 *Complete reference for using Maestro MCP (Model Context Protocol) tools in Claude Code.*

## Available MCP Tools

The Maestro MCP server provides the following tools for interacting with devices and running tests:

### Device Management

#### list_devices
List all available devices (simulators/emulators) that can be used for automation.

```typescript
// Usage
mcp__maestro__list_devices({})

// Returns list of devices with:
// - device_id: Unique identifier
// - platform: ios or android
// - name: Device name
// - status: booted, shutdown, etc.
```

#### start_device
Start a simulator/emulator and get its device ID.

```typescript
// Start specific device
mcp__maestro__start_device({
  device_id: "device-uuid"
})

// Start any iOS device
mcp__maestro__start_device({
  platform: "ios"
})

// Start any Android device
mcp__maestro__start_device({
  platform: "android"
})

// Default (iOS)
mcp__maestro__start_device({})
```

### App Control

#### launch_app
Launch an application on the connected device.

```typescript
mcp__maestro__launch_app({
  device_id: "device-uuid",
  appId: "com.example.app"
})
```

#### stop_app
Stop an application on the connected device.

```typescript
mcp__maestro__stop_app({
  device_id: "device-uuid",
  appId: "com.example.app"
})
```

### UI Interaction

#### tap_on
Tap on a UI element by selector or description.

```typescript
// Tap by text
mcp__maestro__tap_on({
  device_id: "device-uuid",
  text: "Sign In"
})

// Tap by ID
mcp__maestro__tap_on({
  device_id: "device-uuid",
  id: "signin_button"
})

// Tap with multiple criteria
mcp__maestro__tap_on({
  device_id: "device-uuid",
  text: "Submit",
  enabled: true,
  index: 0
})

// Fuzzy text matching (default: true)
mcp__maestro__tap_on({
  device_id: "device-uuid",
  text: "Sign",  // Will match "Sign In"
  use_fuzzy_matching: true
})
```

#### input_text
Input text into the currently focused text field.

```typescript
mcp__maestro__input_text({
  device_id: "device-uuid",
  text: "user@example.com"
})
```

#### back
Press the back button on the device.

```typescript
mcp__maestro__back({
  device_id: "device-uuid"
})
```

### Screen Capture

#### take_screenshot
Capture the current device screen.

```typescript
mcp__maestro__take_screenshot({
  device_id: "device-uuid"
})

// Returns base64 encoded image
```

#### inspect_view_hierarchy
Get the view hierarchy of the current screen.

```typescript
mcp__maestro__inspect_view_hierarchy({
  device_id: "device-uuid"
})

// Returns nested tree structure with:
// - bounds (x, y, width, height)
// - text content
// - resource IDs
// - interaction states (clickable, enabled, checked)
```

### Flow Execution

#### run_flow
Execute Maestro commands directly.

```typescript
// Single command
mcp__maestro__run_flow({
  device_id: "device-uuid",
  flow_yaml: "- tapOn: Sign In"
})

// Multiple commands
mcp__maestro__run_flow({
  device_id: "device-uuid",
  flow_yaml: `
- tapOn: Sign In
- inputText: user@example.com
- tapOn: Password
- inputText: secret123
- tapOn: Submit
  `
})

// Full flow with headers
mcp__maestro__run_flow({
  device_id: "device-uuid",
  flow_yaml: `
appId: com.example.app
---
- launchApp
- assertVisible: Welcome
- tapOn: Get Started
  `
})
```

#### run_flow_files
Run one or more Maestro test files.

```typescript
mcp__maestro__run_flow_files({
  device_id: "device-uuid",
  flow_files: "login.yaml,checkout.yaml"
})
```

#### check_flow_syntax
Validate Maestro YAML syntax before execution.

```typescript
mcp__maestro__check_flow_syntax({
  flow_yaml: `
- tapOn: Button
- inputText: Test
  `
})

// Returns validation results
```

### Documentation & Help

#### cheat_sheet
Get comprehensive Maestro command reference.

```typescript
mcp__maestro__cheat_sheet({})

// Returns documentation on:
// - Commands
// - Syntax
// - Best practices
```

#### query_docs
Query Maestro documentation for specific information.

```typescript
mcp__maestro__query_docs({
  question: "How do I handle popups in Maestro?"
})

// Returns relevant documentation and examples
```

## Workflow Examples

### Basic Test Flow

```typescript
// 1. Start device
const device = await mcp__maestro__start_device({ platform: "ios" })

// 2. Launch app
await mcp__maestro__launch_app({
  device_id: device.device_id,
  appId: "com.example.app"
})

// 3. Take screenshot for reference
await mcp__maestro__take_screenshot({ device_id: device.device_id })

// 4. Inspect current screen
const hierarchy = await mcp__maestro__inspect_view_hierarchy({
  device_id: device.device_id
})

// 5. Run test commands
await mcp__maestro__run_flow({
  device_id: device.device_id,
  flow_yaml: `
- tapOn: Sign In
- inputText: test@example.com
- tapOn: Password
- inputText: testpass123
- tapOn: Submit
- assertVisible: Dashboard
  `
})
```

### Interactive Testing

```typescript
// Start device and app
const device = await mcp__maestro__start_device({ platform: "android" })
await mcp__maestro__launch_app({
  device_id: device.device_id,
  appId: "com.example.app"
})

// Explore interactively
let hierarchy = await mcp__maestro__inspect_view_hierarchy({
  device_id: device.device_id
})

// Find and tap elements
await mcp__maestro__tap_on({
  device_id: device.device_id,
  text: "Menu"
})

// Check new state
hierarchy = await mcp__maestro__inspect_view_hierarchy({
  device_id: device.device_id
})

// Input text
await mcp__maestro__tap_on({
  device_id: device.device_id,
  id: "search_field"
})

await mcp__maestro__input_text({
  device_id: device.device_id,
  text: "test query"
})
```

### Running Test Suites

```typescript
// List available devices
const devices = await mcp__maestro__list_devices({})

// Start preferred device
const device = devices.find(d => d.name.includes("iPhone 14"))
await mcp__maestro__start_device({ device_id: device.device_id })

// Run test files
await mcp__maestro__run_flow_files({
  device_id: device.device_id,
  flow_files: "setup.yaml,login.yaml,main-flow.yaml,cleanup.yaml"
})
```

## Error Handling

### Common Issues

1. **No device running**
   - Always start a device first with `start_device`
   - Check device status with `list_devices`

2. **Element not found**
   - Use `inspect_view_hierarchy` to see available elements
   - Try fuzzy matching: `use_fuzzy_matching: true`
   - Add waits in your flow for dynamic content

3. **App not installed**
   - Ensure app is installed on the device
   - Use proper bundle ID (iOS) or package name (Android)

4. **Syntax errors**
   - Validate with `check_flow_syntax` before running
   - Check YAML formatting and indentation

## Best Practices

1. **Always inspect before interacting**
   ```typescript
   // Good practice
   const hierarchy = await mcp__maestro__inspect_view_hierarchy({...})
   // Analyze hierarchy to find elements
   await mcp__maestro__tap_on({...})
   ```

2. **Use device IDs consistently**
   ```typescript
   const device = await mcp__maestro__start_device({...})
   // Always use device.device_id for subsequent calls
   ```

3. **Validate flows before execution**
   ```typescript
   await mcp__maestro__check_flow_syntax({ flow_yaml: ... })
   ```

4. **Take screenshots for debugging**
   ```typescript
   await mcp__maestro__take_screenshot({ device_id: ... })
   ```

5. **Query docs for specific help**
   ```typescript
   await mcp__maestro__query_docs({ 
     question: "Your specific question" 
   })
   ```

## Integration with Claude Code

When using these tools in Claude Code:

1. Tools are prefixed with `mcp__maestro__`
2. All tools are async and return promises
3. Device IDs must be maintained across calls
4. Flows can be built incrementally or loaded from files
5. Screenshots and hierarchies help with debugging