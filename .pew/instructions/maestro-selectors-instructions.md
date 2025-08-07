---
name: maestro-selectors-instructions
description: "Guide to using Maestro selectors for targeting UI elements in tests."
---

# 🎯 Maestro Selectors Guide
> 💡 *Comprehensive guide to targeting UI elements effectively in Maestro tests.*

## Selector Types

### Basic Selectors

```yaml
# Text selector (shorthand)
- tapOn: "Button Text"

# Text selector (explicit)
- tapOn:
    text: "Button Text"

# ID selector
- tapOn:
    id: "submit_button"

# Index selector (0-based)
- tapOn:
    text: "Item"
    index: 2  # Selects the 3rd matching element
```

### Coordinate Selectors

```yaml
# Relative position (percentage)
- tapOn:
    point: 50%, 50%  # Center of screen

# Absolute position (pixels)
- tapOn:
    point: 100, 200  # x:100, y:200

# Tap within element
- tapOn:
    text: "Large Button"
    point: 90%, 50%  # 90% from left, center vertically
```

### Property Selectors

```yaml
# Size-based selection
- tapOn:
    width: 100
    height: 50
    tolerance: 10  # ±10 pixels tolerance

# State-based selection
- tapOn:
    text: "Checkbox"
    checked: false  # Only unchecked elements

- tapOn:
    id: "input_field"
    focused: true  # Only focused elements

- tapOn:
    text: "Submit"
    enabled: true  # Only enabled elements

- tapOn:
    text: "Tab"
    selected: true  # Only selected elements
```

## Relative Position Selectors

### Spatial Relationships

```yaml
# Element below another
- tapOn:
    below: "Header Text"
    text: "Button"

# Element above another
- tapOn:
    above:
      id: "footer"
    text: "Content"

# Element to the left
- tapOn:
    leftOf: "Price"
    text: "Add to Cart"

# Element to the right
- tapOn:
    rightOf: "Label:"
    id: "input_field"
```

### Parent-Child Relationships

```yaml
# Element containing a child
- tapOn:
    containsChild: "$19.99"

# Element that is a child of another
- tapOn:
    childOf:
      id: "product_card"
    text: "Buy Now"

# Element with multiple descendants
- tapOn:
    containsDescendants:
      - text: "Product Name"
      - text: "$19.99"
      - id: "add_to_cart"
```

## Regular Expression Patterns

### Pattern Matching

```yaml
# Partial text match
- assertVisible: ".*brown fox.*"  # Matches "the quick brown fox jumps"

# Number patterns
- assertVisible: "[0-9]{6}"  # Matches 6-digit code
- assertVisible: "\$[0-9]+\.[0-9]{2}"  # Matches price format

# Email pattern
- assertVisible: "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}"
```

### Escaping Special Characters

```yaml
# Escape brackets
- assertVisible: "Movies \[NEW\]"

# Escape dots
- assertVisible: "Version 1\.0\.0"

# Escape parentheses
- assertVisible: "Total \(USD\)"
```

## Complex Selector Examples

### Combining Multiple Criteria

```yaml
# Text + State
- tapOn:
    text: "Remember Me"
    checked: false
    enabled: true

# ID + Position
- tapOn:
    id: "list_item"
    index: 0
    below: "Section Header"

# Multiple relationships
- tapOn:
    text: "Delete"
    rightOf: "Item Name"
    childOf:
      id: "list_container"
```

### Platform-Specific Selectors

#### Flutter
```yaml
# Semantic identifier (Flutter 3.19+)
- tapOn:
    id: "signin_button"  # Matches Semantics identifier

# Semantic label
- tapOn: "Sign In"  # Matches Semantics label
```

#### Web
```yaml
# CSS selectors for web
- tapOn:
    id: "submit-button"  # Matches HTML id
    
- tapOn:
    text: "Submit"  # Matches visible text
```

## Best Practices

### When to Use Text vs IDs

**Use Text Selectors when:**
- Text is static and unique
- Testing user-visible content
- Improving test readability
- Quick prototyping

**Use ID Selectors when:**
- Content is dynamic or localized
- Targeting non-text elements (icons)
- Need stable, long-term tests
- Working with internationalized apps

### Selector Priority Order

1. **Unique IDs** - Most stable and reliable
2. **Semantic identifiers** - Good for accessibility
3. **Unique text** - Good for readability
4. **Relative positioning** - When elements lack unique identifiers
5. **Index** - Last resort for multiple similar elements
6. **Coordinates** - Only for fixed layouts

### Making Selectors Robust

```yaml
# Too fragile - relies on exact text
- tapOn: "Welcome, John Smith!"

# Better - uses partial match
- tapOn:
    text: "Welcome.*"

# Best - uses stable identifier
- tapOn:
    id: "welcome_message"
```

### Handling Dynamic Content

```yaml
# Wait for element to appear
- extendedWaitUntil:
    visible:
      id: "dynamic_content"
    timeout: 10000

# Use conditional selection
- runFlow:
    when:
      visible: "Cookie Banner"
    commands:
      - tapOn: "Accept"

# Scroll to find element
- scrollUntilVisible:
    element:
      text: "Load More"
```

## Debugging Selectors

### Using Maestro Studio

```bash
# Launch studio to inspect elements
maestro studio

# For web testing
maestro -p web studio
```

### View Hierarchy Commands

```bash
# Print entire hierarchy
maestro hierarchy

# Query specific element
maestro query "text=Button"
maestro query "id=submit"
```

### Common Issues and Solutions

**Issue: Multiple elements match selector**
```yaml
# Solution: Add more criteria or use index
- tapOn:
    text: "Add"
    below: "Product A"
    index: 0
```

**Issue: Element not found**
```yaml
# Solution: Add wait or scroll
- scrollUntilVisible:
    element: "Target Element"
- tapOn: "Target Element"
```

**Issue: Dynamic text content**
```yaml
# Solution: Use regex or ID
- tapOn:
    text: "Order #[0-9]+"
# Or better:
- tapOn:
    id: "order_details"
```

## Advanced Selector Patterns

### List Item Selection

```yaml
# Select specific item in list
- tapOn:
    containsDescendants:
      - text: "Product Name"
      - text: "$29.99"
    childOf:
      id: "product_list"
```

### Form Field Selection

```yaml
# Select input after label
- tapOn:
    rightOf: "Email:"
    id: ".*input.*"

# Select error message for field
- assertVisible:
    below: "Password"
    text: ".*required.*"
```

### Modal/Dialog Selection

```yaml
# Select within modal context
- tapOn:
    text: "Confirm"
    childOf:
      containsChild: "Are you sure?"
```

## Tips and Tricks

1. **Always verify selectors in Maestro Studio first**
2. **Use the most specific selector that's still maintainable**
3. **Combine selectors for precision without brittleness**
4. **Document why you chose specific selectors in comments**
5. **Test selectors across different screen sizes/orientations**
6. **Consider accessibility when choosing selectors**
7. **Keep selector patterns consistent across your test suite**