# Flutter Feature Conversion Prompt

Please create a highly detailed {doc_type} document in {doc_location} based on your system instructions, your best judgement and known practices related to my {user_requests} and {feature_location}.

Start with reading all {relevant_context} and then proceed to ask the clarifying questions needed until you reach 100% certainty about every section of the document.

Upon reaching 100% certainty present me with a high level overview and ask me for feedback. Process the feedback and ask for feedback again.

Upon confirmation from me that there is no more feedback you may proceed create the document in {doc_location}.

## Analysis Requirements

First, analyze the React project and identify:
1. **Core Data Models** - Extract all TypeScript interfaces/types and convert to Dart classes
2. **Key Functionality** - List all user actions, business logic, and data flow
3. **Component Composition** - Identify the layout structure, component hierarchy, and arrangement
4. **Navigation Flow** - Map out how users move between different views
5. **State Management** - Understand how data is managed and shared
6. **Interactive Elements** - Note all buttons, forms, lists, and user interactions

## Flutter Implementation Guide Format

Provide a comprehensive implementation guide with these sections:

### 1. Feature Overview
- Brief description of what this feature does
- Core capabilities and user benefits
- Integration approach for existing Flutter apps

### 2. Data Models (Dart Classes)
- Convert all TypeScript interfaces to Dart classes
- Include proper JSON serialization methods
- Add any necessary data validation

### 3. Integration Instructions
- How to add this feature to existing app navigation
- Adaptation to current project's architecture patterns
- Integration with existing state management solution

### 4. Component Structure & Layout
For each screen/component, provide:
- **Layout Composition**: Describe the arrangement and hierarchy of elements (rows, columns, cards, lists)
- **Component Functionality**: What each component does and how it behaves
- **Data Flow**: How information moves between components
- **User Interactions**: All clickable elements, form inputs, and gestures

### 5. Visual Adaptation Guidelines
- Use existing project's color scheme and theme
- Apply current project's typography and text styles
- Adapt to existing button styles and component appearances
- Follow current project's spacing and padding patterns
- Use existing icon set and sizing conventions
- Apply current card, list, and container styling

### 6. Implementation Details
- Business logic implementation in Dart
- State management using project's existing approach
- Form handling and validation patterns
- Navigation using current routing system
- Data persistence with existing storage solution

## Critical Guidelines

- **Preserve Composition**: Keep the exact same layout structure and component arrangement
- **Maintain Functionality**: All user interactions and business logic must work identically
- **Adapt Visuals Only**: Replace colors, fonts, and styling with target project's design system
- **Use Existing Components**: Reference target project's existing widgets and patterns
- **No Visual Specifications**: Never specify exact colors, fonts, or styling - always reference existing project elements
- **Component Hierarchy**: Maintain the same nested structure and organization
- **Interaction Patterns**: Keep all buttons, forms, and user flows exactly as designed

Example adaptation instruction:
"Create a card widget using your project's existing card component styling, containing a row with a checkbox (using your app's checkbox style), text content (using your app's text theme), and an action button (using your app's button component)."

Generate the Flutter implementation guide that preserves all functionality and composition while seamlessly adapting to the target project's visual design system. When generating this plan use several agents in parallel find define specific parts of the document. Ensure you present the document with 100% confidence about the perfect implementation relative to the the project that it's being implemented in.

Very important: when creating the plan, please frame your instructions in a way that instructs the executing agent to find out the current way of doing things in the current project before implementing the actual feature, so that any implementation is always in line with the current way of working inside the project, as opposed to instructing the agent to implement features with coding standards, snippets and examples that may not be suitable for the project.

```yaml
relevant_context: <file_map>, <file_contents>, <extra_context>
doc_type: User Story Ticket / Guide
doc_location: issues/000-backlog/
feature_location: new_feature/
user_requests: Convert the React web application feature I'm showing you into a complete Flutter feature implementation guide. This guide should help integrate the functionality into an existing Flutter project while adapting all visual properties to the target project's design system. {cursor}
```

```xml
<extra_context>
</extra_context>
```
