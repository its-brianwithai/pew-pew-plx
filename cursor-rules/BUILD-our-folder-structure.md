---
description: Feature Structure - How we organize our feature folders
globs: lib/features/*
document_type: cursor_rule
goal: Define standardized folder structure for features
gpt_action: Read and apply when creating new feature folders
---

# How We Structure Feature Folders

## Purpose
Define a clear and consistent folder structure for features. Each feature has its own parent folder and only includes the folders it needs.

## Trigger Conditions
- Creating a new feature
- Adding new functionality to a feature that requires a specific folder

## Requirements
1. Feature must have its own parent folder in `lib/features/`
2. Feature folder name must be in snake_case
3. Only create folders when they will contain files
4. Each folder must maintain single responsibility

## Available Folders
Below are the standard folders you can create within your feature. Only create the ones you need:

```bash
feature_name/              # Your feature's parent folder
  ├── abstracts/          # Abstract classes and interfaces
  ├── adapters/           # Adapter implementations
  ├── analytics/          # Analytics related code
  ├── annotations/        # Custom annotations
  ├── apis/              # API related code
  ├── config/            # Feature specific configuration
  ├── constants/         # Constants and enums
  ├── converters/        # Data conversion logic
  ├── dtos/             # Data Transfer Objects
  ├── enums/            # Enumeration definitions
  ├── exceptions/        # Custom exceptions
  ├── extensions/        # Extension methods
  ├── forms/            # Form related widgets and logic
  ├── globals/          # Global feature variables
  ├── models/           # Data models
  ├── records/          # Immutable data classes
  ├── requests/         # API request models
  ├── responses/        # API response models
  ├── routing/          # Navigation and routing
  ├── services/         # Business logic services
  ├── strings/          # Localized strings
  ├── typedefs/         # Type definitions
  ├── utils/            # Utility functions
  ├── views/            # Screen/page widgets
  └── widgets/          # Reusable widgets
```

## Examples
### Good Example
```
lib/
  features/
    authentication/       # Feature parent folder
      apis/              # Has API calls
      models/            # Has data models
      services/          # Has business logic
      views/            # Has screens
      widgets/          # Has reusable widgets
```

### Bad Example
```
lib/
  features/
    auth/               # Wrong: Not snake_case
    authentication/     # Wrong: Empty folders
      apis/            # Empty - shouldn't exist
      models/          # Empty - shouldn't exist
      screens/         # Wrong: Should be 'views'
      components/      # Wrong: Should be 'widgets'
```

## Validation Checklist
- [ ] Feature has its own directory in `lib/features/`
- [ ] Feature directory name is in snake_case
- [ ] Only folders containing files are created
- [ ] Folders follow standard naming (no custom names)
- [ ] Each folder serves its designated purpose 
